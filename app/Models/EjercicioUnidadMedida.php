<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EjercicioUnidadMedida extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'ejercicio_unidad_medida';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ejercicio_id',
        'unidad_medida_id'
    ];
}
