<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UrgSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('unidades_responsables_gastos')->insert([
            [
                'numero' => '01',
                'nombre' => 'Pleno',
            ],
            [
                'numero' => '02',
                'nombre' => 'Presidencia',
            ],
            [
                'numero' => '03',
                'nombre' => 'Secretaría General',
            ],
            [
                'numero' => '04',
                'nombre' => 'Secretaría Administrativa',
            ],
            [
                'numero' => '05',
                'nombre' => 'Contraloría Interna',
            ],
            [
                'numero' => '06',
                'nombre' => 'Dirección General Jurídica',
            ],
            [
                'numero' => '07',
                'nombre' => 'Coordinación de Comunicación Social y Relaciones Públicas',
            ],
            [
                'numero' => '08',
                'nombre' => 'Coordinación de Transparencia y Datos Personales',
            ],
            [
                'numero' => '09',
                'nombre' => 'Instituto de Formación y Capacitación',
            ],
            [
                'numero' => '10',
                'nombre' => 'Comisión de Controversias Laborales y Administrativas',
            ],
            [
                'numero' => '11',
                'nombre' => 'Unidad de Servicios Informáticos',
            ],
            [
                'numero' => '12',
                'nombre' => 'Unidad de Estadística y Jurisprudencia',
            ],
            [
                'numero' => '13',
                'nombre' => 'Coordinación de Difusión y Publicación',
            ],
            [
                'numero' => '14',
                'nombre' => 'Coordinación de Archivo',
            ],
            [
                'numero' => '15',
                'nombre' => 'Coordinación de Derechos Humanos y Género',
            ],
            [
                'numero' => '16',
                'nombre' => 'Defensoria Publica de Participación Ciudadana de Proceso Democraticos',
            ],
            [
                'numero' => '17',
                'nombre' => 'Coordinación de Vinculación y Relaciones Internacionales',
            ],
            [
                'numero' => '18',
                'nombre' => 'Unidad Especializada de Procedimientos Sancionadores',
            ]
        ]);
    }
}
