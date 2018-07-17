<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>换房申请</title>

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

        function cheek() {
            var radios = document.getElementsByName("bed_select");
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    return true;
                }
            }
            return false;
        }


        $(function () {
            $("#wardchange").submit(function () {
                if (!cheek()) {
                    alert("未选中新的病床！");
                    return false;
                }
                var x = ($("input[name='bed_select']:checked").parent().parent().find("td").eq(2).html());
                var o_bed_id = ($("#o_bed_id").val());
                $.ajax({
                    url: "/ChangeWard",
                    type: "post",
                    data: {
                        ex_bed_id: x,
                        o_bed_id: o_bed_id
                    },
                    success: function () {
                        alert("申请已提交，请等待回复");
                        window.location.reload();
                    }
                })
                return false;
            })
        })
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
                <ul id="tabsmenu" class="tabsmenu">
                    <li class="active"><a href="#tab1">申请</a></li>
                </ul>
                <div id="tab1" class="tabcontent">
                    <div class="form">
                        <div class="form_row">
                            <label>病房编号：</label> <input type="text" class="form_input"
                                                        value="${ward_id}" name="" readonly="readonly"
                                                        style="width: 20%"/>
                        </div>
                        <div class="form_row">
                            <label>所在床位：</label> <input type="text" class="form_input"
                                                        value="${bed_id}" name="" readonly="readonly"
                                                        style="width: 40%" id="o_bed_id"/>
                        </div>
                        <div class="clear"></div>
                        <h3>空闲床位</h3>
                        <form action="" class="form" method="post" name="form2"
                              id="wardchange">
                            <table class="rounded-corner" style="text-align: center">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>房间号</th>
                                    <th>病床号</th>
                                    <th>状态</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <td colspan="12"></td>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${free_bed}" var="fb" varStatus="cntfb">
                                <tr class="odd">
                                    <td width="40px"><input type="radio" name="bed_select"/></td>
                                    <td>${fb.ward_id}
                                    </td>
                                    <td>${fb.bed_id}
                                    </td>
                                    <td>空闲</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="form_row" style="margin-top: 20px;float: right;">
                                <input type="submit" class="form_submit" value="提交"/> <input
                                    type="reset" class="form_reset" value="重置"/>
                            </div>
                        </form>
                        <h3 style="margin-top: 40px;">申请记录</h3>
                        <table class="rounded-corner" style="text-align: center">
                            <thead>
                            <tr>
                                <th>房间号</th>
                                <th>病床号</th>
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
                            <c:forEach items="${ward_ex}" var="we" varStatus="cntwe">
                            <tr class="odd">
                                <td>${we.bed.ward_id}
                                </td>
                                <td>${we.bed.bed_id}
                                </td>
                                <td><fmt:formatDate value="${we.submit_date}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                </td>
                                <td>
                                    <c:if test="${we.stat == 1}">受理</c:if>
                                    <c:if test="${we.stat == 2}">拒绝</c:if>
                                    <c:if test="${we.stat == 0}">待处理</c:if>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="clear"></div>
                    </div>
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
                <li><a href="WardChange" class="selected">换房申请</a></li>
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
