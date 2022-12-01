<?php
namespace App\Http\Controllers;

use App\Models\{ContentManagement,Faq};

class HomeController
{
    public function getContent($slug)
    {
        $data['content'] = ContentManagement::getBySlug($slug);
        if( !isset($data['content']->id) )
            return redirect('/');

        return view('content', $data);
    }

    public function getFaq()
    {
        $data['contents'] = Faq::all();
        return view('faq', $data);
    }

}
