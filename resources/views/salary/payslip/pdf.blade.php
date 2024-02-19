<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    {{-- <link rel="stylesheet" href="{{ asset('vendor/bootstrap/css/new_bootstrap.min.css') }}" crossorigin="anonymous"> --}}

    <title>{{config('app.name')}}</title>

    <style>
        .page-break {
            page-break-after: always;
        }
        h4 {
            font-size: 80%;
        }
        h5 {
            font-size: 80%;
        }
        h6 {
            font-size: 80%;
        }
       
        tbody {
            font-size: 80%;
            margin:0px;
            padding: 5px;
        }
        .table, .table thead tr th
        {
            border: 1px solid #000;
        }
        
        .table thead tr th {
          
            font-size: 80%;
            margin:0px;
            padding: 5px;

        }
        .table tr td {
           border: 0px solid #fff;
            font-size: 80%;
            margin:0px;
            padding: 5px;
        }
        #heading{
            font-size: 80%;
            color: #CE7749;
            text-align: center;
        }
        #normal-heading{
            font-size: 70%;
            color: #000
        }
        .table td,
.table th {
    vertical-align: top;
}
        /* * { font-family: DejaVu Sans, sans-serif; } */
    </style>
</head>
<body onload="window.print()">

    <h5 class="text-center">{{$company['company_name']}}</h5>
    <p style="font-size: 60%;" class="text-center p-1 m-1">{{$company['location']['address1']}} {{$company['location']['city']}},{{$company['location']['country']['name']}}-{{$company['location']['zip']}}</p>
    <p style="font-size: 60%;" class="text-center font-weight-bold">Payslip for the period of: {{$month_year}}</p>
    <div class="table-responsive">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td><strong class="help-split">{{__('Employee ID')}}: </strong>{{$user['username'] ?? ''}}</td>
                <td><strong class="help-split">{{__('Employee Name')}}: </strong>{{$first_name}} {{$last_name}}</td>
                <td><strong class="help-split">{{__('Payslip NO')}}: </strong>{{$id}}</td>
            </tr>
            <tr>
                <td><strong class="help-split">{{trans('file.Phone')}}: </strong>{{$contact_no}}</td>
                <td><strong class="help-split">{{__('Joining Date')}}: </strong>{{$joining_date}}</td>
                <td><strong class="help-split">{{__('Payslip Type')}}: </strong>{{$payment_type}}</td>

            </tr>
            <tr>
                <td><strong class="help-split">{{trans('file.Company')}}: </strong>{{$company['company_name']}}</td>
                <td><strong class="help-split">{{trans('file.Department')}}: </strong>{{$department['department_name']}}
                </td>
                <td><strong class="help-split">{{trans('file.Designation')}}: </strong>{{$designation['designation_name']}}
                </td>
            </tr>
            </tbody>
        </table>
    </div>


    <table class="w-100">
        <tr class="">

  <td>
        <div class="table-responsive mr-0">
            <table class="table text-center table-borderless" >

                <thead>
                <tr>
                    <th id="heading" colspan="3">{{trans('file.Earnings')}}</th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th id="normal-heading">{{trans('file.Description')}}</th>
                    <th id="normal-heading">{{trans('Amount USD')}}</th>
                    <th id="normal-heading">{{trans('Amount ZWL')}}</th>
                </tr>
                </thead>
                @php
                    if ($payment_type == 'Monthly')
                    {
                        $total_earnings =  $currency_symbol == "$" || is_null($currency_symbol) ? $basic_salary : 0;
                        $total_earnings_zwl =  $currency_symbol == "ZWL"  ? $basic_salary : 0;


                    }
                    else
                    {
                        $total_earnings = $currency_symbol == "$" || is_null($currency_symbol) ? $hours_amount : 0;
                        $total_earnings_zwl = $currency_symbol == "ZWL" ? $hours_amount : 0;
                    }
                @endphp
                <tr>
                    @if($payment_type == 'Monthly')
                        <td >{{__('Basic Salary')}}</td>
                        <td >{{$bs = $currency_symbol =="$" ? '$ '.$basic_salary: '-' }}</td>
                        <td >{{$bs = $currency_symbol =="ZWL" ? 'ZWL '.$basic_salary: '-' }}</td>
                    @else
                        <td >{{__('Basic Salary')}} ({{__('Total')}})</td>
                        <td>{{$te = $currency_symbol =="$" ? '$ '.$total_earnings: '-' }}</td>
                        <td>{{$te = $currency_symbol =="ZWL" ? 'ZWL '.$total_earnings: '-' }}</td>
                    @endif
                </tr>
                @if($allowances)
                    @foreach($allowances as $allowance)
                        <tr>
                            <td >{{$allowance['allowance_title']}}</td>
                            <td >{{$al_amt = $allowance['currency_symbol'] == '$' ||  is_null($allowance['currency_symbol'])  ? '$ '.number_format($allowance['allowance_amount']): '-' }}</td>
                            <td>{{$al_amt = $allowance['currency_symbol'] == 'ZWL' ? 'ZWL '.number_format($allowance['allowance_amount']): '-' }}</td>
                        </tr>
                        @php
                            $total_earnings = $total_earnings + ($allowance['currency_symbol'] == '$' ||  is_null($allowance['currency_symbol'])?  $allowance['allowance_amount'] : 0);
                            $total_earnings_zwl = $total_earnings_zwl + ($allowance['currency_symbol'] == 'ZWL' ?  $allowance['allowance_amount'] : 0);
                        @endphp
                    @endforeach
                @endif

                @if($commissions)
                    @foreach($commissions as $commission)
                        <tr>
                            <td>{{$commission['commission_title']}}</td>
                            <td>{{ $cmn =  $currency_symbol == '$' || is_null($currency_symbol) ? '$ '.$commission['commission_amount'] : '-'}}</td>
                            <td>{{ $cmn =  $currency_symbol == 'ZWL' ? 'ZWL '.$commission['commission_amount'] : '-'}}</td>
                        </tr>
                        @php
                            $total_earnings = $total_earnings + ( $currency_symbol == '$' || is_null($currency_symbol) ? $commission['commission_amount'] : 0) ;
                            $total_earnings_zwl = $total_earnings_zwl + ( $currency_symbol == 'ZWL' ? $commission['commission_amount'] : 0) ;

                        @endphp
                    @endforeach
                @endif

                @if($other_payments)
                    @foreach($other_payments as $other_payment)
                        <tr>
                            <td>{{$other_payment['other_payment_title']}}</td>
                            <td>{{ $ot =  $currency_symbol == '$' || is_null($currency_symbol) ? '$ '.$other_payment['other_payment_amount'] : '-' }}</td>
                            <td>{{$ot = $currency_symbol == 'ZWL' ? 'ZWL '.$other_payment['other_payment_amount'] : '-'}}</td>
                        </tr>
                        @php
                            $total_earnings = $total_earnings + ($currency_symbol == '$' || is_null($currency_symbol) ?  $other_payment['other_payment_amount']: 0) ;
                            $total_earnings_zwl = $total_earnings_zwl + ($currency_symbol == 'ZWL' ?  $other_payment['other_payment_amount']: 0) ;

                        @endphp
                    @endforeach
                @endif

                @if($overtimes)
                    @foreach($overtimes as $overtime)
                        <tr>
                            <td>{{$overtime['overtime_title']}}</td>

                            <td>{{$ovt =  $currency_symbol == '$' || is_null($currency_symbol) ? '$ '.$overtime['overtime_amount'] : '-'}}</td>
                            <td>{{$ovt = $currency_symbol == 'ZWL' ? 'ZWL '.$overtime['overtime_amount'] : '-' }}</td>
                        </tr>
                        @php
                            $total_earnings = $total_earnings + ($currency_symbol == '$' || is_null($currency_symbol) ? $overtime['overtime_amount']: 0);
                            $total_earnings_zwl = $total_earnings_zwl + ($currency_symbol == 'ZWL' ? $overtime['overtime_amount']: 0) ;

                        @endphp
                    @endforeach
                @endif

                @php
        $combinedDeductions = [];
     
    @endphp
                @if($deductions)
             

    @foreach($deductions as $deduction)
        @php
            $title = $deduction['deduction_title'];
            $amount = $deduction['deduction_amount'];
            $symbol = $deduction['currency_symbol'];
            
            // Check if the deduction title exists in the combined array
            $existingKey = array_search($title, array_column($combinedDeductions, 'deduction_title'));

            if ($existingKey !== false) {
                // If deduction title exists, update the amount_zwl
                if ($symbol === 'ZWL') {
                    $combinedDeductions[$existingKey]['amount_zwl'] = $amount;
                  
                }
            } else {
                // If deduction title doesn't exist, add it to the combined array
                $combinedDeductions[] = [
                    'deduction_title' => $title,
                    'amount' => $symbol === '$' ? $amount : '-',
                    'amount_zwl' => $symbol === 'ZWL' ? $amount : '-'
                ];

              
            }
        @endphp
    @endforeach
    @endif
                @php 

             

                $total_rows_alloances = (is_array($overtimes) ? count($overtimes) : 0) + 
                        (is_array($allowances) ? count($allowances) : 0) + 
                        (is_array($other_payments) ? count($other_payments) : 0) + 1;

