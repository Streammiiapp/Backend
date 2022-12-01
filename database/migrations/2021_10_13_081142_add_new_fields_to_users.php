<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNewFieldsToUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->integer('no_of_posts');
            $table->integer('no_of_followers');
            $table->integer('no_of_following');
            $table->integer('total_coins');
            $table->integer('total_coins');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('no_of_posts');
            $table->dropColumn('no_of_followers');
            $table->dropColumn('no_of_following');
            $table->dropColumn('total_coins');
            $table->dropColumn('total_coins');
        });
    }
}
