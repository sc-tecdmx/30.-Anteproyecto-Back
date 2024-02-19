<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProgramaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('programas')->insert([
            [
                'numero' => '01',
                'nombre' => 'Impartición de Justicia',
            ],
            [
                'numero' => '02',
                'nombre' => 'Promoción de la Imagen Institucional y la Cultura Democrática',
            ],
            [
                'numero' => '03',
                'nombre' => 'Incrementar la eficiencia administrativa',
            ],
            [
                'numero' => '04',
                'nombre' => 'Modernización Tecnológica',
            ],
            [
                'numero' => '05',
                'nombre' => 'Transparencia y Protección de Datos Personales',
            ],
            [
                'numero' => '06',
                'nombre' => 'Rendición de Cuentas',
            ],
            [
                'numero' => '07',
                'nombre' => 'Formación y Capacitación del Personal',
            ],
        ]);
    }
}
