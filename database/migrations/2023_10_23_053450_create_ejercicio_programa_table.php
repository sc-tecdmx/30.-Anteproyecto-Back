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
        Schema::create('ejercicio_programa', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('ejercicio_id');
            $table->unsignedBigInteger('programa_id');
            $table->timestamps();

            $table->foreign('ejercicio_id')
                ->references('id')
                ->on('ejercicios')
                ->onUpdate('cascade')
                ->onDelete('restrict');

            $table->foreign('programa_id')
                ->references('id')
                ->on('programas')
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
        Schema::dropIfExists('ejercicio_programa');
    }
};
