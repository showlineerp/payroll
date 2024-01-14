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
        <form method="post" id="sample_form" action="{{route('zimdef-taxtables.store')}}" class="form-horizontal" enctype="multipart/form-data">

            @csrf
            <div class="row">
               
                <div class="form-group col-md-4">
                   
                    <input type="number" step=".01" name="deduction" id="deduction" placeholder="Zimdef deductions %" required class="form-control text-left">
                </div>
                <div class="form-group col-md-4 ">

            <button class="btn btn-primary" type="submit">Submit</button>
            </div>
                
            </div>
          

        </form>
    </div>
    <div class="container">
        <div class="table-responsive bg-white " id="nssa_taxtables">
            <table id="tax_tables" class="table  table-striped">
                <thead>
                    <tr>
                        <th>ZIMDEF deduction</th>
                        <th>Updated By</th>
                        <th class="not-exported">{{trans('file.action')}}</th>
                    </tr>
                </thead>

                <tbody>
                    @if($zimdef->isNotEmpty())
                    @foreach($zimdef as $z)
                    <tr>
                        <td>
                            {{ $z->deduction }}%
                        </td>
                       
                        <td>
                            {{ $z->updated_by }}
                        </td>
                        <td>
                            <a href="{{route('zimdef-taxtables.edit', ['zimdef_taxtable'=> $z->id])}}" class="btn btn-info">update</a>
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