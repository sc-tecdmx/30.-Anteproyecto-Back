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


class ImportController extends Controller
{
    public function importExcel(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);

        $file = $request->file('file');

        

        return redirect('/')->with('success', 'Datos importados correctamente');
    }
}
