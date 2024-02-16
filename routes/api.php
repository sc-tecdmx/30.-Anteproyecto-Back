<?php

use App\Http\Controllers\Api\v1\Autenticacion\AutenticacionController;
use App\Http\Controllers\Api\v1\Catalogos\CapituloController;
use App\Http\Controllers\Api\v1\Catalogos\ConceptoController;
use App\Http\Controllers\Api\v1\Catalogos\MesController;
use App\Http\Controllers\Api\v1\Catalogos\PartidaCapituloController;
use App\Http\Controllers\Api\v1\Catalogos\PartidaController;
use App\Http\Controllers\Api\v1\Catalogos\UnidadMedidaController;
use App\Http\Controllers\Api\v1\CatalogosPOA\AreaController;
use App\Http\Controllers\Api\v1\CatalogosPOA\EjercicioController;
use App\Http\Controllers\Api\v1\CatalogosPOA\ProgramaController;
use App\Http\Controllers\Api\v1\CatalogosPOA\ProyectoController;
use App\Http\Controllers\Api\v1\CatalogosPOA\ResponsableOperativoController;
use App\Http\Controllers\Api\v1\CatalogosPOA\RolController;
use App\Http\Controllers\Api\v1\CatalogosPOA\SubprogramaController;
use App\Http\Controllers\Api\v1\CatalogosPOA\UnidadResponsableGastoController;
use App\Http\Controllers\Api\v1\Configuracion\ConfiguracionController;
use App\Http\Controllers\Api\v1\Contratos\ContratoController;
use App\Http\Controllers\Api\v1\Contratos\ImportController;
use App\Http\Controllers\Api\v1\Contratos\ReporteContratoController;
use App\Http\Controllers\Api\v1\DashboardController;
use App\Http\Controllers\Api\v1\Logica\AnteproyectoController;
use App\Http\Controllers\Api\v1\Usuarios\UsuarioController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/* Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
}); */

