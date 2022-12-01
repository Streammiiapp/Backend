<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnUserComments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('user_comments', function (Blueprint $table) {
            \DB::statement("ALTER TABLE `user_comments` CHANGE `actor_id` `user_id` BIGINT(20) UNSIGNED NOT NULL; ");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('user_comments', function (Blueprint $table) {
            \DB::statement("ALTER TABLE `user_comments` CHANGE `user_id` `actor_id` BIGINT(20) UNSIGNED NOT NULL; ");
        });
    }
}
