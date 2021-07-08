<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/10 0010
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@page import="pers.gulo.fm.service.Impl.AdminServiceImpl" %>
<%@page import="pers.gulo.fm.service.AdminService" %>
<%@page import="pers.gulo.fm.dao.AdminDao" %>
<%@page import="pers.gulo.fm.domain.User" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pers.gulo.fm.exception.MyException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User user=(User) session.getAttribute("user");
	request.setCharacterEncoding("UTF-8");
    if(user==null)
        response.sendRedirect(request.getContextPath()+"/Login.jsp");
    else
        if(user.getUserType()!=1)
            response.sendRedirect(request.getContextPath()+"/Login.jsp");
    AdminService adminService=new AdminServiceImpl();
    List<User> userList= null;
    try {
        userList = adminService.queryAllUsers();
    } catch (MyException e) {
        e.printStackTrace();
    }
    request.setAttribute("userList",userList);
    request.setAttribute("userListLength",userList.size());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <title>机票预订系统控制台</title>

    <!-- Bootstrap core CSS -->
    <link href="./Dashboard Template for Bootstrap_files/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./Dashboard Template for Bootstrap_files/dashboard.css" rel="stylesheet">

    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

</head>
<body>
<!--首部nav和admin一样-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://v3.bootcss.com/examples/dashboard/#">机票预订系统控制台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="servlet/LogoutServlet">退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="admin.jsp">概况</a></li>
                <li class="active"><a href="#">用户管理<span class="sr-only">(current)</span></a></li>
                <li><a href="flightManage.jsp">航班管理</a></li>
                <li><a href="addFlight.jsp">录入新航班</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="orderManage.jsp">订单管理</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <c:if test="${userManageMsg!=null}">
                <div class="alert alert-info" role="alert">
                        ${userManageMsg}
                        ${userManageMsg=null}
                </div>
            </c:if>
            <h2 class="sub-header">当前共有${userListLength}位用户</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>用户编号</th>
                        <th>用户名</th>
                        <th>用户真实姓名</th>
                        <th>用户身份证号码</th>
                        <th>用户类型</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="u" items="${userList}">
                        <tr>
                            <td><c:out value="${u.userID}"/></td>
                            <td><c:out value="${u.name}"/></td>
                            <td><c:out value="${u.realName}"/></td>
                            <td><c:out value="${u.idCard}"/></td>
                            <td><c:out value="${u.userType }"/></td>
                            <td>
                  				<c:if test="${u.userType==1}">
                  					<c:out value="管理员"/>
                  				</c:if>
                  				<c:if test="${u.userType==0}">
                  					<c:out value="用户"/>
                  				</c:if>
                 			</td>
                            <td>
                                <button type="button" class="btn btn-xs btn-warning" onclick="javascript:window.location.href='userInfo.jsp?userID=${u.userID}';">修改</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./Dashboard Template for Bootstrap_files/jquery.min.js"></script>
<script src="./Dashboard Template for Bootstrap_files/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="./Dashboard Template for Bootstrap_files/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="./Dashboard Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>

</body>
</html>
