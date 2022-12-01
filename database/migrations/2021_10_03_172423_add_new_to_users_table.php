<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNewToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->text('bio')->nullable()->after('user_type');
            $table->string('gender')->nullable()->after('bio');
            $table->date('date_of_birth')->nullable()->after('gender');
            $table->string('facebook_url',1000)->nullable()->after('date_of_birth');
            $table->string('instagram_url',1000)->nullable()->after('facebook_url');
            $table->string('twitter_url',1000)->nullable()->after('instagram_url');
            $table->string('snapchat_url',1000)->nullable()->after('twitter_url');
            $table->string('youtube_url',1000)->nullable()->after('snapchat_url');
            $table->string('weblink_url',1000)->nullable()->after('youtube_url');

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
            $table->dropColumn('bio');
            $table->dropColumn('gender');
            $table->dropColumn('date_of_birth');
            $table->dropColumn('facebook_url');
            $table->dropColumn('instagram_url');
            $table->dropColumn('twitter_url');
            $table->dropColumn('snapchat_url');
            $table->dropColumn('youtube_url');
            $table->dropColumn('weblink_url');
        });
    }
}
