<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangePostChangeEnumColumnValue extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('posts', function (Blueprint $table) {
            \DB::statement(" ALTER TABLE `posts` CHANGE `media_type` `media_type` ENUM('audio','video') CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'audio' NOT NULL; ");
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
            \DB::statement(" ALTER TABLE `posts` CHANGE `media_type` `media_type` ENUM('AUDIO','VIDEO') CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'AUDIO' NOT NULL; ");
        });
    }
}
