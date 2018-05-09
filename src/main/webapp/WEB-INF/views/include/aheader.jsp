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
<%@ page import = "com.recruit.domain.UserVO" %>

<%
	try{
		if(login == null){
%>
		<script>
			alert("접근 권한이 없습니다.");
			location.href= "/";
		</script>
<%			
		}
		if(!id.equals("admin")){
%>
		<script>
			alert("접근 권한이 없습니다.");
			location.href= "/";
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
				<a href="/admin/main" class="list-group-item" id="main pmodi resmo main?"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;개인관리</a>
				<a href="/admin/company" class="list-group-item" id="compan cmodif rmodif"><span class="glyphicon glyphicon-briefcase"></span>&nbsp;&nbsp;&nbsp;&nbsp;기업관리</a>
				<a href="/admin/chart" class="list-group-item" id="chart"><span class="glyphicon glyphicon-stats"></span>&nbsp;&nbsp;&nbsp;&nbsp;통계</a>
				<a href="/admin/notice" class="list-group-item" id="notic"><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a>
				<!-- <a href="/admin/usage" class="list-group-item" id="usage"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;&nbsp;&nbsp;이용약관</a> -->
				<a href="/admin/faq" class="list-group-item" id="faq faqmo faqre"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a>
				<a href="/admin/qna" class="list-group-item" id="qna qnamo"><span class="glyphicon glyphicon-question-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;Q&A</a>
			</div>
		</div>
<script>
	
/* var thisfilefullname1 = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.length);
var thisfilefullname2 = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.lastIndexOf("?"));
	
  for(var i =0; i<=$("a[name='sideBtns']").length-1; i++){
 	var active_id = $("a[name='sideBtns']").eq(i).attr("id");
 	if(active_id.indexOf(thisfilefullname1)!= -1){
 		$("a[name='sideBtns']").eq(i).addClass("chk_active");
 		
 	}else if(active_id.indexOf(thisfilefullname2)!= -1){
 		
 		$("a[name='sideBtns']").eq(i).addClass("chk_active");
 	}
 } */
  
	var nav_id = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.lastIndexOf("/") + 6);

	for(var i =0; i<=$(".list-group-item").length -1; i++){
		
		if($(".list-group-item").eq(i).attr("id").indexOf(nav_id)!= -1){
			
			$(".list-group-item").eq(i).css("color","black");
			$(".list-group-item").eq(i).addClass("list-active");
			
		}/* else{
			console.log(i+"번째 네비게이션 pheader뭔가 이상합니다.");
		} */
	}
  
</script>