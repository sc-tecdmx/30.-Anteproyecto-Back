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

class EjecucionContratoController extends Controller
{
    // Almacenamiento de ejecucion del contrato en los meses
    public function execute($id, Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'mes_id' => 'required',
            'costo' => 'required'
        ]);

        $agreementExercise = ContratoEjercicio::where('contrato_id', $id)->where('ejercicio_id', $exercise)->first();

        if(!$agreementExercise) return response(["message" => "No hay contrato en este ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $execution = new ContratoEjecucion();
        $execution->contrato_ejercicio_id = $agreementExercise->id;
        $execution->mes_id = $request->mes_id;
        $execution->costo = $request->costo;
        $execution->save();

        return response()->json($execution, Response::HTTP_CREATED);
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
}
