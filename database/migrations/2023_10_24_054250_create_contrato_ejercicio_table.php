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
        Schema::create('contrato_ejercicio', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('ejercicio_id');
            $table->unsignedBigInteger('contrato_id');
            $table->integer('escenario');
            $table->boolean('cerrado');
            $table->boolean('seleccionado');
            $table->timestamps();

            $table->foreign('ejercicio_id')
                ->references('id')
                ->on('ejercicios')
                ->onUpdate('cascade')
                ->onDelete('restrict');

            $table->foreign('contrato_id')
                ->references('id')
                ->on('contratos')
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
        Schema::dropIfExists('contrato_proyecto');
    }
};