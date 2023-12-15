<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class ResponsableOperativo extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'responsables_operativos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'unidad_responsable_gasto_id',
        'numero',
        'nombre'
    ];

    public function proyectos() {
        return $this->belongsToMany(Proyecto::class);
    }

    public function urgs() {
        return $this->belongsToMany(UnidadResponsableGasto::class);
    }
}