$total_rows_deductions = (is_array($combinedDeductions) ? count($combinedDeductions) : 0) + 
                         (is_array($loans) ? count($loans) : 0) + 1;

                @endphp

                @if($total_rows_alloances < $total_rows_deductions)
                @php
                $diff = $total_rows_deductions - $total_rows_alloances;
                $a = 0; 
                while($a <  $diff)
                {
                
                @endphp
                <tr>
                <td class="text-white">Nothing here </td>
                <td class="text-white">Nothing here </td>
                <td class="text-white">Nothing here </td>
                </tr>

@php 
$a++;
}
@endphp

                @endif
                <tr>
                    <td>Total </td>
                  
                        <td id="total_earnings">$ {{ number_format($total_earnings) }} </td>
                        <td id="total_earnings ">ZWL {{number_format($total_earnings_zwl)}} </td>

                
                </tr>


            </table>
        </div>
        </td>
        <td>
        <!-- /.col -->
        <div class="table-responsive ml-0">
            <table class="table  text-center">

                <thead>
                <tr>
                    <th id="heading" colspan="3">{{trans('file.Deductions')}}</th>
                </tr>
                </thead>
                <thead>
                <tr>
                    <th id="normal-heading">{{trans('file.Description')}}</th>
                    <th id="normal-heading">{{trans('Amount USD')}}</th>
                    <th id="normal-heading">{{trans('Amount ZWL')}}</th>
                </tr>
                </thead>

                @php
                    $total_deductions = 0;
                    $total_deductions_zwl = 0;
                @endphp

                @if($loans)
                    @foreach($loans as $loan)
                        <tr>
                            <td >{{$loan['loan_title']}}</td>
                            <td>{{$ln = $currency_symbol == '$' || is_null($currency_symbol) ? '$ '.$loan['monthly_payable']: '-'}}</td>
                            <td>{{$ln =  $currency_symbol == '$' ? 'ZWL '.$loan['monthly_payable']: '-'}}</td>
                        </tr>
                        @php
                            $total_deductions = $total_deductions +( $currency_symbol == '$'? $loan['monthly_payable'] : 0);
                            $total_deductions_zwl = $total_deductions_wl +( $currency_symbol == 'ZWL'? $loan['monthly_payable'] : 0);

                        @endphp
                    @endforeach
                @endif

                @if($deductions)
    @php
        $combinedDeductions = [];
     
    @endphp

    @foreach($deductions as $deduction)
        @php
            $title = $deduction['deduction_title'];
            $amount = $deduction['deduction_amount'];
            $symbol = $deduction['currency_symbol'];
            if ($title =='NSSA APWCS Contribution')
                {
                continue;
                }
            // Check if the deduction title exists in the combined array
            $existingKey = array_search($title, array_column($combinedDeductions, 'deduction_title'));

            if ($existingKey !== false) {
                // If deduction title exists, update the amount_zwl
                if ($symbol === 'ZWL') {
                    $combinedDeductions[$existingKey]['amount_zwl'] = $amount;
                    $total_deductions_zwl += $amount;
                }
            } else {
                // If deduction title doesn't exist, add it to the combined array
               
                $combinedDeductions[] = [
                    'deduction_title' => $title,
                    'amount' => $symbol === '$' ? $amount : '-',
                    'amount_zwl' => $symbol === 'ZWL' ? $amount : '-'
                ];

                $total_deductions += ($symbol === '$') ? $amount : 0;
                $total_deductions_zwl += ($symbol === 'ZWL') ? $amount : 0;
            }
        @endphp
    @endforeach

    {{-- Output the combined deductions --}}
    @foreach($combinedDeductions as $deduction)
        <tr>
            <td >{{ str_replace("Zimra Income Tax", "ZIMRA Payee Tax", $deduction['deduction_title']) }}</td>
            <td >{{ $deduction['amount'] }}</td>
            <td>{{ $deduction['amount_zwl'] }}</td>
        </tr>
    @endforeach
