<?php

namespace App\Http\Controllers\Api\v1\Contratos;

use App\Http\Controllers\Controller;
use App\Models\Capitulo;
use App\Models\Concepto;
use App\Models\Contrato;
use App\Models\ContratoEjecucion;
use App\Models\ContratoEjercicio;
use App\Models\ContratoPartida;
use App\Models\DetalleContrato;
use App\Exports\Capitulos;
use App\Exports\CapitulosConceptos;
use App\Exports\Contratos;
use App\Exports\ContratosPartidas;
use App\Exports\ContratosProyectos;
use App\Exports\ContratosProyectos1;
use App\Exports\ContratosVersiones;
use App\Models\ContratoEjercicioProyecto;
use App\Models\Ejercicio;
use App\Models\Mes;
use App\Models\Partida;
use App\Models\Programa;
use App\Models\Proyecto;
use App\Models\ResponsableOperativo;
use App\Models\Subprograma;
use App\Models\UnidadMedidaAnteproyecto;
use App\Models\UnidadResponsableGasto;
use App\Models\Version;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;

class ReporteContratoController extends Controller
{
    public function export(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        if (count($responsablesOperativos) == 0) {
            $result = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                //->join('versiones', 'versiones.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('contrato_partida', 'contrato_partida.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('partidas', 'partidas.id', '=', 'contrato_partida.partida_id')
                ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
                ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.numero', '=', DB::raw('SUBSTRING(contratos.clave, 1, 2)'))
                ->select(
                    'contratos.id',
                    'contratos.clave',
                    'contratos.descripcion',
                    'contratos.importe',
                    'contratos.parcialidad',
                    'contratos.tipo',
                    'partidas.numero as partida',
                    'conceptos.numero as concepto',
                    'capitulos.capitulo',
                    'unidades_responsables_gastos.numero as urg'
                )
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->get();
        } else {
            $result = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                ->join('versiones', 'versiones.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('contrato_partida', 'contrato_partida.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('partidas', 'partidas.id', '=', 'contrato_partida.partida_id')
                ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
                ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.numero', '=', DB::raw('SUBSTRING(contratos.clave, 1, 2)'))
                ->select(
                    'contratos.id',
                    'contratos.clave',
                    'contratos.descripcion',
                    'versiones.importe',
                    'partidas.numero as partida',
                    'conceptos.numero as concepto',
                    'capitulos.capitulo',
                    'unidades_responsables_gastos.numero as urg'
                )
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->where('versiones.seleccionado', 1)
                ->whereIn(DB::raw('SUBSTRING(contratos.clave, 3, 2)'), $responsablesOperativos)
                ->get();
        }

        $exporter = new Contratos($result->toArray());

        // dd($exporter);

        return $exporter->download("contratos.xlsx");
    }

    public function chapters(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $year = Ejercicio::find($exercise);

        // $responsablesOperativos = json_decode($request->header('Responsables'), true);
        $budget = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
            ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->join('partidas', 'partidas.id', '=', 'contrato_ejercicio_proyecto.partida_id')
            ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
            ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', $scenario)
            ->whereIn('capitulos.id', [1,2,3,5])
            ->sum('contrato_ejercicio_proyecto.importe');
        
        //$chapters = Capitulo::take(5)->get();
        $chapters = Capitulo::whereIn('id', [1,2,3,5])->get();

        $response['total'] = $budget;
        $response['anio'] = $year->ejercicio;
        $subtotalGastoCorriente = 0;
        $porcentajeGastoCorriente = 0;

        foreach ($chapters as $chapter) {
            $total = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->join('partidas', 'partidas.id', '=', 'contrato_ejercicio_proyecto.partida_id')
                ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
                ->where('ejercicio_proyecto.ejercicio_id', '=', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', '=', $scenario)
                ->where('capitulos.capitulo', '=', $chapter->capitulo)
                ->sum('contrato_ejercicio_proyecto.importe');
            
            $porcentaje = ($total * 100) / $budget;

            if ($chapter->capitulo == '1000' || $chapter->capitulo == '2000'|| $chapter->capitulo == '3000') {
                $subtotalGastoCorriente += $total;
                $porcentajeGastoCorriente += $porcentaje;
            }

            $response[$chapter->capitulo]['total_capitulo'] = $total;
            $response[$chapter->capitulo]['descripcion'] = strtoupper($chapter->descripcion);
            $response[$chapter->capitulo]['porcentaje'] = $porcentaje;
        }

        $response['subtotal_gasto_corriente'] = $subtotalGastoCorriente;
        $response['porcentaje_gastos_corriente'] = $porcentajeGastoCorriente;

        // return response()->json($response, Response::HTTP_OK);
        $exporter = new Capitulos($response);

        // dd($exporter);

        return $exporter->download("cap.xlsx");
    }

    public function chapterConcept(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $year = Ejercicio::find($exercise);

        // $responsablesOperativos = json_decode($request->header('Responsables'), true);
        $budget = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
            ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->join('partidas', 'partidas.id', '=', 'contrato_ejercicio_proyecto.partida_id')
            ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
            ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', $scenario)
            ->whereIn('capitulos.id', [1,2,3,5])
            ->sum('contrato_ejercicio_proyecto.importe');
        
        //$chapters = Capitulo::take(5)->get();
        $chapters = Capitulo::whereIn('id', [1,2,3,5])->get();

        $response['total'] = $budget;
        $response['anio'] = $year->ejercicio;

        foreach ($chapters as $chapter) {
            $response['capitulos'][$chapter->id]['titulo'] = 'Capítulo '.$chapter->capitulo.' '.strtoupper($chapter->descripcion);

            $concepts = Concepto::where('capitulo_id', $chapter->id)->get();
            $subtotalChapter = 0;
            foreach ($concepts as $concept) {
                $response['capitulos'][$chapter->id]['conceptos'][$concept->id]['numero'] = $concept->numero;
                $response['capitulos'][$chapter->id]['conceptos'][$concept->id]['descripcion'] = $concept->descripcion;

                $subtotalConcept = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                    ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                    ->join('partidas', 'partidas.id', '=', 'contrato_ejercicio_proyecto.partida_id')
                    ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                    ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
                    ->where('ejercicio_proyecto.ejercicio_id', '=', $exercise)
                    ->where('contrato_ejercicio_proyecto.escenario', '=', $scenario)
                    ->where('conceptos.id', '=', $concept->id)
                    ->sum('contrato_ejercicio_proyecto.importe');
                
                $response['capitulos'][$chapter->id]['conceptos'][$concept->id]['subtotal'] = $subtotalConcept;
                $subtotalChapter += $subtotalConcept;
            }
            $response['capitulos'][$chapter->id]['subtotal'] = $subtotalChapter;
        }

        // return response()->json($response, Response::HTTP_OK);
        $exporter = new CapitulosConceptos($response);

        // dd($exporter);

        return $exporter->download("capyconcepto.xlsx");
    }

    public function agreementSplit(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $year = Ejercicio::find($exercise);

        // $responsablesOperativos = json_decode($request->header('Responsables'), true);
        $budget = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
            ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->join('partidas', 'partidas.id', '=', 'contrato_ejercicio_proyecto.partida_id')
            ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
            ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', $scenario)
            ->whereIn('capitulos.id', [1,2,3,5])
            ->sum('contrato_ejercicio_proyecto.importe');
        
        //$chapters = Capitulo::take(5)->get();
        $chapters = Capitulo::whereIn('id', [1,2,3,5])->get();

        $response['total'] = $budget;
        $response['anio'] = $year->ejercicio;

        foreach ($chapters as $chapter) {
            $response['capitulos'][$chapter->id]['titulo'] = 'Capítulo '.$chapter->capitulo.' '.strtoupper($chapter->descripcion);

            $splits = Partida::select('partidas.id', 'partidas.concepto_id', 'partidas.numero', 'partidas.descripcion')
                ->join('conceptos', 'partidas.concepto_id', '=', 'conceptos.id')
                ->join('capitulos', 'conceptos.capitulo_id', '=', 'capitulos.id')
                ->join('contrato_ejercicio_proyecto', 'partidas.id', '=', 'contrato_ejercicio_proyecto.partida_id')
                ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('capitulos.id', $chapter->id)
                ->where('contrato_ejercicio_proyecto.importe', '>', 0)
                ->groupBy('partidas.id', 'partidas.concepto_id', 'partidas.numero', 'partidas.descripcion')
                ->orderBy('partidas.id')
                ->get();

            $subtotalChapter = 0;

            foreach ($splits as $split) {
                $response['capitulos'][$chapter->id]['partidas'][$split->id]['numero'] = $split->numero;
                $response['capitulos'][$chapter->id]['partidas'][$split->id]['descripcion'] = $split->descripcion;

                $subtotalSplit = DB::table('contratos')
                    ->join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                    ->join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                    ->join('partidas', 'contrato_ejercicio_proyecto.partida_id', '=', 'partidas.id')
                    ->where('partidas.id', $split->id)
                    ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                    ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                    ->sum('contrato_ejercicio_proyecto.importe');
                
                $response['capitulos'][$chapter->id]['partidas'][$split->id]['subtotal'] = $subtotalSplit;
                $subtotalChapter += $subtotalSplit;
            }
            $response['capitulos'][$chapter->id]['subtotal'] = $subtotalChapter;
        }

        // return response()->json($response, Response::HTTP_OK);

        $exporter = new ContratosPartidas($response);

        return $exporter->download("partidas.xlsx");
    }

    public function agreementProject(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $proyectos = Proyecto::join('ejercicio_proyecto', 'proyectos.id', '=', 'ejercicio_proyecto.proyecto_id')
            ->join('contrato_ejercicio_proyecto', 'ejercicio_proyecto.id', '=', 'contrato_ejercicio_proyecto.ejercicio_proyecto_id')
            ->join('subprogramas', 'proyectos.subprograma_id', '=', 'subprogramas.id')
            ->join('programas', 'subprogramas.programa_id', '=', 'programas.id')
            ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
            ->join('unidades_responsables_gastos', 'responsables_operativos.unidad_responsable_gasto_id', '=', 'unidades_responsables_gastos.id')
            ->select(
                DB::raw('CONCAT(unidades_responsables_gastos.numero, responsables_operativos.numero, programas.numero, subprogramas.numero, proyectos.numero) AS clave'),
                'proyectos.descripcion',
                'ejercicio_proyecto.id'
            )
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', $scenario)
            ->distinct() // Añadimos el método distinct() para obtener solo resultados únicos
            ->get();

        $totals = [];
        $budget = 0;

        foreach ($proyectos as $proyecto) {
            $totalProyecto = ContratoEjercicioProyecto::join('ejercicio_proyecto', 'contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->where('ejercicio_proyecto_id',$proyecto->id)
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->sum('importe');
            $budget += $totalProyecto;
            $totals[] = [
                'clave' => $proyecto->clave,
                'descripcion' => $proyecto->descripcion,
                'total' => $totalProyecto
            ];
        }

        /* $data = [
            'budget' => $budget,
            'contratos' => $totals
        ];

        return response()->json($data, Response::HTTP_OK); */

        $exporter = new ContratosProyectos($totals, $budget);

        return $exporter->download("proyectos.xlsx");
    }
}
