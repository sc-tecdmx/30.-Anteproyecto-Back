<?php

namespace App\Imports;

use App\Models\Contrato;
use App\Models\ContratoEjecucion;
use App\Models\ContratoEjercicioProyecto;
use App\Models\Partida;
use App\Models\Proyecto;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Illuminate\Support\Facades\DB;

class AgreementImport implements ToModel, WithHeadingRow, WithValidation
{
    protected $exercise;
    protected $scenario;

    public function __construct($exercise, $scenario)
    {
        $this->exercise = $exercise;
        $this->scenario = $scenario;
    }

    function nombre_del_mes($numero_mes) {
        $meses = [
            1 => 'enero',
            2 => 'febrero',
            3 => 'marzo',
            4 => 'abril',
            5 => 'mayo',
            6 => 'junio',
            7 => 'julio',
            8 => 'agosto',
            9 => 'septiembre',
            10 => 'octubre',
            11 => 'noviembre',
            12 => 'diciembre',
        ];
    
        return $meses[$numero_mes] ?? null;
    }

    public function model(array $row)
    {
        $agreement = Contrato::create([
            'descripcion' => $row['descripcion'],
            'parcialidad' => $row['parcialidad'],
            'tipo' => $row['tipo']
        ]);

        $clave = $row['clave'];

        $project = Proyecto::join('ejercicio_proyecto', 'ejercicio_proyecto.proyecto_id', '=', 'proyectos.id')
            ->join('ejercicios', 'ejercicios.id', '=', 'ejercicio_proyecto.ejercicio_id')
            ->join('subprogramas', 'subprogramas.id', '=', 'proyectos.subprograma_id')
            ->join('programas', 'programas.id', '=', 'subprogramas.programa_id')
            ->join('responsables_operativos', 'responsables_operativos.id', '=', 'proyectos.responsable_operativo_id')
            ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.id', '=', 'responsables_operativos.unidad_responsable_gasto_id')
            ->select(DB::raw("
                CONCAT(
                    unidades_responsables_gastos.numero,
                    responsables_operativos.numero,
                    programas.numero,
                    subprogramas.numero,
                    proyectos.numero
                ) AS clave,
                ejercicio_proyecto.id
            "))
            ->where('ejercicio_proyecto.ejercicio_id', $this->exercise)
            ->whereRaw("CONCAT(unidades_responsables_gastos.numero, responsables_operativos.numero, programas.numero, subprogramas.numero, proyectos.numero) = '$clave'")
            ->first();
        
        if(!$project) {
            dd($clave);
        }

        $split = Partida::where('numero', $row['partida'])->first();

        $agreementExercise = ContratoEjercicioProyecto::create([
            'ejercicio_proyecto_id' => $project->id,
            'contrato_id' => $agreement->id,
            'partida_id' => $split->id,
            'importe' => $row['importe'],
            'escenario' => $this->scenario,
            'cerrado' => 0,
            'seleccionado' => 0
        ]);

        for ($mes = 1; $mes <= 12; $mes++) {
            ContratoEjecucion::create([
                'contrato_ejercicio_proyecto_id' => $agreementExercise->id,
                'mes_id' => $mes,
                'costo' => $row[$this->nombre_del_mes($mes)],
            ]);
        }

        return $agreement;
    }

    public function rules(): array
    {
        return [
            'clave' => 'required',
            'descripcion' => 'required',
            'parcialidad' => 'required',
            'tipo' => 'required',
            'importe' => 'required',
            'partida' => 'required',
            'enero' => '',
            'febrero' => '',
            'marzo' => '',
            'abril' => '',
            'mayo' => '',
            'junio' => '',
            'julio' => '',
            'agosto' => '',
            'septiembre' => '',
            'octubre' => '',
            'noviembre' => '',
            'diciembre' => ''
        ];
    }
}
