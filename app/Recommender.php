<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Recommender extends Model
{
    //
    public function books()
    {
        return $this->belongsToMany('App\Book');
    }

}
