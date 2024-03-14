<?php

namespace App\Http\Controllers;

use App\Models\Allowances;
use App\Models\Currency;
use App\Models\Employee;
use App\Models\SalaryAllowance;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

class SalaryAllowanceController extends Controller
{

	public function show(Employee $employee)
	{
		$logged_user = auth()->user();

		if ($logged_user->can('view-details-employee')) {
			$currencies = Currency::get();
			if (request()->ajax()) {
				$salaryAllowance = SalaryAllowance::where('employee_id', $employee->id)
					->orderByRaw('DATE_FORMAT(first_date, "%y-%m")')
					->get();

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
			return view('employee.salary.allowance.index', compact('employee', 'currencies'));
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function store(Request $request, Employee $employee)
	{
		$logged_user = auth()->user();
		if ($logged_user->can('store-details-employee')) {
			$validator = Validator::make(
				$request->only(
					'month_year',

				),
				[
					'month_year' => 'required',

				]
			);

			if ($validator->fails()) {
				return response()->json(['errors' => $validator->errors()->all()]);
			}


			$first_date = date('Y-m-d', strtotime('first day of ' . $request->month_year));

			$builk_allowance = Allowances::find($request->allowance_id);
			if (!empty($builk_allowance->employee_id)) {
				$employees = explode(",", $builk_allowance->employee_id);
				if (in_array($request->alllowance_id, $employees) && ($builk_allowance->month_year == $request->month_year || $builk_allowance->is_recurring)) {
					return response()->json(["errors" => 
					["code" => 'allowance', 'message' => 'That allowance already exists for this user this month']]);
				}
			}
			$data = [];
			$data['month_year'] = $request->month_year;
			$data['first_date'] = $first_date;
			$data['allowances_id'] = $builk_allowance->id;
			$data['allowance_title'] = $builk_allowance->allowance_title;
			$data['employee_id'] = $employee->id;
			$data['allowance_amount'] = $builk_allowance->allowance_amount;
			$data['is_taxable'] = $builk_allowance->is_taxable;
			$data['is_recurring'] = $builk_allowance->is_recurring;
			$data['currency_id'] = $builk_allowance->currency_id;
			if ($builk_allowance->is_taxable && empty($builk_allowance->deductible_amt)) {
				$data['deductible_amt'] = 100;
			} else {
				$data['deductible_amt'] = $builk_allowance->deductible_amt;
			}

			$data['currency_symbol'] = $builk_allowance->currency_symbol;
			SalaryAllowance::create($data);
			if (empty($builk_allowance->employee_id)) {
				$builk_allowance->employee_id = $employee->id;
			} else {
				$builk_allowance->employee_id = $builk_allowance->employee_id . "," . $employee->id;
				$builk_allowance->save();
			}

			return response()->json(['success' => __('Data Added successfully.')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}

	public function edit($id)
	{
		if (request()->ajax()) {
			$data = SalaryAllowance::findOrFail($id);

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
			SalaryAllowance::whereId($id)->delete();

			return response()->json(['success' => __('Data is successfully deleted')]);
		}

		return response()->json(['success' => __('You are not authorized')]);
	}
}
