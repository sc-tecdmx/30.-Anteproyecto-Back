<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ConceptoPartidaCapitulo extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'concepto_partida_capitulo';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'concepto_id',
        'partida_capitulo_id'
    ];
}
