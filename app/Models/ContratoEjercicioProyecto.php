<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContratoEjercicioProyecto extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'contrato_ejercicio_proyecto';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ejercicio_proyecto_id',
        'contrato_id',
        'partida_id',
        'importe',
        'escenario',
        'cerrado',
        'seleccionado'
    ];

    public function ejercicioProyecto()
    {
        return $this->belongsto(Ejercicio::class);
    }

    public function partidas()
    {
        return $this->belongsTo(Partida::class);
    }
}
