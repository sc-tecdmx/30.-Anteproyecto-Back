<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Partida extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'concepto_id',
        'descripcion',
        'numero'
    ];

    public function concepto()
    {
        return $this->belongsTo(Concepto::class);
    }

    public function contratos()
    {
        return $this->belongsToMany(Contrato::class);
    }
}
