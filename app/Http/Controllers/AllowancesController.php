<?php

namespace App\Http\Controllers;

use App\Models\Allowances;
use App\Models\company;
use App\Models\Currency;
use App\Models\department;
use App\Models\Employee;
use App\Models\SalaryAllowance;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

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
			$employees = Employee::get();
			$companies = company::get();
			$departments = department::get();
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
			return view('allowances.index', compact('currencies', 'employees', 'companies', 'departments'));
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
		$logged_user = auth()->user();
		if ($logged_user->can('store-details-employee')) {
			$validator = Validator::make(
				$request->only(
					'month_year',
					'allowance_title',
					'allowance_amount',
					'is_taxable',
					'employee_group'
				),
				[
					'month_year' => 'required',
					'allowance_title' => 'required',
					'allowance_amount' => 'required|numeric',
					'is_taxable' => 'required',
					'employee_group' => 'required'
				]
			);

			if ($validator->fails()) {
				return response()->json(['errors' => $validator->errors()->all()]);
			}

			$first_date = date('Y-m-d', strtotime('first day of ' . $request->month_year));

			$currency = Currency::find($request->currency_id);

			$employees = $this->get_employees_by_type($request);
			$data = [];
			$data['month_year'] = $request->month_year;
			$data['first_date'] = $first_date;
			$data['allowance_title'] = $request->allowance_title;
			$data['employee_id'] = $employees;
			$data['employee_group'] = $request->company_id;
			$data['company_id'] = $request->company_id;
			$data['department_id'] = $request->department_id;
			$data['allowance_amount'] = $request->allowance_amount;
			$data['is_taxable'] = $request->is_taxable;
			$data['is_recurring'] = $request->is_recurring;
			$data['currency_id'] = $request->currency_id;
			if ($request->is_taxable && empty($request->deductible_amt)) {
				$data['deductible_amt'] = 100;
			} else {
				$data['deductible_amt'] = $request->deductible_amt;
			}
			if (!empty($currency)) {
				$data['currency_symbol'] = $currency->symbol;
			}
			$data['created_at'] = Carbon::now();
			$data['updated_at'] = Carbon::now();

			Allowances::insert($data);

			$this->add_allowances_to_employees($employees, $data);
			return response()->json(['success' => __('Data Added successfully.')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function edit($id)
	{
		if (request()->ajax()) {
			$data = Allowances::findOrFail($id);

			return response()->json(['data' => $data]);
		}
	}

	public function update(Request $request)
	{
		$logged_user = auth()->user();

		if ($logged_user->can('modify-details-employee')) {
			$id = $request->hidden_id;

			$validator = Validator::make(
				$request->only(
					'month_year',
					'allowance_title',
					'allowance_amount',
					'is_taxable'
				),
				[
					'month_year' => 'required',
					'allowance_title' => 'required',
					'allowance_amount' => 'required|numeric',
					'is_taxable' => 'required',
				]
			);

			if ($validator->fails()) {
				return response()->json(['errors' => $validator->errors()->all()]);
			}

			$first_date = date('Y-m-d', strtotime('first day of ' . $request->month_year));

			$currency = Currency::find($request->currency_id);
			$data = [];
			$data['month_year'] = $request->month_year;
			$data['first_date'] = $first_date;
			$data['allowance_title'] = $request->allowance_title;
			$data['allowance_amount'] = $request->allowance_amount;
			$data['is_taxable'] = $request->is_taxable;
			$data['currency_id'] = $request->currency_id;
			$data['deductible_amt'] = $request->deductible_amt;
			if (!empty($currency)) {
				$data['currency_symbol'] = $currency->symbol;
			}
			SalaryAllowance::whereId($id)->update($data);

			return response()->json(['success' => __('Data is successfully updated')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$logged_user = auth()->user();

		if ($logged_user->can('modify-details-employee')) {
			Allowances::whereId($id)->delete();

			return response()->json(['success' => __('Data is successfully deleted')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function get_employees_by_type($request)
	{
		$employees = null;
		$employee_arr = [];
		if ($request->employee_group == 'company') {
			$employee_arr = Employee::where('company_id', $request->company_id)->pluck('id')->toArray();
			$employees =  implode(",", $employee_arr);
		} else if ($request->employee_group == 'department') {
			$employee_arr = Employee::where('department_id', $request->company_id)->pluck('id')->toArray();
			$employees =  implode(",", $employee_arr);
		} else {
			$employee_arr = Employee::whereIn('id', $request->employees)->pluck('id')->toArray();
			$employees =  implode(",", $employee_arr);
		}
		return $employees;
	}

	public function add_allowances_to_employees($employee, $allowance)
	{
		if (!empty($employee)) {
			$employees = explode(",", $employee);
			foreach ($employees as $employee) {
				$data = [];
				$data['month_year'] = $allowance["month_year"];
				$data['first_date'] = $allowance["first_date"];
				$data['allowance_title'] = $allowance["allowance_title"];
				$data['employee_id'] = $employee;
				$data['allowance_amount'] =  $allowance["allowance_amount"];
				$data['is_taxable'] = $allowance["is_taxable"];
				$data['is_taxable'] = $allowance["is_taxable"];
				$data['currency_id'] = $allowance["currency_id"];
				if ($allowance["is_taxable"] && empty($allowance["deductible_amt"])) {
					$data['deductible_amt'] = 100;
				} else {
					$data['deductible_amt'] = $allowance["deductible_amt"];
				}
				if (!empty($currency)) {
					$data['currency_symbol'] = $allowance["currency_symbol"];
				}
				SalaryAllowance::create($data);
			}
		}
	}
}
