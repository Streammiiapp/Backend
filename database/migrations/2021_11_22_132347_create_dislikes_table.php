<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDisLikesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dislikes', function (Blueprint $table) {
            $table->id();
            $table->integer('is_liked')->default(0);
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('module',225)->nullable();
            $table->integer('module_id');
            $table->dateTime('created_at')->default(\DB::raw('CURRENT_TIMESTAMP'));
            $table->dateTime('updated_at')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dis_likes');
    }
}
