<?php

namespace App\Http\Controllers\Api\v1\Catalogos;

use App\Http\Controllers\Controller;
use App\Models\Mes;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class MesController extends Controller
{
    public function index()
    {
        $months = Mes::get();

        return response()->json($months, Response::HTTP_OK);
    }

    public function show($id)
    {
        $month = Mes::find($id);

        if ($month) return response($month, Response::HTTP_OK);

        return response(["message" => "Mes no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'description' => 'required',
            'abreviatura' => 'required'
        ]);

        $month = new Mes();
        $month->fill($request->all());
        $month->save();

        return response($month, Response::HTTP_CREATED);
    }
}
