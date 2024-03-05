@extends('layout.main')
@section('content')

<section>

<div class="container-fluid">

    <span id="allowance_general_result"></span>


    <div class="mb-3">
        @can('set-salary')
            <button type="button" class="btn btn-info" name="create_record" id="create_allowance_record"><i
                        class="fa fa-plus"></i>{{__('Add Allowance')}}</button>
        @endcan
    </div>

    <div class="row">
        <div class="table-responsive">
            <table id="allowance-table" class="table ">
                <thead>
                <tr>
                    <th>{{__('Month-Year')}}</th>
                    <th>{{__('Allowance Type')}}</th>
                    <th>{{__('Allowance Title')}}</th>
                    @if(config('variable.currency_format') == 'suffix')
                        <th>{{__('Allowance Amount')}} </th>
                    @else
                        <th> {{__('Allowance Amount')}}</th>
                    @endif
                    <th>{{__('Taxable Percentage')}}</th>
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
                </thead>

            </table>
        </div>
    </div>

    <div id="AllowanceformModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{__('Add Allowance')}}</h5>
                    <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="allowance-close"><i class="dripicons-cross"></i></button>
                </div>

                <div class="modal-body">
                    <span id="allowance_form_result"></span>
                    <form method="post" id="allowance_sample_form" class="form-horizontal" autocomplete="off">

                        @csrf
                        <div class="row">

                            <div class="col-md-6 form-group">
                                <label>{{__('Month Year')}} *</label>
                                <input class="form-control month_year" id="month_year" name="month_year" type="text">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>{{__('Employee Group')}} *</label>
                                <select name="employee_group" id="employee_group" required
                                        class="form-control selectpicker"
                                        title='{{__('Selecting', ['key' => __('Employee Group')])}}...'>
                                    <option value="all">All Employees</option>
                                    <option value="company">Company</option>
                                    <option value="department">Department</option>
                                    <option value="select_employees">Select Employees</option>
                                </select>
                            </div>
                            <div class="col-md-6 form-group employee_groups company company_department">
                                <label>{{__('Select Company')}} *</label>
                                <select name="company" id="company_id" required 
                                        class="form-control selectpicker dynamic"
                                        data-dependent="department_name"
                                        title='{{__('Selecting', ['key' => __('Employees')])}}...'>
                                        @if($companies->isNotEmpty())
                                            @foreach($companies as $company)
                                                <option value="{{$company->id}}"> {{$company->company_name}}</option>
                                            @endforeach
                                       @endif
                                  
                                </select>
                            </div>

                            <div class="col-md-6 form-group employee_groups company_department">
                                <label>{{__('Select Department')}} *</label>
                                <select name="department" id="department_id" required multiple
                                        class="form-control selectpicker "
                                        data-live-search="true" data-live-search-style="contains"
                                        title='{{__('Selecting', ['key' => __('Departments')])}}...'>
                                        @if($departments->isNotEmpty())
                         
                                            @foreach($departments as $department)
                                        
                                                <option value="{{$department->id}}"> {{$department->department_name}}</option>
                                      
                                            @endforeach
                                       @endif
                                  
                                </select>
                            </div>
                            <div class="col-md-6 form-group employee_groups select_employees">
                                <label>{{__('Select Employees')}} *</label>
                                <select name="employees" id="employees" required multiple
                                        class="form-control selectpicker"
                                        data-live-search="true" data-live-search-style="contains"
                                        title='{{__('Selecting', ['key' => __('Employees')])}}...'>
                                        @if($employees->isNotEmpty())
                         
                                            @foreach($employees as $employee)
                                        
                                                <option value="{{$employee->id}}"> {{$employee->first_name. ' '. $employee->last_name}}</option>
                                      
                                            @endforeach
                                       @endif
                                  
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>{{__('Allowance Type')}} *</label>
                                <select name="is_taxable" id="allowance_is_taxable" required
                                        class="form-control selectpicker"
                                        title='{{__('Selecting', ['key' => __('Allowance Type')])}}...'>
                                    <option value="1">{{trans('file.Taxable')}}</option>
                                    <option value="0">{{trans('file.Non-Taxable')}}</option>
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>{{__('Allowance Currency')}} *</label>
                                <select name="currency_id" id="currency_id" required
                                        class="form-control selectpicker">
                                      @php 
                                      $currencies = App\Models\Currency::get();
                                      @endphp
                                        @if ($currencies->isNotEmpty())
                                        @foreach($currencies as $cur)
                                        <option value="{{$cur->id}}">{{$cur->name }} {{ $cur->symbol }}</option>
                                        @endforeach
                                        @endif
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                            <label>{{ __('Taxable percentage') }} </label>
                                <input type="number" name="deductible_amt" id="deductible_amt"
                                       placeholder={{__('Taxable percentage')}}
                                                class="form-control text-left">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>{{__('Allowance Title')}} *</label>
                                <input type="text" name="allowance_title" id="allowance_title"
                                       placeholder={{__('Allowance Type')}}
                                               required class="form-control">
                            </div>
                            <div class="col-md-6 form-group">
                                @if(config('variable.currency_format') == 'suffix')
                                    <label>{{__('Allowance Amount')}} ({{config('variable.currency')}})
                                            *</label>
                                @else
                                    <label>({{config('variable.currency')}}) {{__('Allowance Amount')}}
                                            *</label>
                                @endif
                                <input type="text" name="allowance_amount" id="allowance_amount"
                                       placeholder={{__('Allowance Amount')}}
                                               required class="form-control">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>{{__('Recurring Allowance')}} *</label>
                                <select name="is_recurring" id="is_recurring" required
                                        class="form-control selectpicker"
                                        title='{{__('Selecting', ['key' => __('Is Recurring')])}}...'>
                                    <option value="0">Recurring</option>
                                    <option value="1">Once Only</option>
                                   
                                </select>
                            </div>

                            <div class="container">
                                <br>
                                {{-- <span class="text-danger"><i>[NB: If you didn't pay the employee's previous due, the current amount will be treated as the previous amount.]</i></span> <br><br> --}}
                                <div class="form-group" align="center">
                                    <input type="hidden" name="action" id="allowance_action"/>
                                    <input type="hidden" name="hidden_id" id="allowance_hidden_id"/>
                                    <input type="submit" name="action_button" id="allowance_action_button"
                                           class="btn btn-warning" value={{trans('file.Add')}} />
                                </div>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade confirmModal" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">{{trans('file.Confirmation')}}</h2>
                    <button type="button" class="allowance-close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <h4 align="center" style="margin:0;">{{__('Are you sure you want to remove this data?')}}</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" name="ok_button"  class="btn btn-danger allowance-ok">{{trans('file.OK')}}</button>
                    <button type="button" class="allowance-close btn-default" data-dismiss="modal">{{trans('file.Cancel')}}</button>
                </div>
            </div>
        </div>
    </div>
    </div>

