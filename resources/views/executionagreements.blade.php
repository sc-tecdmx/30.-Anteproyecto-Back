<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contratos</title>

    <style>
        table {
            width: 95%;
            border-collapse: collapse;
            margin: 50px auto;
        }

        tr:nth-of-type(odd) {
            background: #eee;
        }

        /* th {
            background: #3498db;
            color: white;
            font-weight: bold;
        } */

        td, th {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th colspan="15" style="font-weight: bold; font-size: 12px; text-align: center;">
                    <div style="width: 40%;">
                        <img src="{{ public_path('images/TECDMX-Imagen-_400px.png') }}" width="100%" alt="" style="display:block; margin: auto;">
                    </div>
                    <div style="width: 60%;">
                        <p>TRIBUNAL ELECTORAL DE LA CIUDAD DE MÉXICO</p>
                        <p>SISTEMA ANTEPROYECTO</p>
                        <p>EJECUCIÓN DE CONTRATOS</p>
                    </div>
                </th>
            </tr>
            <tr style="background-color: #000000; color: white;">
                <th style="font-weight: bold; text-align: center;">Clave programática</th>
                <th style="font-weight: bold; text-align: center;">Partida</th>
                <th style="font-weight: bold; text-align: center;">Concepto</th>                
                <th style="font-weight: bold; text-align: center;">Descripcion</th>
                <th style="font-weight: bold; text-align: center;">Tipo</th>
                <th style="font-weight: bold; text-align: center;">Parcialidad</th>
                <th style="font-weight: bold; text-align: center;">Suma de Costo Total</th>
                <th style="font-weight: bold; text-align: center;">Suma de ENERO</th>
                <th style="font-weight: bold; text-align: center;">Suma de FEBRERO</th>
                <th style="font-weight: bold; text-align: center;">Suma de MARZO</th>
                <th style="font-weight: bold; text-align: center;">Suma de ABRIL</th>
                <th style="font-weight: bold; text-align: center;">Suma de MAYO</th>
                <th style="font-weight: bold; text-align: center;">Suma de JUNIO</th>
                <th style="font-weight: bold; text-align: center;">Suma de JULIO</th>
                <th style="font-weight: bold; text-align: center;">Suma de AGOSTO</th>
                <th style="font-weight: bold; text-align: center;">Suma de SEPTIEMBRE</th>
                <th style="font-weight: bold; text-align: center;">Suma de OCTUBRE</th>
                <th style="font-weight: bold; text-align: center;">Suma de NOVIEMBRE</th>
                <th style="font-weight: bold; text-align: center;">Suma de DICIEMBRE</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($agreements as $agreement)
                <tr>
                    <td data-column="clave" style="text-align: center;">{{ $agreement['clave']; }}</td>
                    <td data-column="partida" style="text-align: center;">{{ $agreement['partida'] }}</td>
                    <td data-column="concepto" style="text-align: center;">{{ $agreement['concepto'] }}</td>
                    <td data-column="descripcion">{{ $agreement['descripcion'] }}</td>
                    <td data-column="tipo" style="text-align: center;">{{ $agreement['tipo'] }}</td>
                    <td data-column="parcialidad">{{ $agreement['parcialidad'] }}</td>
                    <td data-column="importe">${{ number_format($agreement['importe'], 2) }}</td>
                    <td data-column="ene">${{ number_format($agreement['ene'], 2) }}</td>
                    <td data-column="feb">${{ number_format($agreement['feb'], 2) }}</td>
                    <td data-column="mar">${{ number_format($agreement['mar'], 2) }}</td>
                    <td data-column="abr">${{ number_format($agreement['abr'], 2) }}</td>
                    <td data-column="may">${{ number_format($agreement['may'], 2) }}</td>
                    <td data-column="jun">${{ number_format($agreement['jun'], 2) }}</td>
                    <td data-column="jul">${{ number_format($agreement['jul'], 2) }}</td>
                    <td data-column="ago">${{ number_format($agreement['ago'], 2) }}</td>
                    <td data-column="sep">${{ number_format($agreement['sep'], 2) }}</td>
                    <td data-column="oct">${{ number_format($agreement['oct'], 2) }}</td>
                    <td data-column="nov">${{ number_format($agreement['nov'], 2) }}</td>
                    <td data-column="dic">${{ number_format($agreement['dic'], 2) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>