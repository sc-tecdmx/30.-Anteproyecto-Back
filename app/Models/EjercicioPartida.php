<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EjercicioPartida extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'ejercicio_partida';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ejercicio_id',
        'partida_id'
    ];
}
