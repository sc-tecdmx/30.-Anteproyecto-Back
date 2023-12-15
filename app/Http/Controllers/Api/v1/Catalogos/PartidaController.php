<?php

namespace App\Http\Controllers\Api\v1\Catalogos;

use App\Http\Controllers\Controller;
use App\Models\EjercicioPartida;
use App\Models\Partida;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class PartidaController extends Controller
{
    public function index()
    {
        $splits = Partida::with('concepto', 'concepto.capitulo')->get();

        $formattedSplits = $splits->map(function ($split) {
            return [
                'id' => $split->id,
                'descripcion' => $split->descripcion,
                'numero' => $split->numero,
                'concepto' => $split->concepto->numero,
                'capitulo' => $split->concepto->capitulo->capitulo
            ];
        })->values()->toArray();
        return response()->json($formattedSplits, Response::HTTP_OK);
    }

    public function show($id)
    {
        $split = Partida::find($id);

        if ($split) return response($split, Response::HTTP_OK);

        return response(["message" => "Partida no encontrada"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'concepto_id' => 'required|exists:conceptos,id',
            'descripcion' => 'required',
            'numero' => 'required'
        ]);

        $split = new Partida();
        $split->fill($request->all());
        $split->save();

        return response($split, Response::HTTP_CREATED);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'concepto_id' => 'required|exists:conceptos,id',
            'descripcion' => 'required',
            'numero' => 'required'
        ]);

        $dbSplit = Partida::find($id);

        if (!$dbSplit) return response(["message" => "Partida no encontrada"], Response::HTTP_NO_CONTENT);

        $dbSplit->fill($request->all());
        $dbSplit->save();

        return response($dbSplit, Response::HTTP_OK);
    }
}
