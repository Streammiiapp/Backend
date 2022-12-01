<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ReportType;
use Carbon\Carbon;

class ReportTypeSeeder extends Seeder
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
                'title'        => 'Offensive Content',
                'module'       => 'User And Post Report',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Nudity',
                'module'       => 'User And Post Report',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Inappropriate Content',
                'module'       => 'User And Post Report',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Pirated Content',
                'module'       => 'User And Post Report',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Other',
                'module'       => 'User And Post Report',
                'created_at'   => Carbon::now()
            ],
        ];
        ReportType::insert($data);
    }
}
