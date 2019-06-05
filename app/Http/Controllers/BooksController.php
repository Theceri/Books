<?php

namespace App\Http\Controllers;

use App\Book;
use App\Author;
use App\Recommender;
use Illuminate\Http\Request;

class BooksController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //

        return view('books/index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        //
        $book = Book::where('title_slug', $slug)->first();
        //$book->authors;
//        dd($book);
        $coauthoredbooks = Book::findOrFail($book->authors[0]->id)->get();
//        dd($coauthoredbooks);
//      //$book->authors[0]->id means that we look for the book with the particular id ($book), then use the many to many relationship to retrieve the first author (authors[0]) where 'authors' is the relation method in the book function, and then we finally get the id of that first author. The whole statement therefore means we use get() to get all the books of that first author
//        dd($coauthored);
        return view('books.show', compact('book', 'author', 'recommender', 'coauthoredbooks'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
