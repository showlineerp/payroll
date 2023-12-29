<?php

namespace App\Http\Controllers;

use App\Models\Currency;
use App\Models\NssaTable;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NssaTableController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $nssa = NssaTable::get();
        return view("nssa.index", compact('nssa'));
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
        if ($logged_user->can('store-details-employee')) {
            $validator = Validator::make($request->all(), [
                'currency_id' => 'required',
                'posb_contribution' => 'required',
                'insuarance_ceiling' => 'required',
                'posb_insuarance' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
        
            $nssa = $request->only(['currency_id', 'posb_contribution', 'insuarance_ceiling', 'posb_insuarance']);
            $nssa['last_updated_by'] = $logged_user->first_name . ' ' . $logged_user->last_name;
            $nssa['updated_at'] = Carbon::now();
            $nssa['created_at'] = Carbon::now();
            $nssa['currency'] = Currency::find($request->currency_id)->symbol;
            $insert =  NssaTable::insert($nssa);
            if ($insert) {
                return  redirect()->back()->with('success', __('Nssa table updated succesfully'));
            }
        } else {
            return redirect()->back()->with('errors', ['failed'=> __('You are not authorized')]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(NssaTable $nssaTable)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(NssaTable $nssaTable)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, NssaTable $nssaTable)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(NssaTable $nssaTable)
    {
        //
    }
}
