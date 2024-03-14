<?php

namespace App\Http\Controllers;

use App\Models\Allowances;
use App\Models\company;
use App\Models\Currency;
use App\Models\CurrencyRate;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;

class CurrencyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
    	$logged_user = auth()->user();

		if ($logged_user->can('view-details-employee')) {
			$currencies = Currency::get();
			if (request()->ajax()) {
				$salaryAllowance = Allowances::get();

				return datatables()->of($salaryAllowance)
					->setRowId(function ($allowance) {
						return $allowance->id;
					})
					->addColumn('action', function ($data) {
						if (auth()->user()->can('modify-details-employee')) {
							$button = '<button type="button" name="edit" id="' . $data->id . '" class="allowance_edit btn btn-primary btn-sm"><i class="dripicons-pencil"></i></button>';
							$button .= '&nbsp;&nbsp;';
							$button .= '<button type="button" name="delete" id="' . $data->id . '" class="allowance_delete btn btn-danger btn-sm"><i class="dripicons-trash"></i></button>';

							return $button;
						} else {
							return '';
						}
					})
					->rawColumns(['action'])
					->make(true);
			}
			return view('allowances.index', compact('employee', 'currencies'));
		}

		return response()->json(['success' => __('You are not authorized')]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //

        $logged_user = auth()->user();
        if ($logged_user->can('view-details-employee')) {
            if (request()->ajax()) {
                $validator = Validator::make(
                    $request->only('name', 'description', 'rate', 'symbol'),
                    [
                        'name' => 'required',
                        'symbol' => 'required',
                        'rate' => 'required|numeric'
                    ]
                );

                if ($validator->fails()) {
                    return response()->json(['errors' => $validator->errors()->all()]);
                }
                DB::beginTransaction();
                try {
                    $currency_input =  $request->only('name', 'description', 'company_id', 'symbol');
                    $currency = Currency::create($currency_input);
                    $rate_input =  $request->only('rate');
                    $rate_input['currency_id'] = $currency->id;
                    $rate = CurrencyRate::create($rate_input);
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollback();

                    return response()->json(['error' => $e->getMessage()]);
                }
                return response()->json(['success' => __('Currency Added successfully.')]);
            } else {
                return response()->json(['success' => __('You are not authorized')]);
            }
        }
        return response()->json(['success' => __('You are not authorized')]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
        $currency = Currency::with(['rates', 'latestRate'])->findOrFail($id);
        $companies = company::select('id', 'company_name')->get();
        return view('currency.edit', compact('currency','companies'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
        $validator = Validator::make(
            $request->only('name', 'description', 'rate', 'symbol'),
            [
                'name' => 'required',
                'symbol' => 'required',
                'rate' => 'required|numeric'
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with(['errors' => $validator->errors()->all()]);
        }
        DB::beginTransaction();
        try {
            $currency_input =  $request->only('name', 'description', 'company_id', 'symbol');
            $currency = Currency::where('id', $id)->update($currency_input);
            $rate_input =  $request->only('rate');
            $rate_input['currency_id'] = $id;
            $rate = CurrencyRate::create($rate_input);
            DB::commit();
        } catch (Exception $e) {
            DB::rollback();

            return redirect()->back()->with(['errors' => [['code'=> $e->getMessage(),'message'=> $e->getMessage() ]]]);
        }
        return redirect()->back()->with(['success' => __('Currency Updated successfully.')]);
 
        
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
