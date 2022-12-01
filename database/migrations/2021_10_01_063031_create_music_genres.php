<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMusicGenres extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('music_genres', function (Blueprint $table) {
            $table->id();
            $table->string('slug');
            $table->string('title', 225);
            $table->dateTime('created_at')->default(\DB::raw('CURRENT_TIMESTAMP'));
            $table->dateTime('updated_at')->nullable();
            $table->softDeletes();

            $table->index(['slug']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('music_genres');
    }
}
