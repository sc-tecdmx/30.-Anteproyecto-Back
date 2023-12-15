<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\Rol;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RolController extends Controller
{
    public function index()
    {
        $roles = Rol::get();

        return response()->json($roles, Response::HTTP_OK);
    }

    public function show($id)
    {
        $rol = Rol::find($id);

        if ($rol) return response($rol, Response::HTTP_OK);

        return response(["message" => "Rol no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'descripcion' => 'required'
        ]);

        $rol = new Rol();
        $rol->fill($request->all());
        $rol->save();

        return response($rol, Response::HTTP_CREATED);
    }
}
