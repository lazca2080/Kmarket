<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>케이마켓::관리자</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>    
    <script src="../js/gnb.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
    <div id="wrapper">
        <header>
            <div>
                <a href="/Kmarket/admin/index.do" class="logo">
                    <img src="./img/admin_logo.png" alt="admin_logo">
                </a>
                <p>
                <c:choose>
                	<c:when test="${sessUser eq null}">
	                	<a href="/Kmarket/admin/login.do">로그인 |</a>
	                	<a href="/Kmarket/member/join.do">  회원가입</a>
                	</c:when>
                	<c:otherwise>
                		<a><span>${sessUser.manager}</span>님, 반갑습니다  |</a>
                		<a href="/Kmarket/admin/index.do">HOME |</a>
                		<a href="/Kmarket/admin/logout.do">  로그아웃  |</a>
                		<a href="#">고객센터</a>
                	</c:otherwise>
                </c:choose>
                </p>
            </div>
        </header>
