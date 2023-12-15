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
        Schema::create('proyecto_responsable_operativo', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('responsable_operativo_id');
            $table->unsignedBigInteger('proyecto_id');
            $table->timestamps();

            $table->foreign('responsable_operativo_id')
                ->references('id')
                ->on('responsables_operativos')
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
        Schema::dropIfExists('proyecto_responsable_operativo');
    }
};