</section>



    @endsection
    @push('scripts')
    <script>
        
    $('#allowance-table').DataTable().clear().destroy();

var table_table = $('#allowance-table').DataTable({
    initComplete: function () {
        this.api().columns([0]).every(function () {
            var column = this;
            var select = $('<select><option value=""></option></select>')
                .appendTo($(column.footer()).empty())
                .on('change', function () {
                    var val = $.fn.dataTable.util.escapeRegex(
                        $(this).val()
                    );

                    column
                        .search(val ? '^' + val + '$' : '', true, false)
                        .draw();
                });

            column.data().unique().sort().each(function (d, j) {
                select.append('<option value="' + d + '">' + d + '</option>');
                $('select').selectpicker('refresh');
            });
        });
    },
    responsive: true,
    fixedHeader: {
        header: true,
        footer: true
    },
    processing: true,
    serverSide: true,
    ajax: {
        url: "{{ route('allowance.index') }}",
    },

    columns: [

        {
            data: 'month_year',
            name: 'month_year',
        },
        {
            data: 'is_taxable',
            name: 'is_taxable',
            render: function (data, type, row) {
                if (data == 1) {
                    return "{{trans('file.Taxable')}}";
                } else {
                    return "{{trans('file.Non-Taxable')}}"
                }
            }

        },
        {
            data: 'allowance_title',
            name: 'allowance_title'
        },
       
        {
            data: 'allowance_amount',
            name: 'allowance_amount',
            render: function (data, type, row) {
                if ('{{config('variable.currency_format') == 'suffix'}}') {
                    return data + ' {{config('variable.currency')}}';
                } else {
                    return row.currency_symbol +' '+ + data;

                }
            }
        },
        {
            data: 'deductible_amt',
            name: 'taxable_percentage',
            render: function (data) {
                return data + '%'
            }
        },
        {
            data: 'action',
            name: 'action',
            orderable: false
        }
    ],


    "order": [],
    'language': {
        'lengthMenu': '_MENU_ {{__('records per page')}}',
        "info": '{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)',
        "search": '{{trans("file.Search")}}',
        'paginate': {
            'previous': '{{trans("file.Previous")}}',
            'next': '{{trans("file.Next")}}'
        }
    },
    'columnDefs': [
        {
            "orderable": false,
            'targets': [0, 5],
        },
    ],


    {{-- 'select': {style: 'multi', selector: 'td:first-child'}, --}}
    'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
});
new $.fn.dataTable.FixedHeader(table_table);


