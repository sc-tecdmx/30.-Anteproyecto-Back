<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('usuarios')->insert([
            [
                'nombre' => 'Admin',
                'apellido_paterno' => 'Admin',
                'apellido_materno' => 'Admin',
                'genero' => 'Hombre',
                'usuario' => 'admin',
                'password' => '$2y$10$0lbt.LxzVxTF54c0Oww4COo8x/G.ofFLtdqRl3aC0hDNAxTvfyc9e',
                'email' => 'admin@tecdmx.org.mx',
                'foto' => '',
                'area_id' => 24,
                'rol_id' => 1,
            ],
            [
                'nombre' => 'Miguel',
                'apellido_paterno' => 'Federico',
                'apellido_materno' => 'Gutierrez',
                'genero' => 'Hombre',
                'usuario' => 'miguel.gutierres',
                'password' => '$2y$10$0lbt.LxzVxTF54c0Oww4COo8x/G.ofFLtdqRl3aC0hDNAxTvfyc9e',
                'email' => 'miguel.gutierrez@tecdmx.org.mx',
                'foto' => '',
                'area_id' => 18,
                'rol_id' => 3,
            ],
            [
                'nombre' => 'Fernando',
                'apellido_paterno' => 'Cortes',
                'apellido_materno' => 'Figueroa',
                'genero' => 'Hombre',
                'usuario' => 'fernando.cortes',
                'password' => '$2y$10$0lbt.LxzVxTF54c0Oww4COo8x/G.ofFLtdqRl3aC0hDNAxTvfyc9e',
                'email' => 'fernando.cortes@tecdmx.org.mx',
                'foto' => '',
                'area_id' => 18,
                'rol_id' => 2,
            ],
            [
                'nombre' => 'Rene',
                'apellido_paterno' => 'Navarrete',
                'apellido_materno' => 'Tenco',
                'genero' => 'Hombre',
                'usuario' => 'rene.navarrete',
                'password' => '$2y$10$0lbt.LxzVxTF54c0Oww4COo8x/G.ofFLtdqRl3aC0hDNAxTvfyc9e',
                'email' => 'rene.navarrete@tecdmx.org.mx',
                'foto' => '',
                'area_id' => 24,
                'rol_id' => 4,
            ],
        ]);
    }
}
