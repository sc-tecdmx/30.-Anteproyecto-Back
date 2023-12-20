<?php

namespace App\Imports;

use App\Models\Contrato;
use App\Models\ContratoEjecucion;
use App\Models\ContratoEjercicio;
use App\Models\ContratoPartida;
use App\Models\Partida;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;

class AgreementImport implements ToModel, WithHeadingRow, WithValidation
{
    protected $exercise;
    protected $scenario;

    public function __construct($exercise, $scenario)
    {
        $this->exercise = $exercise;
        $this->scenario = $scenario;
    }

    function nombre_del_mes($numero_mes) {
        $meses = [
            1 => 'enero',
            2 => 'febrero',
            3 => 'marzo',
            4 => 'abril',
            5 => 'mayo',
            6 => 'junio',
            7 => 'julio',
            8 => 'agosto',
            9 => 'septiembre',
            10 => 'octubre',
            11 => 'noviembre',
            12 => 'diciembre',
        ];
    
        return $meses[$numero_mes] ?? null;
    }

    public function model(array $row)
    {
        $agreement = Contrato::create([
            'clave' => $row['clave'],
            'descripcion' => $row['descripcion'],
            'parcialidad' => $row['parcialidad'],
            'tipo' => $row['tipo']
        ]);

        $agreementExercise = ContratoEjercicio::create([
            'ejercicio_id' => $this->exercise,
            'contrato_id' => $agreement->id,
            'importe' => $row['importe'],
            'escenario' => $this->scenario,
            'cerrado' => 0,
            'seleccionado' => 0
        ]);

        $split = Partida::where('numero', $row['partida'])->first();

        $agreementSplit = ContratoPartida::create([
            'contrato_ejercicio_id' => $agreementExercise->id,
            'partida_id' => $split->id
        ]);

        for ($mes = 1; $mes <= 12; $mes++) {
            ContratoEjecucion::create([
                'contrato_ejercicio_id' => $agreementExercise->id,
                'mes_id' => $mes,
                'costo' => $row[$this->nombre_del_mes($mes)],
            ]);
        }

        return $agreement;
    }

    public function rules(): array
    {
        return [
            'clave' => 'required|min:10|max:10',
            'descripcion' => 'required',
            'parcialidad' => 'required',
            'tipo' => 'required',
            'importe' => 'required',
            'partida' => 'required',
            'enero' => 'required',
            'febrero' => 'required',
            'marzo' => 'required',
            'abril' => 'required',
            'mayo' => 'required',
            'junio' => 'required',
            'julio' => 'required',
            'agosto' => 'required',
            'septiembre' => 'required',
            'octubre' => 'required',
            'noviembre' => 'required',
            'diciembre' => 'required'
        ];
    }
}
