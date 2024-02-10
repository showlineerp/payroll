@extends('layout.main')
@section('content')


<section>

    <div class="container-fluid"><span id="general_result"></span></div>


    <div class="container-fluid mb-3">

        <div class="mb-3 ">
            <span id="form_result"></span>
            <form method="post" id="sample_form" action="{{route('zwl-taxtables.store')}}" class="form-horizontal" enctype="multipart/form-data">

                @csrf

                <div class="row">
                    <div class="col-md-3 form-group">
                        <label class="text-bold">{{__('From')}} <span class="text-danger">*</span></label>
                        <input type="number" step="0.01" name="lower_range" id="lower_range" placeholder="{{__('Lower Rangge')}}" required class="form-control  text-left">
                    </div>
                    <div class="col-md-3 form-group">
                        <label class="text-bold">{{__('To')}} <span class="text-danger">*</span></label>
                        <input type="number" step="0.01" name="upper_range" id="upper_bound" placeholder="{{__('Upper Range')}}" required class="form-control text-left">
                        <small class="tex-muted text-right" style="color:grey">-1 is above</small>
                    </div>
                    <div class="col-md-3 form-group">
                        <label class="text-bold">{{__('Multiply by')}} <span class="text-danger">%</span></label>
                        <input type="number" step="0.01" name="multiply_by" id="multiply_by" placeholder="{{__('Percentange to multiply')}}" required class="form-control text-left">
                    </div>

                    <div class="col-md-3 form-group">
                        <label class="text-bold">Deduct <span class="text-danger">*</span></label>
                        <input type="number" step="0.01" name="deduct" id="deduct" placeholder="Deduct" required class="form-control text-left">
                    </div>
                    <div class="col-md-6 form-group">
                        <label class="text-bold">Select Table <span class="text-danger">*</span></label>
                        <select name="table_type" id="table_type" class="form-control">
                            <option value="daily"> Daily Table</option>
                            <option value="weekly"> Weekly Table</option>
                            <option value="fortnightly"> Fortnightly Table</option>
                            <option value="monthly"> Monthly Table</option>
                            <option value="annually"> Annual Table</option>
                        </select>
                    </div>

                    <div class="col-md-6 form-group">
                        <label class="text-bold">Example </label>

                        <input type="text" name="calculation_info" id="calculation_info" placeholder="{{__('Example')}}" class="form-control text-left">

                    </div>






                    <div class="form-group">
                        <div class="registrationFormAlert" id="divCheckPasswordMatch">
                        </div>
                    </div>

                </div>
                <input type="submit" name="action_button" id="" class="btn btn-warning w-25" value="Update" />

            </form>
        </div>



        <div class="table-responsive bg-white " id="usd_taxtables">
            <table id="tax_tables" class="table  table-striped">
                <thead>
                    <tr>
                        <th>From</th>
                        <th>To</th>
                        <th>Multiply By</th>
                        <th>Deduct</th>


                        <th>Example </th>
                        <th class="not-exported">{{trans('file.action')}}</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td colspan="6" class="font-weight-bold text-center">DAILY TABLE</td>
                    </tr>
                    @if($daily_taxes->isNotEmpty())
                    @foreach($daily_taxes as $dt)
                    <tr>


                        <td>
                            {{$dt->lower_range}}
                        </td>
                        <td>
                            @if(intval($dt->upper_range) == -1)
                            above
                            @else
                            {{$dt->upper_range}}
                            @endif
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            ZWL {{$dt->deduct}}
                        </td>


                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                           
                            <a class="btn btn-sm btn-danger" href="{{url('zwl-taxtables/delete/'.$dt->id)}}">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                    @endif

                    <tr>
                        <td colspan="6" class="font-weight-bold text-center">WEEKLY TABLE</td>
                    </tr>
                    @if($weekly_taxes->isNotEmpty())
                    @foreach($weekly_taxes as $dt)
                    <tr>


                        <td>
                            {{$dt->lower_range}}
                        </td>

                        <td>
                            @if(intval($dt->upper_range) == -1)
                            above
                            @else
                            {{$dt->upper_range}}
                            @endif
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            ZWL {{$dt->deduct}}
                        </td>

                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                           
                            <a class="btn btn-sm btn-danger" href="{{url('zwl-taxtables/delete/'.$dt->id)}}">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                    @endif
                    <tr>
                        <td colspan="6" class="font-weight-bold  text-center">FORNIGHTLY TABLE</td>
                    </tr>
                    @if($fortnightly_taxes->isNotEmpty())
                    @foreach($fortnightly_taxes as $dt)
                    <tr>


                        <td>
                            {{$dt->lower_range}}
                        </td>
                        <td>
                            @if(intval($dt->upper_range) == -1)
                            above
                            @else
                            {{$dt->upper_range}}
                            @endif
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            ZWL {{$dt->deduct}}
                        </td>

                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                           
                            <a class="btn btn-sm btn-danger" href="{{url('zwl-taxtables/delete/'.$dt->id)}}">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                    @endif

                    <tr>
                        <td colspan="6" class="font-weight-bold text-center">MONTHLY TABLE</td>
                    </tr>
                    @if($monthly_taxes->isNotEmpty())
                    @foreach($monthly_taxes as $dt)
                    <tr>


                        <td>
                            {{$dt->lower_range}}
                        </td>
                        <td>
                            @if(intval($dt->upper_range) == -1)
                            above
                            @else
                            {{$dt->upper_range}}
                            @endif
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            ZWL {{$dt->deduct}}
                        </td>

                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                           
                            <a class="btn btn-sm btn-danger" href="{{url('zwl-taxtables/delete/'.$dt->id)}}">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                    @endif

                    <tr>
                        <td colspan="6" class="font-weight-bold text-center">ANNUAL TABLE</td>
                    </tr>
                    @if($annual_taxes->isNotEmpty())
                    @foreach($annual_taxes as $dt)
                    <tr>


                        <td>
                            {{$dt->lower_range}}
                        </td>

                        <td>
                            @if(intval($dt->upper_range) == -1)
                            above
                            @else
                            {{$dt->upper_range}}
                            @endif
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            ZWL {{$dt->deduct}}
                        </td>

                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                           
                            <a class="btn btn-sm btn-danger" href="{{url('zwl-taxtables/delete/'.$dt->id)}}">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                    @endif
                </tbody>
            </table>
        </div>




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
                        <!-- <span id="form_result"></span> -->
                        <form method="post" id="sample_form1" class="form-horizontal" enctype="multipart/form-data">

                            @csrf
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label class="text-bold">{{__('Panashe')}} <span class="text-danger">*</span></label>
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
                                </div>
                            </div>
                    </div>

                    </form>

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
    </div>
