<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\Programa;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ProgramaController extends Controller
{
    public function index()
    {
        $programs = Programa::get();

        return response()->json($programs, Response::HTTP_OK);
    }

    public function show($id)
    {
        $program = Programa::find($id);
        
        if ($program) return response()->json([$program], $program);

        return response(["message" => "Programa no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'numero' => 'required',
            'nombre' => 'required'
        ]);

        $program = new Programa();
        $program->fil($request->all());
        $program->save();

        return response()->json([$program], Response::HTTP_CREATED);
    }
}
