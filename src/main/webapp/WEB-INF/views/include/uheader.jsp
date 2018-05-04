<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/resources/rpjt/img/favicon.png" type="image/x-icon">
<link rel="icon" href="/resources/rpjt/img/favicon.png" type="image/x-icon">
<title>RecruIT</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/rpjt/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<!-- <link href="css/shop-item.css" rel="stylesheet"> -->
<link href="/resources/rpjt/css/lovelyB_022711.css" rel="stylesheet">
<link href="/resources/rpjt/css/styles.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>

	<%@include file="../include/jheader.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
				<div class="profile-sidebar">
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">회원정보 확인</div>
						<div class="profile-usertitle-status">
							<span class="indicator label-danger"></span>OFFLINE
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<ul class="nav menu list-group">
					<li><a href="/user/IDsearch" id="IDsearch" class="hover">아이디 찾기</a></li>
					<li><a href="/user/PWsearch" id="PWsearch" class="hover">비밀번호 찾기</a></li>
				</ul>
				<!-- 				<div class="list-group">
					<a href="/cs/faq" class="list-group-item">FAQ</a> <a href="/cs/qna"
						class="list-group-item">Q&A</a>
				</div> -->
			</div>
			
<script>
var path = window.location.pathname.substr(6,8);
var id = $("#IDsearch");
var pw = $("#PWsearch");

if(id.attr("id")==path){
	id.addClass("chk_active");
}
if(pw.attr("id")==path){
	pw.addClass("chk_active");
}
</script>
 	<!-- Page Content -->
<!--	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<p class="lead">회원정보 확인</p>
				<div class="list-group">
					<a href="/user/IDsearch" class="list-group-item">아이디 찾기</a>
					<a href="/user/PWsearch" class="list-group-item">비밀번호 찾기</a>
				</div>
			</div> -->