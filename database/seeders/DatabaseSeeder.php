<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            CmsSeeder::class,
            ContentManagementSeeder::class,
            FaqSeeder::class,
            MusicGenresSeeder::class,
            ArtistTypeSeeder::class,
            ReportTypeSeeder::class,
            SubscriptionPackagesSeeder::class,
        ]);
    }
}
