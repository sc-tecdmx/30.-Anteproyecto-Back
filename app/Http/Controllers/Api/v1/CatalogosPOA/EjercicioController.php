<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\ContratoEjercicioProyecto;
use App\Models\Ejercicio;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EjercicioController extends Controller
{
    public function index()
    {
        $exercises = Ejercicio::get();

        return response()->json($exercises);
    }

    public function show($id)
    {
        $exercise = Ejercicio::find($id);

        if ($exercise) return response($exercise, Response::HTTP_OK);

        return response(["message" => "Ejercicio no encontrado"], Response::HTTP_UNPROCESSABLE_ENTITY);
    }

    public function store(Request $request)
    {
        $request->validate([
            'ejercicio' => 'required',
            'permitir_edicion_seguimiento' => 'required',
            'permitir_edicion_seguimiento_derechos_humanos' => 'required',
            'permitir_edicion_elaboracion' => 'required'
        ]);

        $exercise = new Ejercicio();
        $exercise->fill($request->all());
        $exercise->save();

        return response($exercise, Response::HTTP_CREATED);
    }

    public function anteproyecto()
    {
        $exercises = Ejercicio::where('activo_anteproyecto', true)->get();
        return response()->json($exercises, Response::HTTP_OK);
    }

    public function activate($id)
    {
        $exercise = Ejercicio::find($id);

        if (!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $exercise->activo_anteproyecto = 1;
        $exercise->save();

        return response($exercise, Response::HTTP_CREATED);
    }

    public function deactivate($id)
    {
        $exercise = Ejercicio::find($id);

        if (!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $exercise->activo_anteproyecto = 0;
        $exercise->save();

        return response($exercise, Response::HTTP_CREATED);
    }

    public function scenarios($id)
    {
        $scenarios = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->where('ejercicio_proyecto.ejercicio_id', $id)
            ->select('escenario')
            ->distinct()
            ->get();

        if(!$scenarios) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        return response()->json($scenarios, Response::HTTP_OK);
    }

    /* public function configure(Request $request)
    {
        $request->validate([
            'exercise' => 'required'
        ]);

        $lastExercise = strval(intval($request->exercise) - 1);
        
        $previousExercise = Exercise::where('exercise', $lastExercise)->first();

        if (!$previousExercise) return response(["message" => "Ejercicio no encontrado"], Response::HTTP_NO_CONTENT);

        $exercise = new Exercise();
        $exercise->fill($request->all());
        $exercise->save();

        // TODO: Validación de los ultimos valores en las tablas intermedias para no hacer la copia de todos los datos
        // Get measurements values
        $measurements = MeasurementUnitExercise::where('exercise_id', $previousExercise->id)->get();

        foreach ($measurements as $measurement) {
            $newMeasurement = new MeasurementUnitExercise();
            $newMeasurement->exercise_id = $exercise->id;
            $newMeasurement->measurement_unit_id = $measurement->measurement_unit_id;
            $newMeasurement->save();
        }

        // Get split values
        $splits = SplitExercise::where('exercise_id', $previousExercise->id)->get();

        foreach ($splits as $split) {
            $newSplit = new SplitExercise();
            $newSplit->exercise_id = $exercise->id;
            $newSplit->split_id = $split->split_id;
            $newSplit->save();
        }

        // Get unit responsible spending
        $units = UnitResponsibleSpendingExercise::where('exercise_id', $previousExercise->id)->get();

        foreach ($units as $unit) {
            $newUnit = new MeasurementUnitExercise();
            $newUnit->exercise_id = $exercise->id;
            $newUnit->unit_responsible_spending_id = $unit->unit_responsible_spending_id;
            $newUnit->save();
        }

        // Get concepts
        $concepts = ConceptExercise::where('exercise_id', $previousExercise->id)->get();

        foreach ($concepts as $concept) {
            $newConcept = new MeasurementUnitExercise();
            $newConcept->exercise_id = $exercise->id;
            $newConcept->concept_id = $concept->concept_id;
            $newConcept->save();
        }

        // Get services
    } */
}
