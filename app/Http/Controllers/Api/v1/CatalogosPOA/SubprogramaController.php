<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\Subprograma;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SubprogramaController extends Controller
{
    public function index()
    {
        $subprograms = Subprograma::with('programas')->get();

        return response()->json($subprograms, Response::HTTP_OK);
    }

    public function show($id)
    {
        $subprogram = Subprograma::find($id);

        if ($subprogram) return response($subprogram, Response::HTTP_OK);

        return response(["message" => "Subprograma no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'programa_id' => 'required|exists:programas,id',
            'numero' => 'required',
            'nombre' => 'required'
        ]);

        $subprogram = new Subprograma();
        $subprogram->fill($request->all());
        $subprogram->save();

        return response($subprogram, Response::HTTP_CREATED);
    }
}
