<?php

namespace App\Http\Controllers\Api\v1\Contratos;

use App\Http\Controllers\Controller;
use App\Models\Contrato;
use App\Models\ContratoEjecucion;
use App\Models\ContratoEjercicio;
use App\Models\ContratoPartida;
use App\Models\DetalleContrato;
use App\Exports\Contratos;
use App\Exports\ContratosVersiones;
use App\Imports\AgreementImport;
use App\Models\Mes;
use App\Models\Partida;
use App\Models\Programa;
use App\Models\Proyecto;
use App\Models\ResponsableOperativo;
use App\Models\Subprograma;
use App\Models\UnidadMedidaAnteproyecto;
use App\Models\UnidadResponsableGasto;
use App\Models\Version;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;


class ImportController extends Controller
{
    public function importExcel(Request $request)
    {
        $exercise = $request->header('ejercicio');

        if(!$exercise) return response(["message" => "No existe el ejercicio"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $scenario = $request->header('escenario');

        if(!$scenario) return response(["message" => "No existe el escenario"], Response::HTTP_UNPROCESSABLE_ENTITY);

        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);

        $file = $request->file('file');
        
        Excel::import(new AgreementImport($exercise, $scenario), $file);

        return response()->json(['mensaje' => 'La importación fue exitosa'], Response::HTTP_OK);
    }
}
