@extends('layout.main')
@section('content')


<section>

    <div class="container"><span id="general_result"></span></div>


    <div class="container mb-3">
        <div id="form_results">
            @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        </div>
        @endif
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
        <form method="post" id="sample_form" action="{{route('nssa-taxtables.update', ['nssa_taxtable'=> $n->id])}}" class="form-horizontal" enctype="multipart/form-data">
            @method('put')
            @csrf
            <div class="row">
                <div class="form-group col-md-4">
                    <label>{{__('Tax Currency')}} *</label>
                    <select name="currency_id" id="currency_id" required class="form-control">
                        @php
                        $currencies = App\Models\Currency::get();
                        @endphp
                        @if ($currencies->isNotEmpty())
                        @foreach($currencies as $cur)
                        <option value="{{$cur->id}}" @if($n->currency_id == $cur->id) selected @endif>{{$cur->name }} {{ $cur->symbol }}</option>
                        @endforeach
                        @endif
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label>{{__('Insuarable deductions')}} * <small class="text-muted">%</small></label>
                    <input type="number" step=".01" value="{{$n->posb_insuarance}}" name="posb_insuarance" id="posb_insuarance" placeholder="Percentage" required class="form-control text-left">
                </div>
                <div class="form-group col-md-4">
                    <label>{{__('Insuarable deductions Ceiling')}} *</label>
                    <input type="number" step=".01" value="{{$n->insuarance_ceiling}}" name="insuarance_ceiling" id="insuarance_ceiling" placeholder="Insuarable ceiling" required class="form-control text-left">
                </div>
                <div class="form-group col-md-4">
                    <label>{{__('APWCS Contribution')}} * <small class="text-muted">%</small></label>
                    <input type="number" step=".01" value="{{$n->posb_contribution}}" name="posb_contribution" id="posb_contribution" placeholder="Percentage" required class="form-control text-left">
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Update</button>


        </form>
    </div>
 
</section>
@endsection
@if(Session::has('success'))
<script>
    html = '<div class="alert alert-success"> Nssa table updated succesfully' + '</div>';

    $('#form_results').html(html).slideDown(300).delay(5000).slideUp(300);
</script>
@endif