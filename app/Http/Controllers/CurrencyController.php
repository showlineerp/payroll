<?php

namespace App\Http\Controllers;

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
            $companies = company::select('id', 'company_name')->get();
            $currencies = Currency::with(['latestRate', 'company'])->get();
        
            $currentDate = date('Y-m-d');

            if (request()->ajax()) {


                return datatables()->of($currencies)
                    ->setRowId(function ($row) {
                        return $row->id;
                    })
                    ->addColumn('name', function ($row) {
                        return "<span>" . $row->name . "</span>";
                    })
                    ->addColumn('rate', function ($row) {
                        return  $row->latestRate->rate;
                    })
                    ->addColumn('rate_updated', function ($row) {
                        return date('d/m/Y', strtotime($row->latestRate->updated_at));
                    })
                    ->addColumn('company', function ($row) {
                        $company = "<span class='text-bold'>" . strtoupper($row->company->company_name ?? '') . '</span>';
                        return $company;
                    })

                    ->addColumn('action', function ($data) {
                        $button = '';
                        if (auth()->user()->can('view-details-employee')) {
                            $button .= '<a href="'.route('currency.edit', ['currency'=> $data->id]).'"  class="edit btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" title="View Details"><i class="dripicons-preview"></i></button></a>';
                            $button .= '&nbsp;&nbsp;&nbsp;';
                        }
                        // if (auth()->user()->can('modify-details-employee')) {
                        //     if ($data->role_users_id != 1) {
                        //         $button .= '<button type="button" name="delete" id="' . $data->id . '" class="delete btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Delete"><i class="dripicons-trash"></i></button>';
                        //         $button .= '&nbsp;&nbsp;&nbsp;';
                        //     }
                        // }

                        return $button;
                    })
                    ->rawColumns(['name', 'company','currency', 'action'])
                    ->make(true);
            }
            return view('currency.index', compact('companies', 'currencies'));
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
    }
}
