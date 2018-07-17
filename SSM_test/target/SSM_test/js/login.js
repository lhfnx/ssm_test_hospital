$(function () {
    $(".content .con_right .left").click(function (e) {
        $(this).css({ "color": "#333333", "border-bottom": "2px solid #2e558e" });
        $(".content .con_right .right").css({ "color": "#999999", "border-bottom": "2px solid #dedede" });
        $(".content .con_right .middle").css({ "color": "#999999", "border-bottom": "2px solid #dedede" });
        $(".content .con_right ul .con_r_left").css("display", "block");
        $(".content .con_right ul .con_r_middle").css("display", "none");
        $(".content .con_right ul .con_r_right").css("display", "none");
        if (fluCodeInterval == null || fluCheckCodeInterval == null) {
            show();
            flushQRCode();
            checkQRCodeStatus();
        }
    });
    $(".content .con_right .right").click(function (e) {
        $(this).css({ "color": "#333333", "border-bottom": "2px solid #2e558e" });
        $(".content .con_right .left").css({ "color": "#999999", "border-bottom": "2px solid #dedede" });
        $(".content .con_right .middle").css({ "color": "#999999", "border-bottom": "2px solid #dedede" });
        $(".content .con_right ul .con_r_right").css("display", "block");
        $(".content .con_right ul .con_r_middle").css("display", "none");
        $(".content .con_right ul .con_r_left").css("display", "none");
    });
    
    $(".content .con_right .middle").click(function (e) {
        $(this).css({ "color": "#333333", "border-bottom": "2px solid #2e558e" });
        $(".content .con_right .left").css({ "color": "#999999", "border-bottom": "2px solid #dedede" });
        $(".content .con_right .right").css({ "color": "#999999", "border-bottom": "2px solid #dedede" });
        $(".content .con_right ul .con_r_middle").css("display", "block");
        $(".content .con_right ul .con_r_right").css("display", "none");
        $(".content .con_right ul .con_r_left").css("display", "none");
    });
  

    $('#btn_Login_admin').click(function () {
        if ($.trim($('#admin_name').val()) == '') {
            alert('请输入您的用户名');
            return false;
        } else if ($.trim($('#admin_password').val()) == '') {
            alert('请输入密码');
            return false;
        } else {
            return true;
        }
    });

        $('#btn_Login_guest').click(function () {
        if ($.trim($('#username').val()) == '') {
            alert('请输入您的用户名');
            return false;
        } else if ($.trim($('#password').val()) == '') {
            alert('请输入密码');
            return false;
        } else {
            return true;
        }
    });
        
        $('#btn_Login_docotr').click(function () {
            if ($.trim($('#doctor_username').val()) == '') {
                alert('请输入您的用户名');
                return false;
            } else if ($.trim($('#doctor_password').val()) == '') {
                alert('请输入密码');
                return false;
            } else {
                return true;
            }
        });

    $("#flushLoginValiCode1,#flushLoginValiCode2").click(function () {
        $("#loginImgCode").attr("src", "/handler/GetLoginCode.ashx?" + Math.random());
    });
})