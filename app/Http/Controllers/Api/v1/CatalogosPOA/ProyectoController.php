<?php

namespace App\Http\Controllers\Api\v1\CatalogosPOA;

use App\Http\Controllers\Controller;
use App\Models\Proyecto;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;

class ProyectoController extends Controller
{
    public function index()
    {
        $projects = Proyecto::with('subprogramas','responsablesOperativos','subprogramas.programas')->get();

        return response()->json($projects, Response::HTTP_OK);
    }

    public function show($id)
    {
        $project = Proyecto::find($id);

        if ($project) return response($project, Response::HTTP_OK);

        return response(["message" => "Proyecto no encontrado"], Response::HTTP_NO_CONTENT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'responsable_operativo_id' => 'required|exists:responsables_operativos,id',
            'subprograma_id' => 'required|exists:subprogramas,id',
            'numero' => 'required',
            'nombre' => 'required',
            'tipo' => 'required',
            'version' => 'required',
            'objetivo' => 'required',
            'justificacion' => 'required',
            'descripcion' => 'required',
            'fecha' => 'required',
            'nombre_responsable_operativo' => 'required',
            'cargo_responsable_operativo' => 'required',
            'nombre_titular' => 'required',
            'responsable_ficha' => 'required',
            'autorizado_por' => 'required',
            'status' => 'required'
        ]);

        $project = new Proyecto();
        $project->fill($request->all());
        $project->save();

        return response($project, Response::HTTP_CREATED);
    }

    public function budget()
    {
        try {
            $query  = 'SELECT proyectos.nombre as project, SUM(contratos.costo_total) as total_cost
            FROM proyectos
            INNER JOIN contratos ON contratos.project_id = projects.id
            GROUP BY projects.id;';
    
            $result = DB::select(DB::raw($query));
            //dd($resutl);
    
            return response()->json($result, Response::HTTP_OK);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
