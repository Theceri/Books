@extends('layouts.app')

@section('title', $recommender->name)

@section('content')

<h1> {{$recommender->name}} recommends these books </h1>

@foreach($recommender->books as $book)

    <li><a href="{{ url('books', [$book->title_slug]) }}">{{$book->title}}</a> by
        @php
            $count=0 ;
        @endphp
        @foreach($book->authors as $author)
            @if($count > 0)
                and
            @endif
            <a href="{{ url('authors', [$author->id]) }}">{{$author->name}}</a>
            @php
            $count++ ;
            @endphp
        @endforeach
    </li>

    <br>

    {{$book->description}}

    <br><br>



    @if(count($book->recommenders) > 0 )
        {{$book->title}} also has recommendations from
        @php
            $count=0 ;
        @endphp
        @foreach($book->recommenders as $thisrecommender)
            @if($thisrecommender->name != $recommender->name)
                @if($count > 0)
                    ,
                @endif
                <a href="{{ url('recommenders', [$thisrecommender->id]) }}">{{ $thisrecommender->name }}</a>
                @php
                    $count++ ;
                @endphp
            @endif
        @endforeach
    @endif

@endforeach

@endsection