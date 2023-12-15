<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subprograma extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'programa_id',
        'numero',
        'nombre'
    ];

    public function proyectos() {
        return $this->belongsToMany(Proyectos::class);
    }

    public function programas() {
        return $this->belongsToMany(Programa::class);
    }
}
