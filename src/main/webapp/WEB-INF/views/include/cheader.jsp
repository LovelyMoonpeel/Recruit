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
<!-- <link href="css/shop-item.css" rel="stylesheet"> -->
<link href="/resources/rpjt/css/lovelyB_022711.css" rel="stylesheet">

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

<%
	try{
		if(cname == null){
			%>
			<script>
			alert("기업 회원이 아닙니다.");
			self.location = "/personal/index";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<p class="lead">기업정보관리</p>
				<div class="list-group">
					<a href="/company/C_index" class="list-group-item">기업정보관리</a>
					<a href="/company/C_write" class="list-group-item">채용공고작성</a>
					<a href="/company/C_manage" class="list-group-item">채용공고관리</a>
					<a href="/company/C_recom" class="list-group-item">추천인재</a>
					<a href="/company/C_favor" class="list-group-item">관심인재</a>
				</div>
			</div>