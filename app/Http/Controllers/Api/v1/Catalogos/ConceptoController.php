<?php

namespace App\Http\Controllers\Api\v1\Catalogos;

use App\Http\Controllers\Controller;
use App\Models\Concepto;
use App\Models\ConceptoPartidaCapitulo;
use App\Models\ConceptoUnidadMedidaAnteproyecto;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ConceptoController extends Controller
{
    public function index()
    {
        $concepts = Concepto::with('capitulo')->get();

        // return response()->json($concepts, Response::HTTP_OK);
        $formattedConcepts = $concepts->map(function ($concept) {
            return [
                'id' => $concept->id,
                'descripcion' => $concept->descripcion,
                'numero' => $concept->numero,
                'capitulo' => $concept->capitulo->capitulo
            ];
        })->values()->toArray();
        return response()->json($formattedConcepts, Response::HTTP_OK);
    }

    public function show($id)
    {
        $concept = Concepto::find($id);

        if ($concept) return response($concept, Response::HTTP_OK);

        return response(["message" => "Concepto no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'capitulo_id' => 'required|exists:capitulos,id',
            'numero' => 'required',
            'descripcion' => 'required'
        ]);

        $concept = new Concepto();
        $concept->fill($request->all());
        $concept->save();

        return response()->json($concept, Response::HTTP_CREATED);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'capitulo_id' => 'required|exists:capitulos,id',
            'numero' => 'required',
            'descripcion' => 'required'
        ]);

        $dbConcept = Concepto::find($id);

        if (!$dbConcept) {
            return response(["message" => "Concepto no encontrado"], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $dbConcept->fill($request->all());
        $dbConcept->save();

        return response($dbConcept, Response::HTTP_OK);
    }
}
