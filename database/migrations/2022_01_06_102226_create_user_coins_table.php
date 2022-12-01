<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserCoinsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_coins', function (Blueprint $table) {
            $table->id();
            $table->string('slug',150)->unique();
            $table->integer('subscription_package_id')->default(0);
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('gateway_transaction_id',200)->default(0);
            $table->string('gateway_original_transaction_id',200)->default(0);
            $table->string('gateway_type',200);
            $table->text('gateway_response');
            $table->integer('coin')->default(0);
            $table->double('amount',10,2)->default(0);
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
        Schema::dropIfExists('user_coins');
    }
}
