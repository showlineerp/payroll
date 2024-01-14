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
        <form method="post" id="sample_form" action="{{route('zimdef-taxtables.update', ['zimdef_taxtable'=> $zimdef->id])}}" class="form-horizontal" enctype="multipart/form-data">
            @method('put')
            @csrf
            <div class="row">

                <div class="form-group col-md-4">

                    <input type="number" step=".01" name="deduction" value="{{ $zimdef->deduction }}" id="deduction" placeholder="Zimdef deductions %" required class="form-control text-left">
                </div>
                <div class="form-group col-md-4 ">

                    <button class="btn btn-primary" type="submit">Submit</button>
                </div>

            </div>


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