    $('#commission-table').DataTable().clear().destroy();

   var table_table = $('#commission-table').DataTable({
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
            url: "<?php echo e(route('salary_commission.show',$employee->id)); ?>",
        },

        columns: [
            {
                data: 'month_year',
                name : 'month_year'
            },
            {
                data: 'commission_title',
                name : 'commission_title'
            },
            {
                data: 'commission_amount',
                name: 'commission_amount',
                render: function (data) {
                    if ('<?php echo e(config('variable.currency_format') =='suffix'); ?>') {
                        return data + ' <?php echo e(config('variable.currency')); ?>';
                    }else {
                        return '<?php echo e(config('variable.currency')); ?> ' + data;
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
            'lengthMenu': '_MENU_ <?php echo e(__('records per page')); ?>',
            "info": '<?php echo e(trans("file.Showing")); ?> _START_ - _END_ (_TOTAL_)',
            "search": '<?php echo e(trans("file.Search")); ?>',
            'paginate': {
                'previous': '<?php echo e(trans("file.Previous")); ?>',
                'next': '<?php echo e(trans("file.Next")); ?>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': [0, 3],
            },
        ],


        
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
    });
    new $.fn.dataTable.FixedHeader(table_table);


    $('#create_commission_record').click(function () {

        $('.modal-title').text('<?php echo e(__('Add Commission')); ?>');
        $('#commission_action_button').val('<?php echo e(trans('file.Add')); ?>');
        $('#commission_action').val('<?php echo e(trans('file.Add')); ?>');
        $('#CommissionformModal').modal('show');
    });

    $('#commission_sample_form').on('submit', function (event) {
        event.preventDefault();
        if ($('#commission_action').val() == '<?php echo e(trans('file.Add')); ?>') {

            $.ajax({
                url: "<?php echo e(route('salary_commission.store',$employee)); ?>",
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
                    if (data.success) {
                        html = '<div class="alert alert-success">' + data.success + '</div>';
                        $('#commission_sample_form')[0].reset();
                        $('#commission-table').DataTable().ajax.reload();
                    }
                    $('#commission_form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                }

            });
        }

        if ($('#commission_action').val() == '<?php echo e(trans('file.Edit')); ?>') {
            $.ajax({
                url: "<?php echo e(route('salary_commission.update')); ?>",
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
                    if (data.error) {
                        html = '<div class="alert alert-danger">' + data.error + '</div>';
                    }

                    if (data.success) {
                        html = '<div class="alert alert-success">' + data.success + '</div>';
                        setTimeout(function () {
                            $('#CommissionformModal').modal('hide');
                            $('#commission-table').DataTable().ajax.reload();
                            $('#commission_sample_form')[0].reset();
                        }, 2000);

                    }
                    $('#commission_form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                }
            });
        }
    });


    $(document).on('click', '.commission_edit', function () {

        var id = $(this).attr('id');

        var target = "<?php echo e(route('salary_commission.index')); ?>/" + id + '/edit';


        $.ajax({
            url: target,
            dataType: "json",
            success: function (html) {

                let id = html.data.id;

                $('.month_year').val(html.data.month_year);
                $('#commission_amount').val(html.data.commission_amount);
                $('#commission_title').val(html.data.commission_title);

                $('#commission_hidden_id').val(html.data.id);
                $('.modal-title').text('<?php echo e(trans('file.Edit')); ?>');
                $('#commission_action_button').val('<?php echo e(trans('file.Edit')); ?>');
                $('#commission_action').val('<?php echo e(trans('file.Edit')); ?>');
                $('#CommissionformModal').modal('show');
            }
        })
    });


    let commission_delete_id;

    $(document).on('click', '.commission_delete', function () {
    commission_delete_id = $(this).attr('id');
        $('.confirmModal').modal('show');
        $('.modal-title').text('<?php echo e(__('DELETE Record')); ?>');
        $('.commission-ok').text('<?php echo e(trans('file.OK')); ?>');
    });


    $('.commission-close').click(function () {
        $('#commission_sample_form')[0].reset();
        $('.confirmModal').modal('hide');
        $('#commission-table').DataTable().ajax.reload();
    });

    $('.commission-ok').click(function () {
        let target = "<?php echo e(route('salary_commission.index')); ?>/" + commission_delete_id + '/delete';
        $.ajax({
            url: target,
            beforeSend: function () {
                $('.commission-ok').text('<?php echo e(trans('file.Deleting...')); ?>');
            },
            success: function (data) {
                setTimeout(function () {
                    $('.confirmModal').modal('hide');
                    $('#commission-table').DataTable().ajax.reload();
                }, 2000);
            }
        })
    });
<?php /**PATH C:\xampp\htdocs\payroll\resources\views/employee/salary/commission/index_js.blade.php ENDPATH**/ ?>