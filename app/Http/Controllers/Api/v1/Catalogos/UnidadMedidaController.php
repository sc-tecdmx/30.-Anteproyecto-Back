<?php

namespace App\Http\Controllers\Api\v1\Catalogos;

use App\Http\Controllers\Controller;
use App\Models\EjercicioUnidadMedida;
use App\Models\UnidadMedidaAnteproyecto;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class UnidadMedidaController extends Controller
{
    public function index()
    {
        $measurements = UnidadMedidaAnteproyecto::get();

        return response()->json($measurements, Response::HTTP_OK);
    }

    public function show($id)
    {
        $measurement = UnidadMedidaAnteproyecto::find($id);

        if ($measurement) return response($measurement, Response::HTTP_OK);

        return response(["message" => "Unidad de medida no encontrada"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'descripcion' => 'required'
        ]);

        $ejercicio = $request->header('ejercicio');

        if ($ejercicio) {
            $measurement = new UnidadMedidaAnteproyecto();
            $measurement->fill($request->all());
            $measurement->save();

            return response($measurement, Response::HTTP_CREATED);
        }

        return response(["message" => "No hay ejercicio para asociar"], Response::HTTP_NO_CONTENT);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'descripcion' => 'required'
        ]);

        $dbMeasurement = UnidadMedidaAnteproyecto::find($id);

        if (!$dbMeasurement) return response(["message" => "Unidad de medida no encontrada"], Response::HTTP_NO_CONTENT);

        // TODO: Actualización de tabla intermedia measurement_units_exercise
        $measurement = new UnidadMedidaAnteproyecto();
        $measurement->descripcion = $request->description;
        $measurement->parent_id = $dbMeasurement->id;
        $measurement->save();

        return response($measurement, Response::HTTP_OK);
    }
}
