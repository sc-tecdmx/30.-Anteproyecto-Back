<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContratoPartida extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'contrato_partida';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'contrato_ejercicio_id',
        'partida_id'
    ];
}
