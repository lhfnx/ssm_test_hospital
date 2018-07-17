<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>个人信息</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link href='http://fonts.googleapis.com/css?family=Belgrano'
          rel='stylesheet' type='text/css'>
    <!-- jQuery file -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        var $ = jQuery.noConflict();
        $(function () {
            $('#tabsmenu').tabify();
            $(".toggle_container").hide();
            $(".trigger").click(function () {
                $(this).toggleClass("active").next().slideToggle("slow");
                return false;
            });
        });
        $(function () {
            $(".time").text(new Date().toLocaleString());
            //setInterval("$('#currentTime').text(new Date().toLocalsString());",1000);
            setInterval(function () {
                $(".time").text(new Date().toLocaleString());
            }, 1000);
        });
        $(function () {
            $("#infochange").submit(function () {
                var x = ($(this).serialize());
                $.ajax({
                    url: "/ChangeDoctorInfo",
                    type: "post",
                    data: {
                        doctor_name: x.split("&")[0].split("=")[1],
                        doctor_sex: x.split("&")[1].split("=")[1],
                        doctor_age: x.split("&")[2].split("=")[1],
                        doctor_ph: x.split("&")[3].split("=")[1],
                        introduction: x.split("&")[4].split("=")[1]
                    },
                    success: function () {
                        alert("修改成功");
                        window.location.reload(true);
                    }
                })
                return false;
            })
        });
    </script>

</head>

<div id="panelwrap">

    <div class="header">
        <div class="title">
            <a href="#">医院住院管理系统</a>
        </div>
        <div class="header_right">
            当前医生：<c:out value="${sessionScope.doc_name}" default="默认"></c:out><a href="/alllogin" class="logout_b"
                                                                                 style="color:red">登出</a> <br>
            <div class="time"></div>
        </div>
        <div class="menu">
            <ul>
                <li><a href="DoctorFrontPage">首页</a></li>
                <li><a href="DoctorPasswordChange">修改密码</a></li>
                <li><a href="javascript:window.location.reload(true);">刷新</a></li>
                <li><a href="DoctorHelpPage">帮助</a></li>
            </ul>
        </div>
    </div>
    <div class="center_content">
        <div id="right_wrap">
            <div id="right_content">
                <h2>个人信息修改</h2>
                <div id="tab1" class="tabcontent">
                    <h3>基本信息</h3>
                    <div class="form">
                        <form action="" class="form1" method="post" name="form3"
                              id="infochange" accept-charset="utf-8">

                            <img alt="个人照片" src="img/${doctor.doctor_id}.jpg"
                                 style="float: right;height: 150px;width: 150px;margin-right: 10%">

                            <div class="form_row" style="width: 60%;clear:none">
                                <label>姓名：</label> <input type="text" class="form_input"
                                                          value="${doctor.doctor_name}" name="doctor_name"
                                                          style="width: 20%"/>
                            </div>

                            <div class="form_row" style="width: 60%;clear:none">
                                <label>工作编号：</label> <input type="text" class="form_input"
                                                            value="${doctor.doctor_id}" name="" readonly="readonly"
                                                            style="width: 40%"/>
                            </div>
                            <div class="form_row" style="width: 60%;clear:none">
                                <label>性别：</label> <input type="text" class="form_input"
                                                          value="${doctor.doctor_sex}" name="doctor_sex"
                                                          style="width: 10%;margin-right: 20px"/>
                            </div>
                            <div class="form_row" style="width: 60%;clear:none">
                                <label>年龄：</label> <input type="text" class="form_input"
                                                          value="${doctor.doctor_age}" name="doctor_age"
                                                          style="width: 10%;float:left;"/>
                            </div>
                            <div class="form_row" style="width: 60%;clear:none">
                                <label>联系方式：</label> <input type="text" class="form_input"
                                                            value="${doctor.doctor_ph}" name="doctor_ph" style="width: 40%"/>
                            </div>
                            <div class="form_row" style="width: 60%;clear:none">
                                <label>科室：</label> <input type="text" class="form_input" name=""
                                                          value="${doctor.department.department_id}" readonly="readonly"
                                                          style="width: 20%"/>
                            </div>
                            <div class="form_row" style="width: 60%;clear:none">
                                <label>个人简介：</label>
                                <textarea class="form_textarea" name="introduction"
                                          style="width: 300px;">${doctor.introduction}</textarea>
                            </div>
                            <div class="form_row" style="margin-top: 20px;float: right;">
                                <input type="submit" class="form_submit" value="提交"/> <input
                                    type="reset" class="form_reset" value="重置"/>
                            </div>
                            <div class="clear"></div>
                        </form>
                    </div>
                </div>


            </div>
        </div>
        <!-- end of right content-->


        <div class="sidebar" id="sidebar">
            <h2>信息查询</h2>

            <ul>
                <li><a href="DoctorPatientInfo">病人</a></li>
                <li><a href="DoctorDepartmentInfo">科室</a></li>
                <li><a href="DoctorRegisterInfo">预约</a></li>
            </ul>

            <h2>操作</h2>

            <ul>
                <li><a href="DoctorPrescribeChange">处方修改</a></li>
                <li><a href="DoctorInfoChange" class="selected">个人信息修改</a></li>

            </ul>

        </div>


        <div class="clear"></div>
        <!-- important!!! -->
    </div>
    <!--end of center_content-->

    <div class="footer">CopyRight©2018</div>

</div>


</html>
