<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Capitulo extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'capitulo',
        'descripcion'
    ];

    public function partidas() {
        return $this->hasMany(CapituloPartida::class, 'capitulo_id');
    }

    public function conceptos() {
        return $this->hasMany(Concepto::class);
    }
}
