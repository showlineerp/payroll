<?php

namespace App\Http\Controllers;

use App\Models\company;
use App\Models\Currency;
use App\Models\NssaTable;
use App\Models\ZwlTaxTable;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ZwlTaxTableController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //
        $logged_user = auth()->user();
        if ($logged_user->can('view-details-employee')) {
            $taxes = new ZwlTaxTable();


            $daily_taxes =  $taxes->getTableDataByType('daily');
            $weekly_taxes = $taxes->getTableDataByType('weekly');
            $fortnightly_taxes = $taxes->getTableDataByType('fortnightly');
            $monthly_taxes =  $taxes->getTableDataByType('monthly');
            $annual_taxes =  $taxes->getTableDataByType('annually');

            if (request()->ajax()) {
                return view('tax_tables.zwl.partials.table', compact('daily_taxes', 'weekly_taxes', 'fortnightly_taxes', 'monthly_taxes', 'annual_taxes'));
            }


            return view('tax_tables.zwl.index', compact('daily_taxes', 'weekly_taxes', 'fortnightly_taxes', 'monthly_taxes', 'annual_taxes'));

        } else {
            return response()->json(['success' => __('You are not authorized')]);
        }
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

        $validated = $request->validate([
            'lower_range' => 'required',
            'upper_range' => 'required',
            'multiply_by' => 'required',
            'deduct' => 'required',
            'table_type' => 'required'
        ]);

        $tax_table = $request->only(['lower_range', 'upper_range', 'multiply_by', 'deduct', 'table_type', 'calculation_info']);
        $tax_table['created_at'] = Carbon::now();
        $tax_table['updated_at'] = Carbon::now();
        ZwlTaxTable::insert($tax_table);

        return response()->json(['success' => __('Data Added successfully.')]);


        // return redirect()->back()->with("success", "data inserted succesfully");

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
        $n = NssaTable::find($id);

        return view('nssa.edit', compact('n'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
        $deleted = ZwlTaxTable::where('id',$id)->delete();
        return redirect()->back()->with(['success' => __('New entry deleted succesfully')]);

    }
}
