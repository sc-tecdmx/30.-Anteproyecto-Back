<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UnidadMedidaAnteproyecto extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'unidades_medidas_anteproyecto';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'descripcion',
        'parent_id'
    ];
}
