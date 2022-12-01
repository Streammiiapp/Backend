<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\SubscriptionPackages;
use Carbon\Carbon;

class SubscriptionPackagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [
                'title'        => '10 Tokens',
                'identifier'   => 'ios',
                'slug'         => 'com.streammii.tentokens',
                'description'   => '10 Tokens',
                'coins'         => '10',
                'amount'         => '1.99',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => '50 Tokens',
                'identifier'   => 'ios',
                'slug'         => 'com.streammii.50Tokens',
                'description'   => '50 Tokens',
                'coins'         => '50',
                'amount'         => '5.99',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => '125 Tokens',
                'identifier'   => 'ios',
                'slug'         => 'com.streammii.125Tokens',
                'description'   => '125 Tokens',
                'coins'         => '125',
                'amount'         => '9.99',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => '250 Tokens',
                'identifier'   => 'ios',
                'slug'         => 'com.streammii.250Tokens',
                'description'   => '250 Tokens',
                'coins'         => '250',
                'amount'         => '19.99',
                'created_at'   => Carbon::now()
            ], 
            [
                'title'        => '625 Tokens',
                'identifier'   => 'ios',
                'slug'         => 'com.streammii.625Tokens',
                'description'   => '625 Tokens',
                'coins'         => '625',
                'amount'         => '49.99',
                'created_at'   => Carbon::now()
            ], 
            [
                'title'        => '10 Tokens',
                'identifier'   => 'android',
                'slug'         => 'com.streammii.tentokens',
                'description'   => '10 Tokens',
                'coins'         => '10',
                'amount'         => '1.99',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => '50 Tokens',
                'identifier'   => 'android',
                'slug'         => 'com.streammii.50tokens',
                'description'   => '50 Tokens',
                'coins'         => '50',
                'amount'         => '5.99',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => '125 Tokens',
                'identifier'   => 'android',
                'slug'         => 'com.streammii.125tokens',
                'description'   => '125 Tokens',
                'coins'         => '125',
                'amount'         => '9.99',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => '250 Tokens',
                'identifier'   => 'android',
                'slug'         => 'com.streammii.250tokens',
                'description'   => '250 Tokens',
                'coins'         => '250',
                'amount'         => '19.99',
                'created_at'   => Carbon::now()
            ], 
            [
                'title'        => '625 Tokens',
                'identifier'   => 'android',
                'slug'         => 'com.streammii.625tokens',
                'description'   => '625 Tokens',
                'coins'         => '625',
                'amount'         => '49.99',
                'created_at'   => Carbon::now()
            ], 
        ];
        SubscriptionPackages::insert($data);
    }
}
