@extends('layouts.app')

@section('title', $book->title)

@section('content')

<h1> {{$book->title}} </h1>

<h2>By: <a href="{{ url('authors', [$book->authors[0]->id]) }}"> {{$book->authors[0]->name}} </a> </h2>

<p> {{$book->description}} </p>

<h2>Recommended by:</h2>

<p> {{$book->title}} is recommended by these great people: </p>

<ul>
    @foreach($book->recommenders as $recommender)

                <li><a href="{{ url('recommenders', [$recommender->id]) }}">{{$recommender->name}}</a></li>

    @endforeach
</ul>

<h2>More books by {{$book->authors[0]->name}} </h2>
<ul>
    @foreach($coauthoredbooks as $coauthoredbook)

        @if($coauthoredbook->title !== $book->title && count($coauthoredbook->authors) == 1)

            <li><a href="{{ url('books', [$coauthoredbook->id]) }}">{{$coauthoredbook->title}}</a></li>
            @if(count($coauthoredbook->recommenders) > 0)
                Recommended by
                @php
                    $count=0 ;
                @endphp
                @foreach($coauthoredbook->recommenders as $thisrecommender)
                    @if($count > 0)
                        ,
                    @endif
                    <a href="{{ url('recommenders', [$thisrecommender->id]) }}">{{ $thisrecommender->name }}</a>
                    @php
                        $count++ ;
                    @endphp
                @endforeach
            @endif

        @endif

    @endforeach
</ul>

<h2>{{$book->authors[0]->name}} has also co-authored:</h2>
<ul>
    @foreach($coauthoredbooks as $coauthoredbook)

        @if($coauthoredbook->title !== $book->title && count($coauthoredbook->authors) > 1)

            <li><a href="{{ url('books', [$coauthoredbook->id]) }}">{{$coauthoredbook->title}}</a></li>

                    @if(count($coauthoredbook->authors) > 0 )

                        co-authored with
                        @foreach($coauthoredbook->authors as $thisauthor)
                            @if($thisauthor->name != $book->authors[0]->name)
                                <a href="{{ url('authors', [$thisauthor->id]) }}">{{ $thisauthor->name }}</a>
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
                            <a href="{{ url('recommenders', [$thisrecommender->id]) }}">{{ $thisrecommender->name }}</a>
                            @php
                                $count++ ;
                            @endphp
                        @endforeach
                    @endif

            @endif

    @endforeach
</ul>

    @endsection