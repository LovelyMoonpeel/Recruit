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

<div class="container">
	<div class="row">
	<div class="col-md-3">
			<div class="profile-sidebar">
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">고객센터</div>
						<div class="profile-usertitle-status">
							<span class="indicator label-<%=button%>"></span><%=on_off%>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			<div class="list-group">
				<a href="/cs/notice" class="hover list-group-item" id="notice" value="/cs/notice"><span class="glyphicon glyphicon-bullhorn"></span> 공지사항</a>
				<a href="/cs/usage" class="hover list-group-item" id="usage" value="/cs/usage"><span class="glyphicon glyphicon-list-alt"></span> 이용약관</a>
				<a href="/cs/faq" class="hover list-group-item" id="faq" value="/cs/faq"><span class="glyphicon glyphicon-info-sign"></span> FAQ</a>
				<a href="/cs/qna" class="hover list-group-item" id="qna" value="/cs/qna"><span class="glyphicon glyphicon-question-sign"></span> Q&A</a>
			</div>
		</div>
		
<script>
var path = window.location.pathname.substr(4,6);
var faq = $("#faq");
var qna = $("#qna");
var notice = $("#notice");
var usage = $("#usage");

if(faq.attr("id")==path){
	faq.addClass("chk_active");
}
if(qna.attr("id")==path){
	qna.addClass("chk_active");
}
if(notice.attr("id")==path){
	notice.addClass("chk_active");
}
if(usage.attr("id")==path){
	usage.addClass("chk_active");
}
</script>