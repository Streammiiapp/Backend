<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\MusicGenre;
use Carbon\Carbon;

class MusicGenresSeeder extends Seeder
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
                'title'        => 'Blues',
                'slug'         => 'blues',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Classical Music',
                'slug'         => 'classical-music',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Hip-hop',
                'slug'         => 'hip-hop',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Jazz',
                'slug'         => 'jazz',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Pop',
                'slug'         => 'pop',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'R & B',
                'slug'         => 'r-b',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Electronic',
                'slug'         => 'electronic',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Alternative Music',
                'slug'         => 'alternative-music',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Country Music',
                'slug'         => 'country-music',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Heavy Metal',
                'slug'         => 'heavy-metal',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Instrumental',
                'slug'         => 'instrumental',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Reggae',
                'slug'         => 'reggae',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Punk Rock',
                'slug'         => 'punk-rock',
                'created_at'   => Carbon::now()
            ],
        ];
        MusicGenre::insert($data);
    }
}
