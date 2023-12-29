@extends('layout.main')
@section('content')


<section>

    <div class="container-fluid"><span id="general_result"></span></div>
    <div class="card container p-4">
        <span id="form_result">

            @if (session()->has('errors'))
            <ul class="alert alert-danger">
                @foreach(session('errors') as $error)
                <li>{{$error['messsage']}}</li>
                @endforeach
            </ul>
            @endif

            @if (session()->has('success'))
            <ul class="alert alert-success">
                {{ session('success') }}
            </ul>
            @endif
        </span>
        <form method="post" action="{{route('currency.update', ['currency'=> $currency->id])}}" id="sample_form" class="form-horizontal" enctype="multipart/form-data">

            @csrf
            @method('put')

            <div class="row">
                <div class="col-md-6 form-group">
                    <label class="text-bold">{{__('Name')}} <span class="text-danger">*</span></label>
                    <input type="text" value="{{$currency->name}}" name="name" id="name" placeholder="{{__('Currency Name')}}" required class="form-control">
                </div>
                <div class="col-md-6 form-group">
                    <label class="text-bold">{{__('Description')}} <span class="text-danger">*</span></label>
                    <input type="text" value="{{$currency->description}}" name="description" id="description" placeholder="{{__('Description')}}" required class="form-control">
                </div>
                <div class="col-md-6 form-group">
                    <label class="text-bold">{{__('Symbol')}} <span class="text-danger">*</span></label>
                    <input type="text" value="{{$currency->symbol}}" name="symbol" id="symbol" placeholder="{{__('Symbol')}}" required class="form-control">
                </div>

                <div class="col-md-6 form-group">
                    <label class="text-bold">Rate <span class="text-danger">*</span></label>
                    <input type="number" value="{{$currency->latestRate->rate}}"  name="rate" id="rate" placeholder="Rate" required class="form-control text-left" value="1">
                </div>



                <div class="col-md-6">
                    <div class="form-group">
                        <label class="text-bold">{{trans('file.Company')}} <span class="text-danger">*</span></label>
                        <select name="company_id" id="company_id" required class="form-control selectpicker dynamic" data-live-search="true" data-live-search-style="contains" data-shift_name="shift_name" data-dependent="department_name" title="{{__('Selecting',['key'=>trans('file.Company')])}}...">
                            @foreach($companies as $company)
                            <option value="{{$company->id}}" @if ($currency->company_id == $company->id) selected @endif>{{$company->company_name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>







                <div class="form-group">
                    <div class="registrationFormAlert" id="divCheckPasswordMatch">
                    </div>
                </div>
            </div>



            {{-- <div class="col-md-6 form-group"  id="ipField"></div> --}}


            <div class="container">
                <div class="form-group" align="center">
                    <input type="hidden" name="action" id="action" />
                    <input type="hidden" name="hidden_id" id="hidden_id" />
                    <input type="submit" name="action_button" id="action_button" class="btn btn-warning w-100" value="Update Currency" />
                </div>
            </div>


        </form>
    </div>



    <div class="col-12 ">
        <div class="container">
        <h3>Rate history</h3>
        </div>
        <!-- Filtering -->
      
        <!--/ Filtering -->
    </div>


    <div class="table-responsive container">
        <table id="rates-table" class="table ">
            <thead>
                <tr>
                    <th>Updated at</th>
                    <th>Rate</th>
                </tr>
            </thead>
            <tbody>
                @foreach($currency->rates as $rate)
                <tr>
                    <td>{{ date('d/m/Y H:i', strtotime($rate->created_at)) }}</td>
                    <td>{{$currency->symbol. ' '. $rate->rate}}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>



<div id="formModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{__('Add Currency')}}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <span id="form_result"></span>
                <form method="post" id="sample_form" class="form-horizontal" enctype="multipart/form-data">

                    @csrf
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label class="text-bold">{{__('Name')}} <span class="text-danger">*</span></label>
                            <input type="text" name="name" id="name" placeholder="{{__('Currency Name')}}" required class="form-control">
                        </div>
                        <div class="col-md-6 form-group">
                            <label class="text-bold">{{__('Description')}} <span class="text-danger">*</span></label>
                            <input type="text" name="description" id="description" placeholder="{{__('Description')}}" required class="form-control">
                        </div>
                        <div class="col-md-6 form-group">
                            <label class="text-bold">{{__('Symbol')}} <span class="text-danger">*</span></label>
                            <input type="text" name="symbol" id="symbol" placeholder="{{__('Symbol')}}" required class="form-control">
                        </div>

                        <div class="col-md-6 form-group">
                            <label class="text-bold">Rate <span class="text-danger">*</span></label>
                            <input type="number" step="2" name="rate" id="rate" placeholder="Rate" required class="form-control text-left" value="1">
                        </div>



                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-bold">{{trans('file.Company')}} <span class="text-danger">*</span></label>
                                <select name="company_id" id="company_id" required class="form-control selectpicker dynamic" data-live-search="true" data-live-search-style="contains" data-shift_name="shift_name" data-dependent="department_name" title="{{__('Selecting',['key'=>trans('file.Company')])}}...">
                                    @foreach($companies as $company)
                                    <option value="{{$company->id}}">{{$company->company_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>







                        <div class="form-group">
                            <div class="registrationFormAlert" id="divCheckPasswordMatch">
                            </div>
                        </div>
                    </div>



                    {{-- <div class="col-md-6 form-group"  id="ipField"></div> --}}


                    <div class="container">
                        <div class="form-group" align="center">
                            <input type="hidden" name="action" id="action" />
                            <input type="hidden" name="hidden_id" id="hidden_id" />
                            <input type="submit" name="action_button" id="action_button" class="btn btn-warning w-100" value="Add Currency" />
                        </div>
                    </div>


                </form>
            </div>

        </div>
    </div>
</div>
</div>


<div id="confirmModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">{{trans('file.Confirmation')}}</h2>
                <button type="button" class="employee-close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <h4 align="center" style="margin:0;">{{__('Are you sure you want to remove this data?')}}</h4>
            </div>
            <div class="modal-footer">
                <button type="button" name="ok_button" id="ok_button" class="btn btn-danger">{{trans('file.OK')}}</button>
                <button type="button" class="close btn-default" data-dismiss="modal">{{trans('file.Cancel')}}</button>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script type="text/javascript">
    $(document).ready(function() {
        $('#form_result').slideDown(300).delay(5000).slideUp(300);
    })
    //--------  Filter  ---------
    </script>

@endpush