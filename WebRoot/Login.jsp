
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>登录/注册</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">

    <script src="js/ie-emulation-modes-warning.js"></script>
	<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
    <div class="container">
        <form class="form-signin" method="post" action="servlet/LoginServlet">
            <c:if test="${sessionScope.loginMsg!=null}">
                <div class="alert alert-info" role="alert">
                    ${loginMsg}
                    ${sessionScope.loginMsg=null}
                </div>
            </c:if>
            <h2 class="form-sigin-heading">请先登录</h2>

            <label for="inputText" class="sr-only">用户名</label>
            <input type="text" id="inputText" class="form-control" name="username" placeholder="username" required="" autofocus="">
            <label for="inputPassword" class="sr-only">密码</label>
            <input type="password" id="inputPassword" class="form-control" name="password",placeholder="password" required="">
            <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
            <button class="btn btn-lg btn-primary btn-success btn-block" type="button" onclick="javascript:window.location.href='register.jsp';">注册</button>

        </form>
    </div>
    <script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
