<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý đề tài | Student</title>

    <!-- logo title -->
<%--    <link rel="icon" href="/asset/img/fit-logo.png">--%>
    <link rel="icon" href="${pageContext.request.contextPath}/asset/img/fit-logo.png">
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/base.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/main.css" type="text/css">
    <!-- icon -->
    <script src="https://kit.fontawesome.com/18ce1a4b11.js" crossorigin="anonymous"></script>
    <!-- Add html khác -->
    <script src="https://unpkg.com/htmlincludejs"></script>
</head>

<body>
<!-- Header -->
<!--<div id="header"></div>
script src="./asset/script/header-import.js"></script>-->
<jsp:include page="../header/header.jsp" />

<!-- Content -->
<div class="content">
    <!-- Menu -->
    <div class="content__menu">
        <div class="menu__header">
            <h3>Danh mục</h3>
        </div>
        <ul class="menu__nav">
            <li>
                <a href="./make-schedule.html">
                    <i class="bell-icon fa-solid fa-bell" style="color: var(--blue-color)"></i>
                    Thông báo
                </a>
            </li>
            <li>
                <a href="./make-schedule.html">
                    <i class="fa-solid fa-users"></i>
                    Đăng ký nhóm
                </a>
            </li>
            <li>
                <a href="">
                    <i class="fa-solid fa-pen-to-square"></i>
                    Danh sách đề tài
                </a>
            </li>
            <li>
                <a href="">
                    <i class="fa-solid fa-circle-info"></i>
                    Thông tin cá nhân
                </a>
            </li>
            <li>
                <a href="">
                    <i class="fa-solid fa-user"></i>
                    Quản lý tài khoản
                </a>
            </li>
        </ul>
    </div>
    <div class="content__main">
        <div class="content__main__breadcumb">Trang chủ</div>
        <div class="content__main__notify">
            <div class="content__main__notify-header">
                <i class="bell-icon fa-solid fa-bell"></i>
                Thông báo
            </div>
            <div class="content__main__notify-list">

            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer/footer.jsp" />
<!-- Footer -->
<!--<div id="footer"></div>
<script src="./asset/script/footer-import.js"></script>-->
</body>

</html>