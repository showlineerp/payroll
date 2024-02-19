<?php

namespace App\Http\Controllers;

use App\Models\company;
use App\Models\Employee;
use App\Models\FinanceBankCash;
use App\Models\FinanceExpense;
use App\Models\FinanceTransaction;
use App\Http\traits\TotalSalaryTrait;
use App\Models\Payslip;
use App\Models\SalaryLoan;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Throwable;
use App\Http\traits\MonthlyWorkedHours;
use App\Models\NssaTable;
use App\Models\SalaryBasic;
use App\Models\SalaryCommission;
use App\Models\SalaryDeduction;
use App\Models\SalaryOtherPayment;
use App\Models\SalaryOvertime;
use App\Models\UsdTaxTable;
use App\Models\ZwlTaxTable;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class PayrollController extends Controller
{

	use TotalSalaryTrait;
	use MonthlyWorkedHours;
	
	public $apwcs_contribution = [];
	public function index(Request $request)
	{
		$logged_user = auth()->user();
		$companies = company::all();

		$selected_date = empty($request->filter_month_year) ? now()->format('F-Y') : $request->filter_month_year;
		$first_date = date('Y-m-d', strtotime('first day of ' . $selected_date));
		$last_date = date('Y-m-d', strtotime('last day of ' . $selected_date));

		if ($logged_user->can('view-paylist')) {
			if (request()->ajax()) {
				$paid_employees = Payslip::where('month_year', $selected_date)->pluck('employee_id');
				$salary_basic_employees = SalaryBasic::where('first_date', '<=', $first_date)->distinct()->pluck('employee_id');

				if (!empty($request->filter_company && $request->filter_department)) {
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($selected_date) {
							$query->where('month_year', $selected_date);
						},
						'payslips' => function ($query) use ($selected_date) {
							$query->where('month_year', $selected_date);
						},
						'employeeAttendance' => function ($query) use ($first_date, $last_date) {
							$query->whereBetween('attendance_date', [$first_date, $last_date]);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount')
						->where('company_id', $request->filter_company)
						->where('department_id', $request->filter_department)
						->whereIntegerInRaw('id', $salary_basic_employees)
						->whereIntegerNotInRaw('id', $paid_employees)
						->where('is_active', 1)
						->where('exit_date', NULL)
						->get();
				} elseif (!empty($request->filter_company)) {
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($selected_date) {
							$query->where('month_year', $selected_date);
						},
						'payslips' => function ($query) use ($selected_date) {
							$query->where('month_year', $selected_date);
						},
						'employeeAttendance' => function ($query) use ($first_date, $last_date) {
							$query->whereBetween('attendance_date', [$first_date, $last_date]);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount')
						->where('company_id', $request->filter_company)
						->whereIntegerInRaw('id', $salary_basic_employees)
						->whereIntegerNotInRaw('id', $paid_employees)
						->where('is_active', 1)->where('exit_date', NULL)
						->get();
				} else {
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($selected_date) {
							$query->where('month_year', $selected_date);
						},
						'payslips' => function ($query) use ($selected_date) {
							$query->where('month_year', $selected_date);
						},
						'employeeAttendance' => function ($query) use ($first_date, $last_date) {
							$query->whereBetween('attendance_date', [$first_date, $last_date]);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount')
						// ->whereIntegerInRaw('id',$salary_basic_employees)
						// ->whereIntegerNotInRaw('id',$paid_employees)
						->whereIntegerInRaw('id', $salary_basic_employees)
						->whereIntegerNotInRaw('id', $paid_employees)
						->where('is_active', 1)
						->where('exit_date', NULL)
						->get();
				}

				return datatables()->of($employees)
					->setRowId(function ($pay_list) {
						return $pay_list->id;
					})
					->addColumn('employee_name', function ($row) {
						return $row->full_name;
					})
					->addColumn('payslip_type', function ($row) use ($first_date) {
						foreach ($row->salaryBasic as $salaryBasic) {
							if ($salaryBasic->first_date <= $first_date) {
								$payslip_type = $salaryBasic->payslip_type; //payslip_type
							}
						}
						return $payslip_type;
					})
					->addColumn('basic_salary', function ($row) use ($first_date) {
						foreach ($row->salaryBasic as $salaryBasic) {
							if ($salaryBasic->first_date <= $first_date) {
								$basicsalary = $salaryBasic->basic_salary; //basic salary
							}
						}
						return $basicsalary;
					})
					->addColumn('net_salary', function ($row)  use ($first_date) {
						//payslip_type & basic_salary
						foreach ($row->salaryBasic as $salaryBasic) {
							if ($salaryBasic->first_date <= $first_date) {
								$payslip_type = $salaryBasic->payslip_type;
								$basicsalary = $salaryBasic->basic_salary;
							}
						}

						//Pension Amount
						if ($row->pension_type == "percentage") {
							$pension_amount =  ($basicsalary * $row->pension_amount) / 100;
						} else {
							$pension_amount = $row->pension_amount;
						}

						$type              = "getAmount";
						$allowance_amount  = $this->allowances($row, $first_date, $type);
						$deduction_amount  = $this->deductions($row, $first_date, $type);

						//Net Salary
						if ($payslip_type == 'Monthly') {
							$total_salary = $this->totalSalary($row, $payslip_type, $basicsalary, $allowance_amount, $deduction_amount, $pension_amount);
						} else {
							$total = 0;
							$total_hours = $this->totalWorkedHours($row);
							sscanf($total_hours, '%d:%d', $hour, $min);
							//converting in minute
							$total += $hour * 60 + $min;


							//********** Test *********/
							// $total_overtime = 0;
							// $total_overtimes = $this->totalOvertimeHours($row);
							// sscanf($total_overtimes, '%d:%d', $overtimeHour, $overtimeMin);
							// $total_overtime += $overtimeHour * 60 + $overtimeMin;

							// return $total_overtime;

							//********** Test End*********/

							$total_salary = $this->totalSalary($row, $payslip_type, $basicsalary, $allowance_amount, $deduction_amount, $pension_amount, $total);
						}

						return $total_salary;

						// if ($row->payslip_type == 'Monthly')
						// {
						// 	$total_salary = $this->totalSalary($row);
						// } else
						// {
						// 	$total = 0;
						// 	$total_hours = $this->totalWorkedHours($row);

						// 	sscanf($total_hours, '%d:%d', $hour, $min);
						// 	//converting in minute
						// 	$total += $hour * 60 + $min;
						// 	$total_salary = $this->totalSalary($row, $total);
						// }

					})
					->addColumn('status', function ($row) {
						foreach ($row->payslips as $payslip) {
							$status = $payslip->status;

							return $status;
						}
					})
					->addColumn('action', function ($data) {
						if (auth()->user()->can('view-paylist')) {
							if (auth()->user()->can('make-payment')) {
								$button = '<button type="button" name="view" id="' . $data->id . '" class="details btn btn-primary btn-sm" title="Details"><i class="dripicons-preview"></i></button>';
								$button .= '&nbsp;&nbsp;';
								$button .= '<button type="button" name="payment" id="' . $data->id . '" class="generate_payment btn btn-secondary btn-sm" title="generate_payment"><i class="fa fa-money"></i></button>';
							} else {
								$button = '';
							}
							return $button;
						} else {
							return '';
						}
					})
					->rawColumns(['action'])
					->make(true);
			}

			return view('salary.pay_list.index', compact('companies'));
		}

		return abort('403', __('You are not authorized'));
	}


	// Details
	public function paySlip(Request $request)
	{
		$month_year = $request->filter_month_year;
		$first_date = date('Y-m-d', strtotime('first day of ' . $month_year));
		$last_date = date('Y-m-d', strtotime('last day of ' . $month_year));

		$employee = Employee::with([
			'salaryBasic' => function ($query) {
				$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
			},
			'allowances' => function ($query) {
				$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
			},
			'commissions' => function ($query) use ($first_date) {
				$query->where('first_date', $first_date);
			},
			'loans' => function ($query) use ($first_date) {
				$query->where('first_date', '<=', $first_date)
					->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
			},
			'deductions' => function ($query) {
				$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
			},
			'otherPayments' => function ($query) use ($first_date) {
				$query->where('first_date', $first_date);
			},
			'overtimes' => function ($query) use ($month_year) {
				$query->where('month_year', $month_year);
			},
			'designation', 'department', 'user',
			'employeeAttendance' => function ($query) use ($first_date, $last_date) {
				$query->whereBetween('attendance_date', [$first_date, $last_date]);
			}
		])
			->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'designation_id', 'department_id', 'joining_date')
			->findOrFail($request->id);

		//payslip_type && salary_basic
		foreach ($employee->salaryBasic as $salaryBasic) {
			if ($salaryBasic->first_date <= $first_date) {
				$basic_salary = $salaryBasic->basic_salary;
				$payslip_type = $salaryBasic->payslip_type;
			}
		}

		//Pension Amount
		if ($employee->pension_type == "percentage") {
			$pension_amount =  ($basic_salary * $employee->pension_amount) / 100.00;
		} else {
			$pension_amount = $employee->pension_amount;
		}


		$type          = "getArray";
		$allowances    = $this->allowances($employee, $first_date, $type);
		$deductions    = $this->deductions($employee, $first_date, $type);
		$data = [];
		$data['basic_salary'] = $basic_salary;
		$data['basic_total']  = $basic_salary;
		$data['allowances']   = $allowances;
		$data['commissions']  = $employee->commissions;
		$data['loans']        = $employee->loans;
		$data['deductions']   = $deductions;
		$data['overtimes']    = $employee->overtimes;
		$data['other_payments'] = $employee->otherPayments;
		$data['pension_type']   = $employee->pension_type;
		$data['pension_amount'] = $pension_amount;

		$data['employee_id']          = $employee->id;
		$data['employee_full_name']   = $employee->full_name;
		$data['employee_designation'] = $employee->designation->designation_name ?? '';
		$data['employee_department']  = $employee->department->department_name ?? '';
		$data['employee_join_date']   = $employee->joining_date;
		$data['employee_username']    = $employee->user->username;
		$data['employee_profile_photo']          = $employee->user->profile_photo ?? '';

		$data['payslip_type'] = $payslip_type;

		if ($payslip_type == 'Hourly') {
			$total = 0;
			$total_hours_worked = $this->totalWorkedHours($employee);
			$data['monthly_worked_hours'] = $total_hours_worked;
			//formatting in hour:min and separating them
			sscanf($total_hours_worked, '%d:%d', $hour, $min);
			//converting in minute
			$total += $hour * 60 + $min;

			$data['monthly_worked_amount'] = ($basic_salary / 60) * $total;

			$data['basic_total'] = $data['monthly_worked_amount'];
		}

		return response()->json(['data' => $data]);
	}

	public function payslipGenerateInfoShow(Request $request)
	{

		$month_year = $request->filter_month_year;
		$first_date = date('Y-m-d', strtotime('first day of ' . $month_year));
		$last_date = date('Y-m-d', strtotime('last day of ' . $month_year));

		$employee = Employee::with([
			'salaryBasic' => function ($query) {
				$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
			},
			'allowances' => function ($query) {
				$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
			},
			'commissions' => function ($query) use ($first_date) {
				$query->where('first_date', $first_date);
			},
			'loans' => function ($query) use ($first_date) {
				$query->where('first_date', '<=', $first_date)
					->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
			},
			'deductions' => function ($query) {
				$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
			},
			'otherPayments' => function ($query) use ($first_date) {
				$query->where('first_date', $first_date);
			},
			'overtimes' => function ($query) use ($month_year) {
				$query->where('month_year', $month_year);
			},
			'designation', 'department', 'user',
			'employeeAttendance' => function ($query) use ($first_date, $last_date) {
				$query->whereBetween('attendance_date', [$first_date, $last_date]);
			}
		])
			->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'designation_id', 'department_id', 'joining_date', 'pension_type', 'pension_amount')
			->findOrFail($request->id);


		//payslip_type & basic_salary
		foreach ($employee->salaryBasic as $salaryBasic) {
			if ($salaryBasic->first_date <= $first_date) {
				$basic_salary = $salaryBasic->basic_salary;
				$payslip_type = $salaryBasic->payslip_type;
			}
		}
		// $this->calculate_salary_with_taxes($employee, $first_date,$basic_salary, $month_year);
		//Pension Amount
		if ($employee->pension_type == "percentage") {
			$pension_amount =  ($basic_salary * $employee->pension_amount) / 100;
		} else {
			$pension_amount = $employee->pension_amount;
		}


		$type              = "getAmount";
		$allowance_amount  = $this->allowances($employee, $first_date, $type);
		$deduction_amount  = $this->deductions($employee, $first_date, $type);

		$data = [];
		$data['employee']         = $employee->id;
		$data['basic_salary']     = $basic_salary;
		$data['total_allowance']  = $allowance_amount;
		$data['total_commission'] = $employee->commissions->sum('commission_amount');
		$data['monthly_payable']  = $employee->loans->sum('monthly_payable');
		$data['amount_remaining'] = $employee->loans->sum('amount_remaining');
		$data['total_deduction']  = $deduction_amount;
		$data['total_overtime']   = $employee->overtimes->sum('overtime_amount');
		$data['total_other_payment'] = $employee->otherPayments->sum('other_payment_amount');
		$data['payslip_type']     = $payslip_type;
		$data['pension_amount']   = $pension_amount;

		if ($payslip_type == 'Monthly') {
			// $data['total_salary'] = $this->totalSalary($employee); //will be deleted----
			$data['total_salary'] = $this->totalSalary($employee, $payslip_type, $basic_salary, $allowance_amount, $deduction_amount, $pension_amount);
		} else {
			$total = 0;
			$total_hours = $this->totalWorkedHours($employee);
			sscanf($total_hours, '%d:%d', $hour, $min);
			//converting in minute
			$total += $hour * 60 + $min;
			$data['total_hours'] = $total_hours;
			$data['worked_amount'] = ($data['basic_salary'] / 60) * $total;
			$data['total_salary'] = $this->totalSalary($employee, $payslip_type, $basic_salary, $allowance_amount, $deduction_amount, $pension_amount, $total);
		}
		return response()->json(['data' => $data]);
	}


	public function payEmployee($id, Request $request)
	{
		$logged_user = auth()->user();

		if ($logged_user->can('make-payment')) {
			$first_date = date('Y-m-d', strtotime('first day of ' . $request->month_year));

			DB::beginTransaction();
			try {
				$employee = Employee::with([
					'allowances' => function ($query) {
						$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
					},
					'commissions' => function ($query) use ($first_date) {
						$query->where('first_date', $first_date);
					},
					'loans' => function ($query) use ($first_date) {
						$query->where('first_date', '<=', $first_date)
							->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
					},
					'deductions' => function ($query) {
						$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
					},
					'otherPayments' => function ($query) use ($first_date) {
						$query->where('first_date', $first_date);
					},
					'overtimes' => function ($query) use ($first_date) {
						$query->where('first_date', $first_date);
					}
				])
					->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'company_id')
					->findOrFail($id);


				$this->calculate_salary_with_taxes($employee, $first_date, $request->basic_salary, $request->month_year,$request->payslip_type);
				

				$employee = Employee::with([
					'allowances' => function ($query) {
						$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
					},
					'commissions' => function ($query) use ($first_date) {
						$query->where('first_date', $first_date);
					},
					'loans' => function ($query) use ($first_date) {
						$query->where('first_date', '<=', $first_date)
							->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
					},
					'deductions' => function ($query) {
						$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
					},
					'otherPayments' => function ($query) use ($first_date) {
						$query->where('first_date', $first_date);
					},
					'overtimes' => function ($query) use ($first_date) {
						$query->where('first_date', $first_date);
					}
				])
					->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'company_id')
					->findOrFail($id);
				$type          = "getArray";
				$allowances    = $this->allowances($employee, $first_date, $type); //getArray
				$deductions    = $this->deductions($employee, $first_date, $type);
				$taxcredit = $this->taxcredits($employee, $first_date, "getArray");



				$data = [];

				$data['payslip_key']    = Str::random('20');
				$data['payslip_number'] = mt_rand(1000000000, 9999999999);
				$data['payment_type']   = $request->payslip_type;
				$data['basic_salary']   = $request->basic_salary;
				$data['allowances']     = $allowances;
				$data['commissions']    = $employee->commissions;
				$data['loans']          = $employee->loans;
				$data['deductions']     = $deductions;
				$data['overtimes']      = $employee->overtimes;
				$data['tax_credits']    = $taxcredit;
				$data['other_payments'] = $employee->otherPayments;
				$data['month_year']     = $request->month_year;
				$data['net_salary']     = $request->net_salary;
				$data['status']         = 1;
				$data['employee_id']    = $employee->id;
				$data['hours_worked']   = $request->worked_hours;
				$data['pension_type']   = $employee->pension_type;
				$data['pension_amount'] = $request->pension_amount;
				$data['company_id']     = $employee->company_id;

				if ($data['payment_type'] == NULL) { //No Need This Line
					return response()->json(['payment_type_error' => __('Please select a payslip-type for this employee.')]);
				}

				$account_balance = DB::table('finance_bank_cashes')->where('id', config('variable.account_id'))->pluck('account_balance')->first();

				if ((int)$account_balance < (int)$request->net_salary) {
					return response()->json(['error' => 'requested balance is less then available balance']);
				}

				$new_balance = (int)$account_balance - (int)$request->net_salary;

				$finance_data = [];

				$finance_data['account_id'] = config('variable.account_id');
				$finance_data['amount'] = $request->net_salary;
				$finance_data['expense_date'] = now()->format(env('Date_Format'));
				$finance_data['expense_reference'] = trans('file.Payroll');


				FinanceBankCash::whereId($finance_data['account_id'])->update(['account_balance' => $new_balance]);

				$Expense = FinanceTransaction::create($finance_data);

				$finance_data['id'] = $Expense->id;

				FinanceExpense::create($finance_data);

				if ($employee->loans) {
					foreach ($employee->loans as $loan) {
						if ($loan->time_remaining == '0') {
							$amount_remaining = 0;
							$time_remaining   = 0;
							$monthly_payable  = 0;
						} else {
							$amount_remaining = (int) $loan->amount_remaining - (int) $loan->monthly_payable;
							$time_remaining   = (int) $loan->time_remaining - 1;
							$monthly_payable  = $amount_remaining != 0 ? $loan->monthly_payable : 0;
						}
						SalaryLoan::whereId($loan->id)->update([
							'amount_remaining' => $amount_remaining, 'time_remaining' => $time_remaining,
							'monthly_payable' => $monthly_payable
						]);
					}
					$employee_loan = Employee::with('loans:id,employee_id,loan_title,loan_amount,time_remaining,amount_remaining,monthly_payable')
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type')
						->findOrFail($id);
					$data['loans'] = $employee_loan->loans;
				}
				Payslip::create($data);

				DB::commit();
			} catch (Exception $e) {
				DB::rollback();
				return response()->json(['error' => $e->getMessage()]);
			} catch (Throwable $e) {
				DB::rollback();
				return response()->json(['error' => $e->getMessage()]);
			}

			return response()->json(['success' => __('Data Added successfully.')]);
		}
		return response()->json(['success' => __('You are not authorized')]);
	}


	//--- Updated ----
	public function payBulk(Request $request)
	{
		$logged_user = auth()->user();
		if ($logged_user->can('make-bulk_payment')) {
			if (request()->ajax()) {
				$first_date = date('Y-m-d', strtotime('first day of ' . $request->month_year));
				$employeeArrayId = $request->all_checkbox_id;
				//$employeesId = Employee::whereIntegerInRaw('id',$employeeArrayId)->whereIntegerNotInRaw('id',$paid_employee)->pluck('id');

				if (!empty($request->filter_company && $request->filter_department)) //No Need
				{
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'taxcredits' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'company_id', 'currency_symbol')
						->where('company_id', $request->filter_company)
						->where('department_id', $request->filter_department)
						->whereIntegerInRaw('id', $employeeArrayId)
						->where('is_active', 1)->where('exit_date', NULL)
						->get();
				} elseif (!empty($request->filter_company)) //No Need
				{
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'taxcredits' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'company_id', 'currency_symbol')
						->where('company_id', $request->filter_company)
						->whereIntegerInRaw('id', $employeeArrayId)
						->where('is_active', 1)->where('exit_date', NULL)
						->get();
				} else {
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'taxcredits' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'company_id', 'currency_symbol')
						->whereIntegerInRaw('id', $employeeArrayId)
						->where('is_active', 1)->where('exit_date', NULL)
						->get();
				}

				foreach ($employees as $employee) {
					foreach ($employee->salaryBasic as $salaryBasic) {
						if ($salaryBasic->first_date <= $first_date) {
							$payslip_type = $salaryBasic->payslip_type;
							$basicsalary = $salaryBasic->basic_salary;
						}
					}
					$this->calculate_salary_with_taxes($employee, $first_date, $basicsalary, $request->month_year, $payslip_type);
				}

				//Get employees after deductions  have been updated.
				if (!empty($request->filter_company && $request->filter_department)) //No Need
				{
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'company_id', 'currency_symbol')
						->where('company_id', $request->filter_company)
						->where('department_id', $request->filter_department)
						->whereIntegerInRaw('id', $employeeArrayId)
						->where('is_active', 1)->where('exit_date', NULL)
						->get();
				} elseif (!empty($request->filter_company)) //No Need
				{
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'company_id', 'currency_symbol')
						->where('company_id', $request->filter_company)
						->whereIntegerInRaw('id', $employeeArrayId)
						->where('is_active', 1)->where('exit_date', NULL)
						->get();
				} else {
					$employees = Employee::with([
						'salaryBasic' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'allowances' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'commissions' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'loans' => function ($query) use ($first_date) {
							$query->where('first_date', '<=', $first_date)
								->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'deductions' => function ($query) {
							$query->orderByRaw('DATE_FORMAT(first_date, "%y-%m")');
						},
						'otherPayments' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						},
						'overtimes' => function ($query) use ($first_date) {
							$query->where('first_date', $first_date);
						}
					])
						->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type', 'pension_type', 'pension_amount', 'company_id', 'currency_symbol')
						->whereIntegerInRaw('id', $employeeArrayId)
						->where('is_active', 1)->where('exit_date', NULL)
						->get();
				}

				DB::beginTransaction();
				try {
					$total_sum = 0;
				
					foreach ($employees as $employee) {
						//payslip_type & basic_salary
						foreach ($employee->salaryBasic as $salaryBasic) {
							if ($salaryBasic->first_date <= $first_date) {
								$payslip_type = $salaryBasic->payslip_type;
								$basicsalary = $salaryBasic->basic_salary;
							}
						}

						//Pension Amount
						if ($employee->pension_type == "percentage") {
							$pension_amount =  ($basicsalary * $employee->pension_amount) / 100;
						} else {
							$pension_amount = $employee->pension_amount;
						}

						$type1          = "getArray";
						$allowances    = $this->allowances($employee, $first_date, $type1); //getArray
						$deductions    = $this->deductions($employee, $first_date, $type1);
						
						$taxcredit = $this->taxcredits($employee, $first_date, "getArray");
						
						$type2             = "getAmount";
						$allowance_amount  = $this->allowances($employee, $first_date, $type2);
						$allowance_amount_zwl  = $this->allowances($employee, $first_date, $type2, "ZWL");
						$deduction_amount  = $this->deductions($employee, $first_date, $type2);
						$deduction_amount_zwl  = $this->deductions($employee, $first_date, $type2, "ZWL");


						//Net Salary
						if ($payslip_type == 'Monthly') {
							$basicsalary = $employee->currency_symbol == '$'? $basicsalary : 0;
							$net_salary = $this->totalSalary($employee, $payslip_type, $basicsalary, $allowance_amount, $deduction_amount, $pension_amount);

							$basicsalary_zwl = $employee->currency_symbol == 'ZWL' ? $basicsalary : 0;
							$net_salary_zwl = $this->totalSalary($employee, $payslip_type, $basicsalary_zwl, $allowance_amount_zwl, $deduction_amount_zwl, $pension_amount);

							//New- just store work hours, not calculte with salary
							$total = 0;
							$total_hours = $this->totalWorkedHours($employee);
							sscanf($total_hours, '%d:%d', $hour, $min);
							//converting in minute
							$total += $hour * 60 + $min;
						} else {
							$total = 0;
							$total_hours = $this->totalWorkedHours($employee);
							sscanf($total_hours, '%d:%d', $hour, $min);
							//converting in minute
							$total += $hour * 60 + $min;
							$net_salary = $this->totalSalary($employee, $payslip_type, $basicsalary, $allowance_amount, $deduction_amount, $pension_amount, $total);
						}

						$data = [];
						$data['payslip_key']    = Str::random('20');
						$data['payslip_number'] = mt_rand(1000000000, 9999999999);
						$data['payment_type']   = $payslip_type;
						$data['basic_salary']   = $basicsalary; //
						$data['allowances']     = $allowances;
						$data['commissions']    = $employee->commissions;
						$data['loans']          = $employee->loans;
						$data['deductions']     = $deductions;
						$data['tax_credits']    = $taxcredit;
						$data['overtimes']      = $employee->overtimes;
						$data['other_payments'] = $employee->otherPayments;
						$data['month_year']     = $request->month_year;
						$data['net_salary']     = $net_salary;
						$data['net_salary_zwl']     = $net_salary_zwl;
						$data['status']         = 1;
						$data['employee_id']    = $employee->id;
						$data['hours_worked']   = $total_hours; //only for Hourly base employee
						$data['pension_type']   = $employee->pension_type;
						$data['pension_amount'] = $pension_amount;
						$data['company_id']     = $employee->company_id;

						$total_sum = $total_sum + $net_salary;

						if ($employee->loans) {
							foreach ($employee->loans as $loan) {
								if ($loan->time_remaining == '0') {
									$amount_remaining = 0;
									$time_remaining = 0;
									$monthly_payable = 0;
								} else {
									$amount_remaining = $loan->amount_remaining - $loan->monthly_payable;
									$time_remaining = $loan->time_remaining - 1;
									$monthly_payable = $amount_remaining != 0 ? $loan->monthly_payable : 0;
								}
								SalaryLoan::whereId($loan->id)->update([
									'amount_remaining' => $amount_remaining, 'time_remaining' => $time_remaining,
									'monthly_payable' => $monthly_payable
								]);
							}
							$employee_loan = Employee::with('loans:id,employee_id,loan_title,loan_amount,time_remaining,amount_remaining,monthly_payable')
								->select('id', 'first_name', 'last_name', 'basic_salary', 'payslip_type')
								->findOrFail($employee->id);
							$data['loans'] = $employee_loan->loans;
						}

						if ($data['payment_type'] == NULL) { //New
							return response()->json(['payment_type_error' => __('Please select payslip-type for the employees.')]);
						}
						Payslip::create($data);
					}


					$account_balance = DB::table('finance_bank_cashes')->where('id', config('variable.account_id'))->pluck('account_balance')->first();

					if ((int)$account_balance < $total_sum) {
						throw new Exception("requested balance is less then available balance");
					}

					$new_balance = (int)$account_balance - (int)$total_sum;

					$finance_data = [];

					$finance_data['account_id'] = config('variable.account_id');
					$finance_data['amount'] = $total_sum;
					$finance_data['expense_date'] = now()->format(env('Date_Format'));
					$finance_data['expense_reference'] = trans('file.Payroll');


					FinanceBankCash::whereId($finance_data['account_id'])->update(['account_balance' => $new_balance]);

					$Expense = FinanceTransaction::create($finance_data);

					$finance_data['id'] = $Expense->id;

					FinanceExpense::create($finance_data);

					DB::commit();
				} catch (Exception $e) {
					DB::rollback();
					Log::error($e->getMessage(), $e->getTrace());
					return response()->json(['error' =>  $e->getMessage()]);
				} catch (Throwable $e) {
					DB::rollback();
					Log::error($e->getMessage(), $e->getTrace());

					return response()->json(['error' => $e->getMessage()]);
				}

				return response()->json(['success' => __('Paid Successfully')]);
			}
		}

		return response()->json(['error' => __('Error')]);
	}

	protected function allowances($employee, $first_date, $type, $currency = '$')
	{
		$allowances = [];
		if ($type == "getArray") {
			if (!$employee->allowances->isEmpty()) {
				foreach ($employee->allowances as $item) {
					if ($item->first_date <= $first_date) {
						$allowances = array();
						foreach ($employee->allowances as $key => $value) {
							if ($value->first_date <= $first_date) {
								//$allowances = array();
								if ($item->first_date == $value->first_date) {
									$allowances[] =  $employee->allowances[$key];
								}
							}
						}
					}
				}
			} else {
				$allowances = [];
			}
			return $allowances;
		} elseif ($type == "getAmount") {
			$allowance_amount = 0;
			if (!$employee->allowances->isEmpty()) {
				foreach ($employee->allowances as $item) {
					if ($item->first_date <= $first_date) {
						// $allowance_amount = SalaryAllowance::where('month_year',$item->month_year)->where('employee_id',$item->employee_id)->sum('allowance_amount');
						$allowance_amount = 0;
						foreach ($employee->allowances as $value) {
							if ($value->first_date <= $first_date) {
								if ($item->first_date == $value->first_date) {
									if ($currency == 'ZWL') {
										if ($value->currency_symbol == 'ZWL') {
											$allowance_amount += $value->allowance_amount;
										}
									} else {
										if ($value->currency_symbol == '$') {
											$allowance_amount += $value->allowance_amount;
										}
									}
								}
							}
						}
					}
				}
			}

			return $allowance_amount;
		}
	}

	protected function deductions($employee, $first_date, $type, $currency = '$')
	{
		if ($type == "getAmount") {
			$deduction_amount = 0;
			if (!$employee->deductions->isEmpty()) {
				foreach ($employee->deductions as $item) {
					if ($item->first_date <= $first_date) {
						$deduction_amount = 0;
						foreach ($employee->deductions as $value) {
							if ($value->first_date <= $first_date) {
								if ($item->first_date == $value->first_date) {
									if ($currency == 'ZWL') {
										if ($value->currency_symbol == 'ZWL') {
											$deduction_amount += $value->deduction_amount;
										}
									} else {
										if ($value->currency_symbol == '$') {
											$deduction_amount += $value->deduction_amount;
										}
									}
								}
							}
						}
					}
				}
			}
			return $deduction_amount;
		} elseif ($type == "getArray") {
			if (!$employee->deductions->isEmpty()) {
				foreach ($employee->deductions as $item) {
					if ($item->first_date <= $first_date) {
						$deductions = array();
						foreach ($employee->deductions as $key => $value) {
							if ($value->first_date <= $first_date) {
								if ($item->first_date == $value->first_date) {
									$deductions[] =  $employee->deductions[$key];
								}
							}
						}
					}
				}
			} else {
				$deductions = [];
			}
			return $deductions;
		}
	}
	protected function taxcredits($employee, $first_date, $type, $currency = '$')
	{
		if ($type == "getAmount") {
			$deduction_amount = 0;
			if (!$employee->taxcredits->isEmpty()) {
				foreach ($employee->taxcredits as $item) {
					if ($item->first_date <= $first_date) {
						$deduction_amount = 0;
						foreach ($employee->taxcredits as $value) {
							if ($value->first_date <= $first_date) {
								if ($item->first_date == $value->first_date) {
									if ($currency == 'ZWL') {
										if ($value->currency_symbol == 'ZWL') {
											$deduction_amount += $value->deduction_amount;
										}
									} else {
										if ($value->currency_symbol == '$') {
											$deduction_amount += $value->deduction_amount;
										}
									}
								}
							}
						}
					}
				}
			}
			return $deduction_amount;
		} elseif ($type == "getArray") {
			if (!$employee->taxcredits->isEmpty()) {
				foreach ($employee->taxcredits as $item) {
					if ($item->first_date <= $first_date) {
						$deductions = array();
						foreach ($employee->taxcredits as $key => $value) {
							if ($value->first_date <= $first_date) {
								if ($item->first_date == $value->first_date) {
									$deductions[] =  $employee->taxcredits[$key];
								}
							}
						}
					}
				}
			} else {
				$deductions = [];
			}
			return $deductions;
		}
	}
	public function calculate_zimra($basic_salary, $taxable_allowances, $allowable_deductions, $other_deductions, $tax_type, $zwl = false, $taxcredits=0)
	{
		$tax_payable_amnt = ($basic_salary +  $taxable_allowances) - $other_deductions - $allowable_deductions;
		if ($zwl) {
			$taxTable = ZwlTaxTable::where('table_type', $tax_type)
				->where('lower_range', '<=', $tax_payable_amnt)
				->where(function ($query) use ($tax_payable_amnt) {
					$query->where('upper_range', '>=', $tax_payable_amnt)
						->orWhere('upper_range', -1);
				})
				->first();
		} else {
			$taxTable = UsdTaxTable::where('table_type', $tax_type)
				->where('lower_range', '<=', $tax_payable_amnt)
				->where(function ($query) use ($tax_payable_amnt) {
					$query->where('upper_range', '>=', $tax_payable_amnt)
						->orWhere('upper_range', -1);
				})
				->first();
		}
		if ($zwl)
		{
			Log::info("Taxable amount ZWL: ".$tax_payable_amnt);
			Log::info("ZWL Range");
			Log::info($taxTable);

		}else 
		{
			Log::info("Taxable amouunt  USD: " . $tax_payable_amnt);
			Log::info("USD Range");
			Log::info($taxTable);
		}

		if ($taxTable) {
			$zimra_tax = ($tax_payable_amnt * ($taxTable->multiply_by / 100)) -  $taxTable->deduct;
			if ($zwl)
			{
				Log::info("Zimra Tax ZWL: ". $zimra_tax);
			}else{
				Log::info("Zimra Tax USD: ". $zimra_tax);
			}
			
			return $zimra_tax - $taxcredits;
		} else {
			return 0;
		}
	}

	private function calculate_salary_with_taxes($employee, $first_date, $pbasic_salary, $month_year, $payslip_type)
	{

		try{

		DB::beginTransaction();
		$basic_salary = $employee->currency_symbol == '$' ?  $pbasic_salary : 0;
		$basic_salary_zwl = $employee->currency_symbol == 'ZWL' ?  $pbasic_salary : 0;

		$allowance_total = 0;
		$allowance_total_zwl = 0;
		$taxable_allowances = 0;
		$taxable_allowances_zwl = 0;
		if (!$employee->allowances->isEmpty()) {
			foreach ($employee->allowances as $item) {
				if ($item->first_date <= $first_date) {
					// $allowance_amount = SalaryAllowance::where('month_year',$item->month_year)->where('employee_id',$item->employee_id)->sum('allowance_amount');
					$allowance_total = 0;
					$taxable_allowances = 0;
					$allowance_total_zwl = 0;
					$taxable_allowances_zwl = 0;
					foreach ($employee->allowances as $value) {
						if ($value->first_date <= $first_date) {
							if ($item->first_date == $value->first_date) {
								if ($value['currency_symbol'] == 'ZWL') {
									$allowance_total_zwl += $value->allowance_amount;
								} else {
									$allowance_total += $value->allowance_amount;
								}

								if ($value['is_taxable']) {
									if ($value['currency_symbol'] == 'ZWL') {
										$taxable_allowances_zwl += $value['allowance_amount'] * ($value['deductible_amt'] / 100);
									} else {
										$taxable_allowances += $value['allowance_amount'] * ($value['deductible_amt'] / 100);
									}
								}
							}
						}
					}
				}
			}
		} else {
			Log::info("No ");
		}
		$deduction_total = 0.00;
		$allowable_deductions = 0.00;
		$other_deductions = 0.00;
		$deduction_total_zwl = 0.00;
		$allowable_deductions_zwl = 0.00;
		$other_deductions_zwl = 0.00;
		if (!$employee->deductions->isEmpty() || empty($employee->deductions) ) {
			foreach ($employee->deductions as $item) {
				if ($item->first_date <= $first_date) {
					$deduction_total = 0.00;
					$allowable_deductions = 0.00;
					$other_deductions = 0.00;
					$deduction_total_zwl = 0.00;
					$allowable_deductions_zwl = 0.00;
					$other_deductions_zwl = 0.00;
					foreach ($employee->deductions as $value) {
						if ($value->first_date <= $first_date) {
							if ($item->first_date == $value->first_date) {
								if ($value->deduction_title != 'Zimra Income Tax' && $value->deduction_title != 'Zimra AIDS Levy') {
									if ($value['currency_symbol'] == 'ZWL') {
										$deduction_total_zwl += $value->deduction_amount;
									} else {
										$deduction_total += $value->deduction_amount;
									}
									if ($value['is_taxable']) {
										if ($value['currency_symbol'] == 'ZWL') {
											$allowable_deductions_zwl += $value['deduction_amount'] * ($value['deductible_amt'] / 100);
										} else {
											$allowable_deductions += $value['deduction_amount'] * ($value['deductible_amt'] / 100);
										}
									} else {
										if ($value['currency_symbol'] == 'ZWL') {
											$other_deductions_zwl += $value['deduction_amount'];
										} else {
											$other_deductions += $value['deduction_amount'];
										}
									}
								}
							}
						}
					}
				}
			}
		}

		Log::info('Deduction: ' . $deduction_total);
		Log::info('Deduction: ZWL' . $deduction_total_zwl);
		Log::info('Taxable Allowances : ' . $taxable_allowances);
		Log::info('Taxable Allowances ZWL: ' . $taxable_allowances_zwl);

		Log::info('Allowances: USD' . $allowance_total);
		Log::info('Allowances: ZWL' . $allowance_total_zwl);
		$taxcredits = $this->taxcredits($employee, $first_date, "getAmount");
		$taxcredits_zwl = $this->taxcredits($employee, $first_date, "getAmount",'ZWL');
		$zimra_deduction = $this->calculate_zimra($basic_salary, $taxable_allowances, $allowable_deductions, $other_deductions, $payslip_type, false, $taxcredits);
		$zimra_deduction_zwl = $this->calculate_zimra($basic_salary_zwl, $taxable_allowances_zwl, $allowable_deductions_zwl, $other_deductions_zwl, $payslip_type, true, $taxcredits_zwl);
		Log::info("I have created Zimra deduction");
		$data = [];
		$data['employee_id'] = $employee->id;
		$data['month_year'] = $month_year;
		$data['first_date'] = $first_date;
		$data['deduction_title'] = 'Zimra Income Tax';
		$data['currency_symbol'] = '$';
		$data['deduction_amount'] = $zimra_deduction;
		$data['zimra_payable_amount'] = ($basic_salary +  $taxable_allowances) - $other_deductions - $allowable_deductions;

		$data['deduction_type'] = 'Other Statutory Deduction';
		$data['created_at'] = Carbon::now();
		$data['updated_at'] = Carbon::now();
		SalaryDeduction::create($data);

		Log::info("I have created Zimra deduction");
		//ZWL
		$data = [];
		$data['employee_id'] = $employee->id;
		$data['month_year'] = $month_year;
		$data['first_date'] = $first_date;
		$data['deduction_title'] = 'Zimra Income Tax';
		$data['deduction_amount'] = $zimra_deduction_zwl;
		$data['currency_symbol'] = 'ZWL';
		$data['zimra_payable_amount'] = ($basic_salary_zwl +  $taxable_allowances_zwl) - $other_deductions_zwl - $allowable_deductions_zwl;
		$data['deduction_type'] = 'Other Statutory Deduction';
		$data['created_at'] = Carbon::now();
		$data['updated_at'] = Carbon::now();
		SalaryDeduction::create($data);
		Log::info("I have created Zimra zwl deduction");


		$data = [];
		$data['employee_id'] = $employee->id;
		$data['month_year'] = $month_year;
		$data['first_date'] = $first_date;
		$data['deduction_title'] = 'Zimra AIDS Levy';
		$data['deduction_amount'] = $zimra_deduction * (0.03);
		$data['deduction_type'] = 'Other Statutory Deduction';
		$data['created_at'] = Carbon::now();
		$data['updated_at'] = Carbon::now();
		SalaryDeduction::create($data);

		Log::info("I have created Zimra Aids deduction");

		//ZWL
		$data = [];
		$data['employee_id'] = $employee->id;
		$data['month_year'] = $month_year;
		$data['first_date'] = $first_date;
		$data['deduction_title'] = 'Zimra AIDS Levy';
		$data['deduction_amount'] = $zimra_deduction_zwl * (0.03);
		$data['currency_symbol'] = 'ZWL';
		$data['deduction_type'] = 'Other Statutory Deduction';
		$data['created_at'] = Carbon::now();
		$data['updated_at'] = Carbon::now();
		SalaryDeduction::create($data);

		$gross_salary = $basic_salary +
			$this->allowances($employee, $first_date, "getAmount") +
			($employee->currency_symbol == 'ZWL' ? 0 : SalaryCommission::where('employee_id', $employee->id)->where('first_date', $first_date)->sum('commission_amount')) +
			($employee->currency_symbol == 'ZWL' ? 0 : SalaryOtherPayment::where('employee_id', $employee->id)->where('first_date', $first_date)->sum('other_payment_amount')) +
			($employee->currency_symbol == 'ZWL' ? 0 : SalaryOvertime::where('employee_id', $employee->id)->where('first_date', $first_date)->sum('overtime_amount'));

		$nssa = NssaTable::where('currency_symbol', '$')->latest()->first();
		$nssa_payable_contribution = $gross_salary * ($nssa->posb_insuarance / 100);
		$nssa_payable_contribution = $nssa_payable_contribution > $nssa->insuarance_ceiling ? $nssa->insuarance_ceiling : $nssa_payable_contribution;
		$APWCS_contribution = $gross_salary * ($nssa->posb_contribution / 100);
		Log::info("Gross " . $gross_salary);

		$gross_salary_zwl = $basic_salary_zwl +
			$this->allowances($employee, $first_date, "getAmount", 'ZWL') +
			($employee->currency_symbol == '$' ? 0 : SalaryCommission::where('employee_id', $employee->id)->where('first_date', $first_date)->sum('commission_amount')) +
			($employee->currency_symbol == '$' ? 0 : SalaryOtherPayment::where('employee_id', $employee->id)->where('first_date', $first_date)->sum('other_payment_amount')) +
			($employee->currency_symbol == '$' ? 0 : SalaryOvertime::where('employee_id', $employee->id)->where('first_date', $first_date)->sum('overtime_amount'));

		$nssa_zwl = NssaTable::where('currency_symbol', 'ZWL')->latest()->first();
		$nssa_payable_contribution_zwl = $gross_salary_zwl * ($nssa_zwl->posb_insuarance / 100);
		$nssa_payable_contribution_zwl = $nssa_payable_contribution_zwl > $nssa_zwl->insuarance_ceiling ? $nssa_zwl->insuarance_ceiling : $nssa_payable_contribution_zwl;
		$APWCS_contribution_zwl = $gross_salary_zwl * ($nssa_zwl->posb_contribution / 100);
		Log::info("Gross ZWL " . $gross_salary_zwl);
		$data = [];
		$data['employee_id'] = $employee->id;
		$data['month_year'] = $month_year;
		$data['first_date'] = $first_date;
		$data['deduction_title'] = 'NSSA Insurance (' . $nssa->posb_insuarance . '%)';
		$data['deduction_amount'] = $nssa_payable_contribution;
		$data['insuarable_amount'] = $gross_salary;
		$data['is_nssa_insuarance'] = true;
		$data['currency_symbol'] = '$';
		$data['deduction_type'] = 'Other Statutory Deduction';
		$data['created_at'] = Carbon::now();
		$data['updated_at'] = Carbon::now();
		SalaryDeduction::create($data);
		Log::info("Inserted Nass");

		
		//ZWL
		$data = [];
		$data['employee_id'] = $employee->id;
		$data['month_year'] = $month_year;
		$data['first_date'] = $first_date;
		$data['deduction_title'] = 'NSSA Insurance (' . $nssa->posb_insuarance . '%)';
		$data['deduction_amount'] = $nssa_payable_contribution_zwl;
		$data['insuarable_amount'] = $gross_salary_zwl;
		$data['is_nssa_insuarance'] = true;
		$data['currency_symbol'] = 'ZWL';
		$data['deduction_type'] = 'Other Statutory Deduction';
		$data['created_at'] = Carbon::now();
		$data['updated_at'] = Carbon::now();
		SalaryDeduction::create($data);


		$data = [];
		$data['employee_id'] = $employee->id;
		$data['month_year'] = $month_year;
		$data['first_date'] = $first_date;
		$data['deduction_title'] = 'NSSA APWCS Contribution';
		$data['is_nssa_contribution'] = true;
		$data['insuarable_amount'] = $gross_salary;
		$data['deduction_amount'] = $APWCS_contribution;
		$data['deduction_type'] = 'Other Statutory Deduction';
		$data['created_at'] = Carbon::now();
		$data['updated_at'] = Carbon::now();
		SalaryDeduction::create($data);

		//ZWL
		$data = [];
		$data['employee_id'] = $employee->id;
		$data['month_year'] = $month_year;
		$data['first_date'] = $first_date;
		$data['deduction_title'] = 'NSSA APWCS Contribution';
		$data['currency_symbol'] = 'ZWL';
		$data['deduction_amount'] = $APWCS_contribution_zwl;
		$data['is_nssa_contribution'] = true;
		$data['insuarable_amount'] = $gross_salary_zwl;
		$data['deduction_type'] = 'Other Statutory Deduction';
		$data['created_at'] = Carbon::now();
		$data['updated_at'] = Carbon::now();
		SalaryDeduction::create($data);
		DB::commit();
	}catch (Throwable $e){
		Log::error($e->getMessage());
		DB::rollBack();
	}
	}
	
}
