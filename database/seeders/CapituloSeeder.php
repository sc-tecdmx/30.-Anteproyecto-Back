<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CapituloSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('capitulos')->insert([
            [
                'capitulo' => 1000,
                'descripcion' => 'Servicios personales',
            ],
            [
                'capitulo' => 2000,
                'descripcion' => 'Materiales y suministrso',
            ],
            [
                'capitulo' => 3000,
                'descripcion' => 'Servicios generales',
            ],
            [
                'capitulo' => 4000,
                'descripcion' => 'Transferencias, asignaciones, subsidios y otras ayudas',
            ],
            [
                'capitulo' => 5000,
                'descripcion' => 'Bienes muebles, inmuebles e intangibles',
            ],
            [
                'capitulo' => 6000,
                'descripcion' => 'Inversión pública',
            ],
            [
                'capitulo' => 7000,
                'descripcion' => 'Inversiones financieras y otras provisiones',
            ],
            [
                'capitulo' => 8000,
                'descripcion' => 'Participaciones y aportaciones',
            ],
            [
                'capitulo' => 9000,
                'descripcion' => 'Deuda pública',
            ],
        ]);
    }
}
