<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\ResponsableOperativo;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ResponsableOperativoController extends Controller
{
    public function index()
    {
        $operationals = ResponsableOperativo::get();

        return response()->json($operationals, Response::HTTP_OK);
    }

    public function show($id)
    {
        $operational = ResponsableOperativo::find($id);

        if ($operational) return response($operational, Response::HTTP_OK);

        return response(["message" => "Responsable operativo no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'unidad_responsable_gasto_id' => 'required',
            'numero' => 'required',
            'nombre' => 'required'
        ]);

        $operational = new ResponsableOperativo();
        $operational->fill($request->all());
        $operational->save();

        return response($operational, Response::HTTP_CREATED);
    }
}
