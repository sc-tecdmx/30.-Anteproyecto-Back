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
                <th colspan="3" style="font-weight: bold; font-size: 12px; text-align: center;">
                    <div style="width: 40%;">
                        <img src="{{ public_path('images/TECDMX-Imagen-_400px.png') }}" width="100%" alt="" style="display:block; margin: auto;">
                    </div>
                    <div style="width: 60%;">
                        <p>TRIBUNAL ELECTORAL DE LA CIUDAD DE MÉXICO</p>
                        <p>SISTEMA ANTEPROYECTO</p>
                        <p>PARTIDAS</p>
                    </div>
                </th>
            </tr>
            <tr style="background-color: #000000; color: white;">
                <th style="font-weight: bold; text-align: center;">Número</th>
                <th style="font-weight: bold; text-align: center;">Partida</th>
                <th style="font-weight: bold; text-align: center;">Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($splits as $split)
                <tr>
                    <td data-column="clave" style="text-align: center;">{{ $split['numero']; }}</td>
                    <td data-column="partida">{{ $split['partida'] }}</td>
                    <td data-column="concepto" style="text-align: right;">{{ number_format($split['total'],2) }}</td>
                </tr>
            @endforeach
            <tr>
                <td colspan="2" style="font-weight: bold; text-align: right;">Total:</td>
                <td data-column="total" style="text-align: right;">{{ number_format($budget,2) }}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>