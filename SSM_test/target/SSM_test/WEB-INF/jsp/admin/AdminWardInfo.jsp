<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>病房列表</title>

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
            $("#ward_select").change(function () {
                var ward_id = ($("#ward_select").children('option:selected').val());
                $.ajax({
                    url: "/AdminChangeWard",
                    type: "post",
                    data: {
                        selected_ward_id: ward_id
                    },
                    success: function () {
                        window.location.reload(true);
                    }
                })
                return true;
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
            当前管理员：<c:out value="${sessionScope.admin.admin_name}" default="默认"></c:out><a href="/alllogin"
                                                                                          class="logout_b"
                                                                                          style="color:red">登出</a> <br>
            <div class="time"></div>
        </div>
        <div class="menu">
            <ul>
                <li><a href="AdminFrontPage">首页</a></li>
                <li><a href="AdminPasswordChange">修改密码</a></li>
                <li><a href="javascript:window.location.reload(true);">刷新</a></li>
                <li><a href="AdminHelpPage">帮助</a></li>
            </ul>
        </div>
    </div>
    <div class="center_content">
        <div id="right_wrap">
            <div id="right_content">
                <h2>全部病房信息</h2>
                <div id="tab1" class="tabcontent">
                    <div class="form">
                        <div class="form_row">
                            <label>病房编号：</label> <select class="form_select"
                                                         name="ward_select" id="ward_select" style="width: 20%">
                            <c:forEach items="${wards}" var="w1" varStatus="cntw1">
                                <option <c:if test="${w1.ward_id == selected_ward.ward_id}">selected</c:if>>
                                        ${w1.ward_id}
                                </option>
                            </c:forEach>
                        </select>
                        </div>
                        <div class="form_row">
                            <label>空闲床位数：</label> <input type="text" class="form_input"
                                                         value="${selected_ward.bed_num}" name="" readonly="readonly"
                                                         style="width: 20%"/>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <h3>床位安排</h3>
                    <table id="rounded-corner" style="text-align: center">
                        <thead>
                        <tr>
                            <th>床位号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>年龄</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <td colspan="12"></td>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach items="${patients}" var="pat" varStatus="cntpat">
                        <tr class="odd">
                            <td>${pat.bed_id}
                            </td>
                            <td>${pat.patient_name}
                            </td>
                            <td>${pat.patient_sex}
                            </td>
                            <td>${pat.patient_age}
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
                <li><a href="AdminPatientInfo">病人</a></li>
                <li><a href="AdminDoctorInfo">医生</a></li>
                <li><a href="AdminWardInfo" class="selected">病房</a></li>
                <li><a href="AdminDepartmentInfo">科室</a></li>
            </ul>

            <h2>操作</h2>

            <ul>
                <li><a href="AdminAddDoctor">医生录入</a></li>
                <li><a href="AdminAddPatient">病人录入</a></li>
                <li><a href="AdminAddWard">新增病房</a></li>
                <li><a href="AdminAddDepartment">新增科室</a></li>
                <li><a href="AdminConfirm">申请核实</a></li>
            </ul>

        </div>


        <div class="clear"></div>
        <!-- important!!! -->
    </div>
    <!--end of center_content-->

    <div class="footer">CopyRight©2018</div>

</div>


</html>
