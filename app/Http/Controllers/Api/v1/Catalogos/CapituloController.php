<?php

namespace App\Http\Controllers\Api\v1\Catalogos;

use App\Http\Controllers\Controller;
use App\Models\Capitulo;
use App\Models\CapituloPartida;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;


class CapituloController extends Controller
{
    public function index()
    {
        $chapters = Capitulo::get();

        return response()->json($chapters, Response::HTTP_OK);
    }

    public function show($id)
    {
        $chapter = Capitulo::find($id);

        if ($chapter) return response($chapter, Response::HTTP_OK);

        return response(["message" => "Capítulo no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'capitulo' => 'required',
            'descripcion' => 'required'
        ]);

        $chapter = new Capitulo();
        $chapter->fill($request->all());
        $chapter->save();

        return response($chapter, Response::HTTP_CREATED);
    }
}
