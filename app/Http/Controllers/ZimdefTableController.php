<?php

namespace App\Http\Controllers;

use App\Models\ZimdefTable;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ZimdefTableController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $zimdef  = ZimdefTable::get();

        return view('zimdef.index', compact('zimdef'));
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
                'deduction' => 'required',

            ]);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            $zimdef = $request->only(['deduction']);
            $zimdef['updated_by'] =  $logged_user->first_name . ' ' . $logged_user->last_name;

            $zimdef['created_at'] =  Carbon::now();
            $zimdef['updated_at'] =  Carbon::now();

            $insert = ZimdefTable::insert($zimdef);

            if ($insert) {
                return  redirect()->back()->with('success', __('Zimdef table updated succesfully'));
            }
        } else {
            return redirect()->back()->with('errors', ['failed' => __('You are not authorized')]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(ZimdefTable $zimdefTable)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit( $zimdefTable)
    {
        //
        $zimdef  = ZimdefTable::find($zimdefTable);

        return view('zimdef.edit', compact('zimdef'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,  $zimdefTable)
    {
        //
        $logged_user = auth()->user();
        if ($logged_user->can('store-details-employee')) {
            $validator = Validator::make($request->all(), [
                'deduction' => 'required',

            ]);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            $zimdef = $request->only(['deduction']);
            $zimdef['updated_by'] =  $logged_user->first_name . ' ' . $logged_user->last_name;

            $zimdef['updated_at'] =  Carbon::now();

            $insert = ZimdefTable::where('id', $zimdefTable)->update($zimdef);

            if ($insert) {
                return  redirect('zimdef-taxtables')->with('success', __('Zimdef table updated succesfully'));
            }
        } else {
            return redirect()->back()->with('errors', ['failed' => __('You are not authorized')]);
        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ZimdefTable $zimdefTable)
    {
        //
    }
}
