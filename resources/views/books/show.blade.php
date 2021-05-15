@extends('layouts.app')

@section('title', $book->title)

@section('content')

<h1> {{$book->title}} </h1>

<h2>By: 
@foreach($book->authors as $key=>$value)
<a href="{{ url('authors', [$value->name_slug]) }}"> <h2>{{$value->name}}</h2> </a> </h2>
@endforeach

<p> {{$book->description}} </p>

<h2>Recommended by:</h2>

<p> {{$book->title}} is recommended by these great people: </p>

@if(count($book->recommenders) > 0)

<ul>

    @foreach($book->recommenders as $recommender)

                <li><a href="{{ url('recommenders', [$recommender->name_slug]) }}">{{$recommender->name}}</a></li>

    @endforeach

</ul>

@endif

        <h2> More books by {{ $all_author }} </h2>

        @foreach($coauthoredbooks as $coauthoredbook)

            @if($coauthoredbook->title !== $book->title && count($coauthoredbook->authors) == 1)
                @php
                    $count=0;
                @endphp
                @if($count == 0)
                    
                    
                @endif
                <ul>
                <li><a href="{{ url('books', [$coauthoredbook->title_slug]) }}">{{ $coauthoredbook->title }}</a></li>
                @if(count($coauthoredbook->recommenders) > 0)
                    Recommended by

                    @foreach($coauthoredbook->recommenders as $thisrecommender)
                        @if($count > 0)
                            ,
                        @endif
                        <a href="{{ url('recommenders', [$thisrecommender->name_slug]) }}">{{ $thisrecommender->name }}</a>
                        @php
                            $count++ ;
                        @endphp
                    @endforeach
                @endif
                    </ul>

            @endif

        @endforeach




    @foreach($coauthoredbooks as $coauthoredbook)

        @if($coauthoredbook->title !== $book->title && count($coauthoredbook->authors) > 1)
            @php
                $count=0;
            @endphp
            @if($count == 0)
                <h2> {{$book->authors[0]->name}} has also co-authored:</h2>
                <ul>
            @endif

            <li><a href="{{ url('books', [$coauthoredbook->title_slug]) }}">{{$coauthoredbook->title}}</a></li>

                @if(count($coauthoredbook->authors) > 0 )

                    co-authored with
                    @foreach($coauthoredbook->authors as $thisauthor)
                        @if($thisauthor->name != $book->authors[0]->name)
                            <a href="{{ url('authors', [$thisauthor->name_slug]) }}">{{ $thisauthor->name }}</a>
                        @endif
                    @endforeach
                @endif

                @if(count($coauthoredbook->recommenders) > 0)
                    <br>
                    Recommended by
                    @php
                        $count=0 ;
                    @endphp
                    @foreach($coauthoredbook->recommenders as $thisrecommender)
                        @if($count > 0)
                            ,
                        @endif
                        <a href="{{ url('recommenders', [$thisrecommender->name_slug]) }}">{{ $thisrecommender->name }}</a>
                        @php
                            $count++ ;
                        @endphp
                    @endforeach
                @endif
                </ul>
            @endif

    @endforeach

    @endsection