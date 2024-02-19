<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EjercicioProyecto extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'ejercicio_proyecto';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ejercicio_id',
        'proyecto_id'
    ];

    public function contratoEjercicioProyecto()
    {
        return $this->belongsto(ContratoEjercicioProyecto::class);
    }

    public function ejercicios()
    {
        return $this->belongsTo(Ejercicio::class);
    }
}
