<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\FaqController;
use App\Http\Controllers\Api\ArtistTypeController;
use App\Http\Controllers\Api\MusicGenreController;
use App\Http\Controllers\Api\FollowerController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\CommentController;
use App\Http\Controllers\Api\UserBlockController;
use App\Http\Controllers\Api\LikeController;
use App\Http\Controllers\Api\UserReportController;
use App\Http\Controllers\Api\UserSubscriptionController;
use App\Http\Controllers\Api\UserCoinsController;
use App\Http\Controllers\Api\UserCoinsSupportController;
use App\Http\Controllers\Api\PromotionController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['api_authorization'])->group(function(){

    Route::post('user/login',[UserController::class,'login']);
    Route::post('user/forgot-password',[UserController::class,'forgotPassword']);
    Route::post('user/change-password',[UserController::class,'changePassword']);
    Route::post('user/logout',[UserController::class,'userLogout']);
    Route::post('user/social-login',[UserController::class,'socialLogin']);
    Route::post('user/verify-code',[UserController::class,'verifyCode']);
    Route::post('user/resend-code',[UserController::class,'resendCode']);
    Route::resource('user',UserController::class)->except(['delete']);


    // Artist Types
    Route::resource('artist-types',ArtistTypeController::class)->only('index');

    // Music Genres
    Route::resource('music-genres',MusicGenreController::class)->only('index');
    Route::resource('faq',FaqController::class)->only('index');
    Route::middleware(['custom_auth:api'])->group(function(){
        Route::post('user/user-public-setting',[UserController::class,'userPublicSetting']);
        Route::get('notification',[NotificationController::class,'index']);
        Route::put('notification/{any}',[NotificationController::class,'update']);
        Route::post('notification/send',[NotificationController::class,'sendNotification']);
        Route::post('notification/setting',[NotificationController::class,'saveNotificationSetting']);
        Route::get('notification/setting',[NotificationController::class,'getNotificationSetting']);
        Route::get('notification/get-count',[NotificationController::class,'getNotificationCount']);
        Route::post('user-subscription',[UserSubscriptionController::class,'storeUserSubscription']);
        Route::resource('user-subscriptions',UserSubscriptionController::class,['only' => ['index', 'show']]);
        Route::resource('post',PostController::class);
        Route::get('user-follow/request',[FollowerController::class, 'getFollowRequest']);
        Route::post('user-follow/accept',[FollowerController::class, 'acceptRequest']);
        Route::get('user-request-count',[FollowerController::class, 'getRequestCount']);
        Route::resource('follower',FollowerController::class);
        Route::resource('comment',CommentController::class);
        Route::get('user-report-type',[UserReportController::class, 'getReportTypeList']);
        Route::resource('user-report',UserReportController::class);
        Route::resource('user-block',UserBlockController::class);
        Route::post('like',[LikeController::class, 'addLike']);
        Route::post('dislike',[LikeController::class, 'addDisLike']);
        Route::get('like-dislike-post-user',[LikeController::class, 'getLikeOrDislike']);
        Route::resource('buy-coins',UserCoinsController::class);
        Route::get('support-artist-post-list',[UserCoinsSupportController::class, 'getPostSupportArtist']);
        Route::resource('support-artist',UserCoinsSupportController::class);
        Route::resource('promotion',PromotionController::class);
    });

});
Route::post('data-truncate',[UserController::class,'dataTruncate']);

