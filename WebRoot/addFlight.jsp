<%@ page import="pers.gulo.fm.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/11 0011
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@page import="pers.gulo.fm.domain.Flight" %>
<%@page import="pers.gulo.fm.service.Impl.AdminServiceImpl" %>
<%@page import="pers.gulo.fm.service.AdminService" %>
<%@page import="pers.gulo.fm.domain.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User user=(User)session.getAttribute("user");
    if(user==null){
        response.sendRedirect(request.getContextPath()+"/Login.jsp");
    }else{
        if(user.getUserType()!=1)
            response.sendRedirect(request.getContextPath()+"/Login.jsp");
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>添加新航班</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jsjquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h2 class="sub-header">添加新航班</h2>
    <form class="form-horizontal" role="form" method="post" action="servlet/AddFlightServlet">

        <div class="form-group">
            <label class="col-sm-2 control-label">航班编号</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="flightID">
            </div>
        </div>

		<div class="form-group">
            <label class="col-sm-2 control-label">航班号</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="flightName">
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label">出发时间</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="startTime">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">到达时间</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="endTime">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">出发地点</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="startCity">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">目的地点</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="endCity">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">票价</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="price">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">容量</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="capacity">
            </div>
        </div>
        <button type="submit" class="btn btn-default">提交</button>
    </form>
</div>
</body>

</html>
