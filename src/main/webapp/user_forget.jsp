<%--
  Created by Eclipse.
  User: cym
  Date: 2020/06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>找回密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/cart.js"></script>
</head>
<body>

<!--header-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value=""></jsp:param>
</jsp:include>
<!--//header-->


<!--account-->
<div class="account">
    <div class="container">
        <div class="register">
            <c:if test="${!empty msg }">
                <div class="alert alert-danger">${msg }</div>
            </c:if>
            <form action="register.action" method="post">
                <div class="register-top-grid">
                    <h3>找回密码</h3>
                    <div class="input">
                        <span>手机号 <label style="color:red;">*</label></span>
                        <input type="text" name="uphone" placeholder="请输入手机号" required="required">
                    </div>
                    <div class="input">
                        <span>新密码 <label style="color:red;">*</label></span>
                        <input type="password" name="upwd" placeholder="请输入新密码" required="required">
                    </div>
                    <div class="input">
                        <span>验证码 <label style="color:red;">*</label></span>
                        <input type="text" name=" " placeholder="请输入验证码" required="required">
                        <span class="navbar-right"><a href="error/404error.jsp">获取验证码</a></span>
                    </div>
                </div>
                <div class="register-but text-center">
                    <input type="submit" value="立刻找回">
                    <div class="clearfix"> </div>
                </div>
            </form>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//account-->






<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
<!--//footer-->


</body>
</html>