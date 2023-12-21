<?php

namespace App\Http\Controllers\Api\v1\Contratos;

use App\Http\Controllers\Controller;
use App\Exports\ContratosImportacion;
use App\Imports\AgreementImport;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
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

    public function downloadTemplate()
    {
        $exporter = new ContratosImportacion();

        return $exporter->download("plantillaContratos.xlsx");
    }
}
