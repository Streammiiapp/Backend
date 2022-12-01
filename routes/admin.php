<?php

use App\Http\Controllers\Admin\ArtistController;
use App\Http\Controllers\Admin\ContentManagementController;
use App\Http\Controllers\Admin\FanController;
use App\Http\Controllers\Admin\FaqController;
use App\Http\Controllers\Admin\PostController;
use App\Http\Controllers\Admin\UserReportController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\TokenController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\Admin\Auth\ForgotPasswordController;
use App\Http\Controllers\Admin\Auth\ResetPasswordController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\CmsUserController;
use App\Http\Controllers\Admin\CmsRoleController;
use App\Http\Controllers\Admin\ApplicationSettingController;
use App\Http\Controllers\Admin\UserController;
/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
|
*/

Route::prefix('admin')->group(function () {

    Route::middleware(['guest:cms_user'])->group( function(){

        Route::match( ['get','post'],'login', [ LoginController::class,'login' ])->name('admin.login');
        Route::match( ['get','post'],'forgot-password', [ ForgotPasswordController::class,'forgotPassword' ])->name('admin.forgot-password');
        Route::match( ['get','post'],'reset-password/{any}', [ ResetPasswordController::class,'resetPassword' ])->name('admin.reset-password');

    });

    Route::middleware(['custom_auth:cms_user'])->group( function(){

        Route::match(['get','post'],'profile',[CmsUserController::class,'profile'])->name('admin.profile');
        Route::match(['get','post'],'change-password',[CmsUserController::class,'changePassword'])->name('admin.change-password');
        Route::get('logout',[CmsUserController::class,'logout'])->name('admin.logout');

        Route::get('dashboard',[DashboardController::class,'index'])->name('admin.dashboard');
        Route::get('dashboard/small-widget',[DashboardController::class,'getSmallWidget'])->name('admin.dashboard.small-widget');
        Route::get('dashboard/line-chart',[DashboardController::class,'getLineChart'])->name('admin.dashboard.line-chart');

        Route::get('cms-roles-management/ajax-listing',[CmsRoleController::class,'ajaxListing'])->name('cms-roles-management.ajax-listing');
        Route::resource('cms-roles-management',CmsRoleController::class);

        Route::get('cms-users-management/ajax-listing',[CmsUserController::class,'ajaxListing'])->name('cms-users-management.ajax-listing');
        Route::resource('cms-users-management',CmsUserController::class);

        Route::match(['get','post'],'application-setting',[ApplicationSettingController::class,'index'])->name('admin.application-setting');

        Route::get('app-users/ajax-listing',[UserController::class,'ajaxListing'])->name('app-users.ajax-listing');
        Route::resource('app-users',UserController::class);

        Route::get('artist-management/ajax-listing',[ArtistController::class,'ajaxListing'])->name('artist-management.ajax-listing');
        Route::resource('artist-management',ArtistController::class);

        Route::get('fan-management/ajax-listing',[FanController::class,'ajaxListing'])->name('fan-management.ajax-listing');
        Route::resource('fan-management',FanController::class);

        Route::get('post-management/ajax-listing',[PostController::class,'ajaxListing'])->name('post-management.ajax-listing');
        Route::resource('post-management',PostController::class);
        Route::delete('delete/comment',[PostController::class,'deleteComment'])->name('delete.comment');

        Route::get('report-management/ajax-listing',[ReportController::class,'ajaxListing'])->name('report-management.ajax-listing');
        Route::resource('report-management',ReportController::class);

        Route::get('user-report-management/ajax-listing',[UserReportController::class,'ajaxListing'])->name('user-report-management.ajax-listing');
        Route::resource('user-report-management',UserReportController::class);

        Route::get('content-management/ajax-listing',[ContentManagementController::class,'ajaxListing'])->name('content-management.ajax-listing');
        Route::resource('content-management',ContentManagementController::class);

        Route::get('faq/ajax-listing',[FaqController::class,'ajaxListing'])->name('faq.ajax-listing');
        Route::resource('faq',FaqController::class);
    });

});
