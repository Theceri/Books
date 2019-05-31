@extends('layouts.app')

@section('title', $author->name)

@section('content')

<h1> {{$author->name}} </h1>

<p>{{$author->description}}</p>

<h2> Books by {{$author->name}} </h2>

<ul>
    @foreach($author->books as $book)

        @if(count($book->authors) == 1 )

        <li><a href="{{ url('books', [$book->id]) }}">{{$book->title}}</a>
            @if(count($book->recommenders) > 0)
                <br>
                Recommended by
                <a href="{{ url('recommenders', [$book->recommenders[0]->id]) }}">{{ $book->recommenders[0]->name }}</a>
            @endif
        </li>

        @endif

    @endforeach
</ul>

<h2> {{$author->name}} has also co-authored: </h2>

<ul>
    @foreach($author->books as $book)

        @if(count($book->authors) > 1 )

            <li><a href="{{ url('books', [$book->id]) }}">{{$book->title}}</a>
                @if(count($book->authors) > 0 )
                    <br>
                    co-authored with
                    @foreach($book->authors as $thisauthor)
                        @if($thisauthor->name != $author->name)
                            <a href="{{ url('authors', [$thisauthor->id]) }}">{{ $thisauthor->name }}</a>
                        @endif
                    @endforeach
                @endif

                @if(count($book->recommenders) > 0)
                    <br>
                    Recommended by
                    <a href="{{ url('recommenders', [$book->recommenders[0]->id]) }}">{{ $book->recommenders[0]->name }}</a>
                @endif
            </li>

        @endif

    @endforeach
</ul>

@endsection