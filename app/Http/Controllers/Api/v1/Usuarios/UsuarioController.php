<?php

namespace App\Http\Controllers\Api\v1\Usuarios;

use App\Http\Controllers\Controller;
use App\Models\AreaUsuario;
use App\Models\ResponsableOperativo;
use App\Models\ResponsableOperativoUsuario;
use App\Models\RolUsuario;
use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;

class UsuarioController extends Controller
{
    public function index()
    {
        $users = Usuario::with('rol', 'area')->get();

        $formattedUsers = $users->map(function ($user) {
            return [
                'id' => $user->id,
                'nombre' => $user->nombre,
                'apellido_paterno' => $user->apellido_paterno,
                'apellido_materno' => $user->apellido_materno,
                'usuario' => $user->usuario,
                'email' => $user->email,
                'rol' => $user->rol->descripcion,
                'area' => $user->area->nombre
            ];
        })->values()->toArray();

        return response()->json($formattedUsers, Response::HTTP_OK);
    }

    public function show($id)
    {
        $user = Usuario::with('roles', 'areas', 'responsablesOperativos')->find($id);

        if ($user) {
            return response()->json($user, Response::HTTP_OK);
        }

        return response(["message" => "Usuario no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request) 
    {
        // validación de datos
        $request->validate([
            'nombre' => 'required',
            'apellido_paterno' => 'required',
            'genero' => 'required',
            'usuario' => 'required',
            'password' => 'required',
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
        $user->foto = $request->foto ?? '';
        $user->email = $request->email;
        $user->rol_id = $request->rol_id;
        $user->area_id = $request->area_id;
        $user->save();

        return response()->json($user, Response::HTTP_CREATED);
    }

    public function update($id, Request $request){
        // validación de datos
        $request->validate([
            'nombre' => 'required',
            'apellido_paterno' => 'required',
            'genero' => 'required',
            'usuario' => 'required',
            // 'password' => 'required',
            'email' => 'required|email',
            'rol_id' => 'required|exists:roles,id',
            'area_id' => 'required|exists:areas,id'
        ]);

        $dbUser = Usuario::find($id);

        if (!$dbUser) {
            return response(["message" => "Usuario no encontrado"], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $dbUser->nombre = $request->nombre;
        $dbUser->apellido_paterno = $request->apellido_paterno;
        $dbUser->apellido_materno = $request->apellido_materno;
        $dbUser->genero = $request->genero;
        $dbUser->usuario = $request->usuario;

        if ($request->password != '') {
            $dbUser->password = Hash::make($request->password);
        }

        $dbUser->foto = $request->foto ?? '';
        $dbUser->email = $request->email;
        $dbUser->rol_id = $request->rol_id;
        $dbUser->area_id = $request->area_id;
        $dbUser->save();

        return response()->json($dbUser, Response::HTTP_OK);
    }

    public function assign($id, Request $request)
    {
        $request->validate([
            'responsables.*' => 'required|exists:responsables_operativos,id'
        ]);

        $user = Usuario::find($id);

        if ($user) {
            $responsables = json_decode($request->responsables);

            $ros = ResponsableOperativoUsuario::where('usuario_id', $id)->get();

            if ($ros) {
                $ros->each->delete();
            }

            foreach ($responsables as $responsable) {
                $search = ResponsableOperativoUsuario::where('responsable_operativo_id', $responsable)->where('usuario_id', $id)->first();

                if(!$search) {
                    $ro = new ResponsableOperativoUsuario();
                    $ro->responsable_operativo_id = $responsable;
                    $ro->usuario_id = $id;
                    $ro->save();
                }
            }

            return response()->json(["message" => 'Responsables Operativos asignados correctamente'], Response::HTTP_OK);
        }

        return response(["message" => "Usuario no encontrado"], Response::HTTP_NO_CONTENT);
    }
}
