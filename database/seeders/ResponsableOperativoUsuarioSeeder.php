<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ResponsableOperativoUsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('responsable_operativo_usuario')->insert([
            [
                'usuario_id' => 4,
                'responsable_operativo_id' => 23,
            ]
        ]);
    }
}
