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
<style>
.list-group a:hover{
	color : black;
	background-color: #dde2e6;
}

.list-group a:focus {
	color : black;
	background-color: #dde2e6;
}
  
.list-active{
	color: black !important;
    background-color: #dde2e6;
}
</style>
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
				<a href="/cs/notice" class="list-group-item" id="notic"><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a>
				<a href="/cs/usage" class="list-group-item" id="usage"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;&nbsp;&nbsp;이용약관</a>
				<a href="/cs/faq" class="list-group-item" id="faq faqre"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a>
				<a href="/cs/qna" class="list-group-item" id="qna qnare qna?p"><span class="glyphicon glyphicon-question-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;Q&A</a>
			</div>
		</div>
		
<script>
var nav_id = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.lastIndexOf("/") + 6);
for(var i =0; i<=$(".list-group-item").length -1; i++){
	if($(".list-group-item").eq(i).attr("id").indexOf(nav_id)!= -1){
		$(".list-group-item").eq(i).css("color","black");
		$(".list-group-item").eq(i).addClass("list-active");
		
	}
}
</script>