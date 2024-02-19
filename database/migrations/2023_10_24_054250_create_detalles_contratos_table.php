<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detalles_contratos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('contrato_ejercicio_proyecto_id');
            $table->float('cantidad');
            $table->double('costo_unitario');
            $table->unsignedBigInteger('unidad_medida_id');
            $table->timestamps();

            $table->foreign('contrato_ejercicio_proyecto_id')
                ->references('id')
                ->on('contrato_ejercicio_proyecto')
                ->onUpdate('cascade')
                ->onDelete('restrict');

            $table->foreign('unidad_medida_id')
                ->references('id')
                ->on('unidades_medidas_anteproyecto')
                ->onUpdate('cascade')
                ->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('detalles_contratos');
    }
};
