<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>recruIT</title>

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
	<%
		String button = "danger";
		String on_off = "Offline";

		try {
			if (login != null) {
				button = "success";
				on_off = "Online";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

	<!-- Page Content -->
	<div class="container-fluid">
		<div class="row">
			<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
				<div class="profile-sidebar">
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">고객센터</div>
						<div class="profile-usertitle-status">
							<span class="indicator label-<%=button%>"></span><%=on_off%>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<ul class="nav menu list-group">
					<li><a href="/cs/faq" class="hover" id="faq" value="/cs/faq"><span class="glyphicon glyphicon-info-sign"></span> FAQ</a></li>
					<li><a href="/cs/qna" class="hover" id="qna" value="/cs/qna"><span class="glyphicon glyphicon-question-sign"></span> Q&A</a></li>
				</ul>
				<!-- 				<div class="list-group">
					<a href="/cs/faq" class="list-group-item">FAQ</a> <a href="/cs/qna"
						class="list-group-item">Q&A</a>
				</div> -->
			</div>
			
<script>
var path = window.location.pathname.substr(4,3);
var faq = $("#faq");
var qna = $("#qna");

if(faq.attr("id")==path){
	faq.addClass("chk_active");
}
if(qna.attr("id")==path){
	qna.addClass("chk_active");
}
</script>