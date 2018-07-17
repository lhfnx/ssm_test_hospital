<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>病人信息</title>

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
    </script>

</head>

<div id="panelwrap">

    <div class="header">
        <div class="title">
            <a href="#">医院住院管理系统</a>
        </div>
        <div class="header_right">
            当前用户：<c:out value="${sessionScope.user_name}" default="默认"></c:out><a href="/alllogin" class="logout_b"
                                                                                  style="color:red">登出</a> <br>
            <div class="time"></div>
        </div>
        <div class="menu">
            <ul>
                <li><a href="UserFrontPage">首页</a></li>
                <li><a href="PasswordChange">修改密码</a></li>
                <li><a href="javascript:window.location.reload(true);">刷新</a></li>
                <li><a href="HelpPage">帮助</a></li>
            </ul>
        </div>
    </div>
    <div class="center_content">
        <div id="right_wrap">
            <div id="right_content">
                <h2>个人信息</h2>
                <div id="tab1" class="tabcontent">
                    <h3>基本信息</h3>
                    <div class="form">

                        <div class="form_row">
                            <label>姓名：</label> <input type="text" class="form_input"
                                                      value="${patient_name}" name="" readonly="readonly"
                                                      style="width: 20%"/>
                        </div>

                        <div class="form_row">
                            <label>身份证号：</label> <input type="text" class="form_input"
                                                        value="${resident_id}" name="" readonly="readonly"
                                                        style="width: 40%"/>
                        </div>
                        <div class="form_row">
                            <label>性别：</label> <input type="text" class="form_input"
                                                      value="${patient_sex}" name="" readonly="readonly"
                                                      style="width: 10%;margin-right: 20px"/>
                        </div>
                        <div class="form_row">
                            <label>年龄：</label> <input type="text" class="form_input"
                                                      value="${patient_age}" name="" readonly="readonly"
                                                      style="width: 10%;float:left;"/>
                        </div>
                        <div class="form_row">
                            <label>联系方式：</label> <input type="text" class="form_input"
                                                        value="${patient_ph}" name="" readonly="readonly"
                                                        style="width: 40%"/>
                        </div>
                        <div class="form_row">
                            <label>入院时间：</label> <input type="text" class="form_input"
                                                        value="${in_time}" name="" readonly="readonly"
                                                        style="width: 40%"/>
                        </div>
                        <div class="form_row">
                            <label>出院时间：</label> <input type="text" class="form_input"
                                                        value="${out_time}" name="" readonly="readonly"
                                                        style="width: 40%"/>
                        </div>
                        <div class="form_row">
                            <label>主治医生姓名：</label> <input type="text" class="form_input"
                                                          value="${doctor_name}" name="" readonly="readonly"
                                                          style="width: 40%"/>
                        </div>
                        <div class="form_row">
                            <label>病房：</label> <input type="text" class="form_input" name=""
                                                      value="${ward_id}" readonly="readonly" style="width: 20%"/>
                        </div>
                        <div class="form_row">
                            <label>病床：</label> <input type="text" class="form_input" name=""
                                                      value="${bed_id}" readonly="readonly" style="width: 20%"/>
                        </div>
                        <div class="form_row">
                            <label>家庭地址：</label>
                            <textarea class="form_textarea" name="" readonly="readonly">${address}</textarea>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>

            </div>
        </div>
        <!-- end of right content-->


        <div class="sidebar" id="sidebar">
            <h2>信息查询</h2>

            <ul>
                <li><a href="PatientInfo" class="selected">病人</a></li>
                <li><a href="PrescribeInfo">处方</a></li>
                <li><a href="ReportInfo">检验报告</a></li>
                <li><a href="DoctorInfo">主治医生</a></li>
            </ul>

            <h2>病房操作</h2>

            <ul>
                <li><a href="WardInfo">病房信息</a></li>
                <li><a href="WardChange">换房申请</a></li>
            </ul>

            <h2>挂号</h2>

            <ul>
                <li><a href="RegisterDoc">医生预约</a></li>
            </ul>

            <h2>出院</h2>
            <ul>
                <li><a href="OutHospital">出院申请</a></li>
                <li><a href="PayPrice">费用缴纳</a></li>
                <li><a href="History">住院历史</a>
            </ul>

        </div>


        <div class="clear"></div>
        <!-- important!!! -->
    </div>
    <!--end of center_content-->

    <div class="footer">CopyRight©2018</div>

</div>


</html>
