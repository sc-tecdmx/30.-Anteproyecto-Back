<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\Area;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AreaController extends Controller
{
    public function index()
    {
        $areas = Area::get();

        return response()->json($areas, Response::HTTP_OK);
    }

    public function show($id)
    {
        $area = Area::find($id);

        if ($area) return response($area, Response::HTTP_OK);

        return response(["message" => "Área no encontrada"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required',
            'descripcion' => 'required'
        ]);

        $area = new Area();
        $area->fill($request->all());
        $area->save();

        return response($area, Response::HTTP_CREATED);
    }
}
