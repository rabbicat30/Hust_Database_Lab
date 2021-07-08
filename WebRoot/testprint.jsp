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
    String name=new String(request.getParameter("name"));
    int seatID=Integer.parseInt(request.getParameter("seatID"));
    int seatPrice=Integer.parseInt(request.getParameter("seatPrice"));
    String s_time=new String(request.getParameter("s_time"));
    String e_time=new String(request.getParameter("e_time"));
    String s_city=new String(request.getParameter("s_city"));
    String e_city=new String(request.getParameter("e_city"));
   
    request.setAttribute("name",name);
    request.setAttribute("seatID",seatID);
    request.setAttribute("seatPrice",seatPrice);
    request.setAttribute("s_time",s_time);
    request.setAttribute("e_time",e_time);
    request.setAttribute("s_city",s_city);
    request.setAttribute("e_city",e_city);
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
 <script type="text/javascript" src="jquery.js"></script>
<style>
	table{width:800px;border:1px solid red;}
	td{width:200px;height:40px;}
</style>
</head>
<body>
 
<div style=" width:100%;text-align: center; margin:10px auto;">
   	<table>
   		<tr>
   			<td>航班：<td>
   			<td><c:out value="${name}"/></td>
   		</tr>
   		
   		<tr>
   			<td>座位号：<td>
   			<td><c:out value="${seatID}"/></td>
   		</tr>
   		
   		<tr>
   			<td>票价：<td>
   			<td><c:out value="${seatPrice}"/></td>
   		</tr>
   		
   		<tr>
   			<td>出发时间：<td>
   			<td><c:out value="${s_time}"/></td>
   		</tr>
   		
   		<tr>
   			<td>到达时间：<td>
   			<td><c:out value="${e_time}"/></td>
   		</tr>
   		
   		<tr>
   			<td>出发地点：<td>
   			<td><c:out value="${s_city}"/></td>
   		</tr>
   		
   		<tr>
   			<td>到达地点：<td>
   			<td><c:out value="${e_city}"/></td>
   		</tr>
   	
   	
   	</table>
</div>
<div id="printbtn" style=" width:100%;text-align: center; margin:10px auto;">
  <input type=button class="buttoncls" onclick="javascript:prt();" value="打  印"/>
</div>
 
 
 
<script  type="text/javascript">
    function prt()
    {
        var btn_obj = document.getElementById("printbtn");
        btn_obj.style.display="none";
        print();
        btn_obj.style.display="";
    }
</script>
</body>
</html>
