<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Concepto extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'capitulo_id',
        'descripcion',
        'numero'
    ];

    public function capitulo()
    {
        return $this->belongsTo(Capitulo::class);
    }

    public function partidas()
    {
        return $this->hasMany(Partida::class);
    }
}
