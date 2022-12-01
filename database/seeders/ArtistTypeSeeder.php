<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ArtistType;
use Carbon\Carbon;

class ArtistTypeSeeder extends Seeder
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
                'title'        => 'Musician/Band',
                'slug'         => 'musician-band',
                'image'         => 'imgMusician.png',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Music Producer',
                'slug'         => 'music-producer',
                'image'         => 'imgMusicProducer.png',
                'created_at'   => Carbon::now()
            ],
            [
                'title'        => 'Song Writer',
                'slug'         => 'song-writer',
                'image'         => 'imgSongWirter.png',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'Video Editor',
                'slug'         => 'video-editor',
                'image'         => 'imgVideoEditor.png',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'Video Director',
                'slug'         => 'video-director',
                'image'         => 'imgVideoDirector.png',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'Booking/Hiring Agent',
                'slug'         => 'booking-hiring-agent',
                'image'         => 'imgBookingHiringAgent.png',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'Music Artist',
                'slug'         => 'music-artist',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'Music Composer',
                'slug'         => 'music-composer',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'Music Label',
                'slug'         => 'music-label',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'DJ',
                'slug'         => 'dj',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'Tour Manager',
                'slug'         => 'tour-manager',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], [
                'title'        => 'Artist Manager',
                'slug'         => 'artist-manager',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], 
            [
                'title'        => 'Composer',
                'slug'         => 'composer',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], 
            [
                'title'        => 'Singer',
                'slug'         => 'singer',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], 
            [
                'title'        => 'Lyricist',
                'slug'         => 'lyricist',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], 
            [
                'title'        => 'Background Singer',
                'slug'         => 'background-singer',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], 
            [
                'title'        => 'Dancer',
                'slug'         => 'dancer',
                'image'         => '',
                'created_at'   => Carbon::now()
            ], 
        ];
        ArtistType::insert($data);
    }
}
