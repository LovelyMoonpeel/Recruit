<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<!-- <link href="css/shop-item.css" rel="stylesheet"> -->
<link href="/resources/rpjt/css/lovelyB_022711.css" rel="stylesheet">

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

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">퍼팩트 매칭</a>
				<sub><a	href="/admin/A_main"><span class="navbar-brand-sub">관리자 페이지</span></a></sub>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">기업찾기</a></li>
					<li><a href="#">인재찾기</a></li>
					<li><a href="#">검색</a></li>
					<li><a href="#"> <span class="glyphicon glyphicon-user"></span>
							회원가입
					</a></li>
					<li><a href="#"> <span class="glyphicon glyphicon-log-in"></span>
							로그인
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<p class="lead">관리자페이지</p>
				<div class="list-group">
					<a href="/admin/A_main" class="list-group-item">개인관리</a>
					<a href="/admin/A_company" class="list-group-item">기업관리</a>
					<a href="#"	class="list-group-item">통계</a>
					<a href="/admin/A_amodify" class="list-group-item">관리자정보수정</a>
					<a href="/admin/A_faq" class="list-group-item">FAQ</a>
					<a href="/admin/A_qna" class="list-group-item">Q&A</a>
				</div>
			</div>