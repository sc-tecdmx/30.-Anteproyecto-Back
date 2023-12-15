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
        Schema::create('programa_subprograma', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('programa_id');
            $table->unsignedBigInteger('subprograma_id');
            $table->timestamps();

            $table->foreign('programa_id')
                ->references('id')
                ->on('programas')
                ->onUpdate('cascade')
                ->onDelete('restrict');

            $table->foreign('subprograma_id')
                ->references('id')
                ->on('subprogramas')
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
        Schema::dropIfExists('programa_subprograma');
    }
};
