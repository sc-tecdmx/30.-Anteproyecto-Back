<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResponsableOperativoUsuario extends Model
{
    use HasFactory;

    /** @var string */
    protected $table = 'responsable_operativo_usuario';

    public function responsablesOperativos()
    {
        return $this->belongsToMany(ResponsableOperativo::class);
    }

    public function Usuarios()
    {
        return $this->belongsToMany(Usuario::class);
    }
}
