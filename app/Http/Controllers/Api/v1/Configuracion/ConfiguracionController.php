<?php

namespace App\Http\Controllers\Api\v1\Configuracion;

use App\Http\Controllers\Controller;
use App\Models\ContratoEjecucion;
use App\Models\ContratoEjercicio;
use App\Models\ContratoPartida;
use App\Models\DetalleContrato;
use App\Models\Ejercicio;
use App\Models\Version;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ConfiguracionController extends Controller
{
    public function index()
    {
        $exercises = Ejercicio::get();

        return response()->json($exercises, Response::HTTP_OK);
    }

    public function activeExercise(Request $request)
    {
        $request->validate([
            'ejercicios.*' => 'required|exists:ejercicios,id'
        ]);

        $exercises = $request->ejercicios;

        foreach ($exercises as $exercise) {
            $ejercicio = Ejercicio::find($exercise);
            $ejercicio->activo_anteproyecto = true;
            $ejercicio->save();
        }

        return response()->json(['mensaje' => 'Los ejercicios fueron activados con éxito'], Response::HTTP_OK);
    }

    public function newExcercise()
    {
        /**
         * Pasos para un nuevo ejercicio de anteproyecto
         * 1. Obtener el ultimo registro de la tabla ejercicio
         * 2. Crear un nuevo registro de ejercicio
         * 3. Sacar la información de todas las tablas intermedias y copiarlas con el nuevo id del ejercicio
         */
        $lastExercise = Ejercicio::latest()->first();

        // $recordExercise = Ejercicio::where('ejercicio', $request->ejercicio)->first();

        // if ($recordExercise) return response(["message" => "Ya existe un ejercicio con este numero"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $exercise = new Ejercicio();
        $exercise->ejercicio = $lastExercise->ejercicio + 1;
        $exercise->permitir_edicion_seguimiento = 0;
        $exercise->permitir_edicion_seguimiento_derechos_humanos = 0;
        $exercise->permitir_edicion_elaboracion = 0;
        $exercise->activo_anteproyecto = 1;
        $exercise->save();

        $lastAgreementsExercise = ContratoEjercicio::where('ejercicio_id', $lastExercise->id)->where('escenario', 1)->get();

        if (!$lastAgreementsExercise) return response(["message" => "No hay contratos anteriores registrados"], Response::HTTP_UNPROCESSABLE_ENTITY);

        foreach ($lastAgreementsExercise as $lastAgreementExercise) {
            // Insertar en base de datos la relación de los contratos con el nuevo ejercicio
            $newAgreementExercise = new ContratoEjercicio();
            $newAgreementExercise->ejercicio_id = $exercise->id;
            $newAgreementExercise->contrato_id = $lastAgreementExercise->contrato_id;
            $newAgreementExercise->escenario = 1;
            $newAgreementExercise->cerrado = 0;
            $newAgreementExercise->seleccionado = 0;
            $newAgreementExercise->importe = $lastAgreementExercise->importe;
            $newAgreementExercise->save();

            $lastAgreementsSplits = ContratoPartida::where('contrato_ejercicio_id', $lastAgreementExercise->id)->get();

            if ($lastAgreementsSplits) {
                foreach ($lastAgreementsSplits as $lastAgreementSplit) {
                    $newAgreementSplit = new ContratoPartida();
                    $newAgreementSplit->contrato_ejercicio_id = $newAgreementExercise->id;
                    $newAgreementSplit->partida_id = $lastAgreementSplit->id;
                    $newAgreementSplit->save();
                }
            }

            $lastDetailAgreement = DetalleContrato::where('contrato_ejercicio_id', $lastAgreementExercise->id)->first();

            if ($lastDetailAgreement) {
                $newDetailAgreement = new DetalleContrato();
                $newDetailAgreement->contrato_ejercicio_id = $newAgreementExercise->id;
                $newDetailAgreement->cantidad = $lastDetailAgreement->cantidad;
                $newDetailAgreement->costo_unitario = $lastDetailAgreement->costo_unitario;
                $newDetailAgreement->unidad_medida_id = $lastDetailAgreement->unidad_medida_id;
                $newDetailAgreement->save();
            }

            $lastAgreementsExecutions = ContratoEjecucion::where('contrato_ejercicio_id', $lastAgreementExercise->id)->get();

            if ($lastAgreementsExecutions) {
                foreach ($lastAgreementsExecutions as $lastAgreementExecution) {
                    $newAgreementExecution = new ContratoEjecucion();
                    $newAgreementExecution->contrato_ejercicio_id = $newAgreementExercise->id;
                    $newAgreementExecution->mes_id = $lastAgreementExecution->mes_id;
                    $newAgreementExecution->costo = $lastAgreementExecution->costo;
                    $newAgreementExecution->save();
                }
            }
        }

        return response()->json($exercise, Response::HTTP_CREATED);
    }

    public function scenario(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $lastScenario = ContratoEjercicio::where('ejercicio_id', $exercise)->max('escenario');

        $newNumberScenario = $lastScenario + 1;

        $firstScenarios = ContratoEjercicio::where('ejercicio_id', $exercise)->where('escenario', 1)->get();

        foreach ($firstScenarios as $firstScenario) {
            $newScenario = new ContratoEjercicio();
            $newScenario->ejercicio_id = $exercise;
            $newScenario->contrato_id = $firstScenario->contrato_id;
            $newScenario->escenario = $newNumberScenario;
            $newScenario->cerrado = 0;
            $newScenario->seleccionado = 0;
            $newScenario->importe = $firstScenario->importe;
            $newScenario->save();

            $executionFirstScenario = ContratoEjecucion::where('contrato_ejercicio_id', $firstScenario->id)->get();

            foreach ($executionFirstScenario as $execution) {
                $newExecution = new ContratoEjecucion();
                $newExecution->contrato_ejercicio_id = $newScenario->id;
                $newExecution->mes_id = $execution->mes_id;
                $newExecution->costo = $execution->costo;
                $newExecution->save();
            }
        }

        return response()->json($exercise, Response::HTTP_CREATED);
    }
}
