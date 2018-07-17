<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>申请核实</title>

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

            $(".bed_change_refuse").click(function () {
                var x = ($(this).parent().parent().find("td").eq(0).html().replace(/[\r\n\s]/g,""));
                var stat = '2';
                $.ajax({
                    url: "/AdminBedChange",
                    type: "post",
                    data: {
                        count_id: x,
                        stat: stat
                    },
                    success: function () {
                        window.location.reload();
                    }
                })
                return true;
            });
            $(".bed_change_accept").click(function () {
                var x = ($(this).parent().parent().find("td").eq(0).html().replace(/[\r\n\s]/g,""));
                var stat = '1';
                $.ajax({
                    url: "/AdminBedChange",
                    type: "post",
                    data: {
                        count_id: x,
                        stat: stat
                    },
                    success: function () {
                        window.location.reload();
                    }
                })
                return true;
            });

            $(".outhospital_refuse").click(function () {
                var x = ($(this).parent().parent().find("td").eq(0).html().replace(/[\r\n\s]/g,""));
                var stat = '2';
                $.ajax({
                    url: "/AdminOutHospital",
                    type: "post",
                    data: {
                        count_id: x,
                        stat: stat
                    },
                    success: function () {
                        window.location.reload();
                    }
                })
                return true;
            });
            $(".outhospital_accept").click(function () {
                var x = ($(this).parent().parent().find("td").eq(0).html().replace(/[\r\n\s]/g,""));
                var stat = '1';
                $.ajax({
                    url: "/AdminOutHospital",
                    type: "post",
                    data: {
                        count_id: x,
                        stat: stat
                    },
                    success: function () {
                        window.location.reload();
                    }
                })
                return true;
            });
        })
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
                <h2>申请确认</h2>
                <div id="tab1" class="tabcontent">
                    <h3>病床申请记录</h3>
                    <table class="rounded-corner" style="text-align: center">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>病人编号</th>
                            <th>原病床</th>
                            <th>申请病床</th>
                            <th>提交日期</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <td colspan="12"></td>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach items="${wardexs}" var="we" varStatus="cntwe">
                            <tr class="odd">
                                <td>${we.count_id}
                                </td>
                                <td>${we.patient_id}
                                </td>
                                <td>${we.o_bed_id}
                                </td>
                                <td>${we.bed_id}
                                </td>
                                <td><fmt:formatDate value="${we.submit_date}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                </td>
                                <td>
                                    <c:if test="${we.stat == 1}">受理</c:if>
                                    <c:if test="${we.stat == 2}">拒绝</c:if>
                                    <c:if test="${we.stat == 0}">
                                        <input type="button"
                                               class="form_submit bed_change_accept" value="受理"
                                               style="float: none;"/> <input type="button"
                                                                             class="form_submit bed_change_refuse"
                                                                             value="拒绝"
                                                                             style="float: none;background: #eb8484"/>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <h3 style="margin-top: 40px;">出院申请记录</h3>
                    <table class="rounded-corner" style="text-align: center">
                        <thead>
                        <tr>
                            <th>预约编号</th>
                            <th>病人编号</th>
                            <th>申请日期</th>
                            <th>留言</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <td colspan="12"></td>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach items="${outhospitals}" var="oh" varStatus="cntoh">
                            <tr class="odd">
                                <td>${oh.count_id}
                                </td>
                                <td>${oh.patient_id}
                                </td>
                                <td><fmt:formatDate value="${oh.submit_date}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                </td>
                                <td style="width: 250px;">${oh.postscript}
                                </td>
                                <td>
                                    <c:if test="${oh.stat == 1}">受理</c:if>
                                    <c:if test="${oh.stat == 2}">拒绝</c:if>
                                    <c:if test="${oh.stat == 0}">
                                        <input type="button"
                                               class="form_submit outhospital_accept" value="受理"
                                               style="float: none;"/> <input type="button"
                                                                             class="form_submit outhospital_refuse"
                                                                             value="拒绝"
                                                                             style="float: none;background: #eb8484"/>
                                    </c:if>
                                </td>
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
                <li><a href="AdminWardInfo">病房</a></li>
                <li><a href="AdminDepartmentInfo">科室</a></li>
            </ul>

            <h2>操作</h2>

            <ul>
                <li><a href="AdminAddDoctor">医生录入</a></li>
                <li><a href="AdminAddPatient">病人录入</a></li>
                <li><a href="AdminAddWard">新增病房</a></li>
                <li><a href="AdminAddDepartment">新增科室</a></li>
                <li><a href="AdminConfirm" class="selected">申请核实</a></li>
            </ul>

        </div>


        <div class="clear"></div>
        <!-- important!!! -->
    </div>
    <!--end of center_content-->

    <div class="footer">CopyRight©2018</div>

</div>


</html>
