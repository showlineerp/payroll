<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ZwlTaxTable extends Model
{
    use HasFactory;

    public function getTableDataByType($tableType)
    {
        return $this->where('table_type', $tableType)->orderBy('lower_range','ASC')->get();
    }

}
