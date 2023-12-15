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

class DetalleContratoController extends Controller
{
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
}
