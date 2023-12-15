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
        Schema::create('proyectos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('numero', 3);
            $table->text('nombre');
            $table->string('tipo');
            $table->integer('version');
            $table->text('objetivo');
            $table->text('justificacion');
            $table->text('descripcion');
            $table->date('fecha');
            $table->string('nombre_responsable_operativo');
            $table->string('cargo_responsable_operativo');
            $table->string('nombre_titular');
            $table->string('responsable_ficha');
            $table->string('autorizado_por');
            $table->string('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('proyectos');
    }

    // evitar duplicidad de tablas intermedias o dejando estatico algunos detalles
};
