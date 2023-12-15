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
        Schema::create('contratos_ejecucion', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('contrato_ejercicio_id');
            $table->unsignedBigInteger('mes_id');
            $table->double('costo');
            $table->timestamps();

            $table->foreign('contrato_ejercicio_id')
                ->references('id')
                ->on('contrato_ejercicio')
                ->onUpdate('cascade')
                ->onDelete('restrict');

            $table->foreign('mes_id')
                ->references('id')
                ->on('meses')
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
        Schema::dropIfExists('contratos_ejecucion');
    }
};
