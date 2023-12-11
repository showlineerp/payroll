<table id="tax_tables" class="table  table-stripped">
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
                            {{$dt->upper_range}}
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            $ {{$dt->deduct}}
                        </td>


                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                            <a class="btn btn-sm btn-success mx-1" href="{{route('usd-taxtables.edit', ['usd_taxtable'=> $dt->id])}}">edit</a>
                            <a class="btn btn-sm btn-danger" href="{{url('usd-taxtables/delete/'.$dt->id)}}">Delete</a>
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
                            {{$dt->upper_range}}
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            $ {{$dt->deduct}}
                        </td>

                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                            <a class="btn btn-sm btn-success mx-1" href="{{route('usd-taxtables.edit', ['usd_taxtable'=> $dt->id])}}">edit</a>
                            <a class="btn btn-sm btn-danger" href="{{url('usd-taxtables/delete/'.$dt->id)}}">Delete</a>
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
                            {{$dt->upper_range}}
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            $ {{$dt->deduct}}
                        </td>

                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                            <a class="btn btn-sm btn-success mx-1" href="{{route('usd-taxtables.edit', ['usd_taxtable'=> $dt->id])}}">edit</a>
                            <a class="btn btn-sm btn-danger" href="{{url('usd-taxtables/delete/'.$dt->id)}}">Delete</a>
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
                            {{$dt->upper_range}}
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            $ {{$dt->deduct}}
                        </td>

                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                            <a class="btn btn-sm btn-success mx-1" href="{{route('usd-taxtables.edit', ['usd_taxtable'=> $dt->id])}}">edit</a>
                            <a class="btn btn-sm btn-danger" href="{{url('usd-taxtables/delete/'.$dt->id)}}">Delete</a>
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
                            {{$dt->upper_range}}
                        </td>
                        <td>
                            {{$dt->multiply_by}} %
                        </td>
                        <td>
                            $ {{$dt->deduct}}
                        </td>

                        <td>
                            {{$dt->calculation_info}}
                        </td>
                        <td>
                            <a class="btn btn-sm btn-success mx-1" href="{{route('usd-taxtables.edit', ['usd_taxtable'=> $dt->id])}}">edit</a>
                            <a class="btn btn-sm btn-danger" href="{{url('usd-taxtables/delete/'.$dt->id)}}">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                    @endif
                </tbody>
            </table>