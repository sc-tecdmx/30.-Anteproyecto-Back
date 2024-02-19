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

    public function rol()
    {
        return $this->belongsTo(Rol::class);
    }

    public function area()
    {
        return $this->belongsTo(Area::class);
    }

    public function responsablesOperativos()
    {
        return $this->belongsToMany(ResponsableOperativo::class, 'responsable_operativo_usuario', 'usuario_id', 'responsable_operativo_id');
    }
}
