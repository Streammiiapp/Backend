jQuery(document).ready(function () {
    // This Function Use for User Active and Inactive by admin
    // Start Function
    jQuery('.is_active').on('click', function () {
        var params = {};
        params['status']= jQuery(this).data("toggle");
        params['is_active']= jQuery(this).data("status");
        params['id'] = jQuery(this).data('id');
        if (window.confirm('Are you sure, you want to ' + params['status'] + ' this user?')) {
            userChangeStatus(params);
        }
    });

    // End Function

    function userChangeStatus(params) {
        $.ajax({
            url: "../event/change_status",
            method : "POST",
            type : "POST",
            data : params,
            success: function (result) {
                //alert(result['message']);
                if (result['status_change'] == "yes") {
                    jQuery('.is_active_'+params['id']).data('toggle', 'no');
                    jQuery('.is_active_'+params['id']).text(result['status_change'].substr(0,1).toUpperCase() + result['status_change'].substr(1));
                    jQuery('.is_active_'+params['id']).removeClass('btn-danger').removeClass('btn-success').addClass('btn-success');
                }

                if (result['status_change'] == "no"){
                    jQuery('.is_active_'+params['id']).data('toggle', 'yes');
                    jQuery('.is_active_'+params['id']).text(result['status_change'].substr(0,1).toUpperCase() + result['status_change'].substr(1));
                    jQuery('.is_active_'+params['id']).removeClass('btn-success').removeClass('btn-danger').addClass('btn-danger');
                }

            }
        });
    }
});