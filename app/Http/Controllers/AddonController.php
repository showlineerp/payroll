<?php

namespace App\Http\Controllers;

use App\Http\Requests\InstallationRequest;
use App\Http\traits\ENVFilePutContent;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use ZipArchive;

class AddonController extends Controller
{
    use ENVFilePutContent;

    public function index()
    {
        return view('addons.index');
    }

    public function saasInstallStep1()
    {
        return view('addons.saas.step_1');
    }

    public function saasInstallStep2()
    {
        return view('addons.saas.step_2');
    }
    public function saasInstallStep3()
    {
        return view('addons.saas.step_3');
    }

    public function saasInstallProcess(InstallationRequest $request)
    {
        $isPurchaseVerified = self::purchaseVerify($request->purchasecode);

        if (!$isPurchaseVerified->codecheck) {
            return redirect()->back()->withErrors(['errors' => ['Wrong Purchase Code !']]);
        }
        $envPath = base_path('.env');
        if (!file_exists($envPath))
            return redirect()->back()->withErrors(['errors' => ['.env file does not exist.']]);
        elseif (!is_readable($envPath))
            return redirect()->back()->withErrors(['errors' => ['.env file is not readable.']]);
        elseif (!is_writable($envPath))
            return redirect()->back()->withErrors(['errors' => ['.env file is not writable.']]);
        else {

            $data = self::fileReceivedFromAuthorServer($isPurchaseVerified->authorServerURL);

            if(!$data['isReceived']) {
                return redirect()->back()->withErrors(['errors' => ['The file transfer has failed. Please try again later.']]);
            }

            self::fileUnzipAndDeleteManage($data);
            $this->envSetDatabaseCredentials($request);
            self::switchToNewDatabaseConnection($request);
            self::migrateCentralDatabase();
            self::seedCentralDatabase();
            session(['centralDomain' => $request->central_domain]);

            return redirect($request->central_domain.'/addons/saas/install/step-4');
        }
    }

    protected static function purchaseVerify(string $purchaseCode) : object
    {
        $url = 'https://peopleprohrmsaas.com/public/purchaseverify/';
        $post_string = 'purchasecode='.urlencode($purchaseCode);
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_POST, true);
        curl_setopt($ch,CURLOPT_POSTFIELDS, $post_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $result = curl_exec($ch);
        $object = new \stdClass();
        $object = json_decode(strip_tags($result));
        curl_close($ch);

        return $object;
    }

    protected static function fileReceivedFromAuthorServer(string $authorServerURL): array
    {
        $remoteFileName = pathinfo($authorServerURL)['basename'];
        $localFile = base_path('/'.$remoteFileName);
        $isCopied = copy($authorServerURL, $localFile);

        return [
            'isReceived' => $isCopied,
            'remoteFileName' => $remoteFileName,
        ];
    }

    protected static function databaseMigrateRollback(): void
    {
        Artisan::call('migrate:rollback --path=database/migrations/modify');
        Artisan::call('migrate:rollback --path=database/migrations/primary');
    }


    protected static function fileUnzipAndDeleteManage(array $data): void
    {
        if ($data['isReceived']) {

            self::baseDirectoryDelete();
            self::baseFileDelete();

            $zip = new ZipArchive;
            self::unzipAndDeleteProcessing($zip, 'vendorSAAS.zip');
            self::unzipAndDeleteProcessing($zip, $data['remoteFileName']);
       }
    }

    protected static function baseDirectoryDelete(): void
    {
        $baseDirectories = [
            'app',
            'bootstrap',
            'config',
            'database',
            'logo',
            'public',
            'resources',
            'routes',
            'storage',
            'tests',
            'track',
            'vendor',
        ];

        foreach ($baseDirectories as $value) {
            $directoryPath = base_path($value);
            File::deleteDirectory($directoryPath);
        }
    }
    protected static function baseFileDelete(): void
    {
        $baseFiles = [
            'README.md',
            'artisan',
            'composer.json',
            'composer.lock',
            'package.json',
            'package-lock.json',
            'phpunit.xml',
            'pint.json',
            'server.php',
            'webpack.mix.js',
            '.editorconfig',
            '.env.example',
            '.gitattributes',
            '.gitignore',
            '.styleci.yml'
        ];

        foreach ($baseFiles as $file) {
            File::delete(base_path("/$file"));
        }
    }

    protected static function unzipAndDeleteProcessing($zip, string $fileName): void
    {
        $file = base_path($fileName);
        $res = $zip->open($file);
        if ($res === TRUE) {
           $zip->extractTo(base_path());
           $zip->close();

           // ****** Delete Zip File ******
           File::delete($file);
        }
    }

    protected function envSetDatabaseCredentials($request): void
    {
        $centralDomain = self::filterURL($request->central_domain);

        $this->dataWriteInENVFile('CPANEL_USER_NAME', $request->cpanel_username);
        $this->dataWriteInENVFile('CENTRAL_DOMAIN', $centralDomain);
        $this->dataWriteInENVFile('DB_PREFIX', $request->db_prefix);
        $this->dataWriteInENVFile('DB_CONNECTION', 'peopleprosaas_landlord');
        $this->dataWriteInENVFile('DB_HOST', $request->db_host);
        $this->dataWriteInENVFile('DB_PORT', $request->db_port);
        $this->dataWriteInENVFile('DB_DATABASE', null);
        $this->dataWriteInENVFile('LANDLORD_DB', $request->db_name);
        $this->dataWriteInENVFile('DB_USERNAME', $request->db_username);
        $this->dataWriteInENVFile('DB_PASSWORD', $request->db_password);
        $this->dataWriteInENVFile('VERSION', '1.0.0');
    }

    protected static function filterURL(string $centralDomain): string
    {
        if (strpos($centralDomain, 'http://') === 0) {
            $url = substr($centralDomain, 7);
        }
        elseif (strpos($centralDomain, 'https://') === 0) {
            $url = substr($centralDomain, 8);
        }

        return $url = rtrim($url, '/');
    }

    public function switchToNewDatabaseConnection($request): void
    {
        DB::purge('mysql');
        Config::set('database.connections.mysql.host', $request->db_host);
        Config::set('database.connections.mysql.database', $request->db_name);
        Config::set('database.connections.mysql.username', $request->db_username);
        Config::set('database.connections.mysql.password', $request->db_password);
    }

    protected static function migrateCentralDatabase(): void
    {
        Artisan::call('migrate --path=database/migrations/landlord');
    }

    protected static function seedCentralDatabase(): void
    {
        Artisan::call('db:seed');
    }

    public function saasInstallStep4()
    {
        return view('addons.saas.step_4');
    }
}




