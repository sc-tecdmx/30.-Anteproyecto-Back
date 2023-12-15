<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PartidaCapitulo extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'partidas_capitulos';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'partida_id',
        'capitulo_id',
        'numero',
        'descripcion'
    ];

    public function capitulos() {
        return $this->belongsTo(Capitulo::class);
    }
}
