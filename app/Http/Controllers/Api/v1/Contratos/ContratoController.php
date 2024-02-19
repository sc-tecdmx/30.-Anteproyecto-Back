<?php

namespace App\Http\Controllers\Api\v1\Contratos;

use App\Http\Controllers\Controller;
use App\Models\Contrato;
use App\Models\ContratoEjecucion;
use App\Models\ContratoEjercicio;
use App\Models\ContratoPartida;
use App\Models\DetalleContrato;
use App\Exports\Contratos;
use App\Exports\ContratosVersiones;
use App\Models\ContratoEjercicioProyecto;
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

class ContratoController extends Controller
{
    public function index(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        if (count($responsablesOperativos) == 0) {
            $contratos = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto', 'contrato_ejercicio_proyecto.ejercicio_proyecto_id', '=', 'ejercicio_proyecto.id')
                ->join('ejercicios', 'ejercicio_proyecto.ejercicio_id', '=', 'ejercicios.id')
                ->join('partidas', 'contrato_ejercicio_proyecto.partida_id', '=', 'partidas.id')
                ->join('conceptos', 'partidas.concepto_id', '=', 'conceptos.id')
                ->join('capitulos', 'conceptos.capitulo_id', '=', 'capitulos.id')
                ->join('proyectos', 'ejercicio_proyecto.proyecto_id', '=', 'proyectos.id')
                ->join('subprogramas', 'proyectos.subprograma_id', '=', 'subprogramas.id')
                ->join('programas', 'subprogramas.programa_id', '=', 'programas.id')
                ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
                ->join('unidades_responsables_gastos', 'responsables_operativos.unidad_responsable_gasto_id', '=', 'unidades_responsables_gastos.id')
                ->select(
                    DB::raw('CONCAT(unidades_responsables_gastos.numero, responsables_operativos.numero, programas.numero, subprogramas.numero, proyectos.numero) AS clave'),
                    'unidades_responsables_gastos.numero as urg',
                    'partidas.numero as partida',
                    'capitulos.capitulo',
                    'conceptos.numero as concepto',
                    'contratos.descripcion',
                    'contrato_ejercicio_proyecto.id'
                )
                ->where('ejercicios.id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->get();
        } else {
            $contratos = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto', 'contrato_ejercicio_proyecto.ejercicio_proyecto_id', '=', 'ejercicio_proyecto.id')
                ->join('ejercicios', 'ejercicio_proyecto.ejercicio_id', '=', 'ejercicios.id')
                ->join('partidas', 'contrato_ejercicio_proyecto.partida_id', '=', 'partidas.id')
                ->join('conceptos', 'partidas.concepto_id', '=', 'conceptos.id')
                ->join('capitulos', 'conceptos.capitulo_id', '=', 'capitulos.id')
                ->join('proyectos', 'ejercicio_proyecto.proyecto_id', '=', 'proyectos.id')
                ->join('subprogramas', 'proyectos.subprograma_id', '=', 'subprogramas.id')
                ->join('programas', 'subprogramas.programa_id', '=', 'programas.id')
                ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
                ->join('unidades_responsables_gastos', 'responsables_operativos.unidad_responsable_gasto_id', '=', 'unidades_responsables_gastos.id')
                ->select(
                    DB::raw('CONCAT(unidades_responsables_gastos.numero, responsables_operativos.numero, programas.numero, subprogramas.numero, proyectos.numero) AS clave'),
                    'unidades_responsables_gastos.numero as urg',
                    'partidas.numero as partida',
                    'capitulos.capitulo',
                    'conceptos.numero as concepto',
                    'contratos.descripcion',
                    'contrato_ejercicio_proyecto.id'
                )
                ->where('ejercicios.id', 6)
                ->where('contrato_ejercicio_proyecto.escenario', 1)
                ->whereIn('responsables_operativos.id', $responsablesOperativos)
                ->get();
        }
        return response()->json($contratos, Response::HTTP_OK);
    }

    public function show($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if (!$exercise) return response()->json(['message' => 'No existe ejercicio'], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $contrato = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto', 'contrato_ejercicio_proyecto.ejercicio_proyecto_id', '=', 'ejercicio_proyecto.id')
                ->join('ejercicios', 'ejercicio_proyecto.ejercicio_id', '=', 'ejercicios.id')
                ->join('partidas', 'contrato_ejercicio_proyecto.partida_id', '=', 'partidas.id')
                ->join('conceptos', 'partidas.concepto_id', '=', 'conceptos.id')
                ->join('capitulos', 'conceptos.capitulo_id', '=', 'capitulos.id')
                ->join('proyectos', 'ejercicio_proyecto.proyecto_id', '=', 'proyectos.id')
                ->join('subprogramas', 'proyectos.subprograma_id', '=', 'subprogramas.id')
                ->join('programas', 'subprogramas.programa_id', '=', 'programas.id')
                ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
                ->join('unidades_responsables_gastos', 'responsables_operativos.unidad_responsable_gasto_id', '=', 'unidades_responsables_gastos.id')
                ->select(
                    DB::raw('CONCAT(unidades_responsables_gastos.numero, responsables_operativos.numero, programas.numero, subprogramas.numero, proyectos.numero) AS clave'),
                    'contrato_ejercicio_proyecto.importe',
                    'partidas.numero as partida',
                    'partidas.descripcion as descripcion_partida',
                    'partidas.id as partida_id',
                    'conceptos.numero as concepto',
                    'conceptos.descripcion as concepto_descripcion',
                    'capitulos.capitulo',
                    'capitulos.descripcion as capitulo_descripcion',
                    'unidades_responsables_gastos.numero as urg',
                    'unidades_responsables_gastos.nombre',
                    'contrato_ejercicio_proyecto.importe',
                    'contratos.parcialidad',
                    'contratos.tipo',
                    'contratos.descripcion',
                    'contrato_ejercicio_proyecto.id',
                    'ejercicio_proyecto.id as epid'
                )
                ->where('ejercicios.id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('contrato_ejercicio_proyecto.id', $id)
                ->first();
        
        $detail = DetalleContrato::where('contrato_ejercicio_proyecto_id', $contrato->id)->with('unidadMedida')->first();

        if ($detail) {
            $contrato['cantidad'] = $detail->cantidad;
            $contrato['costo_unitario'] = $detail->costo_unitario;
            $contrato['unidad_medida'] = $detail->unidadMedida->descripcion;
            $contrato['unidad_medida_id'] = $detail->unidad_medida_id;
        }

        return response()->json($contrato, Response::HTTP_OK);
    }
    

    public function store(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'descripcion' => 'required',
            'parcialidad' => 'required',
            'tipo' => 'required',
            'ejercicio_proyecto_id' => 'required',
            'partida_id' => 'required',
            'importe' => 'required',
        ]);

        $agreement = new Contrato();
        $agreement->descripcion = $request->descripcion;
        $agreement->parcialidad = $request->parcialidad;
        $agreement->tipo = $request->tipo;
        $agreement->save();

        $agreementExerciseProject = new ContratoEjercicioProyecto();
        $agreementExerciseProject->contrato_id = $agreement->id;
        $agreementExerciseProject->ejercicio_proyecto_id = $request->ejercicio_proyecto_id;
        $agreementExerciseProject->partida_id = $request->partida_id;
        $agreementExerciseProject->importe = $request->importe;
        $agreementExerciseProject->escenario = $scenario;
        $agreementExerciseProject->cerrado = 0;
        $agreementExerciseProject->seleccionado = 1;
        $agreementExerciseProject->save();

        $months = Mes::get();

        if (!$months) return response(["message" => "No existen meses para configurar"], Response::HTTP_UNPROCESSABLE_ENTITY);

        foreach ($months as $month){
            $execution = new ContratoEjecucion();
            $execution->contrato_ejercicio_proyecto_id = $agreementExerciseProject->id;
            $execution->mes_id = $month->id;
            $execution->costo = 0.0;
            $execution->save();
        }

        return response()->json($agreement, Response::HTTP_CREATED);
    }

    // Actualizar información del contrato
    public function update($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreementExercise = ContratoEjercicioProyecto::find($id);

        if(!$agreementExercise) return response(["message" => "No existe el contrato"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreement = Contrato::where('id', $agreementExercise->contrato_id)->first();

        if(!$agreementExercise) return response(["message" => "No existe el ejercicio con el contrato"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'descripcion' => 'required',
            'parcialidad' => 'required',
            'tipo' => 'required',
            'clave' => 'required',
            'partida_id' => 'required',
            'importe' => 'required',
        ]);

        $agreement->descripcion = $request->descripcion;
        $agreement->parcialidad = $request->parcialidad;
        $agreement->tipo = $request->tipo;
        $agreement->save();

        $agreementExercise->ejercicio_proyecto_id = $request->clave;
        $agreementExercise->partida_id = $request->partida_id;
        $agreementExercise->importe = $request->importe;
        $agreementExercise->save();

        return response()->json($agreement, Response::HTTP_CREATED);
    }

     // Almacenamiento del detalle del contrato
    public function detail($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'cantidad' => 'required',
            'costo_unitario' => 'required',
            'unidad_medida_id' => 'required|exists:unidades_medidas_anteproyecto,id'
        ]);

        $agreementExercise = ContratoEjercicioProyecto::find($id);

        if(!$agreementExercise) return response(["message" => "No hay contrato en este ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $dbDetail = DetalleContrato::where('contrato_ejercicio_proyecto_id', $agreementExercise->id)->first();

        if ($dbDetail) {
            $dbDetail->fill($request->all());
            $dbDetail->save();

            return response()->json($dbDetail, RESPONSE::HTTP_OK);
        }

        $detail = new DetalleContrato();
        $detail->contrato_ejercicio_proyecto_id = $agreementExercise->id;
        $detail->cantidad = $request->cantidad;
        $detail->costo_unitario = $request->costo_unitario;
        $detail->unidad_medida_id = $request->unidad_medida_id;
        $detail->save();

        return response()->json($detail, Response::HTTP_CREATED);
    }

    // Almacenamiento de ejecucion del contrato en los meses
    public function execute($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            '*.mes_id' => 'required',
            '*.costo' => 'required'
        ]);

        $agreementExercise = ContratoEjercicioProyecto::find($id);

        if(!$agreementExercise) return response(["message" => "No hay contrato en este ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $executions = $request->all();
        $data = [];

        foreach ($executions as $execution) {
            $dbExecution = ContratoEjecucion::find($execution['id']);
            $dbExecution->costo = $execution['costo'] ?? 0;
            $dbExecution->save();
            $data[] = $execution;
        }

        return response()->json($data, Response::HTTP_CREATED);
    }

    // Ver ejecucion
    public function showExecution($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $execution = ContratoEjecucion::find($id);

        if(!$execution) return response(["message" => "No existe esta ejecución del contrato"], Response::HTTP_UNPROCESSABLE_ENTITY);

        return response()->json($execution, Response::HTTP_CREATED);
    }

    // Actualizar ejecución
    public function updateExecution($id, Request $request)
    {
        $execution = ContratoEjecucion::find($id);

        if(!$execution) return response(["message" => "No existe esta ejecución del contrato"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'mes_id' => 'required',
            'costo' => 'required'
        ]);

        $execution->fill($request->all());
        $execution->save();

        return response()->json($execution, Response::HTTP_OK);
    }

    // Obtener claves para la creación de un contrato
    public function programaticKeys(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        $proyectos = Proyecto::join('ejercicio_proyecto', 'proyectos.id', '=', 'ejercicio_proyecto.proyecto_id')
            ->join('contrato_ejercicio_proyecto','ejercicio_proyecto.id','=','contrato_ejercicio_proyecto.ejercicio_proyecto_id')
            ->join('ejercicios', 'ejercicio_proyecto.ejercicio_id', '=', 'ejercicios.id')
            ->join('subprogramas', 'proyectos.subprograma_id', '=', 'subprogramas.id')
            ->join('programas', 'subprogramas.programa_id', '=', 'programas.id')
            ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
            ->join('unidades_responsables_gastos', 'responsables_operativos.unidad_responsable_gasto_id', '=', 'unidades_responsables_gastos.id')
            ->select(
                DB::raw('CONCAT(unidades_responsables_gastos.numero, responsables_operativos.numero, programas.numero, subprogramas.numero, proyectos.numero) AS clave'),
                'ejercicio_proyecto.id'
            )
            ->where('ejercicios.id', $exercise);

        if (count($responsablesOperativos) > 0) {
            $proyectos->whereIn('responsables_operativos.id', $responsablesOperativos);
        }

        $proyectos = $proyectos->get();
        /**
         * Clave
         * URG  RO  PG  SP  PY
         */

        return response()->json($proyectos, Response::HTTP_OK);
    }

    // Mostrar la ejecución del contrato en los meses
    public function months($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $executions = ContratoEjecucion::where('contrato_ejercicio_proyecto_id', $id)->with('mes')->get();

        return response()->json($executions, Response::HTTP_OK);
    }

    // Meses libres que no se encuentran aun en la lista de ejecución del contrato
    public function freeMonths($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $id)->where('ejercicio_id', $exercise)->first();

        if(!$agreementExercise) return response(["message" => "No hay contrato en este ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $allMonths = Mes::all();

        $executions = ContratoEjecucion::where('contrato_ejercicio_id', $agreementExercise->id)->with('mes')->get();
        
        // Obtén los ids de los meses asociados a la ejecución del contrato
        $executedMonthIds = $executions->pluck('mes.id')->toArray();

        // Filtra los meses que no están en la tabla de contrato ejecución
        $freeMonths = $allMonths->reject(function ($month) use ($executedMonthIds) {
            return in_array($month->id, $executedMonthIds);
        });

        // Formatea la respuesta en formato JSON
        $response = $freeMonths->map(function ($month) {
            return [
                'id' => $month->id,
                'abreviatura' => $month->abreviatura,
                'descripcion' => $month->descripcion,
            ];
        })->values()->toArray();

        return response()->json($response);
    }

    public function export(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        $contratos = Contrato::join('contrato_ejercicio_proyecto', 'contratos.id', '=', 'contrato_ejercicio_proyecto.contrato_id')
                ->join('ejercicio_proyecto', 'contrato_ejercicio_proyecto.ejercicio_proyecto_id', '=', 'ejercicio_proyecto.id')
                ->join('ejercicios', 'ejercicio_proyecto.ejercicio_id', '=', 'ejercicios.id')
                ->join('partidas', 'contrato_ejercicio_proyecto.partida_id', '=', 'partidas.id')
                ->join('conceptos', 'partidas.concepto_id', '=', 'conceptos.id')
                ->join('capitulos', 'conceptos.capitulo_id', '=', 'capitulos.id')
                ->join('proyectos', 'ejercicio_proyecto.proyecto_id', '=', 'proyectos.id')
                ->join('subprogramas', 'proyectos.subprograma_id', '=', 'subprogramas.id')
                ->join('programas', 'subprogramas.programa_id', '=', 'programas.id')
                ->join('responsables_operativos', 'proyectos.responsable_operativo_id', '=', 'responsables_operativos.id')
                ->join('unidades_responsables_gastos', 'responsables_operativos.unidad_responsable_gasto_id', '=', 'unidades_responsables_gastos.id')
                ->select(
                    DB::raw('CONCAT(unidades_responsables_gastos.numero, responsables_operativos.numero, programas.numero, subprogramas.numero, proyectos.numero) AS clave'),
                    'contratos.descripcion',
                    'contrato_ejercicio_proyecto.importe',
                    'contratos.parcialidad',
                    'contratos.tipo',
                    'partidas.numero as partida',
                    'capitulos.capitulo',
                    'conceptos.numero as concepto',
                    'unidades_responsables_gastos.numero as urg'
                )
                ->where('ejercicios.id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario);

        if (count($responsablesOperativos) > 0) {
            $contratos->whereIn('responsables_operativos.id', $responsablesOperativos);
        }
         
        $contratos = $contratos->get();

        $exporter = new Contratos($contratos->toArray());

        return $exporter->download("contratos.xlsx");
    }

    public function total($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreementExercise = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->where('contrato_ejercicio_proyecto.id', $id)
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', $scenario)
            ->first();

        if (!$agreementExercise) return response(["message" => "No existe el contrato en el ejercicio con ese escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $total = ContratoEjecucion::where('contrato_ejercicio_proyecto_id', $agreementExercise->id)->sum('costo');

        return response()->json($total, Response::HTTP_OK);
    }
}
