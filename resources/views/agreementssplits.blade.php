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
                <th colspan="6" style="font-weight: bold; font-size: 12px; text-align: center;">
                    <div style="width: 20%;">
                        <img src="{{ public_path('images/TECDMX-Imagen-_400px.png') }}" width="100%" alt="" style="margin: auto;">
                    </div>
                    <div style="width: 80%;">
                        <p>Tribunal Electoral de la Ciudad de México</p>
                        <p>Secretaría Administrativa</p>
                        <p>Dirección de Recursos Financieros</p>
                    </div>
                </th>
            </tr>
            <tr style="background-color: #000000; color: white; text-align: center;">
                <th colspan="6" style="font-weight: bold; text-align: center;">ANTEPROYECTO DE PRESUPUESTO {{ $data['anio'] }}</th>
            </tr>
            <tr style="text-align: center; font-weight: bold;">
                <th colspan="6" style="font-weight: bold; text-align: center;">Integración por Partida</th>
            </tr>
            <tr>
                <th colspan="6"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td style="font-weight: bold; text-align: center;">Capítulo</td>
                <td style="font-weight: bold; text-align: center;">Descripción</td>
                <td style="font-weight: bold; text-align: center;">Importe</td>
                <td style="font-weight: bold; text-align: center;"></td>
                <td style="font-weight: bold; text-align: center;"></td>
            </tr>
            @foreach ($data['capitulos'] as $capitulo)
            <tr>
                <td></td>
                <td></td>
                <td style="font-weight: bold; text-align: center;">{{ $capitulo['titulo'] }}</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            @foreach ($capitulo['partidas'] as $partida )
            <tr>
                <td></td>
                <td>{{ $partida['numero'] }}</td>
                <td>{{ $partida['descripcion'] }}</td>
                <td style="text-align: right;">{{ number_format($partida['subtotal'],2) }}</td>
                <td></td>
                <td></td>
            </tr>
            @endforeach
            <tr>
                <td></td>
                <td></td>
                <td style="font-weight: bold; text-align: right;">SUBTOTAL</td>
                <td style="text-align: right;">{{ number_format($capitulo['subtotal'],2) }}</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            @endforeach
            <tr>
                <td></td>
                <td></td>
                <td style="font-weight: bold; text-align: right;">GRAN TOTAL</td>
                <td style="font-weight: bold; text-align: right;">{{ number_format($data['total'],2) }}</td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>
</body>
</html>