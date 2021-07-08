<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/11 0011
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java" import="java.util.*" %>
<%@ page import="pers.gulo.fm.domain.User" %>
<%@ page import="pers.gulo.fm.service.AdminService" %>
<%@ page import="pers.gulo.fm.service.Impl.AdminServiceImpl" %>
<%@ page import="pers.gulo.fm.domain.Flight" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    User user =(User)session.getAttribute("user");
    if(user==null){
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    }else{
        if(user.getUserType()!=1){
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }
    int flightID=Integer.parseInt(request.getParameter("flightID"));
    AdminService adminService=new AdminServiceImpl();
    List<Flight> flightList=adminService.queryAllFlight();
    for(Flight flight:flightList){
        if(flight.getFlightID()==flightID){
            request.setAttribute("flight",flight);
            break;
        }
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>修改航班信息</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jsjquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h2 class="sub-header">修改航班信息</h2>
    <form class="form-horizontal" role="form" method="post" action="servlet/UpdateFlightServlet">
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">航班编号</label>
            <div class="col-sm-10">
                <input class="form-control" id="disabledInput" type="text" placeholder="${flight.flightID}" disabled name="flightID">
                <input type="hidden" name="flightID" value="${flight.flightID}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">起飞时间</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="startTime" value="${flight.s_time}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">到达时间</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="endTime" value="${flight.e_time}">
            </div>
        </div>

        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">出发地点</label>
            <div class="col-sm-10">
                <input class="form-control" id="disabledInput" type="text" placeholder="${flight.s_city}" disabled name="startCity">
                <input type="hidden" name="startCity" value="${flight.s_city}">
            </div>
        </div>

        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">到达地点</label>
            <div class="col-sm-10">
                <input class="form-control" id="disabledInput" type="text" placeholder="${flight.e_city}" disabled name="endCiy">
                <input type="hidden" name="endcity" value="${flight.e_city}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">头等舱余量</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="tSeatNum" value="${flight.TSeatsNum}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">商务舱余量</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="sSeatNum" value="${flight.SSeatsNum}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">经济舱余量</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="jSeatNum" value="${flight.JSeatsNum}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">头等舱票价</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="tPrice" value="${flight.TPrice}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">商务舱票价</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="sPrice" value="${flight.SPrice}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">经济舱票价</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="jPrice" value="${flight.JPrice}">
            </div>
        </div>

        <button type="submit" class="btn btn-default">提交</button>
    </form>
</div>
</body>

</html>
