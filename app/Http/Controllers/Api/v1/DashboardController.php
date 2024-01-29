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

        $budget = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
            ->where('contrato_ejercicio.ejercicio_id', $exercise)
            ->where('contrato_ejercicio.escenario', $scenario)
            ->sum('contrato_ejercicio.importe');

        $projects = Proyecto::count();

        $urgs = UnidadResponsableGasto::count();

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

        $urgs = UnidadResponsableGasto::get();

        $sumaTotalPorUnidad = [];

        foreach ($urgs as $urg) {
            $total = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->where(DB::raw('SUBSTRING(contratos.clave, 1, 2)'), $urg->numero)
                ->sum('contratos.importe');

            $sumaTotalPorUnidad[$urg->nombre] = $total;
        }

        return response()->json($sumaTotalPorUnidad, Response::HTTP_OK);
    }

    public function monthCost(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_NO_CONTENT);

        $months = Mes::get();

        $totalSumPerMonths = [];

        foreach ($months as $month) {
            $total = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                ->join('contratos_ejecucion', 'contratos_ejecucion.contrato_ejercicio_id', '=', 'contrato_ejercicio.contrato_id')
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->where('contratos_ejecucion.mes_id', $month->id)
                ->sum('contratos_ejecucion.costo');

            $totalSumPerMonths[$month->descripcion] = $total;
        }

        return response()->json($totalSumPerMonths, Response::HTTP_OK);
    }

    public function programCost(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_NO_CONTENT);

        $programs = Programa::get();

        $sumaTotalPorPrograma = [];

        foreach ($programs as $program) {
            $total = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->where(DB::raw('SUBSTRING(contratos.clave, 5, 2)'), $program->numero)
                ->sum('contratos.importe');

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
            $total = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                ->join('contrato_partida', 'contrato_partida.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('partidas', 'partidas.id', '=', 'contrato_partida.partida_id')
                ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
                ->where('contrato_ejercicio.ejercicio_id', '=', $exercise)
                ->where('contrato_ejercicio.escenario', '=', $scenario)
                ->where('capitulos.capitulo', '=', $chapter->capitulo)
                ->sum('contrato_ejercicio.importe');

            $totalSumForChapters[$chapter->capitulo] = $total;
        }

        return response()->json($totalSumForChapters, Response::HTTP_OK);
    }
}
