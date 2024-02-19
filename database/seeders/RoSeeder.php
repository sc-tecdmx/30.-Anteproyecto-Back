<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('responsables_operativos')->insert([
            [
                'unidad_responsable_gasto_id' => 1,
                'numero' => '01',
                'nombre' => 'Ponencia del Magistrado Armando Ambriz Hernández',
            ],
            [
                'unidad_responsable_gasto_id' => 1,
                'numero' => '02',
                'nombre' => 'Ponencia del Magistrado Juan Carlos Sánchez León',
            ],
            [
                'unidad_responsable_gasto_id' => 1,
                'numero' => '03',
                'nombre' => 'Ponencia de la Magistrada Martha Leticia Mercado Ramírez',
            ],
            [
                'unidad_responsable_gasto_id' => 1,
                'numero' => '04',
                'nombre' => 'Ponencia del Magistratura VACANTE',
            ],
            [
                'unidad_responsable_gasto_id' => 1,
                'numero' => '05',
                'nombre' => 'Ponencia del Magistratura VACANTE 2',
            ],
            [
                'unidad_responsable_gasto_id' => 2,
                'numero' => '01',
                'nombre' => 'Magistrado (a) Presidente (a)',
            ],
            [
                'unidad_responsable_gasto_id' => 3,
                'numero' => '01',
                'nombre' => 'Secretario (a) General',
            ],
            [
                'unidad_responsable_gasto_id' => 3,
                'numero' => '02',
                'nombre' => 'Secretario (a) Técnico (a)',
            ],
            [
                'unidad_responsable_gasto_id' => 4,
                'numero' => '01',
                'nombre' => 'Secretario (a)  Administrativo (a)',
            ],
            [
                'unidad_responsable_gasto_id' => 4,
                'numero' => '02',
                'nombre' => 'Director (a) de Planeación y Recursos Financieros',
            ],
            [
                'unidad_responsable_gasto_id' => 4,
                'numero' => '03',
                'nombre' => 'Director (a) de Recursos Humanos',
            ],
            [
                'unidad_responsable_gasto_id' => 4,
                'numero' => '04',
                'nombre' => 'Director (a) de Recursos Materiales y Servicios Generales',
            ],
            [
                'unidad_responsable_gasto_id' => 5,
                'numero' => '01',
                'nombre' => 'Contralor (a) Interno (a)',
            ],
            [
                'unidad_responsable_gasto_id' => 5,
                'numero' => '02',
                'nombre' => 'Director (a) de Responsabilidades y Atención a Quejas',
            ],
            [
                'unidad_responsable_gasto_id' => 5,
                'numero' => '03',
                'nombre' => 'Director (a) de Auditoría, Control y Evaluación',
            ],
            [
                'unidad_responsable_gasto_id' => 6,
                'numero' => '01',
                'nombre' => 'Director (a) General Jurídico (a)',
            ],
            [
                'unidad_responsable_gasto_id' => 6,
                'numero' => '02',
                'nombre' => 'Subdirector (a) de lo Contencioso y Consultivo',
            ],
            [
                'unidad_responsable_gasto_id' => 6,
                'numero' => '03',
                'nombre' => 'Subdirector (a) de Contratos y Normatividad',
            ],
            [
                'unidad_responsable_gasto_id' => 6,
                'numero' => '04',
                'nombre' => 'Encargado (a) del Despacho de la Dirección General Jurídica',
            ],
            [
                'unidad_responsable_gasto_id' => 7,
                'numero' => '01',
                'nombre' => 'Coordinador (a) de Comunicación Social y Relaciones Públicas',
            ],
            [
                'unidad_responsable_gasto_id' => 8,
                'numero' => '01',
                'nombre' => 'Director (a) de la Coordinación de Transparencia y Datos Personales',
            ],
            [
                'unidad_responsable_gasto_id' => 9,
                'numero' => '01',
                'nombre' => 'Director (a) del Instituto de Formación y Capacitación',
            ],
            [
                'unidad_responsable_gasto_id' => 10,
                'numero' => '01',
                'nombre' => 'Encargado de Despacho de la Secretaría Técnica de la Comisión de Controversias Laborales y Administrativas',
            ],
            [
                'unidad_responsable_gasto_id' => 11,
                'numero' => '01',
                'nombre' => 'Director (a) de la Unidad de Servicios Informáticos',
            ],
            [
                'unidad_responsable_gasto_id' => 12,
                'numero' => '01',
                'nombre' => 'Director (a) de la Unidad de Estadística y Jurisprudencia',
            ],
            [
                'unidad_responsable_gasto_id' => 13,
                'numero' => '01',
                'nombre' => 'Coordinador/a de Difusión y Publicación',
            ],
            [
                'unidad_responsable_gasto_id' => 14,
                'numero' => '01',
                'nombre' => 'Coordinador (a) de Archivo',
            ],
            [
                'unidad_responsable_gasto_id' => 15,
                'numero' => '01',
                'nombre' => 'Coordinador (a) de Derechos Humanos y Género',
            ],
            [
                'unidad_responsable_gasto_id' => 16,
                'numero' => '01',
                'nombre' => 'Defensor(a) Ciudadano(a)',
            ],
            [
                'unidad_responsable_gasto_id' => 17,
                'numero' => '01',
                'nombre' => 'Coordinador(a) de Vinculación y Relaciones Internacionales',
            ],
            [
                'unidad_responsable_gasto_id' => 18,
                'numero' => '01',
                'nombre' => 'Director(a) de la Unidad Especializada de Procedimientos Sancionadores',
            ],
        ]);
    }
}
