<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetalleContrato extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'detalles_contratos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'contrato_ejercicio_id',
        'cantidad',
        'costo_unitario',
        'unidad_medida_id'
    ];
}
