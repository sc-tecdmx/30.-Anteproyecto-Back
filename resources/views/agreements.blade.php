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
                <th colspan="7" style="font-weight: bold; font-size: 12px; text-align: center;">
                    <div style="width: 20%;">
                        <img src="{{ public_path('images/TECDMX-Imagen-_400px.png') }}" width="100%" alt="" style="margin: auto;">
                    </div>
                    <div style="width: 80%;">
                        <p>TRIBUNAL ELECTORAL DE LA CIUDAD DE MÉXICO</p>
                        <p>SISTEMA ANTEPROYECTO</p>
                        <p>CONTRATOS</p>
                    </div>
                </th>
            </tr>
            <tr style="background-color: #000000; color: white;">
                <th style="font-weight: bold; text-align: center;">UR</th>
                <th style="font-weight: bold; text-align: center;">PARTIDA</th>
                <th style="font-weight: bold; text-align: center;">CAPÌTULO</th>
                <th style="font-weight: bold; text-align: center;">CONCEPTO</th>
                <th style="font-weight: bold; text-align: center;">DESCRIPCIÓN</th>
                <th style="font-weight: bold; text-align: center;">IMPORTE</th>
                <th style="font-weight: bold; text-align: center;">CLAVE</th>
                <th style="font-weight: bold; text-align: center;">PARCIALIDAD</th>
                <th style="font-weight: bold; text-align: center;">TIPO</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($agreements as $agreement)
                <tr>
                    <td data-column="UR" style="text-align: center;">{{ $agreement['urg']; }}</td>
                    <td data-column="PARTIDA" style="text-align: center;">{{ $agreement['partida'] }}</td>
                    <td data-column="CAPITULO" style="text-align: center;">{{ $agreement['capitulo'] }}</td>
                    <td data-column="CONCEPTO" style="text-align: center;">{{ $agreement['concepto'] }}</td>
                    <td data-column="DESCRICPION">{{ $agreement['descripcion'] }}</td>
                    <td data-column="IMPORTE">${{ number_format($agreement['importe'], 2) }}</td>
                    <td data-column="CLAVE" style="text-align: center;">{{ $agreement['clave'] }}</td>
                    <td data-column="PARCIALIDAD" style="text-align: center;">{{ $agreement['parcialidad'] }}</td>
                    <td data-column="TIPO" style="text-align: center;">{{ $agreement['tipo'] }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>