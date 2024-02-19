<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Models\Capitulo;
use App\Models\Concepto;
use App\Models\Contrato;
use App\Models\Mes;
use App\Models\Programa;
use App\Models\Proyecto;
use App\Models\UnidadResponsableGasto;
use App\Models\ContratoEjercicio;
use App\Models\ContratoEjercicioProyecto;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_NO_CONTENT);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        $budget = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
            ->join('ejercicio_proyecto', 'contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->join('proyectos', 'ejercicio_proyecto.proyecto_id','=','proyectos.id')
            ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', $scenario);
        
        $projects = Proyecto::join('ejercicio_proyecto', 'proyectos.id', '=', 'ejercicio_proyecto.proyecto_id')
            ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise);

        $urgs = Proyecto::join('ejercicio_proyecto', 'proyectos.id', '=', 'ejercicio_proyecto.proyecto_id')
            ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
            ->join('unidades_responsables_gastos', 'responsables_operativos.unidad_responsable_gasto_id', '=', 'unidades_responsables_gastos.id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise);

        if (count($responsablesOperativos) > 0) {
            $budget->whereIn('responsables_operativos.id', $responsablesOperativos);
            $projects->whereIn('responsables_operativos.id', $responsablesOperativos);
            $urgs->whereIn('responsables_operativos.id', $responsablesOperativos);
        }
        
        $budget = $budget->sum('contrato_ejercicio_proyecto.importe');
        $projects = $projects->count();
        $urgs = $urgs->distinct('unidades_responsables_gastos.id')->count('unidades_responsables_gastos.id');
        $concepts = Concepto::count();

        $result = [
            [
                "title" => "Costo Total",
                "value" => $budget,
                "iconClass" => "fa-solid fa-dollar-sign",
                "iconBackground" => "bg-primary",
            ],
            [
                "title" => "Proyectos",
                "value" => $projects,
                "iconClass" => "fa-solid fa-list-check",
                "iconBackground" => "bg-info",
            ],
            [
                "title" => "URG",
                "value" => $urgs,
                "iconClass" => "fa-solid fa-book",
                "iconBackground" => "bg-dark",
            ],
            [
                "title" => "Conceptos",
                "value" => $concepts,
                "iconClass" => "fa-solid fa-chart-simple",
                "iconBackground" => "bg-warning",
            ]
        ];

        return response()->json($result, Response::HTTP_OK);
    }

    /**
     * Clave
     * URG  RO  PG  SP  PY
     */
    public function urgCost(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $urgs = UnidadResponsableGasto::get();

        // $sumaTotalPorUnidad = [];
        $data = [];

        foreach ($urgs as $urg) {
            $total = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id','=','contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->join('proyectos', 'ejercicio_proyecto.proyecto_id','=','proyectos.id')
                ->join('responsables_operativos','proyectos.responsable_operativo_id','=','responsables_operativos.id')
                ->join('unidades_responsables_gastos','responsables_operativos.unidad_responsable_gasto_id','=','unidades_responsables_gastos.id')
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('unidades_responsables_gastos.id', $urg->numero)
                ->sum('contrato_ejercicio_proyecto.importe');

            $agreements = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id','=','contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->join('proyectos', 'ejercicio_proyecto.proyecto_id','=','proyectos.id')
                ->join('responsables_operativos','proyectos.responsable_operativo_id','=','responsables_operativos.id')
                ->join('unidades_responsables_gastos','responsables_operativos.unidad_responsable_gasto_id','=','unidades_responsables_gastos.id')
                ->where('unidades_responsables_gastos.id',$urg->id)
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('contrato_ejercicio_proyecto.cerrado', 1)
                ->get();

            if (!$agreements->isEmpty()) {
                $data[] = [
                    'id' => $urg->id,
                    'numero' => $urg->numero,
                    'nombre' => $urg->nombre,
                    'total' => $total,
                    'cerrado' => 1
                ];
            } else {
                $data[] = [
                    'id' => $urg->id,
                    'numero' => $urg->numero,
                    'nombre' => $urg->nombre,
                    'total' => $total,
                    'cerrado' => 0
                ];
            }
        }

        return response()->json($data, Response::HTTP_OK);
    }

    public function monthCost(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_NO_CONTENT);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $months = Mes::get();

        $totalSumPerMonths = [];

        foreach ($months as $month) {
            $total = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->join('contrato_ejecucion', 'contrato_ejercicio_proyecto.id', '=', 'contrato_ejecucion.contrato_ejercicio_proyecto_id')
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('contrato_ejecucion.mes_id', $month->id)
                ->sum('contrato_ejecucion.costo');

            $totalSumPerMonths[$month->descripcion] = $total;
        }

        return response()->json($totalSumPerMonths, Response::HTTP_OK);
    }

    public function programCost(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_NO_CONTENT);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        // $programs = Programa::get();
        $programs = Proyecto::join('ejercicio_proyecto', 'proyectos.id', '=', 'ejercicio_proyecto.proyecto_id')
            ->join('subprogramas', 'proyectos.subprograma_id', '=', 'subprogramas.id')
            ->join('programas', 'subprogramas.programa_id', '=', 'programas.id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->distinct('unidades_responsables_gastos.id')
            ->get();
        // dd($programs);

        $sumaTotalPorPrograma = [];

        foreach ($programs as $program) {
            $total = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->join('proyectos','ejercicio_proyecto.proyecto_id','=','proyectos.id')
                ->join('subprogramas','proyectos.subprograma_id','=','subprogramas.id')
                ->join('programas','subprogramas.programa_id','=','programas.id')
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('programas.id', $program->id)
                ->sum('contrato_ejercicio_proyecto.importe');

            $sumaTotalPorPrograma[$program->nombre] = $total;
        }

        return response()->json($sumaTotalPorPrograma, Response::HTTP_OK);
    }

    public function chapterCost(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_NO_CONTENT);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $chapters = Capitulo::get();

        $totalSumForChapters = [];

        foreach ($chapters as $chapter) {
            $total = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->join('partidas', 'contrato_ejercicio_proyecto.partida_id', '=', 'partidas.id')
                ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('capitulos.capitulo', $chapter->capitulo)
                ->sum('contrato_ejercicio_proyecto.importe');

            $totalSumForChapters[] = [
                'capitulo' => $chapter->capitulo,
                'descripcion' => $chapter->descripcion,
                'costo_total' => $total,
            ];
        }

        return response()->json($totalSumForChapters, Response::HTTP_OK);
    }

    public function getChaptersCost($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_NO_CONTENT);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreements = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
            ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->join('partidas', 'contrato_ejercicio_proyecto.partida_id', '=', 'partidas.id')
            ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
            ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
            ->where('ejercicio_proyecto.ejercicio_id', '=', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', '=', $scenario)
            ->where('capitulos.capitulo', '=', $id)
            ->get();
        
        $total = $agreements->sum('importe');
        
        $data = [
            'capitulo' => $id,
            'contratos' => $agreements,
            'total' => $total
        ];

        return response()->json($data, Response::HTTP_OK);
    }
}
