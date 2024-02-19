<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\ContratoEjercicioProyecto;
use App\Models\UnidadResponsableGasto;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;

class UnidadResponsableGastoController extends Controller
{
    public function index()
    {
        $units = UnidadResponsableGasto::get();

        return response()->json($units, Response::HTTP_OK);
    }

    public function show($id)
    {
        $unit = UnidadResponsableGasto::find($id);

        if ($unit) return response($unit, Response::HTTP_OK);

        return response(["message" => "Unidad responsable de gasto no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'numero' => 'required',
            'nombre' => 'required'
        ]);

        $unit = new UnidadResponsableGasto();
        $unit->fill($request->all());
        $unit->save();

        return response($unit, Response::HTTP_CREATED);
    }

    public function closed(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $urgs = UnidadResponsableGasto::get();

        $data = [];

        foreach($urgs as $urg) {
            $agrements = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->join('proyectos','ejercicio_proyecto.proyecto_id','=','proyectos.id')
                ->join('responsables_operativos','proyectos.responsable_operativo_id','=','responsables_operativos.id')
                ->join('unidades_responsables_gastos','responsables_operativos.unidad_responsable_gasto_id','=','unidades_responsables_gastos.id')
                ->join('contratos', 'contrato_ejercicio_proyecto.contrato_id','=','contratos.id')
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('contrato_ejercicio_proyecto.cerrado', 1)
                ->where('unidades_responsables_gastos.id', $urg->id)
                ->get();
            if (!$agrements->isEmpty()) {
                $data[] = [
                    'id' => $urg->id,
                    'numero' => $urg->numero,
                    'nombre' => $urg->nombre,
                    'cerrado' => 1
                ];
            } else {
                $data[] = [
                    'id' => $urg->id,
                    'numero' => $urg->numero,
                    'nombre' => $urg->nombre,
                    'cerrado' => 0
                ];
            }
        }

        return response($data, Response::HTTP_OK);
    }

    public function updateState(Request $request, $id)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $agrements = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
            ->join('proyectos','ejercicio_proyecto.proyecto_id','=','proyectos.id')
            ->join('responsables_operativos','proyectos.responsable_operativo_id','=','responsables_operativos.id')
            ->join('unidades_responsables_gastos','responsables_operativos.unidad_responsable_gasto_id','=','unidades_responsables_gastos.id')
            ->join('contratos', 'contrato_ejercicio_proyecto.contrato_id','=','contratos.id')
            ->where('ejercicio_proyecto.ejercicio_id', $exercise)
            ->where('contrato_ejercicio_proyecto.escenario', $scenario)
            ->where('unidades_responsables_gastos.id', $id)
            ->get();
        
        foreach ($agrements as $agreement) {
            $agreement = ContratoEjercicioProyecto::join('ejercicio_proyecto','contrato_ejercicio_proyecto.ejercicio_proyecto_id','=','ejercicio_proyecto.id')
                ->where('ejercicio_proyecto.ejercicio_id', $exercise)
                ->where('contrato_ejercicio_proyecto.escenario', $scenario)
                ->where('contrato_ejercicio_proyecto.id', $agreement->id)
                ->first();
            $agreement->cerrado = $request->state;
            $agreement->save();
        }

        return response(['message' => 'La URG ha sido actualizada correctamente'], Response::HTTP_OK);
    }
}
