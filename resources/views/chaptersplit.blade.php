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
            <tr style="background-color: #000000; color: white;">
                <th colspan="6">ANTEPROYECTO DE PRESUPUESTO {{ $anio }}</th>
            </tr>
            <tr>
                <th colspan="6">Integración por Capítulo y Partida de Gasto</th>
            </tr>
            <tr>
                <th colspan="6"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td>Partida</td>
                <td>Descripción</td>
                <td>Importe</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>GASTO CORRIENTE</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>1000</td>
                <td>SERVICIOS PERSONALES</td>
                <td>{{  }}</td>
                <td>{{  }}%</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>SUBTOTAL</td>
                <td>{{  }}</td>
                <td>{{  }}%</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>GASTO DE INVERSIÓN</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>5000</td>
                <td>BIENES MUEBLES INMUEBLES E INTANGIBLES</td>
                <td>{{  }}</td>
                <td>{{  }}%</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>SUBTOTAL</td>
                <td>{{  }}</td>
                <td>{{  }}%</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="6"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>GRAN TOTAL</td>
                <td>{{  }}</td>
                <td>{{  }}%</td>
                <td></td>
            </tr>
        </tbody>
    </table>
</body>
</html>