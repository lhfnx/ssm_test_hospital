<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>预约医生</title>

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
            var radios = document.getElementsByName("doctor_select");
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    return true;
                }
            }
            return false;
        }

        $(function () {
            $("#registerdoc").submit(function () {
                if (!cheek()) {
                    alert("未选中医生！");
                    return false;
                }
                var x = ($("input[name='doctor_select']:checked").parent().parent().find("td").eq(1).html());
                $.ajax({
                    url: "/DocRegister",
                    type: "post",
                    data: {
                        re_doc_id: x
                    },
                    success: function () {
                        alert("预约已提交，请等待回复");
                        window.location.reload(true);
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
                    <li class="active"><a href="#tab1">预约</a></li>
                </ul>
                <div id="tab1" class="tabcontent">
                    <div class="form">
                        <h3>医生</h3>
                        <form action="" class="form" method="post" name="form2"
                              id="registerdoc">
                            <table class="rounded-corner" style="text-align: center">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>医生编号</th>
                                    <th>医生姓名</th>
                                    <th>性别</th>
                                    <th>年龄</th>
                                    <th>所属科室</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <td colspan="12"></td>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${all_doc}" var="doc" varStatus="cntdoc">
                                    <tr class="odd">
                                        <td width="40px"><input type="radio" name="doctor_select"/></td>
                                        <td>${doc.doctor_id}
                                        </td>
                                        <td>${doc.doctor_name}
                                        </td>
                                        <td>${doc.doctor_sex}
                                        </td>
                                        <td>${doc.doctor_age}
                                        </td>
                                        <td>${doc.department.department_name}
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="form_row" style="margin-top: 20px;float: right;">
                                <input type="submit" class="form_submit" value="提交"/> <input
                                    type="reset" class="form_reset" value="重置"/>
                            </div>
                        </form>
                        <h3 style="margin-top: 40px;">预约记录</h3>
                        <table class="rounded-corner" style="text-align: center">
                            <thead>
                            <tr>
                                <th>医生编号</th>
                                <th>医生姓名</th>
                                <th>预约日期</th>
                                <th>状态</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <td colspan="12"></td>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach items="${reg_doc}" var="rdoc" varStatus="cntrdoc">
                            <tr class="odd">
                                <td>${rdoc.doctor.doctor_id}
                                </td>
                                <td>${rdoc.doctor.doctor_name}
                                </td>
                                <td><fmt:formatDate value="${rdoc.submit_date}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                </td>
                                <td>
                                    <c:if test="${rdoc.stat == 0}">等待</c:if>
                                    <c:if test="${rdoc.stat == 1}">成功</c:if>
                                    <c:if test="${rdoc.stat == 2}">失败</c:if>
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
                <li><a href="WardChange">换房申请</a></li>
            </ul>

            <h2>挂号</h2>

            <ul>
                <li><a href="RegisterDoc" class="selected">医生预约</a></li>
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
