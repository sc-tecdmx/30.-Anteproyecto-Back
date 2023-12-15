<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ejercicio extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ejercicio',
        'permitir_edicion_seguimiento',
        'permitir_edicion_seguimiento_derechos_humanos',
        'permitir_edicion_elaboracion'
    ];
}
