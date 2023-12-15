<?php

namespace App\Http\Controllers\Api\v1\Autenticacion;

use App\Http\Controllers\Controller;
use App\Models\AreaUsuario;
use App\Models\RolUsuario;
use Illuminate\Http\Request;
use App\Models\Usuario;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;
use LDAP\Result;
use Symfony\Component\HttpFoundation\Response;

class AutenticacionController extends Controller
{
    public function register(Request $request) 
    {
        // validación de datos
        return $request->validate([
            'nombre' => 'required',
            'apellido_paterno' => 'required',
            'genero' => 'required',
            'usuario' => 'required',
            'password' => 'required|confirmed',
            'email' => 'required|email|unique:usuarios',
            'rol_id' => 'required|exists:roles,id',
            'area_id' => 'required|exists:areas,id'
        ]);

        // alta de usuario
        $user = new Usuario();
        $user->nombre = $request->nombre;
        $user->apellido_paterno = $request->apellido_paterno;
        $user->apellido_materno = $request->apellido_materno;
        $user->genero = $request->genero;
        $user->usuario = $request->usuario;
        $user->password = Hash::make($request->password);
        $user->foto = $request->foto;
        $user->email = $request->email;
        $user->save();

        $userRol = new RolUsuario();
        $userRol->rol_id = $request->rol_id;
        $userRol->usuario_id = $user->id;
        $userRol->save();

        $userArea = new AreaUsuario();
        $userArea->area_id = $request->area_id;
        $userArea->usuario_id = $user->id;
        $userArea->save();

        /* return response()->json([
            "message" => "El usuario ha sido registrado",
            "user" => $user
        ]); */

        return response()->json($user, Response::HTTP_CREATED);
    }

    public function username()
    {
        return 'usuario';
    }

    public function login(Request $request) 
    {
        $credentials = $request->validate([
            'username' => ['required'],
            'password' => ['required']
        ]);

        if (Auth::attempt(
            ['usuario' => $credentials['username'], 'password' => $credentials['password']],
            $request->filled('remember')
        )) {
            $user = Auth::user();
            $roles = $user->roles()->get();
            $formatedUser = [
                'id' => $user->id,
                'nombre' => $user->nombre,
                'apellido_paterno' => $user->apellido_paterno,
                'apellido_materno' => $user->apellido_materno,
                'usuario' => $user->usuario,
                'email' => $user->email,
                'rol' => $roles->isEmpty() ? null : $roles[0]->id,
            ]; 
            $responsablesIds = $user->responsablesOperativos->pluck('id')->toArray();
            $token = $user->createToken('token')->plainTextToken;
            $cookie = cookie('cookie_token', $token, 60 * 24);

            return response([
                "token" => $token,
                "user" => $formatedUser,
                "responsables" => $responsablesIds
            ], Response::HTTP_OK)->withCookie($cookie);
        }

        return response(["message" => "Credenciales Inválidas"], Response::HTTP_UNAUTHORIZED);
    }

    public function logout()
    {
        $cookie = Cookie::forget('cookie_token');
        return response(["message" => "Sesión cerrada"], Response::HTTP_OK)->withCookie($cookie);
    }
}
