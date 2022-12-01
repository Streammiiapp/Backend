jQuery(document).ready(function () {
    // This Function Use for User Active and Inactive by admin
    // Start Function
    jQuery('.status_change').on('click', function () {
        var params = {};
        params['status']= jQuery(this).data("toggle");
        params['status_id']= jQuery(this).attr("data-status");
        params['user_id'] = jQuery(this).data('id');
        if (window.confirm('Are you sure, you want to ' + params['status'].toLowerCase() + ' this user?')) {
            userChangeStatus(params);
        }
    });

    // End Function

    function userChangeStatus(params) {
        $.ajax({
            url: "../api/user/user_change_status",
            method : "POST",
            type : "POST",
            data : params,
            success: function (result) {
                //alert(result['message']);
                if (result.data.user_status_id == 1) {
                    jQuery('.status_change_'+result.data.id).data('toggle', 'Inactive');
                    jQuery('.status_change_'+result.data.id).attr('data-status', 0);
                    jQuery('.status_change_'+result.data.id).text("Active");
                    jQuery('.status_change_'+result.data.id).removeClass('btn-danger').removeClass('btn-success').addClass('btn-success');
                }


                if (result.data.user_status_id == 0){
                    jQuery('.status_change_'+result.data.id).data('toggle', 'Active');
                    jQuery('.status_change_'+result.data.id).attr('data-status', 1);
                    jQuery('.status_change_'+result.data.id).text("Inactive");
                    jQuery('.status_change_'+result.data.id).removeClass('btn-success').removeClass('btn-danger').addClass('btn-danger');
                }

            }
        });
    }
});