Route::group(['prefix' => 'v1/', 'namespace' => 'Api'], function () {
    Route::post('/registro', [AutenticacionController::class, 'register']);
    Route::post('/login', [AutenticacionController::class, 'login']);
    Route::post('/logout', [AutenticacionController::class, 'logout']);

    Route::prefix('dashboard')->group(function () {
        Route::get('/', [DashboardController::class, 'index']);
        Route::get('/urgs', [DashboardController::class, 'urgCost']);
        Route::get('/meses', [DashboardController::class, 'monthCost']);
        Route::get('/programas', [DashboardController::class, 'programCost']);
        Route::get('/capitulos', [DashboardController::class, 'chapterCost']);
        Route::get('/capitulos/{id}', [DashboardController::class, 'getChaptersCost']);
    });

    Route::prefix('ejercicios')->group(function () {
        Route::get('/', [EjercicioController::class, 'index']);
        Route::get('/activos', [EjercicioController::class, 'anteproyecto']);
        Route::get('/{id}', [EjercicioController::class, 'show']);
        Route::get('/{id}/activar', [EjercicioController::class, 'activate']);
        Route::get('/{id}/desactivar', [EjercicioController::class, 'deactivate']);
        Route::get('/{id}/escenarios', [EjercicioController::class, 'scenarios']);
        Route::post('/', [EjercicioController::class, 'store']);
    });

    Route::prefix('partidas')->group(function () {
        Route::get('/', [PartidaController::class, 'index']);
        Route::get('/{id}', [PartidaController::class, 'show']);
        Route::post('/', [PartidaController::class, 'store']);
    });

    Route::prefix('unidades-medida')->group(function () {
        Route::get('/', [UnidadMedidaController::class, 'index']);
        Route::get('/{id}', [UnidadMedidaController::class, 'show']);
        Route::post('/', [UnidadMedidaController::class, 'store']);
    });

    Route::prefix('capitulos')->group(function () {
        Route::get('/', [CapituloController::class, 'index']);
        Route::get('/{id}', [CapituloController::class, 'show']);
        Route::post('/', [CapituloController::class, 'store']);
    });

    Route::prefix('capitulos-partidas')->group(function () {
        Route::get('/', [PartidaCapituloController::class, 'index']);
        Route::get('/{id}', [PartidaCapituloController::class, 'show']);
        Route::get('/detalle/{id}', [PartidaCapituloController::class, 'partidaCapitulo']);
        Route::post('/', [PartidaCapituloController::class, 'store']);
    });

    Route::prefix('conceptos')->group(function () {
        Route::get('/', [ConceptoController::class, 'index']);
        Route::get('/{id}', [ConceptoController::class, 'show']);
        Route::post('/', [ConceptoController::class, 'store']);
    });

    Route::prefix('meses')->group(function () {
        Route::get('/', [MesController::class, 'index']);
        Route::get('/{id}', [MesController::class, 'show']);
        Route::post('/', [MesController::class, 'store']);
    });

    Route::prefix('unidades-responsables-gastos')->group(function () {
        Route::get('/', [UnidadResponsableGastoController::class, 'index']);
        Route::get('/cerrada', [UnidadResponsableGastoController::class, 'closed']);
        Route::get('/{id}', [UnidadResponsableGastoController::class, 'show']);
        Route::post('/', [UnidadResponsableGastoController::class, 'store']);
        Route::post('/{id}/estatus', [UnidadResponsableGastoController::class, 'updateState']);
    });

    Route::prefix('programas')->group(function () {
        Route::get('/', [ProgramaController::class, 'index']);
        Route::get('/{id}', [ProgramaController::class, 'show']);
        Route::post('/', [ProgramaController::class, 'store']);
    });

    Route::prefix('subprogramas')->group(function () {
        Route::get('/', [SubprogramaController::class, 'index']);
        Route::get('/{id}', [SubprogramaController::class, 'show']);
        Route::post('/', [SubprogramaController::class, 'store']);
    });

    Route::prefix('responsables-operativos')->group(function () {
        Route::get('/', [ResponsableOperativoController::class, 'index']);
        Route::get('/{id}', [ResponsableOperativoController::class, 'show']);
        Route::post('/', [ResponsableOperativoController::class, 'store']);
    });

    Route::prefix('areas')->group(function () {
        Route::get('/', [AreaController::class, 'index']);
        Route::get('/{id}', [AreaController::class, 'show']);
        Route::post('/', [AreaController::class, 'store']);
    });

    Route::prefix('proyectos')->group(function () {
        Route::get('/', [ProyectoController::class, 'index']);
        Route::get('/{id}', [ProyectoController::class, 'show']);
        Route::post('/', [ProyectoController::class, 'store']);
    });

    Route::prefix('contratos')->group(function () {
        Route::get('/', [ContratoController::class, 'index']);
        Route::get('/claves-programaticas', [ContratoController::class, 'programaticKeys']);
        Route::get('/plantilla', [ImportController::class, 'downloadTemplate']);
        Route::get('/{id}', [ContratoController::class, 'show']);
        Route::get('/{id}/ejecucion', [ContratoController::class, 'months']);
        Route::get('/{id}/seleccionar', [ContratoController::class, 'select']);
        Route::get('/{id}/aprobar', [ContratoController::class, 'approve']);
        Route::get('/{id}/ejecucion/meses', [ContratoController::class, 'freeMonths']);
        Route::get('/{id}/total', [ContratoController::class, 'total']);
        Route::get('/ejecucion/{id}', [ContratoController::class, 'showExecution']);
        Route::post('/', [ContratoController::class, 'store']);
        Route::post('/importar', [ImportController::class, 'importExcel']);
        Route::post('/{id}/detalle', [ContratoController::class, 'detail']);
        Route::post('/{id}/version', [ContratoController::class, 'version']);
        Route::put('/{id}', [ContratoController::class, 'update']);
        Route::put('/{id}/ejecucion', [ContratoController::class, 'execute']);
        Route::put('/{id}/detalle', [ContratoController::class, 'updateDetail']);
        Route::put('/versiones/{id}/', [ContratoController::class, 'updateVersion']);
        Route::put('/ejecucion/{id}', [ContratoController::class, 'updateExecution']);
    });

    Route::prefix('anteproyecto')->group(function () {
        Route::get('/', [AnteproyectoController::class, 'index']);
        Route::get('/{id}', [AnteproyectoController::class, 'contratos']);
    });

    Route::prefix('usuarios')->group(function () {
        Route::get('/', [UsuarioController::class, 'index']);
        Route::get('/{id}', [UsuarioController::class, 'show']);
        Route::post('/', [UsuarioController::class, 'store']);
        Route::post('/{id}', [UsuarioController::class, 'assign']);
        Route::put('/{id}', [UsuarioController::class, 'update']);
    });

    Route::prefix('roles')->group(function () {
        Route::get('/', [RolController::class, 'index']);
    });

    Route::prefix('reportes')->group(function () {
        Route::get('/contratos', [ContratoController::class, 'export']);
        Route::get('/contratos/ejecucion', [AnteproyectoController::class, 'export']);
        Route::get('/contratos/capitulos', [ReporteContratoController::class, 'chapters']);
        Route::get('/contratos/capitulos-conceptos', [ReporteContratoController::class, 'chapterConcept']);
        Route::get('/contratos/partidas', [ReporteContratoController::class, 'agreementSplit']);
        Route::get('/contratos/proyectos', [ReporteContratoController::class, 'agreementProject']);
    });

    Route::prefix('configuracion')->group(function () {
        Route::get('/escenario', [ConfiguracionController::class, 'scenario']);
        Route::get('/ejercicio', [ConfiguracionController::class, 'newExcercise']);
        Route::get('/cerrar', [ConfiguracionController::class, 'closeAgreements']);
        Route::post('/activar', [ConfiguracionController::class, 'activeExercise']);
    });

    Route::group(['middleware' => ['auth:sanctum']], function () {
    });
});

