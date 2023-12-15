<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UnidadResponsableGasto extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'unidades_responsables_gastos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'numero',
        'nombre'
    ];

    public function responsablesOperativos() {
        return $this->belongsToMany(ResponsableOperativo::class);
    }
}
