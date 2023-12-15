<?php

namespace App\Http\Controllers\Api\v1\Catalogos;

use App\Http\Controllers\Controller;
use App\Models\CapituloPartida;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class PartidaCapituloController extends Controller
{
    public function index()
    {
        $splits = CapituloPartida::get();

        return response()->json($splits, Response::HTTP_OK);
    }

    public function show($id)
    {
        $split = CapituloPartida::find($id);

        if ($split) return response($split, Response::HTTP_OK);

        return response(["message" => "Partida - capítulo no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'partida_id' => 'required',
            'capitulo_id' => 'required',
            'numero' => 'required',
            'descripcion' => 'required'
        ]);

        $usedChapter = CapituloPartida::where('partida_id', $request->partida_id)->get();

        if ($usedChapter->isNotEmpty() && $usedChapter[0]->capitulo_id !== $request->capitulo_id) {
            return response()->json(["message" => "No se puede asignar la partida a un capítulo diferente"], Response::HTTP_CONFLICT);
        }

        $chapterSplit = new CapituloPartida();
        $chapterSplit->fill($request->all());
        $chapterSplit->save();

        return response()->json($chapterSplit, Response::HTTP_CREATED);
    }

    public function partidaCapitulo($id)
    {
        $splits = CapituloPartida::with('capitulos')->where('partida_id', $id)->get();

        return response()->json($splits, Response::HTTP_OK);
    }
}
