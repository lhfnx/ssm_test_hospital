<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>科室信息</title>

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
                <h2>所在科室信息</h2>
                <div id="tab1" class="tabcontent">
                    <div class="form">
                        <div class="form_row">
                            <label>科室编号：</label> <input type="text" class="form_input"
                                                        value="${department.department_id}" name="" readonly="readonly"
                                                        style="width: 20%"/>
                        </div>
                        <div class="form_row">
                            <label>科室名：</label> <input type="text" class="form_input"
                                                       value="${department.department_name}" name="" readonly="readonly"
                                                       style="width: 20%"/>
                        </div>
                        <div class="form_row">
                            <label>科室电话：</label> <input type="text" class="form_input"
                                                        value="${department.department_ph}" name="" readonly="readonly"
                                                        style="width: 40%"/>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <h3>科室人员</h3>
                    <table id="rounded-corner" style="text-align: center">
                        <thead>
                        <tr>
                            <th>医生编号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>联系方式</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <td colspan="12"></td>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach items="${mate}" var="doc" varStatus="cntdoc">
                        <tr class="odd">
                            <td>${doc.doctor_id}
                            </td>
                            <td>${doc.doctor_name}
                            </td>
                            <td>${doc.doctor_sex}
                            </td>
                            <td>${doc.doctor_age}
                            </td>
                            <td>${doc.doctor_ph}
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <!-- end of right content-->


        <div class="sidebar" id="sidebar">
            <h2>信息查询</h2>

            <ul>
                <li><a href="DoctorPatientInfo">病人</a></li>
                <li><a href="DoctorDepartmentInfo" class="selected">科室</a></li>
                <li><a href="DoctorRegisterInfo">预约</a></li>
            </ul>

            <h2>操作</h2>

            <ul>
                <li><a href="DoctorPrescribeChange">处方修改</a></li>
                <li><a href="DoctorInfoChange">个人信息修改</a></li>

            </ul>

        </div>


        <div class="clear"></div>
        <!-- important!!! -->
    </div>
    <!--end of center_content-->

    <div class="footer">CopyRight©2018</div>

</div>


</html>
