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
        Schema::create('contrato_ejercicio_proyecto', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('contrato_id');
            $table->unsignedBigInteger('ejercicio_proyecto_id');
            $table->unsignedBigInteger('partida_id');
            $table->integer('escenario');
            $table->float('importe')->default(0.0);
            $table->boolean('cerrado');
            $table->boolean('seleccionado');
            $table->timestamps();

            $table->foreign('ejercicio_proyecto_id')
                ->references('id')
                ->on('ejercicio_proyecto')
                ->onUpdate('cascade')
                ->onDelete('restrict');

            $table->foreign('contrato_id')
                ->references('id')
                ->on('contratos')
                ->onUpdate('cascade')
                ->onDelete('restrict');
            
            $table->foreign('partida_id')
                ->references('id')
                ->on('partidas')
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
        Schema::dropIfExists('contrato_ejercicio_proyecto');
    }
};