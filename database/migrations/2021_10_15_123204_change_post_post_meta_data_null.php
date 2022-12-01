<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangePostPostMetaDataNull extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('posts', function (Blueprint $table) {
            \DB::statement("ALTER TABLE `posts` CHANGE `post_meta_data` `post_meta_data` TEXT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci NULL; ");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('posts', function (Blueprint $table) {
            \DB::statement("ALTER TABLE `posts` CHANGE `post_meta_data` `post_meta_data` TEXT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL; ");
        });
    }
}