</section>
@endsection
@if(Session::has('success'))
<script>
    html = '<div class="alert alert-success"> Deleted entry successfuly' + '</div>';
   
    $('#form_result').html(html).slideDown(300).delay(5000).slideUp(300);
</script>
@endif
@push('scripts')
<script type="text/javascript">
    $(document).ready(function() {

        if (window.location.href.indexOf('#formModal') != -1) {
            $('#formModal').modal('show');
        }

        var date = $('.date');
        date.datepicker({
            format: '{{ env('Date_Format_JS ')}}',
            autoclose: true,
            todayHighlight: true
        });




        //-------------- Filter -----------------------

        $('#filterSubmit').on("click", function(e) {
            $('#employee-table').DataTable().draw(true);
            //$('#filter_form')[0].reset();
            //$('select').selectpicker('refresh');
        });
        //--------------/ Filter ----------------------


        $('#create_record').click(function() {

            $('.modal-title').text("Add Employee");
            $('#action_button').val('Add');
            $('#action').val('Add');
            $('#formModal').modal('show');
        });

        $('#sample_form').on('submit', function(event) {
            event.preventDefault();
            // var attendance_type = $("#attendance_type").val();
            // console.log(attendance_type);

            $.ajax({
                url: "{{ route('zwl-taxtables.store') }}",
                method: "POST",
                data: new FormData(this),
                contentType: false,
                cache: false,
                processData: false,
                dataType: "json",
                success: function(data) {
                    get_updated_table()
                    var html = '';
                    if (data.errors) {
                        html = '<div class="alert alert-danger">';
                        for (var count = 0; count < data.errors.length; count++) {
                            html += '<p>' + data.errors[count] + '</p>';
                        }
                        html += '</div>';
                    }
                    if (data.error) {
                        html = '<div class="alert alert-danger">' + data.error + '</div>';
                    }
                    if (data.success) {
                        html = '<div class="alert alert-success"> Added new entry thank you!' + '</div>';
                        $('#sample_form')[0].reset();
                    
                        // $('.date').datepicker('update');
                    }

                    $('#form_result').html(html).slideDown(300).delay(5000).slideUp(300);

                }
            });
        });


        let employee_delete_id;




    })




    function get_updated_table() {
        $.ajax({
            url: "{{ route('zwl-taxtables.index') }}",
            method: "GET",
            success: function(data) {

                $("#usd_taxtables").html(data)

            }
        });
    }




    // Login Type Change
    // $('#login_type').change(function() {
    //     var login_type = $('#login_type').val();
    //     if (login_type=='ip') {
    //         data = '<label class="text-bold">{{__("IP Address")}} <span class="text-danger">*</span></label>';
    //         data += '<input type="text" name="ip_address" id="ip_address" placeholder="Type IP Address" required class="form-control">';
    //         $('#ipField').html(data)
    //     }else{
    //         $('#ipField').empty();
    //     }
    // });



    //--------  Filter  ---------
</script>


@endpush