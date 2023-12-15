<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Version extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'versiones';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'contrato_ejercicio_id',
        'version',
        'importe',
        'seleccionado',
        'aprobado'
    ];
}
