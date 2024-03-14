<section>

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
                    @if(config('variable.currency_format')=='suffix')
                        <th>{{__('Allowance Amount')}} </th>
                    @else
                        <th> {{__('Allowance Amount')}}</th>
                    @endif
                    <th>{{__('Recurring')}}</th>
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
                                <label>{{__('Select Allowance')}} *</label>
                                <select name="allowance_id" id="allowance_is_taxable" required
                                 data-live-search = "true"
                                        class="form-control selectpicker"
                                        title='{{__('Selecting',['key'=>__('Allowance')])}}...'>
                                   @if($employee_allowance->isNotEmpty())
                                   @foreach($employee_allowance as $ea)
                                   <option value="{{$ea->id}}">{{$ea->allowance_title}}</option>
                                   @endforeach
                                   @endif 
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


</section>

