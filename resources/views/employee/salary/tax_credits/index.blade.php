<section>

    <span id="taxcredit_general_result"></span>


    <div class="mb-3">
        @can('set-salary')
            <button type="button" class="btn btn-info" name="create_record" id="create_taxcredit_record"><i
                        class="fa fa-plus"></i>{{__('Add Tax Credit')}}</button>
        @endcan
    </div>

    <div class="row">
        <div class="table-responsive">
            <table id="taxcredit-table" class="table ">
                <thead>
                <tr>
                <th>{{__('Month-Year')}}</th>
                    <th>{{__('Tax Credit Title')}}</th>
                    @if(config('variable.currency_format')=='suffix')
                        <th>{{__('Tax Credit Amount')}} </th>
                    @else
                        <th> {{__('Tax Credit Amount')}}</th>
                    @endif
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
                </thead>

            </table>
        </div>
    </div>

    <div id="TaxCreditformModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{__('Add Tax Credit')}}</h5>
                    <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="allowance-close"><i class="dripicons-cross"></i></button>
                </div>

                <div class="modal-body">
                    <span id="allowance_form_result"></span>
                    <form method="post" id="taxcredit_sample_form" class="form-horizontal" autocomplete="off">

                        @csrf
                        <div class="row">

                            <div class="col-md-6 form-group">
                                <label>{{__('Month Year')}} *</label>
                                <input class="form-control month_year" id="month_year" name="month_year" type="text">
                            </div>

                            <!-- <div class="col-md-6 form-group">
                                <label>{{__('Tax Type')}} *</label>
                                <select name="is_taxable" id="allowance_is_taxable" required
                                        class="form-control selectpicker"
                                        title='{{__('Selecting',['key'=>__('Allowance Type')])}}...'>
                                    <option value="1">{{trans('file.Taxable')}}</option>
                                    <option value="0">{{trans('file.Non-Taxable')}}</option>
                                </select>
                            </div> -->
                            <div class="col-md-6 form-group">
                                <label>{{__('Tax Credit Currency')}} *</label>
                                <select name="currency_id" id="currency_id" required
                                        class="form-control selectpicker">
                                      @php 
                                      $currencies =  App\Models\Currency::get();
                                      @endphp
                                        @if ($currencies->isNotEmpty())
                                        @foreach($currencies as $cur)
                                        <option value="{{$cur->id}}">{{$cur->name }} {{ $cur->symbol }}</option>
                                        @endforeach
                                        @endif
                                </select>
                            </div>
                            <!-- <div class="col-md-6 form-group">
                            <label>{{ __('Taxable percentage') }} </label>
                                <input type="number" name="deductible_amt" id="deductible_amt"
                                       placeholder={{__('Deductible percentage')}}
                                                class="form-control text-left">
                            </div> -->
                            <div class="col-md-6 form-group">
                                <label>{{__('Tax Credit Title')}} *</label>
                                <input type="text" name="allowance_title" id="taxcredit_title"
                                       placeholder={{__('Tax Credit Title')}}
                                               required class="form-control">
                            </div>
                            <div class="col-md-6 form-group">
                                @if(config('variable.currency_format')=='suffix')
                                    <label>{{__('Credit Amount')}} ({{config('variable.currency')}})
                                            *</label>
                                @else
                                    <label>({{config('variable.currency')}}) {{__('Credit Amount')}}
                                            *</label>
                                @endif
                                <input type="text" name="allowance_amount" id="taxcredit_amount"
                                       placeholder={{__('Allowance Amount')}}
                                               required class="form-control">
                            </div>


                            <div class="container">
                                <br>
                                {{-- <span class="text-danger"><i>[NB: If you didn't pay the employee's previous due, the current amount will be treated as the previous amount.]</i></span> <br><br> --}}
                                <div class="form-group" align="center">
                                    <input type="hidden" name="action" id="taxcredit_action"/>
                                    <input type="hidden" name="hidden_id" id="taxcredit_hidden_id"/>
                                    <input type="submit" name="action_button" id="taxcredit_action_button"
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

