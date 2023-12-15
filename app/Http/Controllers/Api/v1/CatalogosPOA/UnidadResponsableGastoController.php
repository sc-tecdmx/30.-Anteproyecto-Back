<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\UnidadResponsableGasto;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

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
}
