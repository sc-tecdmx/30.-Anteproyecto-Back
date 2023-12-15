<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ConceptoUnidadMedida extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'concepto_unidad_medida';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'concepto_id',
        'unidad_medida_id'
    ];
}
