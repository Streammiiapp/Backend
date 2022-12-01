<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
use App\Models\SubscriptionPackages;

class UserSubscription extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_subscription';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['user_id','subscription_package_id','gateway_transaction_id','transaction_id','gateway_original_transaction_id','subscription_expiry_date','status','is_trial_period','device_type','created_at','updated_at','deleted_at'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * It is used to enable or disable DB cache record
     * @var bool
     */
    protected $__is_cache_record = false;

    /**
     * @var
     */
    protected $__cache_signature;

    /**
     * @var string
     */
    protected $__cache_expire_time = 1; //days


    public function subscriptionPackage()
    {
        return $this->hasOne(SubscriptionPackages::class, 'id', 'subscription_package_id');
    }

    public static function checkSubscription($original_transaction_id){
        $query = \DB::table('user_subscription')
                ->where('gateway_original_transaction_id',$original_transaction_id)
                ->orderBy('id','desc')
                ->first();
        return $query;
    }

    public static function addUserSubscription($params)
    {
        $user = User::find($params['user']['id']);
        $gateway_response = json_decode($params['gateway_response'],true);

        if( $params['device_type'] == 'android' ){
            $data_android =  json_decode($gateway_response['transactionReceipt'],true);
            $gateway_response['transactionId'] = $data_android['orderId'];
            $gateway_response['original_transaction_id'] = $gateway_response['purchaseToken'];
        }
        else{
            $gateway_response['transactionId']           = $gateway_response['transaction_id'];
            $gateway_response['original_transaction_id'] = $gateway_response['original_transaction_id'];
        }

        //get package
        $package = SubscriptionPackages::where('id',$params['subscription_package_id'])->first();
        //create transaction
        $params['payment_method'] = 'inapp_purchase';
        $params['total_amount']   = $package->amount;
           //add user subscription data
           $record = self::create([
                'gateway_transaction_id'   => $gateway_response['transactionId'],
                'gateway_original_transaction_id' => $gateway_response['original_transaction_id'],
                'subscription_package_id'  => $params['subscription_package_id'],
                'user_id'                  => $params['user']['id'],
                'status'                   => 'active',
                'device_type'			   => $params['device_type'],
                'created_at'               => Carbon::now(),
            ]);

        User::where('id',$params['user']['id'])
        ->increment('total_coins',$package->coins);

        return [
            'error'   => 0,
            'message' => 'Success',
            'data'    => $record,
        ];


    }

    /**
     *  this function is used to get user subscription
     *  @params {int} $user_id
     *  @return {object}
     */
    public static function getUserSubscription($user_id)
    {
        $checkUserSubscription = \DB::table('user_subscription')
                                      ->where('user_id',$user_id)
                                    //   ->where('subscription_package_id',1)
                                      ->orderBy('id','desc')
                                      ->first();
        return $checkUserSubscription;
    }

}
