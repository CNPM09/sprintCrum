<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<% String context = request.getContextPath(); request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    
    <!-- logo title -->
    <link rel="icon" href="./asset/img/fit-logo.png" type="image/icon type">
    <!-- CSS -->
    <link rel="stylesheet" href="./asset/css/base.css">
    <link rel="stylesheet" href="./asset/css/login-styles.css">
    <!-- icon -->
    <script src="https://kit.fontawesome.com/18ce1a4b11.js" crossorigin="anonymous"></script>
    <!-- Add html khác -->
    <script src="https://unpkg.com/htmlincludejs"></script>
</head>
<body>
    <jsp:include page="./header/header.jsp" />
    <div class="content">
        <div class="login">
            <div class="login__header"><h3>ĐĂNG NHẬP</h3></div>
            <form class = "login__form" action="<%=context%>/login" method="POST">
<%--                <input  value="${}">--%>
                <div class="login__form-position">
                    <input type="radio" name="position_choice" id="sinhvien" value="Sinh viên">
                    <label for="sinhvien">Sinh viên</label>
                    <input type="radio" name="position_choice" id="giangvien" value="Giảng viên">
                    <label for="giangvien">Giảng viên</label>
                    <input type="radio" name="position_choice" id="truongbomon" value="Trưởng bộ môn">
                    <label for="truongbomon">Trưởng môn</label>
                    <input type="radio" name="position_choice" id="admin" value="Admin">
                    <label for="admin">Admin</label>
                </div>
                <div class="login__form-userpass">
                    <input type="text" name="username" id="username" value="${username}" placeholder="Tên đăng nhập">
                    <input type="password" name="password" id="password" value="${password}" placeholder="Mật khẩu">
                </div>
                <input type="submit" value="Join Now">
            </form>
        </div>
    </div>

     <jsp:include page="./footer/footer.jsp" />
</body>
</html>