$('#create_allowance_record').click(function () {

    $('.modal-title').text('{{__('Add Allowance')}}');
    $('#allowance_action_button').val('{{trans('file.Add')}}');
    $('#allowance_action').val('{{trans('file.Add')}}');
    $('#AllowanceformModal').modal('show');
});

$('#allowance_sample_form').on('submit', function (event) {
    event.preventDefault();
    if ($('#allowance_action').val() == '{{trans('file.Add')}}') {

        $.ajax({
            url: "{{ route('allowance.store') }}",
            method: "POST",
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            dataType: "json",
            success: function (data) {
                var html = '';
                if (data.errors) {
                    html = '<div class="alert alert-danger">';
                    for (var count = 0; count < data.errors.length; count++) {
                        html += '<p>' + data.errors[count] + '</p>';
                    }
                    html += '</div>';
                }
                if (data.success) {
                    html = '<div class="alert alert-success">' + data.success + '</div>';
                    $('#allowance_sample_form')[0].reset();
                    $('select').selectpicker('refresh');
                    $('#allowance-table').DataTable().ajax.reload();
                }
                $('#allowance_form_result').html(html).slideDown(300).delay(5000).slideUp(300);
            }

        });
    }

    if ($('#allowance_action').val() == '{{trans('file.Edit')}}') {
        $.ajax({
            url: "{{ route('allowance.update', 1) }}",
            method: "POST",
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            dataType: "json",
            success: function (data) {
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
                    setTimeout(function () {
                        $('#AllowanceformModal').modal('hide');
                        $('select').selectpicker('refresh');
                        $('#allowance-table').DataTable().ajax.reload();
                        $('#allowance_sample_form')[0].reset();
                    }, 2000);

                }
                $('#allowance_form_result').html(html).slideDown(300).delay(5000).slideUp(300);
            }
        });
    }
});


$(document).on('click', '.allowance_edit', function () {

    var id = $(this).attr('id');
    var target = "{{ route('allowance.index') }}/" + id + '/edit';


    $.ajax({
        url: target,
        dataType: "json",
        success: function (html) {
            console.log(html);
            let id = html.data.id;
            $('.month_year').val(html.data.month_year);
            $('#allowance_amount').val(html.data.allowance_amount);
            $('#allowance_title').val(html.data.allowance_title);
            $('#currency_id').val(html.data.currency_id);
            $('#deductible_amt').val(html.data.deductible_amt);
            $('#allowance_is_taxable').selectpicker('val', html.data.is_taxable);

            $('#allowance_hidden_id').val(html.data.id);
            $('.modal-title').text('{{trans('file.Edit')}}');
            $('#allowance_action_button').val('{{trans('file.Edit')}}');
            $('#allowance_action').val('{{trans('file.Edit')}}');
            $('#AllowanceformModal').modal('show');
        }
    })
});


let allowance_delete_id;

$(document).on('click', '.allowance_delete', function () {
allowance_delete_id = $(this).attr('id');
    $('.confirmModal').modal('show');
    $('.modal-title').text('{{__('DELETE Record')}}');
    $('.allowance-ok').text('{{trans('file.OK')}}');
});


$('.allowance-close').click(function () {
    $('#allowance_sample_form')[0].reset();
    $('select').selectpicker('refresh');
    $('.confirmModal').modal('hide');
    $('#allowance-table').DataTable().ajax.reload();
});

$('.allowance-ok').click(function () {
    let target = "{{ route('allowance.index') }}/" + allowance_delete_id + '/delete';
    $.ajax({
        url: target,
        beforeSend: function () {
            $('.allowance-ok').text('{{trans('file.Deleting...')}}');
        },
        success: function (data) {
            setTimeout(function () {
                $('.confirmModal').modal('hide');
                $('#allowance-table').DataTable().ajax.reload();
            }, 2000);
        }
    })
});

$('.dynamic').change(function () {
        if ($(this).val() !== '') {
            let value = $(this).val();
            let dependent = $(this).data('dependent');
            let _token = $('input[name="_token"]').val();
            $.ajax({
                url: "{{ route('dynamic_department') }}",
                method: "POST",
                data: {value: value, _token: _token, dependent: dependent},
                success: function (result) {

                    $('select').selectpicker("destroy");
                    $('#department_id').html(result);
                    $('select').selectpicker();

                }
            });
        }
    });

    $("#employee_group").change(function () {
        const group = $(this).val();
        console.log(group)
        if (group == 'all')
        {
            $(".employee_groups").hide();
        }else if (group == 'company')
        {
            $(".employee_groups").hide();
            $(".company").show();
        }else if (group == 'select_employees')
        {
            $(".employee_groups").hide();
            $(".employees").show();
        }else 
        {
            $(".employee_groups").hide();
            $(".company_department").show();
        }
    })
    $(document).ready(function () {
        $(".employee_groups").hide();
    })
    </script>
    @endpush