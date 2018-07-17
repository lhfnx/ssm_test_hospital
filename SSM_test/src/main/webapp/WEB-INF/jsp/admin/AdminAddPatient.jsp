<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>病人录入</title>
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
            $("#addpatient").submit(function () {
                var x = ($(this).serialize());
                $.ajax({
                    url: "/AdminAddNewPatient",
                    type: "post",
                    data: {
                        patient_id: x.split("&")[0].split("=")[1],
                        resident_id: x.split("&")[1].split("=")[1],
                        patient_name: x.split("&")[2].split("=")[1],
                        patient_sex: x.split("&")[3].split("=")[1],
                        patient_age: x.split("&")[4].split("=")[1],
                        address: x.split("&")[5].split("=")[1],
                        patient_ph: x.split("&")[6].split("=")[1],
                        register_price: x.split("&")[7].split("=")[1],
                        in_time: x.split("&")[8].split("=")[1],
                        out_time: x.split("&")[9].split("=")[1],
                        host_ex: x.split("&")[10].split("=")[1],
                        doctor_id: x.split("&")[11].split("=")[1],
                        bed_id: x.split("&")[12].split("=")[1],
                        report_id: x.split("&")[13].split("=")[1],
                        r_create_time: x.split("&")[14].split("=")[1],
                        report_detail: x.split("&")[15].split("=")[1],
                        report_ex: x.split("&")[16].split("=")[1],
                        department_id: x.split("&")[17].split("=")[1],
                        prescribe_id: x.split("&")[18].split("=")[1],
                        prescribe_detail: x.split("&")[19].split("=")[1],
                        p_create_time: x.split("&")[20].split("=")[1],
                        treat_ex: x.split("&")[21].split("=")[1],
                        p_doctor_id: x.split("&")[22].split("=")[1]
                    },
                    success: function () {
                        alert("添加新病人成功");
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
                <h2>新增病人</h2>
                <div id="tab1" class="tabcontent">
                    <form action="" class="form1" method="post" name="form3"
                          id="addpatient" accept-charset="utf-8">
                        <div class="form">
                            <h3>基本信息</h3>
                            <div class="form_row">
                                <label>病人编号：</label> <input type="text" class="form_input"
                                                            name="patient_id" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>身份证号：</label> <input type="text" class="form_input"
                                                            name="resident_id" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>姓名：</label> <input type="text" class="form_input"
                                                          name="patient_name" style="width: 20%"/>
                            </div>
                            <div class="form_row">
                                <label>性别：</label> <input type="text" class="form_input"
                                                          name="patient_sex" style="width: 10%;margin-right: 20px"/>
                            </div>
                            <div class="form_row">
                                <label>年龄：</label> <input type="text" class="form_input"
                                                          name="patient_age" style="width: 10%;float:left;"/>
                            </div>
                            <div class="form_row">
                                <label>住址：</label>
                                <textarea class="form_textarea" name="address"
                                          style="width: 300px;"></textarea>
                            </div>
                            <div class="form_row">
                                <label>联系方式：</label> <input type="text" class="form_input"
                                                            name="patient_ph" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>挂号费：</label> <input type="text" class="form_input"
                                                           name="register_price" style="width: 20%"/>
                            </div>
                            <div class="form_row">
                                <label>入院时间：</label> <input type="date" class="form_input"
                                                            name="in_time" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>出院时间：</label> <input type="date" class="form_input"
                                                            name="out_time" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>住院费：</label> <input type="text" class="form_input"
                                                           name="host_ex" style="width: 20%"/>
                            </div>
                            <div class="form_row">
                                <label>主治医生：</label> <select class="form_select"
                                                             name="doctor_id" style="width: 20%;">
                                <c:forEach items="${doctors}" var="doc" varStatus="cntdoc">
                                    <option>${doc.doctor_id}
                                    </option>
                                </c:forEach>
                            </select>
                                <!--<input type="text" class="form_input" name="department_id" style="width: 20%"/> -->
                            </div>
                            <div class="form_row">
                                <label>病床：</label> <select class="form_select" name="bed_id"
                                                           style="width: 20%;">
                                <c:forEach items="${beds}" var="bed" varStatus="cntbed">
                                    <option>${bed.bed_id}
                                    </option>
                                </c:forEach>
                            </select>
                                <!--<input type="text" class="form_input" name="department_id" style="width: 20%"/> -->
                            </div>
                            <div class="clear"></div>
                            <h3>检验报告</h3>
                            <div class="form_row">
                                <label>报告编号：</label> <input type="text" class="form_input"
                                                            name="report_id" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>开具时间：</label> <input type="date" class="form_input"
                                                            name="r_create_time" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>内容：</label>
                                <textarea class="form_textarea" name="report_detail"
                                          style="width: 300px;"></textarea>
                            </div>
                            <div class="form_row">
                                <label>检验费：</label> <input type="text" class="form_input"
                                                           name="report_ex" style="width: 20%"/>
                            </div>
                            <div class="form_row">
                                <label>开具科室：</label> <select class="form_select"
                                                             name="department_id" style="width: 20%;">
                                <c:forEach items="${departments}" var="dep" varStatus="cntdep">
                                    <option>${dep.department_id}
                                    </option>
                                </c:forEach>
                            </select>
                            </div>
                            <div class="clear"></div>
                            <h3>处方信息</h3>
                            <div class="form_row">
                                <label>处方编号：</label> <input type="text" class="form_input"
                                                            name="prescribe_id" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>内容：</label>
                                <textarea class="form_textarea" name="prescribe_detail"
                                          style="width: 300px;"></textarea>
                            </div>
                            <div class="form_row">
                                <label>开具时间：</label> <input type="date" class="form_input"
                                                            name="p_create_time" style="width: 40%"/>
                            </div>
                            <div class="form_row">
                                <label>治疗验费：</label> <input type="text" class="form_input"
                                                            name="treat_ex" style="width: 20%"/>
                            </div>
                            <div class="form_row">
                                <label>开具医生：</label> <select class="form_select"
                                                             name="p_doctor_id" style="width: 20%;">
                                <c:forEach items="${doctors}" var="doc" varStatus="cntdoc">
                                    <option>${doc.doctor_id}
                                    </option>
                                </c:forEach>
                            </select>
                            </div>
                            <div class="form_row" style="margin-top: 20px;float: right;">
                                <input type="submit" class="form_submit" value="提交"/> <input
                                    type="reset" class="form_reset" value="重置"/>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <!-- end of right content-->


        <div class="sidebar" id="sidebar">
            <h2>信息查询</h2>

            <ul>
                <li><a href="AdminPatientInfo">病人</a></li>
                <li><a href="AdminDoctorInfo">医生</a></li>
                <li><a href="AdminWardInfo">病房</a></li>
                <li><a href="AdminDepartmentInfo">科室</a></li>
            </ul>

            <h2>操作</h2>

            <ul>
                <li><a href="AdminAddDoctor">医生录入</a></li>
                <li><a href="AdminAddPatient" class="selected">病人录入</a></li>
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
