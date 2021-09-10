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
    <title>用户登录</title>
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
<jsp:include page="header.jsp">
    <jsp:param name="flag" value="9"></jsp:param>
</jsp:include>
<!--//header-->

<!--account-->
<div class="account">
    <div class="container">
        <div class="register">
            <c:if test="${!empty msg }">
                <div class="alert alert-success">${msg }</div>
            </c:if>
            <c:if test="${!empty failMsg }">
                <div class="alert alert-danger">${failMsg }</div>
            </c:if>
            <form action="login.action" method="post">
                <div class="register-top-grid">
                    <h3>用户登录</h3>
					<div>
						<span class="navbar-right">忘记用户名,
							<a href="user_login_phone.jsp">手机号登录&nbsp;</a>
						</span>
					</div>
                    <div class="input">
                        <span>用户名 <label style="color:red;">*</label></span>
                        <input type="text" name="uname" placeholder="请输入用户名" required="required">
                    </div>
                    <div class="input">
                        <span>密码 <label style="color:red;">*</label></span>
                        <input type="password" name="upwd" placeholder="请输入密码" required="required">
                    </div>
                    <div class="input">
                        <span>验证码 <label style="color:red;">*</label></span>
                        <input  style="width:550px" type="text" name="vcode" placeholder="请输入验证码" required="required">
                        <img src="checkCode.action"  alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="register-but text-center">
                    <input type="submit" value="提交">
                    <div class="clearfix"> </div>
                </div>
                <div>
					<a href="user_forget.jsp">忘记密码</a>
					<span class="navbar-right">没有账号,
						<a href="user_register.jsp">去注册&nbsp;</a>
					</span>
				</div>
            </form>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//account-->






<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->


</body>
</html>
