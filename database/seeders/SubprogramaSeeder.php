<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SubprogramaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('subprogramas')->insert([
            [
                'programa_id' => 1,
                'numero' => '01',
                'nombre' => 'Impartición de Justicia Electoral, Laboral y Administrativa',
            ],
            [
                'programa_id' => 1,
                'numero' => '02',
                'nombre' => 'Apoyo al Funcionamiento Técnico Jurídico del Pleno',
            ],
            [
                'programa_id' => 1,
                'numero' => '03',
                'nombre' => 'Controversias Laborales y Administrativas',
            ],
            [
                'programa_id' => 2,
                'numero' => '04',
                'nombre' => 'Imagen Institucional',
            ],
            [
                'programa_id' => 2,
                'numero' => '05',
                'nombre' => 'Relación y Cooperación Institucional',
            ],
            [
                'programa_id' => 2,
                'numero' => '06',
                'nombre' => 'Documentación y Servicios Bibliotecarios',
            ],
            [
                'programa_id' => 3,
                'numero' => '07',
                'nombre' => 'Gestión y Modernización Administrativa',
            ],
            [
                'programa_id' => 3,
                'numero' => '08',
                'nombre' => 'Servicios Jurídicos',
            ],
            [
                'programa_id' => 3,
                'numero' => '09',
                'nombre' => 'Creación, Revisión y Actualización de Normatividad',
            ],
            [
                'programa_id' => 4,
                'numero' => '10',
                'nombre' => 'Estandarización de la Infraestructura de Tecnologías de la Información y Comunicaciones',
            ],
            [
                'programa_id' => 4,
                'numero' => '11',
                'nombre' => 'Prestación de Servicios Informáticos',
            ],
            [
                'programa_id' => 4,
                'numero' => '12',
                'nombre' => 'Implantación de Sistemas',
            ],
            [
                'programa_id' => 5,
                'numero' => '13',
                'nombre' => 'Transparencia y Acceso a la Información Pública',
            ],
            [
                'programa_id' => 6,
                'numero' => '14',
                'nombre' => 'Sistema Institucional de Archivos',
            ],
            [
                'programa_id' => 6,
                'numero' => '15',
                'nombre' => 'Auditoría',
            ],
            [
                'programa_id' => 6,
                'numero' => '16',
                'nombre' => 'Seguimiento y Evaluación',
            ],
            [
                'programa_id' => 6,
                'numero' => '17',
                'nombre' => 'Responsabilidades',
            ],
            [
                'programa_id' => 7,
                'numero' => '18',
                'nombre' => 'Capacitación',
            ],
            [
                'programa_id' => 7,
                'numero' => '19',
                'nombre' => 'Investigación',
            ],
        ]);
    }
}
