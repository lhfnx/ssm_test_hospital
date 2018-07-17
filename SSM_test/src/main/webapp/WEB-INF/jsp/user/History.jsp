<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>住院历史</title>

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
                <h2>住院历史</h2>
                <div id="tab1" class="tabcontent">
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
                    </div>
                    <table id="rounded-corner" style="text-align: center">
                        <thead>
                        <tr>
                            <th>入院时间</th>
                            <th>出院时间</th>
                            <th>床位号</th>
                            <th>主治医生</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <td colspan="12"></td>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach items="${history}" var="his" varStatus="cnthis">
                        <tr class="odd">
                            <td><fmt:formatDate value="${his.in_time}" pattern="yyyy-MM-dd"></fmt:formatDate>
                            </td>
                            <td><fmt:formatDate value="${his.out_time}" pattern="yyyy-MM-dd"></fmt:formatDate>
                            </td>
                            <td>${his.bed_id}
                            </td>
                            <td>${his.doctor_name}
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="clear"></div>
                </div>

            </div>
        </div>
        <!-- end of right content-->


        <div class="sidebar" id="sidebar">
            <h2>信息查询</h2>

            <ul>
                <li><a href="PatientInfo">病人</a></li>
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
                <li><a href="History" class="selected">住院历史</a>
            </ul>

        </div>

        <div class="clear"></div>
        <!-- important!!! -->
    </div>
    <!--end of center_content-->

    <div class="footer">CopyRight©2018</div>

</div>


</html>
