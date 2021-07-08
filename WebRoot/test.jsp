<%@page import="pers.gulo.fm.domain.Flight" %>
<%@page import="pers.gulo.fm.service.Impl.AdminServiceImpl" %>
<%@page import="pers.gulo.fm.service.AdminService" %>
<%@page import="pers.gulo.fm.domain.User" %>
<%@page import="pers.gulo.fm.dao.Impl.UserDaoImpl" %>
<%@page import="pers.gulo.fm.dao.UserDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	User user=(User) request.getSession().getAttribute("user");
	UserDAO userDAO=new UserDaoImpl();
    if(user==null){
        response.sendRedirect(request.getContextPath()+"/Login.jsp");
    }
    
    request.setCharacterEncoding("UTF-8");
    int flightID=Integer.parseInt(request.getParameter("flightID"));
    int seatPrice=Integer.parseInt(request.getParameter("seatPrice"));
    Flight flight=userDAO.getFlightByID(flightID);
    request.setAttribute("flightID",flightID);
    request.setAttribute("flightName",flight.getName());
    request.setAttribute("seatPrice",seatPrice);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>添加乘客</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jsjquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h2 class="sub-header">添加乘客信息</h2>
    <form class="form-horizontal" role="form" method="post" action="servlet/BookServlet">
    
    <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">航班编号</label>
            <div class="col-sm-10">
                <input class="form-control" id="disabledInput" type="text" placeholder="${flightID}" disabled name="flightID">
                <input type="hidden" name="flightID" value="${flightID}">
            </div>
        </div>
        
		<div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">航班号</label>
            <div class="col-sm-10">
                <input class="form-control" id="disabledInput" type="text" placeholder="${flightName}" disabled name="flightName">
            </div>
        </div>

        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">票价</label>
            <div class="col-sm-10">
                <input class="form-control" id="disabledInput" type="text" placeholder="${seatPrice}" disabled name="seatPrice">
                <input type="hidden" name="seatPrice" value="${seatPrice}">
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="name">
            </div>
        </div>

		<div class="form-group">
            <label class="col-sm-2 control-label">身份证号</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="id">
            </div>
        </div>
        <button type="submit" class="btn btn-default">提交</button>
    </form>
</div>
</body>

</html>
