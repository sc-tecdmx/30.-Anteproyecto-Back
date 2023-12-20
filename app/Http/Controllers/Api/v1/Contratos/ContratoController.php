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
            $result = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                ->join('contrato_partida', 'contrato_partida.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('partidas', 'partidas.id', '=', 'contrato_partida.partida_id')
                ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
                ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.numero', '=', DB::raw('SUBSTRING(contratos.clave, 1, 2)'))
                ->select(
                    'contratos.id',
                    'contratos.clave',
                    'contratos.descripcion',
                    'partidas.numero as partida',
                    'conceptos.numero as concepto',
                    'capitulos.capitulo',
                    'unidades_responsables_gastos.numero as urg'
                )
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->where('contrato_ejercicio.escenario', $scenario)
                //->where('versiones.seleccionado', 1)
                ->groupBy('contratos.clave', 'contratos.id', 'contratos.descripcion', 'partidas.numero', 'conceptos.numero', 'capitulos.capitulo', 'unidades_responsables_gastos.numero')
                ->get();
        } else {
            $resultado = DB::table('responsables_operativos')
                    ->select('responsables_operativos.numero as ronum', 'unidades_responsables_gastos.numero as urnum')
                    ->join('responsable_operativo_urg', 'responsable_operativo_urg.responsable_operativo_id', '=', 'responsables_operativos.id')
                    ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.id', '=', 'responsable_operativo_urg.unidad_responsable_gasto_id')
                    ->whereIn('responsables_operativos.id', $responsablesOperativos)
                    ->get();

            $rosurg = $resultado->map(function ($re) {
                return [
                    $re->ronum . $re->urnum
                ];
            });

            $result = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
                ->join('contrato_partida', 'contrato_partida.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
                ->join('partidas', 'partidas.id', '=', 'contrato_partida.partida_id')
                ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
                ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
                ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.numero', '=', DB::raw('SUBSTRING(contratos.clave, 1, 2)'))
                ->select(
                    'contratos.id',
                    'contratos.clave',
                    'contratos.descripcion',
                    'partidas.numero as partida',
                    'conceptos.numero as concepto',
                    'capitulos.capitulo',
                    'unidades_responsables_gastos.numero as urg'
                )
                ->where('contrato_ejercicio.ejercicio_id', $exercise)
                ->where('contrato_ejercicio.escenario', $scenario)
                //->where('versiones.seleccionado', 1)
                ->whereIn(DB::raw('SUBSTRING(contratos.clave, 3, 2)'), $rosurg)
                ->groupBy('contratos.clave', 'contratos.id', 'contratos.descripcion', 'partidas.numero', 'conceptos.numero', 'capitulos.capitulo', 'unidades_responsables_gastos.numero')
                ->get();
        }
        return response()->json($result, Response::HTTP_OK);
    }

    public function show($id, Request $request)
    {
        $agreement = Contrato::find($id);

        if (!$agreement) return response()->json(['message' => 'Contrato no encontrado'], Response::HTTP_UNPROCESSABLE_ENTITY);

        $exercise = $request->header('ejercicio');

        if (!$exercise) return response()->json(['message' => 'No existe ejercicio'], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $agreement->id)->where('ejercicio_id', $exercise)->first();

        if (!$agreementExercise) return response()->json(['message' => 'No se encuentra relación entre el ejercicio y el contrato'], Response::HTTP_UNPROCESSABLE_ENTITY);

        $result = Contrato::join('contrato_ejercicio', 'contratos.id', '=', 'contrato_ejercicio.contrato_id')
            // ->join('detalles_contratos', 'detalles_contratos.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
            // ->join('unidades_medida', 'unidades_medida.id = detalles_contratos.unidad_medida_id')
            // ->join('versiones', 'versiones.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
            ->join('contrato_partida', 'contrato_partida.contrato_ejercicio_id', '=', 'contrato_ejercicio.id')
            ->join('partidas', 'partidas.id', '=', 'contrato_partida.partida_id')
            ->join('conceptos', 'conceptos.id', '=', 'partidas.concepto_id')
            ->join('capitulos', 'capitulos.id', '=', 'conceptos.capitulo_id')
            ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.numero', '=', DB::raw('SUBSTRING(contratos.clave, 1, 2)'))
            ->select(
                'contrato_ejercicio.importe',
                'partidas.numero as partida',
                'partidas.descripcion as descripcionp',
                'partidas.id as partida_id',
                'conceptos.numero as concepto',
                'conceptos.descripcion as descripcionc',
                'capitulos.capitulo',
                'capitulos.descripcion as descripcionch',
                'unidades_responsables_gastos.numero as urg',
                'unidades_responsables_gastos.nombre',
            )
            ->where('contrato_ejercicio.ejercicio_id', $exercise)
            ->where('contratos.id', $agreement->id)
            ->first();
        
        $response = [
            'id' => $agreement->id,
            'clave' => $agreement->clave,
            'descripcion' => $agreement->descripcion,
            'partida' => $result->partida,
            'descripcion_partida' => $result->descripcionp,
            'partida_id' => $result->partida_id,
            'concepto' => $result->concepto,
            'concepto_descripcion' => $result->descripcionc,
            'capitulo' => $result->capitulo,
            'capitulo_descripcion' => $result->descripcionch,
            'urg' => $result->urg,
            'urg_nombre' => $result->nombre,
            'importe' => $result->importe,
            'parcialidad' => $agreement->parcialidad,
            'tipo' => $agreement->tipo
        ];
        
        $detail = DetalleContrato::where('contrato_ejercicio_id', $agreementExercise->id)->first();

        if ($detail) {
            $response['cantidad'] = $detail->cantidad;
            $response['costo_unitario'] = $detail->costo_unitario;

            $measurement = UnidadMedidaAnteproyecto::where('id', $detail->unidad_medida_id)->first();

            if($measurement) $response['unidad_medida'] = $measurement->descripcion;
        }

        return response()->json($response, Response::HTTP_OK);
    }
    

    public function store(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'clave' => 'required',
            'descripcion' => 'required',
            'importe' => 'required',
            'parcialidad' => 'required',
            'tipo' => 'required',
            'partida_id' => 'required'
        ]);

        $clave = str_split($request->clave, 2);

        if (strlen($request->clave) < 10) {
            return response(["message" => "La longitud de la clave no es la correcta"], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $urg = UnidadResponsableGasto::where('numero', $clave[0])->first();

        if (!$urg) return response(["message" => "La URG no existe"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $ro = ResponsableOperativo::where('numero', $clave[1])->first();

        if(!$ro) return response(["message" => "El responsable operativo no existe"], Response::HTTP_UNPROCESSABLE_ENTITY);

        // programa
        $pg = Programa::where('numero', $clave[2])->first();

        if (!$pg) return response(["message" => "El programa no existe"], Response::HTTP_UNPROCESSABLE_ENTITY);
        
        // subprogrma
        $sp = Subprograma::where('numero', $clave[3])->first();

        if (!$sp) return response(["message" => "El subprograma no existe"], Response::HTTP_UNPROCESSABLE_ENTITY);

        // proyecto
        $py = Proyecto::where('numero', $clave[4])->first();

        if (!$py) return response(["message" => "El proyecto no existe"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreement = new Contrato();
        $agreement->clave = $request->clave;
        $agreement->descripcion = $request->descripcion;
        // $agreement->importe = $request->importe;
        $agreement->parcialidad = $request->parcialidad;
        $agreement->tipo = $request->tipo;
        $agreement->save();

        $agreementExercise = new ContratoEjercicio();
        $agreementExercise->contrato_id = $agreement->id;
        $agreementExercise->ejercicio_id = $exercise;
        $agreementExercise->escenario = $scenario;
        $agreementExercise->cerrado = 0;
        $agreementExercise->seleccionado = 0;
        $agreementExercise->importe = $request->importe;
        $agreementExercise->save();

        $split = new ContratoPartida();
        $split->contrato_ejercicio_id = $agreementExercise->id;
        $split->partida_id = $request->partida_id;
        $split->save();

        $months = Mes::get();

        if (!$months) return response(["message" => "No existen meses para configurar"], Response::HTTP_UNPROCESSABLE_ENTITY);

        foreach ($months as $month){
            $execution = new ContratoEjecucion();
            $execution->contrato_ejercicio_id = $agreementExercise->id;
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

        $agreement = Contrato::find($id);

        if(!$agreement) return response(["message" => "No existe el contrato"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $id)->where('contrato_id', $id)->where('escenario', $scenario)->first();

        if(!$agreementExercise) return response(["message" => "No existe el ejercicio con el contrato"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'clave' => 'required',
            'descripcion' => 'required',
            'importe' => 'required',
            'parcialidad' => 'required',
            'tipo' => 'required',
            'partida_id' => 'required'
        ]);

        $agreement->clave = $request->clave;
        $agreement->descripcion = $request->descripcion;
        $agreement->importe = $request->importe;
        $agreement->parcialidad = $request->parcialidad;
        $agreement->tipo = $request->tipo;
        $agreement->save();

        $agreementExercise->importe = $request->importe;
        $agreementExercise->save();

        $split = ContratoPartida::where('contrato_ejercicio_id', $agreementExercise->id)->first();
        $split->contrato_ejercicio_id = $agreementExercise->id;
        $split->partida_id = $request->partida_id;
        $split->save();

        return response()->json($agreement, Response::HTTP_CREATED);
    }

     // Almacenamiento del detalle del contrato
    public function detail($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'cantidad' => 'required',
            'costo_unitario' => 'required',
            'unidad_medida_id' => 'required'
        ]);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $id)->where('ejercicio_id', $exercise)->first();

        if(!$agreementExercise) return response(["message" => "No hay contrato en este ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $detail = new DetalleContrato();
        $detail->contrato_ejercicio_id = $agreementExercise->id;
        $detail->cantidad = $request->cantidad;
        $detail->costo_unitario = $request->costo_unitario;
        $detail->unidad_medida_id = $request->unidad_medida_id;
        $detail->save();

        return response()->json($detail, Response::HTTP_CREATED);
    }

    public function updateDetail($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $id)->where('ejercicio_id', $exercise)->first();

        if(!$agreementExercise) return response(["message" => "No hay contrato en este ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'cantidad' => 'required',
            'costo_unitario' => 'required',
            'unidad_medida_id' => 'required|exists:unidades_medida,id'
        ]);

        $dbDetail = DetalleContrato::where('contrato_ejercicio_id', $agreementExercise->id)->first();

        if (!$dbDetail) {
            return response(["message" => "Concepto no encontrado"], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $dbDetail->fill($request->all());
        $dbDetail->save();

        return response($dbDetail, Response::HTTP_OK);
    }

    // Almacenamiento de ejecucion del contrato en los meses
    public function execute($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            '*.mes_id' => 'required',
            '*.costo' => 'required'
        ]);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $id)->where('ejercicio_id', $exercise)->first();

        if(!$agreementExercise) return response(["message" => "No hay contrato en este ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $executions = [];

        foreach ($request->all() as $data) {
            $execution = ContratoEjecucion::find($data['id']);
            $execution->costo = $data['costo'] ?? 0;
            $execution->save();
            $executions[] = $execution;
        }
        /* $execution = new ContratoEjecucion();
        $execution->contrato_ejercicio_id = $agreementExercise->id;
        $execution->mes_id = $request->mes_id;
        $execution->costo = $request->costo;
        $execution->save(); */

        return response()->json($executions, Response::HTTP_CREATED);
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

        if (count($responsablesOperativos) == 0) {
            $result = Proyecto::select(
                    'proyectos.id',
                    'proyectos.numero as proyecto_numero',
                    'subprogramas.numero as subprograma_numero',
                    'programas.numero as programa_numero',
                    'responsables_operativos.numero as responsable_operativo_numero',
                    'unidades_responsables_gastos.numero as unidad_responsable_numero'
                )
                ->join('proyecto_subprograma', 'proyecto_subprograma.proyecto_id', '=', 'proyectos.id')
                ->join('subprogramas', 'subprogramas.id', '=', 'proyecto_subprograma.subprograma_id')
                ->join('programa_subprograma', 'programa_subprograma.subprograma_id', '=', 'subprogramas.id')
                ->join('programas', 'programas.id', '=', 'programa_subprograma.programa_id')
                ->join('proyecto_responsable_operativo', 'proyecto_responsable_operativo.proyecto_id', '=', 'proyectos.id')
                ->join('responsables_operativos', 'responsables_operativos.id', '=', 'proyecto_responsable_operativo.responsable_operativo_id')
                ->join('responsable_operativo_urg', 'responsable_operativo_urg.responsable_operativo_id', '=', 'responsables_operativos.id')
                ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.id', '=', 'responsable_operativo_urg.unidad_responsable_gasto_id')
                ->get();
        } else {
            $result = Proyecto::select(
                    'proyectos.id',
                    'proyectos.numero as proyecto_numero',
                    'subprogramas.numero as subprograma_numero',
                    'programas.numero as programa_numero',
                    'responsables_operativos.numero as responsable_operativo_numero',
                    'unidades_responsables_gastos.numero as unidad_responsable_numero'
                )
                ->join('proyecto_subprograma', 'proyecto_subprograma.proyecto_id', '=', 'proyectos.id')
                ->join('subprogramas', 'subprogramas.id', '=', 'proyecto_subprograma.subprograma_id')
                ->join('programa_subprograma', 'programa_subprograma.subprograma_id', '=', 'subprogramas.id')
                ->join('programas', 'programas.id', '=', 'programa_subprograma.programa_id')
                ->join('proyecto_responsable_operativo', 'proyecto_responsable_operativo.proyecto_id', '=', 'proyectos.id')
                ->join('responsables_operativos', 'responsables_operativos.id', '=', 'proyecto_responsable_operativo.responsable_operativo_id')
                ->join('responsable_operativo_urg', 'responsable_operativo_urg.responsable_operativo_id', '=', 'responsables_operativos.id')
                ->join('unidades_responsables_gastos', 'unidades_responsables_gastos.id', '=', 'responsable_operativo_urg.unidad_responsable_gasto_id')
                ->whereIn('responsables_operativos.id', $responsablesOperativos)
                ->get();
        }

        /**
         * Clave
         * URG  RO  PG  SP  PY
         */
        $keys = $result->map(function ($key) {
            return [
                'clave' => $key->unidad_responsable_numero . 
                    $key->responsable_operativo_numero .
                    $key->programa_numero .
                    $key->subprograma_numero .
                    $key->proyecto_numero
            ];
        });

        return response()->json($keys, Response::HTTP_OK);
    }

    // Mostrar la ejecución del contrato en los meses
    public function months($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $id)->where('ejercicio_id', $exercise)->first();

        if(!$agreementExercise) return response(["message" => "No hay contrato en este ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $executions = ContratoEjecucion::where('contrato_ejercicio_id', $agreementExercise->id)->with('mes')->get();

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

    public function total($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreement = Contrato::find($id);

        if(!$agreement) return response(["message" => "No existe el contrato"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $id)->where('ejercicio_id', $exercise)->where('escenario', $scenario)->first();

        if (!$agreementExercise) return response(["message" => "No existe el contrato en el ejercicio con ese escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $total = ContratoEjecucion::where('contrato_ejercicio_id', $agreementExercise->id)->sum('costo');

        return response()->json($total, Response::HTTP_OK);
    }
}
