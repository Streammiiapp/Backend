<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->integer('artist_type_id')->unsigned()->nullable()->after('deleted_at');
            $table->integer('music_genre_id')->unsigned()->nullable()->after('artist_type_id');
            $table->string('user_type')->nullable();
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
            $table->dropColumn('artist_type_id');
            $table->dropColumn('music_genre_id');
            $table->dropColumn('user_type');
        });
    }
}
