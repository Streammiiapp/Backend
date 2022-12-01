<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_comments', function (Blueprint $table) {
            $table->id();
            $table->integer('parent_id');
            $table->foreignId('actor_id')->constrained('users')->onDelete('cascade');
            $table->string('module',225)->nullable();;
            $table->integer('module_id');
            $table->text('comment',5000);
            $table->enum('status',['1','0'])->default('1');
            $table->integer('total_like')->default('0');
            $table->integer('total_dislike')->default('0');
            $table->integer('reply_count');
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
        Schema::dropIfExists('user_comments');
    }
}
