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
        Schema::create('contrato_partida', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('contrato_ejercicio_id');
            $table->unsignedBigInteger('partida_id');
            $table->timestamps();

            $table->foreign('contrato_ejercicio_id')
                ->references('id')
                ->on('contrato_ejercicio')
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
        Schema::dropIfExists('contrato_partida');
    }
};
