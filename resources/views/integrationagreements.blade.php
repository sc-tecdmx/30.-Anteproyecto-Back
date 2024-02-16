<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cap</title>

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
                <th colspan="6">ANTEPROYECTO DE PRESUPUESTO {{ $chapters['anio'] }}</th>
            </tr>
            <tr style="text-align: center; font-weight: bold;">
                <th colspan="6">Integración por Capítulo de Gasto</th>
            </tr>
            <tr>
                <th colspan="6"></th>
            </tr>
        </thead>
        <tbody>
            <tr style="text-align: center;">
                <td></td>
                <td>Capítulo</td>
                <td>Descripción</td>
                <td>Importe</td>
                <td>%</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="font-weight: bold;">GASTO CORRIENTE</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>1000</td>
                <td>{{ $chapters['1000']['descripcion'] }}</td>
                <td>{{ number_format($chapters['1000']['total_capitulo'],2) }}</td>
                <td>{{ number_format($chapters['1000']['porcentaje'],2) }}%</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>2000</td>
                <td>{{ $chapters['2000']['descripcion'] }}</td>
                <td>{{ number_format($chapters['2000']['total_capitulo'],2) }}</td>
                <td>{{ number_format($chapters['2000']['porcentaje'],2) }}%</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>3000</td>
                <td>{{ $chapters['3000']['descripcion'] }}</td>
                <td>{{ number_format($chapters['3000']['total_capitulo'],2) }}</td>
                <td>{{ number_format($chapters['3000']['porcentaje'],2) }}%</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align: center; font-weight: bold;">SUBTOTAL</td>
                <td style="font-weight: bold;">{{ number_format($chapters['subtotal_gasto_corriente'],2) }}</td>
                <td style="font-weight: bold;">{{ number_format($chapters['porcentaje_gastos_corriente'],2) }}%</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="font-weight: bold;">GASTO DE INVERSIÓN</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>5000</td>
                <td>{{ $chapters['5000']['descripcion'] }}</td>
                <td>{{ number_format($chapters['5000']['total_capitulo'],2) }}</td>
                <td>{{ number_format($chapters['5000']['porcentaje'],2) }}%</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align: center; font-weight: bold;">SUBTOTAL</td>
                <td style="font-weight: bold;">{{ number_format($chapters['5000']['total_capitulo'],2) }}</td>
                <td style="font-weight: bold;">{{ number_format($chapters['5000']['porcentaje'],2) }}%</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align: center; font-weight: bold;">GRAN TOTAL</td>
                <td style="font-weight: bold;">{{ number_format($chapters['total'], 2) }}</td>
                <td style="font-weight: bold;">100%</td>
                <td></td>
            </tr>
        </tbody>
    </table>
</body>
</html>