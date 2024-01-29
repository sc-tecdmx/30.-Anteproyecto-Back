<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContratoEjercicio extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'contrato_ejercicio';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ejercicio_id',
        'contrato_id',
        'importe',
        'escenario',
        'cerrado',
        'seleccionado'
    ];

    public function ejercicio()
    {
        return $this->belongsto(Ejercicio::class);
    }

    public function partidas()
    {
        return $this->belongsTo(Partida::class);
    }
}
