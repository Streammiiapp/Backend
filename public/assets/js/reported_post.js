$(".view-detail").click(function () {
    $(".post_report_footer").html("")
    var id = $(this).attr("id");
    $.ajax({
        url: 'user_report/post-detail/' + id,
        type: "GET",
        success: function (response) {
            $(".post_report_footer").html(response.footer)
            $(".post-detail").html(response.view)
        }
    })
})


$(document).on('click','.img-load',function () {
    var media = $(this).data('content');
    var type = $(this).data('placement');
    var mine = media.split(/\.(?=[^\.]+$)/);
    console.log(mine);
    if(type == "image"){
        $('.media-load').html('<img src="'+media+'" class="image-responsive"/>');
    }
    else if (type == "video"){
        $('.media-load').html('<video width="500" height="400" controls>\n' +
            '  <source src="'+media+'" type="video/'+mine[1]+'">\n' +
            '  Your browser does not support the video tag.\n' +
            '</video>');
    }
})


$(document).on("click",".delete_post",function () {
    var id = $(this).attr("id");
    $.ajax({
        url: 'user_report/post-delete/' + id,
        type: "GET",
        success: function (response) {
            if(response.code == "200"){
                let message = "<p class='alert alert-success' style='text-align: center;'>"+response.message+"</p>";
                $(".post_report_footer").html(message);
                setTimeout(function () {
                    $(".alert-success").hide();
                },5000)
                //$("#myModal").find(".close").trigger("click");
            }
        }
    })
})
