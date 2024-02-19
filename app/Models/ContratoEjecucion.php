<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ContratoEjecucion extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'contrato_ejecucion';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'contrato_ejercicio_proyecto_id',
        'mes_id',
        'costo'
    ];

    public function mes()
    {
        return $this->belongsTo(Mes::class);
    }
}
