<?php

namespace App\Http\Controllers\Api\v1\Configuracion;

use App\Http\Controllers\Controller;
use App\Models\ContratoEjecucion;
use App\Models\ContratoEjercicioProyecto;
use App\Models\ContratoPartida;
use App\Models\DetalleContrato;
use App\Models\Ejercicio;
use App\Models\EjercicioProyecto;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;

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

        $lastProjectsExercise = EjercicioProyecto::where('ejercicio_id', $lastExercise->id)->get();

        foreach($lastProjectsExercise as $lastProjectExercise) {
            $newExerciseProject = new EjercicioProyecto();
            $newExerciseProject->ejercicio_id = $exercise->id;
            $newExerciseProject->proyecto_id = $lastProjectExercise->proyecto_id;
            $newExerciseProject->save();

            $lastAgreementsExerciseProject = ContratoEjercicioProyecto::where('ejercicio_proyecto_id', $lastProjectExercise->id)->where('escenario', 1)->get();

            if (!$lastAgreementsExerciseProject) return response(["message" => "No hay contratos anteriores registrados"], Response::HTTP_UNPROCESSABLE_ENTITY);

            foreach ($lastAgreementsExerciseProject as $lastAgreementExerciseProject) {
                // Insertar en base de datos la relación de los contratos con el nuevo ejercicio
                $newAgreementExerciseProject = new ContratoEjercicioProyecto();
                $newAgreementExerciseProject->ejercicio_proyecto_id = $newExerciseProject->id;
                $newAgreementExerciseProject->contrato_id = $lastAgreementExerciseProject->contrato_id;
                $newAgreementExerciseProject->partida_id = $lastAgreementExerciseProject->partida_id;
                $newAgreementExerciseProject->escenario = 1;
                $newAgreementExerciseProject->cerrado = 0;
                $newAgreementExerciseProject->seleccionado = 0;
                $newAgreementExerciseProject->importe = $lastAgreementExerciseProject->importe;
                $newAgreementExerciseProject->save();
    
                $lastDetailAgreementProject = DetalleContrato::where('contrato_ejercicio_proyecto_id', $lastAgreementExerciseProject->id)->first();
    
                if ($lastDetailAgreementProject) {
                    $newDetailAgreement = new DetalleContrato();
                    $newDetailAgreement->contrato_ejercicio_id = $newAgreementExerciseProject->id;
                    $newDetailAgreement->cantidad = $lastDetailAgreementProject->cantidad;
                    $newDetailAgreement->costo_unitario = $lastDetailAgreementProject->costo_unitario;
                    $newDetailAgreement->unidad_medida_id = $lastDetailAgreementProject->unidad_medida_id;
                    $newDetailAgreement->save();
                }
    
                $lastAgreementsExecutions = ContratoEjecucion::where('contrato_ejercicio_proyecto_id', $lastAgreementExerciseProject->id)->get();
    
                if ($lastAgreementsExecutions) {
                    foreach ($lastAgreementsExecutions as $lastAgreementExecution) {
                        $newAgreementExecution = new ContratoEjecucion();
                        $newAgreementExecution->contrato_ejercicio_id = $newAgreementExerciseProject->id;
                        $newAgreementExecution->mes_id = $lastAgreementExecution->mes_id;
                        $newAgreementExecution->costo = $lastAgreementExecution->costo;
                        $newAgreementExecution->save();
                    }
                }
            }
        }

        return response()->json($exercise, Response::HTTP_CREATED);
    }

    public function scenario(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $lastScenario = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->max('contrato_ejercicio_proyecto.escenario');

        $newNumberScenario = $lastScenario + 1;

        $firstScenarios = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', 1)
            ->get();

        foreach ($firstScenarios as $firstScenario) {
            $newScenario = new ContratoEjercicioProyecto();
            $newScenario->contrato_id = $firstScenario->contrato_id;
            $newScenario->ejercicio_proyecto_id = $firstScenario->ejercicio_proyecto_id;
            $newScenario->partida_id = $firstScenario->partida_id;
            $newScenario->escenario = $newNumberScenario;
            $newScenario->cerrado = 0;
            $newScenario->seleccionado = 0;
            $newScenario->importe = $firstScenario->importe;
            $newScenario->save();

            $executionFirstScenario = ContratoEjecucion::where('contrato_ejercicio_proyecto_id', $firstScenario->id)->get();

            foreach ($executionFirstScenario as $execution) {
                $newExecution = new ContratoEjecucion();
                $newExecution->contrato_ejercicio_proyecto_id = $newScenario->id;
                $newExecution->mes_id = $execution->mes_id;
                $newExecution->costo = $execution->costo;
                $newExecution->save();
            }
        }

        return response()->json($exercise, Response::HTTP_CREATED);
    }

    private function getAgreements($exercise, $scenario, $managers)
    {
        if (count($managers) == 0) {
            $result = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->get();            
            return $result;
        }

        $result = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->join('proyectos', 'ejercicio_proyecto.proyecto_id','=','proyectos.id')
            ->join('responsables_operativos','proyectos.responsable_operativo_id','=','responsables_operativos.id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', $scenario)
            ->whereIn('responsables_operativos.id', $managers)
            ->get();

        return $result;
    }

    public function closeAgreements(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        $result = $this->getAgreements($exercise, $scenario, $responsablesOperativos);

        // return response()->json($result, Response::HTTP_CREATED);

        foreach ($result as $agreement) {
            $agreementExercise = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->where('contrato_ejercicio_proyecto.contrato_id', $agreement->contrato_id)
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->first();
            $agreementExercise->cerrado = 1;
            $agreementExercise->save();
        }

        return response()->json(['mensaje' => 'Los contratos fueron cerrados correctamente'], Response::HTTP_CREATED);
    }

    public function openAgreements(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        $result = $this->getAgreements($exercise, $scenario, $responsablesOperativos);

        foreach ($result as $agreement) {
            $agreementExercise = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->where('contrato_ejercicio_proyecto.contrato_id', $agreement->contrato_id)
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->first();
            $agreementExercise->cerrado = 0;
            $agreementExercise->save();
        }

        return response()->json(['mensaje' => 'Los contratos fueron abiertos correctamente'], Response::HTTP_CREATED);
    }

    public function selectAgreement(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $responsablesOperativos = json_decode($request->header('Responsables'), true);

        $result = $this->getAgreements($exercise, $scenario, $responsablesOperativos);

        foreach ($result as $agreement) {
            $agreementExercise = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->where('contrato_ejercicio_proyecto.contrato_id', $agreement->contrato_id)
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->first();
            $agreementExercise->seleccionado = 1;
            $agreementExercise->save();
        }

        return response()->json(['mensaje' => 'Los contratos fueron abiertos correctamente'], Response::HTTP_CREATED);
    }
}
