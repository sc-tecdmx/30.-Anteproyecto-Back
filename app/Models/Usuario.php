<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Usuario extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /** @var string */
    protected $table = 'usuarios';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'nombre',
        'apellido_paterno',
        'apellido_materno',
        'genero',
        'usuario',
        'email',
        'password',
        'foto',
        'rol_id',
        'area_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password'
    ];

    public function roles()
    {
        return $this->belongsToMany(Rol::class);
    }

    public function areas()
    {
        return $this->belongsToMany(Area::class);
    }

    public function responsablesOperativos()
    {
        return $this->belongsToMany(ResponsableOperativo::class);
    }
}
