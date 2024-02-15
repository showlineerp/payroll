
    $('#taxcredit-table').DataTable().clear().destroy();

    var table_table = $('#taxcredit-table').DataTable({
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
            url: "{{ route('salary_tax_credits.show',$employee->id) }}",
        },

        columns: [

            {
                data: 'month_year',
                name: 'month_year',
            },
            {
                data: 'deduction_title',
                name: 'deduction_title'
            },
           
            {
                data: 'deduction_amount',
                name: 'deduction_amount',
                render: function (data, type, row) {
                    if ('{{config('variable.currency_format') =='suffix'}}') {
                        return data + ' {{config('variable.currency')}}';
                    } else {
                        return row.currency_symbol +' '+ + data;

                    }
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
                'targets': [0, 3],
            },
        ],


        {{-- 'select': {style: 'multi', selector: 'td:first-child'}, --}}
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
    });
    new $.fn.dataTable.FixedHeader(table_table);


    $('#create_taxcredit_record').click(function () {

        $('.modal-title').text('{{__('Add Tax Credit')}}');
        $('#taxcredit_action_button').val('{{trans('file.Add')}}');
        $('#taxcredit_action').val('{{trans('file.Add')}}');
        $('#TaxCreditformModal').modal('show');
    });

    $('#taxcredit_sample_form').on('submit', function (event) {
        event.preventDefault();
        if ($('#taxcredit_action').val() == '{{trans('file.Add')}}') {

            $.ajax({
                url: "{{ route('salary_tax_credits.store',$employee) }}",
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
                        $('#taxcredit_sample_form')[0].reset();
                        $('select').selectpicker('refresh');
                        $('#taxcredit-table').DataTable().ajax.reload();
                    }
                    $('#taxcredit_form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                }

            });
        }

        if ($('#taxcredit_action').val() == '{{trans('file.Edit')}}') {
            $.ajax({
                url: "{{ route('salary_tax_credits.update') }}",
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
                            $('#TaxCreditformModal').modal('hide');
                            $('select').selectpicker('refresh');
                            $('#taxcredit-table').DataTable().ajax.reload();
                            $('#taxcredit_sample_form')[0].reset();
                        }, 2000);

                    }
                    $('#taxcredit_form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                }
            });
        }
    });


    $(document).on('click', '.allowance_edit', function () {

        var id = $(this).attr('id');
        var target = "{{ route('salary_tax_credits.index') }}/" + id + '/edit';


        $.ajax({
            url: target,
            dataType: "json",
            success: function (html) {
                console.log(html);
                let id = html.data.id;
                $('.month_year').val(html.data.month_year);
                $('#taxcredit_amount').val(html.data.deduction_amount);
                $('#taxcredit_title').val(html.data.deduction_title);
                $('#currency_id').val(html.data.currency_id);
             
                $('#taxcredit_hidden_id').val(html.data.id);
                $('.modal-title').text('{{trans('file.Edit')}}');
                $('#taxcredit_action_button').val('{{trans('file.Edit')}}');
                $('#taxcredit_action').val('{{trans('file.Edit')}}');
                $('#TaxCreditformModal').modal('show');
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
        $('#taxcredit_sample_form')[0].reset();
        $('select').selectpicker('refresh');
        $('.confirmModal').modal('hide');
        $('#taxcredit-table').DataTable().ajax.reload();
    });

    $('.allowance-ok').click(function () {
        let target = "{{ route('salary_tax_credits.index') }}/" + allowance_delete_id + '/delete';
        $.ajax({
            url: target,
            beforeSend: function () {
                $('.allowance-ok').text('{{trans('file.Deleting...')}}');
            },
            success: function (data) {
                setTimeout(function () {
                    $('.confirmModal').modal('hide');
                    $('#taxcredit-table').DataTable().ajax.reload();
                }, 2000);
            }
        })
    });
