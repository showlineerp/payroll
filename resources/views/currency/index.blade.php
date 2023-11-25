@extends('layout.main')
@section('content')


<section>

    <div class="container-fluid"><span id="general_result"></span></div>


    <div class="container-fluid mb-3">
        @can('store-details-employee')
        <button type="button" class="btn btn-info" name="create_record" id="create_record"><i class="fa fa-plus"></i> {{__('Add Currency')}}</button>
        @endcan
        @can('modify-details-employee')
        <button type="button" class="btn btn-danger" name="bulk_delete" id="bulk_delete"><i class="fa fa-minus-circle"></i> {{__('Bulk delete')}}</button>
        @endcan
        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            <i class="fa fa-filter" aria-hidden="true"></i> Filter
        </button>
    </div>
    <div class="col-12">
        <!-- Filtering -->
        <div class="collapse" id="collapseExample">
            <div class="card card-body">
                <form action="" method="GET" id="filter_form">
                    <div class="row">
                        <!-- Company -->
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="text-bold"><strong>Currency</strong></label>
                                <select name="company_id" id="company_id_filter" class="form-control selectpicker dynamic" data-live-search="true" data-live-search-style="contains" data-shift_name="shift_name" data-dependent="department_name" title="{{__('Selecting',['key'=>'Currency'])}}...">
                                    <option value=""></option>
                                    @foreach($currencies as $currency)
                                    <option value="{{$currency->id}}">{{$currency->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                       
                        <div class="col-md-1">
                            <label class="text-bold"></label><br>
                            <button type="button" class="btn btn-dark" id="filterSubmit">
                                <i class="fa fa-arrow-right" aria-hidden="true"></i> &nbsp; GET
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--/ Filtering -->
    </div>


    <div class="table-responsive">
        <table id="employee-table" class="table ">
            <thead>
                <tr>
                    <th>Currency</th>
                    <th>Description</th>
                    <th>Symbol</th>
                    <th>Rate</th>
                    <th>Rate updated on </th>
                    <th>Company</th>
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
            </thead>

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
            </div>

            </form>

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

        if (window.location.href.indexOf('#formModal') != -1) {
            $('#formModal').modal('show');
        }

        var date = $('.date');
        date.datepicker({
            format: '{{ env('Date_Format_JS ')}}',
            autoclose: true,
            todayHighlight: true
        });

        var table_table = $('#employee-table').DataTable({
            // initComplete: function() {
            //     this.api().columns([2, 4]).every(function() {
            //         var column = this;
            //         var select = $('<select><option value=""></option></select>')
            //             .appendTo($(column.footer()).empty())
            //             .on('change', function() {
            //                 var val = $.fn.dataTable.util.escapeRegex(
            //                     $(this).val()
            //                 );

            //                 column
            //                     .search(val ? '^' + val + '$' : '', true, false)
            //                     .draw();
            //             });

            //         column.data().unique().sort().each(function(d, j) {
            //             select.append('<option value="' + d + '">' + d + '</option>');
            //             $('select').selectpicker('refresh');
            //         });
            //     });
            // },
            responsive: true,
            fixedHeader: {
                header: true,
                footer: true
            },
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ route('currency.index') }}",
                type: 'GET',
                data: function(d) {
                    d.company_id = $("#company_id_filter").val();
                }
            },

            columns: [
                {
                    data: 'name',
                    name: 'name',

                },
                {
                    data: 'description',
                    name: 'description',

                },
                {
                    data: 'symbol',
                    name: 'symbol',

                },
              
                {
                    data: 'rate',
                    name: 'rate',

                },
                {
                    data: 'rate_updated',
                    name: 'rate_updated',

                },
                {
                    data: 'company',
                    name: 'company',
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false
                }
            ],


            "order": [],
            'language': {
                'lengthMenu': '_MENU_ records per page',
                "info": '{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)',
                "search": '{{trans("file.Search")}}',
                'paginate': {
                    'previous': '{{trans("file.Previous")}}',
                    'next': '{{trans("file.Next")}}'
                }
            },
           
        });
        new $.fn.dataTable.FixedHeader(table_table);

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
            url: "{{ route('currency.store') }}",
            method: "POST",
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            dataType: "json",
            success: function(data) {
                console.log(data);
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
                    html = '<div class="alert alert-success">' + data.success + '</div>';
                    $('#sample_form')[0].reset();
                    $('select').selectpicker('refresh');
                    $('.date').datepicker('update');
                    $('#employee-table').DataTable().ajax.reload();
                }
                $('#form_result').html(html).slideDown(300).delay(5000).slideUp(300);
            }
        });
    });


    let employee_delete_id;

    $(document).on('click', '.delete', function() {
        employee_delete_id = $(this).attr('id');
        $('#confirmModal').modal('show');
        $('.modal-title').text('{{__('DELETE Record ')}}');
        $('#ok_button').text('OK');

    });


    $(document).on('click', '#bulk_delete', function() {

        var id = [];
        let table = $('#employee-table').DataTable();
        id = table.rows({
            selected: true
        }).ids().toArray();
        if (id.length > 0) {
            if (confirm('{{__('Delete Selection ',['
                    key '=>trans('file.Employee ')])}}')) {
                $.ajax({
                    url: '{{url('mass_delete_employees ')}}',
                    method: 'POST',
                    data: {
                        employeeIdArray: id
                    },
                    success: function(data) {
                        if (data.success) {
                            html = '<div class="alert alert-success">' + data.success + '</div>';
                        }
                        if (data.error) {
                            html = '<div class="alert alert-danger">' + data.error + '</div>';
                        }
                        table.ajax.reload();
                        table.rows('.selected').deselect();
                        $('#general_result').html(html).slideDown(300).delay(5000).slideUp(300);

                    }

                });
            }
        } else {
            alert('{{__('Please select atleast one checkbox ')}}');
        }
    });


    $('#close').click(function() {
        $('#sample_form')[0].reset();
        $('select').selectpicker('refresh');
        $('.date').datepicker('update');
        $('#employee-table').DataTable().ajax.reload();
    });

    $('#ok_button').click(function() {
        let target = "{{ route('currency.index') }}/" + employee_delete_id + '/delete';
        $.ajax({
            url: target,
            beforeSend: function() {
                $('#ok_button').text('{{trans('file.Deleting...')}}');
            },
            success: function(data) {
                if (data.success) {
                    html = '<div class="alert alert-success">' + data.success + '</div>';
                }
                if (data.error) {
                    html = '<div class="alert alert-danger">' + data.error + '</div>';
                }
                setTimeout(function() {
                    $('#general_result').html(html).slideDown(300).delay(5000).slideUp(300);
                    $('#confirmModal').modal('hide');
                    $('#employee-table').DataTable().ajax.reload();
                }, 2000);
            }
        })
    });





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