<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AreaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('areas')->insert([
            [ // 1
                'nombre' => 'Comisión Controversias Laborales y Administrativas',
                'descripcion' => 'Comisión de Controversias Laborales y Administrativas',
            ],
            [ // 2
                'nombre' => 'Contraloría Interna',
                'descripcion' => 'Contraloría Interna',
            ],
            [ // 3
                'nombre' => 'Coordinación de Archivo',
                'descripcion' => 'Coordinación de Archivo',
            ],
            [ // 4
                'nombre' => 'Coordinación de Comun. Soc. y  Relaciones Públicas',
                'descripcion' => 'Coordinación de Comun. Soc. y  Relaciones Públicas',
            ],
            [ // 5
                'nombre' => 'Coordinación de Difusión y Publicación',
                'descripcion' => 'Coordinación de Difusión y Publicación',
            ],
            [ // 6
                'nombre' => 'Coordinación de Transparencia y Datos Personales',
                'descripcion' => 'Coordinación de Transparencia y Datos Personales',
            ],
            [ // 7
                'nombre' => 'Coordinación de Vinculación y Relaciones Intern.',
                'descripcion' => 'Coordinación de Vinculación y Relaciones Intern.',
            ],
            [ // 8
                'nombre' => 'Defensoría Pública Ciudadana de Procesos Democráticos',
                'descripcion' => 'Defensoría Pública Ciudadana de Procesos Democráticos',
            ],
            [ // 9
                'nombre' => 'Dirección General Jurídica',
                'descripcion' => 'Dirección General Jurídica',
            ],
            [ // 10
                'nombre' => 'Instituto de Formación y Capacitación',
                'descripcion' => 'Instituto de Formación y Capacitación',
            ],
            [ // 11
                'nombre' => 'Pleno del Tribunal',
                'descripcion' => 'Pleno del Tribunal',
            ],
            [ // 12
                'nombre' => 'Ponencia de la Magistrada Martha L Mercado Ramírez',
                'descripcion' => 'Ponencia de la Magistrada Martha L Mercado Ramírez',
            ],
            [ // 13
                'nombre' => 'Ponencia del Magistrado Armando Ambriz Hernández',
                'descripcion' => 'Ponencia del Magistrado Armando Ambriz Hernández',
            ],
            [ // 14
                'nombre' => 'Ponencia del Magistrado Juan Carlos Sánchez León',
                'descripcion' => 'Ponencia del Magistrado Juan Carlos Sánchez León',
            ],
            [ // 15
                'nombre' => 'Ponencia Vacante A',
                'descripcion' => 'Ponencia de Magistratura Electoral Vacante',
            ],
            [ // 16
                'nombre' => 'Ponencia Vacante B',
                'descripcion' => 'Ponencia de Magistratura Electoral Vacante',
            ],
            [ // 17
                'nombre' => 'Presidencia',
                'descripcion' => 'Presidencia',
            ],
            [ // 18
                'nombre' => 'S.A. Dirección de Planeación y Recursos Financieros',
                'descripcion' => 'Secretaría Administrativa DRF',
            ],
            [ // 19
                'nombre' => 'S.A. Dirección de Recursos Humanos',
                'descripcion' => 'Secretaría Administrativa DRH',
            ],
            [ // 20
                'nombre' => 'S.A. Dirección de Recursos Mat. y Serv. General',
                'descripcion' => 'Secretaría Administrativa RMSG',
            ],
            [ // 21
                'nombre' => 'Secretaría Administrativa',
                'descripcion' => 'Secretaría Administrativa',
            ],
            [ // 22
                'nombre' => 'Secretaría General',
                'descripcion' => 'Secretaría General',
            ],
            [ // 23
                'nombre' => 'Unidad de Estadística y Jurisprudencia',
                'descripcion' => 'Unidad de Estadística y Jurisprudencia',
            ],
            [ // 24
                'nombre' => 'Unidad de Servicios Informáticos',
                'descripcion' => 'Unidad de Servicios Informáticos',
            ],
            [ // 25
                'nombre' => 'Unidad Especializada de Procedimientos Sancionadores',
                'descripcion' => 'Unidad Especializada de Procedimientos Sancionadores',
            ],
            [ // 26
                'nombre' => 'Coordinación de Derechos Humanos y Género',
                'descripcion' => 'Coordinación de Derechos Humanos y Género',
            ],
        ]);
    }
}
