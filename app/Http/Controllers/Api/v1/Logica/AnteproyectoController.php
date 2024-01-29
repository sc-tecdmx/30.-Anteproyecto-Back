<?php

namespace App\Http\Controllers\Api\v1\Logica;

use App\Exports\ContratosEjecucion;
use App\Http\Controllers\Controller;
use App\Models\Contrato;
use App\Models\ContratoEjecucion;
use App\Models\Proyecto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;

class AnteproyectoController extends Controller
{
    public function index()
    {
        $projects = Proyecto::with('contratos', 'subprogramas', 'responsablesOperativos', 'subprogramas.programas', 'responsablesOperativos.urgs')->get();

        $projects->each(function ($project) {
            $project->total_costo_contratos = $project->contratos->sum('costo_total');
        });
        // $agreements = Contrato::with('proyectos', 'proyectos.subprogramas', 'proyectos.responsablesOperativos', 'proyectos.subprogramas.programas', 'proyectos.responsablesOperativos.urgs')->get();

        return response()->json($projects, Response::HTTP_OK);
    }

    public function contratos($id)
    {
        $agreements = Contrato::whereHas('proyectos', function ($query) use ($id) {
            $query->where('proyecto_id', $id);
        })->get();

        return response()->json($agreements, Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $request->validate([
            'contrato_id' => 'required',
            'mes_id' => 'required',
            'costo' => 'required'
        ]);

        $execution = new ContratoEjecucion();
        $execution->fill($request->all());
        $execution->save();

        return response()->json($execution, Response::HTTP_OK);
    }

    private function getMonthlySums($contractId)
    {
        return DB::table('contratos_ejecucion')
            ->where('contrato_ejercicio_id', $contractId)
            ->pluck('costo', 'mes_id')
            ->toArray();
    }

    public function export(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        if (count($responsablesOperativos) == 0) {
            $result = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                //->join('versiones', 'versiones.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('contrato_partida', 'contrato_partida.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('partidas', 'partidas.id', '=', 'contrato_partida.partida_id')
                ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                ->select(
                    'contrato_ejercicio.id',
                    'contratos.clave',
                    'contratos.tipo',
                    'contratos.parcialidad',
                    'contratos.descripcion',
                    'conceptos.numero as concepto',
                    'contrato_ejercicio.importe',
                    'partidas.numero as partida',
                )
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->where('contrato_ejercicio.escenario', $scenario)
                ->get();
        } else {
            $result = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                //->join('versiones', 'versiones.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('contrato_partida', 'contrato_partida.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('partidas', 'partidas.id', '=', 'contrato_partida.partida_id')
                ->select(
                    'contrato_ejercicio.id',
                    'contratos.clave',
                    'contrato_ejercicio.importe',
                    'partidas.numero as partida'
                )
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->where('contrato_ejercicio.escenario', $scenario)
                ->whereIn(DB::raw('SUBSTRING(contratos.clave, 3, 2)'), $responsablesOperativos)
                ->get();
        }

        $formattedResult = $result->map(function ($exec) {
            $monthlySums = $this->getMonthlySums($exec->id);
            
            return [
                'clave' => $exec->clave,
                'partida' => $exec->partida,
                'importe' => $exec->importe,
                'tipo' => $exec->tipo,
                'parcialidad' => $exec->parcialidad,
                'descripcion' => $exec->descripcion,
                'concepto' => $exec->concepto,
                'ene' => $monthlySums[1] ?? 0,
                'feb' => $monthlySums[2] ?? 0,
                'mar' => $monthlySums[3] ?? 0,
                'abr' => $monthlySums[4] ?? 0,
                'may' => $monthlySums[5] ?? 0,
                'jun' => $monthlySums[6] ?? 0,
                'jul' => $monthlySums[7] ?? 0,
                'ago' => $monthlySums[8] ?? 0,
                'sep' => $monthlySums[9] ?? 0,
                'oct' => $monthlySums[10] ?? 0,
                'nov' => $monthlySums[11] ?? 0,
                'dic' => $monthlySums[12] ?? 0,
            ];
        });

        // return response()->json($formattedResult, Response::HTTP_OK);

        $exporter = new ContratosEjecucion($formattedResult->toArray());

        return $exporter->download("contratos.xlsx");
    }
}
