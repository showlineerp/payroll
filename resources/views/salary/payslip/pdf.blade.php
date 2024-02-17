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

        .table thead tr th, {
            border: 1px solid #000;
            font-size: 80%;
            margin:0px;
            padding: 5px;

        }
        .table tr td {
            border: 1px solid #000;
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
        /* * { font-family: DejaVu Sans, sans-serif; } */
    </style>
</head>
<body onload="window.print()">

    <h5>{{$company['company_name']}}</h5>
    <h6>{{$company['location']['address1']}}</h6>
    <h6>{{$company['location']['city']}},{{$company['location']['country']['name']}}-{{$company['location']['zip']}}</h6>
    <h6>Phone: {{$company['contact_no']}}| {{trans('file.Email')}}: {{$company['email']}}</h6>
    <hr>

    <div class="center">
        <h5>{{trans('file.Payslip')}}: {{$month_year}}</h5>
    </div>

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
    <hr>
    

    <table class="w-100">
        <tr>

  <td>
        <div class="table-responsive mr-0">
            <table class="table table-bordered text-center">

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
                        <td class="py-3">{{__('Basic Salary')}}</td>
                        <td class="py-3">{{$bs = $currency_symbol =="$" ? '$ '.$basic_salary: '-' }}</td>
                        <td class="py-3">{{$bs = $currency_symbol =="ZWL" ? 'ZWL '.$basic_salary: '-' }}</td>
                    @else
                        <td class="py-3">{{__('Basic Salary')}} ({{__('Total')}})</td>
                        <td>{{$te = $currency_symbol =="$" ? '$ '.$total_earnings: '-' }}</td>
                        <td>{{$te = $currency_symbol =="ZWL" ? 'ZWL '.$total_earnings: '-' }}</td>
                    @endif
                </tr>
                @if($allowances)
                    @foreach($allowances as $allowance)
                        <tr>
                            <td class="py-3">{{$allowance['allowance_title']}}</td>
                            <td class="py-3">{{$al_amt = $allowance['currency_symbol'] == '$' ||  is_null($allowance['currency_symbol'])  ? '$ '.number_format($allowance['allowance_amount']): '-' }}</td>
                            <td class="py-3">{{$al_amt = $allowance['currency_symbol'] == 'ZWL' ? 'ZWL '.number_format($allowance['allowance_amount']): '-' }}</td>
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
                            <td class="py-3">{{$commission['commission_title']}}</td>
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
                            <td class="py-3">{{$other_payment['other_payment_title']}}</td>
                            <td class="py-3">{{ $ot =  $currency_symbol == '$' || is_null($currency_symbol) ? '$ '.$other_payment['other_payment_amount'] : '-' }}</td>
                            <td class="py-3">{{$ot = $currency_symbol == 'ZWL' ? 'ZWL '.$other_payment['other_payment_amount'] : '-'}}</td>
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
                            <td class="py-3">{{$overtime['overtime_title']}}</td>

                            <td>{{$ovt =  $currency_symbol == '$' || is_null($currency_symbol) ? '$ '.$overtime['overtime_amount'] : '-'}}</td>
                            <td>{{$ovt = $currency_symbol == 'ZWL' ? 'ZWL '.$overtime['overtime_amount'] : '-' }}</td>
                        </tr>
                        @php
                            $total_earnings = $total_earnings + ($currency_symbol == '$' || is_null($currency_symbol) ? $overtime['overtime_amount']: 0);
                            $total_earnings_zwl = $total_earnings_zwl + ($currency_symbol == 'ZWL' ? $overtime['overtime_amount']: 0) ;

                        @endphp
                    @endforeach
                @endif

                <tr>
                    <td class="py-3">Total</td>
                  
                        <td id="total_earnings py-3">$ {{ number_format($total_earnings) }} </td>
                        <td id="total_earnings py-3">ZWL {{number_format($total_earnings_zwl)}} </td>

                
                </tr>


            </table>
        </div>
                </td>
        <td>
        <!-- /.col -->
        <div class="table-responsive ml-0">
            <table class="table table-bordered text-center">

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
                            <td class="py-3">{{$loan['loan_title']}}</td>
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
        $total_deductions = 0;
        $total_deductions_zwl = 0;
    @endphp

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
            <td class="py-3">{{ str_replace("Zimra Income Tax", "ZIMRA Payee Tax", $deduction['deduction_title']) }}</td>
            <td class="py-3">{{ $deduction['amount'] }}</td>
            <td class="py-3">{{ $deduction['amount_zwl'] }}</td>
        </tr>
    @endforeach
@endif

                    <tr>
                        <td class="py-3">{{__('Pension Amount')}}</td>
                        <td class="py-3">{{$pa = $currency_symbol == '$' || is_null($currency_symbol) ? '$ '.$pension_amount : '-' }}</td>
                        <td class="py-3">{{$pa = $currency_symbol == 'ZWL' || is_null($currency_symbol) ? 'ZWL '.$pension_amount : '-' }}</td>
                    </tr>

                    @php
                        $total_deductions = $total_deductions + ($currency_symbol == '$' || is_null($currency_symbol) ?  $pension_amount: 0);
                        $total_deductions_zwl += $total_deductions_zwl + ($currency_symbol == 'ZWL' ?  $pension_amount: 0);

                    @endphp



                <tr>
                    <td class="py-3">{{trans('file.Total')}}</td>
                  
                        <td id="total_deductions" class="py-3"> $ {{ number_format($total_deductions)}} </td>
                        <td id="total_deductions" class="py-3"> ZWL {{number_format($total_deductions_zwl)}} </td>
          
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
