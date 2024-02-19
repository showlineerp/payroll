@extends('layout.main')
@section('content')


<section>

    <div class="container"><span id="general_result"></span></div>


    <div class="container-fluid mb-3">
        <div id="form_results">
            @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
            @endif
        </div>
       
        <div id="form_resul">
            @if($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
        </div>
        <form method="post" id="sample_form" action="{{route('nssa-employer-taxtables.store')}}" class="form-horizontal" enctype="multipart/form-data">

            @csrf
            <div class="row">
                <div class="form-group col-md-6">
                    <label>{{__('Tax Currency')}} *</label>
                    <select name="currency_id" id="currency_id" required class="form-control">
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
                <div class="form-group col-md-6">
                    <label>{{__('APWCS Contribution')}} * <small class="text-muted">%</small></label>
                    <input type="number" step=".01" name="posb_contribution" id="posb_contribution" placeholder="Percentage" required class="form-control text-left">
                </div>
                <div class="form-group col-md-6">
                    <label>{{__('Insuarable deductions')}} * <small class="text-muted">%</small></label>
                    <input type="number" step=".01" name="posb_insuarance" id="posb_insuarance" placeholder="Percentage" required class="form-control text-left">
                </div>
                <div class="form-group col-md-6">
                    <label>{{__('Insuarable deductions Ceiling')}} *</label>
                    <input type="number" step=".01" name="insuarance_ceiling" id="insuarance_ceiling" placeholder="Insuarable ceiling" required class="form-control text-left">
                </div>
               
            </div>
            <button class="btn btn-primary" type="submit">Submit</button>


        </form>
    </div>
    <div class="container-fluid">
        <div class="table-responsive bg-white " id="nssa_taxtables">
            <table id="tax_tables" class="table  table-striped">
                <thead>
                    <tr>
                        <th>Currency</th>
                        <th>Insuarable Deductions</th>
                        <th>Deduction Ceiling</th>
                        <th>APWCS Contribution</th>
                        <th>Updated By</th>
                        <th class="not-exported">{{trans('file.action')}}</th>
                    </tr>
                </thead>

                <tbody>
                    @if($nssa->isNotEmpty())
                    @foreach($nssa as $n)
                    <tr>
                        <td>
                            {{ $n->currency }}
                        </td>
                        <td>
                            {{ $n->posb_insuarance }}%
                        </td>
                        <td>
                            {{ $n->currency. number_format($n->insuarance_ceiling) }}
                        </td>
                        <td>
                            {{ $n->posb_contribution }}%
                        </td>
                        <td>
                            {{ $n->last_updated_by }}
                        </td>
                        <td>
                            <a href="{{route('nssa-employer-taxtables.edit', ['nssa_employer_taxtable'=> $n->id])}}" class="btn btn-info">update</a>
                        </td>
                    </tr>
                    @endforeach
                    @endif
                </tbody>
            </table>
        </div>
    </div>
</section>
@endsection
@if(Session::has('success'))
<script>
    html = '<div class="alert alert-success"> Nssa table updated succesfully' + '</div>';

    $('#form_results').html(html).slideDown(300).delay(5000).slideUp(300);
</script>
@endif