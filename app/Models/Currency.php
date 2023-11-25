<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'description', 'company_id', 'symbol'];

    public function latestRate()
    {
        return $this->hasOne(CurrencyRate::class, 'currency_id', 'id')
            ->latest(); 
    }
    public function company()
    {
        return $this->belongsTo(company::class, 'company_id', 'id');
    }
}
