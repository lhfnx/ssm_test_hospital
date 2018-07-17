<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/6/19
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Login Page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#user_login").submit(function () {
                    $.ajax(
                        {
                            url: "/UsersLogin",
                            data: $('#user_login').serialize(),
                            type: "post",
                            success: function (result) {
                                if (result === "ok") {
                                    <!-- alert("Users Login Success"); -->
                                    location.href='/UserFrontPage';
                                }
                                else {
                                    alert("账号名或密码错误！");
                                }
                            }
                        }
                    );
                    return false;
                }
            );
            $("#admin_login").submit(function () {
                    $.ajax(
                        {
                            url: "/AdminsLogin",
                            data: $('#admin_login').serialize(),
                            type: "post",
                            success: function (result) {
                                if (result === "ok") {
                                    <!-- alert("Admins Login Success");-->
                                    location.href='/AdminFrontPage';
                                }
                                else {
                                    alert("账号名或密码错误！");
                                }
                            }
                        }
                    );
                    return false;
                }
            );
            $("#doctor_login").submit(function () {
                    $.ajax(
                        {
                            url: "/DoctorsLogin",
                            data: $('#doctor_login').serialize(),
                            type: "post",
                            success: function (result) {
                                if (result === "ok") {
                                    <!-- alert("Doctors Login Success");  -->
                                    location.href='/DoctorFrontPage';
                                }
                                else {
                                    alert("账号名或密码错误！");
                                }
                            }
                        }
                    );
                    return false;
                }
            );

        });

    </script>
</head>

<body style="overflow:hidden">
<div class="pagewrap">
    <div class="main">
        <div class="header"></div>
        <div class="content">
            <div class="con_left"></div>
            <div class="con_right">
                <div class="con_r_top"><!--切换标签-->
                    <a href="javascript:;" class="left" style="color: rgb(153, 153, 153); border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: rgb(222, 222, 222);">管理员登录</a>
                    <a href="javascript:;" class="middle" style="color: rgb(153, 153, 153); border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: rgb(222, 222, 222);">医生登录</a>
                    <a href="javascript:;" class="right" style="color: rgb(51, 51, 51); border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: rgb(46, 85, 142);">病人登录</a>
                </div>
                <ul>
                    <li class="con_r_left" style="display: none;"><!--con_r_left 管理员登录界面，form2-->
                        <form name="form2" id="admin_login" method="post" action="" autocomplete="off">
                            <div class="user">
                                <div>
                                    <span class="user-icon"></span>
                                    <input type="text" id="admin_name" name="admin_name" placeholder="输入账号" value="" >
                                </div>
                                <br>
                                <div>
                                    <span class="mima-icon"></span>
                                    <input type="password" id="admin_password" name="admin_password" placeholder="输入密码" value="">
                                </div>
                            </div><br>
                            <button id="btn_Login_admin" type="submit">登 录</button><!--按钮btn_Login_admin-->
                        </form>
                    </li>

                    <li class="con_r_middle" style="display: none;"><!--con_r_right 医生登录界面，form3-->
                        <form name="form3" id="doctor_login" method="post" action="" autocomplete="off">
                            <div class="user">
                                <div>
                                    <span class="user-icon"></span>
                                    <input type="text" id="doctor_username" name="doctor_username" placeholder="输入账号" value="">
                                </div>
                                <br>
                                <div>
                                    <span class="mima-icon"></span>
                                    <input type="password" id="doctor_password" name="doctor_password" placeholder="输入密码" value="">
                                </div>
                            </div><br>
                            <button id="btn_Login_doctor" type="submit">登 录</button><!--按钮btn_Login_guest-->
                        </form>
                    </li>

                    <li class="con_r_right" style="display: block;"><!--con_r_right 病人登录界面，form1-->
                        <form name="form1" id="user_login" method="post" action="" autocomplete="off">
                            <div class="user">
                                <div>
                                    <span class="user-icon"></span>
                                    <input type="text" id="username" name="username" placeholder="输入账号" value="">
                                </div>
                                <br>
                                <div>
                                    <span class="mima-icon"></span>
                                    <input type="password" id="password" name="password" placeholder="输入密码" value="">
                                </div>
                            </div><br>
                            <button id="btn_Login_guest" type="submit">登 录</button><!--按钮btn_Login_guest-->
                        </form>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
