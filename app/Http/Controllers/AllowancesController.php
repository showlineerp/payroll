<?php

namespace App\Http\Controllers;

use App\Models\Allowances;
use App\Models\company;
use App\Models\Currency;
use Illuminate\Http\Request;

class AllowancesController extends Controller
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
			return view('allowances.index', compact('currencies'));
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
    }

    /**
     * Display the specified resource.
     */
    public function show(Allowances $allowances)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Allowances $allowances)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Allowances $allowances)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Allowances $allowances)
    {
        //
    }
}
