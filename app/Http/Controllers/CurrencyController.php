<?php

namespace App\Http\Controllers;

use App\Models\company;
use Illuminate\Http\Request;
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
            $roles = Role::where('id', '!=', 3)->where('is_active', 1)->select('id', 'name')->get();
            $currentDate = date('Y-m-d');

            if (request()->ajax()) {

            

                $employees = $this->getEmployees($request, $currentDate);

                return datatables()->of($employees)
                    ->setRowId(function ($row) {
                        return $row->id;
                    })
                    ->addColumn('name', function ($row) {
                        if ($row->user->profile_photo) {
                            $url = url('uploads/profile_photos/'.$row->user->profile_photo);
                            $profile_photo = '<img src="'.$url.'" class="profile-photo md" style="height:35px;width:35px"/>';
                        } else {
                            $url = url('logo/avatar.jpg');
                            $profile_photo = '<img src="'.$url.'" class="profile-photo md" style="height:35px;width:35px"/>';
                        }
                        $name = '<span><a href="employees/'.$row->id.'" class="d-block text-bold" style="color:#24ABF2">'.$row->full_name.'</a></span>';
                        $username = '<span>'.__('file.Username').': '.($row->user->username ?? '').'</span>';
                        $staff_id = '<span>'.__('file.Staff Id').': '.($row->staff_id ?? '').'</span>';
                        $gender = '';
                        if ($row->gender != null) {
                            $gender = '<span>'.__('file.Gender').': '.__('file.'.$row->gender ?? '').'</span></br>';
                        }

                        $shift = '<span>'.__('file.Shift').': '.($row->officeShift->shift_name ?? '').'</span>';
                        if (config('variable.currency_format') == 'suffix') {
                            $salary = '<span>'.__('file.Salary').': '.($row->basic_salary ?? '').' '.config('variable.currency').'</span>';
                        } else {
                            $salary = '<span>'.__('file.Salary').': '.config('variable.currency').' '.($row->basic_salary ?? '').'</span>';
                        }

                        if ($row->payslip_type) {
                            $payslip_type = '<span>'.__('file.Payslip Type').': '.__('file.'.$row->payslip_type).'</span>';
                        } else {
                            $payslip_type = ' ';
                        }

                        return "<div class='d-flex'>
                                        <div class='mr-2'>".$profile_photo.'</div>
                                        <div>'
                                            .$name.'</br>'.$username.'</br>'.$staff_id.'</br>'.$gender.$shift.'</br>'.$salary.'</br>'.$payslip_type;

                    })
                    ->addColumn('company', function ($row) {
                        $company = "<span class='text-bold'>".strtoupper($row->company->company_name ?? '').'</span>';
                        $department = '<span>'.__('file.Department').' : '.($row->department->department_name ?? '').'</span>';
                        $designation = '<span>'.__('file.Designation').' : '.($row->designation->designation_name ?? '').'</span>';

                        return $company.'</br>'.$department.'</br>'.$designation;
                    })
                    ->addColumn('contacts', function ($row) {
                        $email = "<i class='fa fa-envelope text-muted' title='Email'></i> ".$row->email;
                        $contact_no = "<i class='text-muted fa fa-phone' title='Phone'></i> ".$row->contact_no;
                        $skype_id = "<i class='text-muted fa fa-skype' title='Skype'></i> ".$row->skype_id;
                        $whatsapp_id = "<i class='text-muted fa fa-whatsapp' title='Whats App'></i> ".$row->whatsapp_id;

                        return $email.'</br>'.$contact_no.'</br>'.$skype_id.'</br>'.$whatsapp_id;
                    })
                    ->addColumn('action', function ($data) {
                        $button = '';
                        if (auth()->user()->can('view-details-employee')) {
                            $button .= '<a href="employees/'.$data->id.'"  class="edit btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" title="View Details"><i class="dripicons-preview"></i></button></a>';
                            $button .= '&nbsp;&nbsp;&nbsp;';
                        }
                        if (auth()->user()->can('modify-details-employee')) {
                            if ($data->role_users_id != 1) {
                                $button .= '<button type="button" name="delete" id="'.$data->id.'" class="delete btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Delete"><i class="dripicons-trash"></i></button>';
                                $button .= '&nbsp;&nbsp;&nbsp;';
                            }

                            $button .= '<a class="download btn-sm" style="background:#FF7588; color:#fff" title="PDF" href="'.route('employees.pdf', $data->id).'"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a>';
                        }

                        return $button;
                    })
                    ->rawColumns(['name', 'company', 'contacts', 'action'])
                    ->make(true);
            }
            return view('currency.index', compact('companies', 'roles'));
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
