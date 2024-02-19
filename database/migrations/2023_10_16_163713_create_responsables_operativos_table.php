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
        Schema::create('responsables_operativos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('unidad_responsable_gasto_id');
            $table->char('numero', 2);
            $table->string('nombre');
            $table->timestamps();

            $table->foreign('unidad_responsable_gasto_id')
                ->references('id')
                ->on('unidades_responsables_gastos')
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
        Schema::dropIfExists('responsables_operativos');
    }
};
