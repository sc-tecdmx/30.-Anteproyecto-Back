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
        Schema::create('proyecto_subprograma', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('subprograma_id');
            $table->unsignedBigInteger('proyecto_id');
            $table->timestamps();

            $table->foreign('subprograma_id')
                ->references('id')
                ->on('subprogramas')
                ->onUpdate('cascade')
                ->onDelete('restrict');

            $table->foreign('proyecto_id')
                ->references('id')
                ->on('proyectos')
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
        Schema::dropIfExists('proyecto_subprograma');
    }
};
