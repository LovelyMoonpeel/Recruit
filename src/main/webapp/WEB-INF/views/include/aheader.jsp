<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>퍼팩트 매칭</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/rpjt/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/rpjt/css/shop-item.css" rel="stylesheet">
<link href="/resources/rpjt/css/styles.css" rel="stylesheet">
<!-- <link href="/resources/rpjt/css/lovelyB_022711.css" rel="stylesheet"> -->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<style>
/* 관리자 페이지*/
.navbar-brand-sub{
  float:left;
  height:50px;
  padding:15px 15px;
  font-size:13px;
  line-height:20px;
  color:#9d9d9d; 
}
.navbar-brand-sub:hover,
.navbar-brand-sub:focus {
  text-decoration: none;
}
.navbar-brand-sub:hover,
.navbar-brand-sub:focus {
  color: #5e5e5e;
  background-color: transparent;
}
/* 관리자 페이지 끝*/
</style>


</head>

<body>

<%@include file="../include/jheader.jsp"%>
<%@ page import = "com.recruit.domain.BoardVO" %>

<%
/* 	String id = "";
	BoardVO login = null; */
	
	try{
		/* System.out.println("첫번째"); */
		/* login = (BoardVO)session.getAttribute("login"); */
		/* System.out.println("로그인"+login);
		System.out.println("두번째"); */
		/* if(login != null){
		id = login.getId();} */
/* 		System.out.println("세번째");
		System.out.println("아이디값 출력" + id); */
		if(login == null){
%>
		<script>
			alert("접근 권한이 없습니다.");
			location.href= "/";
		</script>
<%			
		}
		if(!id.equals("admin")){
			/* System.out.println("아이디 입니다요" + id); */
%>
		<script>
			alert("접근 권한이 없습니다.");
			location.href= "/";
		</script>
<%
			/* response.sendRedirect("/cs/S_faq"); */
			/* System.out.println("나옵니까?"); */
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>


	<!-- Page Content -->
<div class="container-fluid">
	<div class="row">
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">관리자페이지</div>
				<div class="profile-usertitle-status">
					<span class="indicator label-success"></span>Online
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="list-group">
			<a href="/admin/main" class="list-group-item">개인관리</a> <a
				href="/admin/company" class="list-group-item">기업관리</a>
				<a href="#"	class="list-group-item">통계</a>
				<a href="/admin/amodify" class="list-group-item">관리자정보수정</a>
				<a href="/admin/faq" class="list-group-item">FAQ</a>
				<a href="/admin/qna" class="list-group-item">Q&A</a>
		</div>
	</div>

	<!-- <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">Username</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="index.html"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>
			<li><a href="widgets.html"><em class="fa fa-calendar">&nbsp;</em> Widgets</a></li>
			<li class="active"><a href="charts.html"><em class="fa fa-bar-chart">&nbsp;</em> Charts</a></li>
			<li><a href="elements.html"><em class="fa fa-toggle-off">&nbsp;</em> UI Elements</a></li>
			<li><a href="panels.html"><em class="fa fa-clone">&nbsp;</em> Alerts &amp; Panels</a></li>
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> Multilevel <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="#">
						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 1
					</a></li>
					<li><a class="" href="#">
						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 2
					</a></li>
					<li><a class="" href="#">
						<span class="fa fa-arrow-right">&nbsp;</span> Sub Item 3
					</a></li>
				</ul>
			</li>
			<li><a href="login.html"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div>/.sidebar -->