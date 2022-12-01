<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('title',225)->nullable();;
            $table->text('description', 65535)->nullable();;
            $table->string('slug',225)->nullable();;
            $table->string('post_type',50)->nullable();;
            $table->string('latitude',225)->nullable();;
            $table->string('longitude',225)->nullable();;
            $table->string('media_file',100)->nullable();;
            $table->string('media_thumbnail_url',100)->nullable();;
            $table->enum('media_type',['AUDIO','VIDEO'])->default('VIDEO');
            $table->string('post_status',100)->nullable();;
            $table->enum('status',['1','0'])->default('1');
            $table->integer('total_comment')->default(0);
            $table->integer('total_like')->default(0);
            $table->integer('total_votes')->default(0);
            $table->integer('support_coin')->default(0);
            $table->enum('post_identify',['normal_post','auto_generated_post'])->default('normal_post');
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
        Schema::dropIfExists('posts');
    }
}
