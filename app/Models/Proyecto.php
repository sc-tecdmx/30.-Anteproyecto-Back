<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Proyecto extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'numero',
        'nombre',
        'tipo',
        'version',
        'objetivo',
        'justificacion',
        'descripcion',
        'fecha',
        'nombre_responsable_operativo',
        'cargo_responsable_operativo',
        'nombre_titular',
        'responsable_ficha',
        'autorizado por',
        'status'
    ];

    public function subprogramas() {
        return $this->belongsToMany(Subprograma::class);
    }

    public function responsablesOperativos() {
        return $this->belongsToMany(ResponsableOperativo::class);
    }

    public function contratos() {
        return $this->belongsToMany(Contrato::class);
    }
}