@endif

                    <tr>
                        <td >{{__('Pension Amount')}}</td>
                        <td >{{$pa = $currency_symbol == '$' || is_null($currency_symbol) ? '$ '.$pension_amount : '-' }}</td>
                        <td >{{$pa = $currency_symbol == 'ZWL' || is_null($currency_symbol) ? 'ZWL '.$pension_amount : '-' }}</td>
                    </tr>

                    @php
                        $total_deductions = $total_deductions + ($currency_symbol == '$' || is_null($currency_symbol) ?  $pension_amount: 0);
                        $total_deductions_zwl += $total_deductions_zwl + ($currency_symbol == 'ZWL' ?  $pension_amount: 0);

                    @endphp

        @php
       $diff = $total_rows_alloances - $total_rows_deductions;
                $a = 0; 
                while($a <  $diff)
                {
                
                @endphp
                <tr>
                <td class="text-white">Nothing here </td>
                <td class="text-white">Nothing here </td>
                <td class="text-white">Nothing here </td>
                </tr>

@php 
$a++;
}
@endphp

                <tr>
                    <td >{{trans('file.Total')}}</td>
                  
                        <td id="total_deductions" > $ {{ number_format($total_deductions)}} </td>
                        <td id="total_deductions" > ZWL {{number_format($total_deductions_zwl)}} </td>
          
                </tr>


            </table>
    </div>
  
                </td>
    </tr>
                </table>
    @if(config('variable.currency_format') =='suffix')
        <p class="text-danger">{{__('Total Paid')}} : <strong>{{$net_salary}} <span style="font-family: DejaVu Sans; sans-serif;">{{config('variable.currency')}}</span></strong></p>
    @else
    <table>
    
    <tr>
    <td>
        <p class="text-danger">{{__('Total Paid USD')}} : $ <strong>{{number_format($net_salary)}}</strong></p>
       
        </td>
        <td>
        <p class="text-danger px-3">{{__('Total Paid ZWL')}} : ZWL <strong>{{number_format($net_salary_zwl)}}</strong></p>
        </td>
        @php 
    $show_leave = env("SHOW_LEAVE_PAYSLIP", false);

    @endphp

    @if( $show_leave)
   
        <td> <p style="font-size: 60%;" ><strong>Leave Information:  </strong></p></td>
    @if(!empty($leaves))
  
 
    <td > <p style="font-size: 60%;"> @foreach($leaves as $l) <strong>{{ $l['leave_type'] }} </strong> : {{$l['remaining_allocated_day']}},   @endforeach </p></td>
     
    @endif
    @endif
    </tr>
    <tr class="m-0 p-0">
        <td>
        <p style="font-size: 80%;"> Employer/HR Signature</p>
        <p class="p-0 m-0">________________________</p>
        </td>
        <td></td>
       <td></td>
        <td >
        <p style="font-size: 80%;"> Employee Signature</p>
        <p class="p-0 m-0">________________________</p>
        </td>
    </tr>
  
    </table>
      
    @endif



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
