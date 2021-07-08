<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/11 0011
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@page import="pers.gulo.fm.domain.User" %>
<%@page import="pers.gulo.fm.service.Impl.AdminServiceImpl" %>
<%@page import="pers.gulo.fm.service.AdminService" %>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pers.gulo.fm.exception.MyException" %>
<%
    User user=(User) session.getAttribute("user");
    if(user==null)
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    int userID=Integer.parseInt(request.getParameter("userID"));
    AdminService adminService=new AdminServiceImpl();
    List<User> userList= null;
    try {
        userList = adminService.queryAllUsers();
    } catch (MyException e) {
        e.printStackTrace();
    }
    for(User u:userList){
        if(u.getUserID()==userID){
            request.setAttribute("user",u);
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
    <title>修改用户信息</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jsjquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h2 class="sub-header">修改用户信息</h2>
    <form class="form-horizontal" role="form" method="post" action="servlet/UpdateUserByUserServlet">

        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="username" value="${user.name}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">用户密码</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="password" value="${user.password}" >
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">用户真实姓名</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="realName" value="${user.realName}" >
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">身份证号码</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="idCard" value="${user.idCard}">
            </div>
        </div>
        
        <button type="submit" class="btn btn-default">提交</button>
    </form>
</div>
</body>

</html>
