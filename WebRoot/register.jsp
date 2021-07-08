
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户注册</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="jsjquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h2 class="sub-header">用户注册</h2>
    <form class="form-horizontal" role="form" method="post" action="servlet/AddUserServlet">

        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="username">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">用户密码</label>
            <div class="col-sm-10">
                <input type="password" id="inputPassword" class="form-control" name="password" placeholder="password" required="">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">用户真实姓名</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="realName">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">用户身份证号</label>
            <div class="col-sm-10">
                <input class="form-control" id="focusedInput" type="text" name="idCard">
            </div>
        </div>

        <button type="submit" class="btn btn-default">提交</button>
    </form>
</div>
</body>

</html>
