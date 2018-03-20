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

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<p class="lead">마이페이지(개인)</p>
				<div class="list-grozup">
					<a href="/personal/index" class="list-group-item">개인정보관리 P_index</a><!-- p08 --> <a
						href="/personal/write?id=${PUserVO.id}" class="list-group-item">이력서 작성</a> <!-- p02 --><a
						href="/personal/manage" class="list-group-item">이력서 관리</a> <!-- p01 --><a
						href="/personal/recom?id=${PUserVO.id}" class="list-group-item">추천채용공고 P_recom</a> <!-- p04 --><a
						href="/personal/favor?id=${PUserVO.id}" id = "P_favor" class="list-group-item">관심채용공고 P_favor</a> <!-- p05 --><a
						href="/personal/applied?id=${PUserVO.id}" class="list-group-item">지원현황리스트 P_applied</a><!-- p07 -->
				</div>
			</div>