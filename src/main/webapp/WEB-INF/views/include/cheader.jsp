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

<!-- 문> 관심인재에 있던거 끌어다가 여기 공통으로 넣어놨음 -->
<style>

.gobox1{
	width: 740px; 
	padding: 0 0 15px 0; /*시계방향으로 패팅 설정  */
	margin: 0;
}
.gobox2{
	border: 1px solid #c1d1f2; 
	background-color: #f4f9ff; 
	padding: 50px;
	line-height: 200%;
	font-size:16px;
}


/* 문> 채용공고관리에서 반응형 카드를 구현하기 위한 css코드  */
.card {
  display: block;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border-radius: 2px;
    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
    transition: box-shadow .25s;
}
.card:hover {
  box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
}
.img-card {
  width: 100%;
  height:200px;
  border-top-left-radius:2px;
  border-top-right-radius:2px;
  display:block;
    overflow: hidden;
}
.img-card img{
  width: 100%;
  height: 200px;
  object-fit:cover;
  transition: all .25s ease;
}
.card-content {
  padding:15px;
  text-align:left;
}
.card-title {
  margin-top:0px;
  font-weight: 700;
  font-size: 1.65em;
}
.card-title a {
  color: #000;
  text-decoration: none !important;
}
.card-read-more {
  border-top: 1px solid #D4D4D4;
}
.card-read-more a {
  text-decoration: none !important;
  padding:10px;
  font-weight:600;
  text-transform: uppercase
}
/* 문> // 채용공고관리에서 반응형 카드를 구현하기 위한 css코드  */

.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
    z-index: 2;
    color: black;
    background-color: #dde2e6;
    border-color: #dde2e6;
}
</style> <!-- //요기까지  -->

</head>

<body class="fuelux">
	
	
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
				<!-- <p class="lead">기업정보관리</p> -->
				<div class="profile-sidebar">
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">기업정보관리</div>
						<div class="profile-usertitle-status">
							<span class="indicator label-success"></span>Online
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="list-group">
					<a href="/company/C_index" name="sideBtns" id="C_index C_modify" class="list-group-item"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;&nbsp;&nbsp;기업정보관리</a>
					<a href="/company/C_write" name="sideBtns" id="C_write"  class="list-group-item"><span class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;&nbsp;&nbsp;채용공고작성</a>
					<a href="/company/C_manage" name="sideBtns" id="C_manage C_recruitInfo C_recruitModify" class="list-group-item"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;&nbsp;&nbsp;채용공고관리</a>
					<a href="/company/C_recom" name="sideBtns" id="C_recom" class="list-group-item"><span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;&nbsp;&nbsp;추천인재</a>
					<a href="/company/C_favor" name="sideBtns" id="C_favor" class="list-group-item"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;&nbsp;&nbsp;관심인재</a>
					<a href="/company/C_pass" name="sideBtns" id="C_pass" class="list-group-item"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 변경</a>
					<a href="/company/C_leave" name="sideBtns" id="C_leave" class="list-group-item"><span class="glyphicon glyphicon-remove-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;탈퇴하기</a>
				</div>
			</div>
			
			<script>
			
			var thisfilefullname1 = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.length);
			var thisfilefullname2 = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.lastIndexOf("?"));
			
			
		
	
	  		for(var i =0; i<=$("a[name='sideBtns']").length -1; i++){
	 		
	 			if($("a[name='sideBtns']").eq(i).attr("id").indexOf(thisfilefullname1)!= -1){
				
	 				$("a[name='sideBtns']").eq(i).addClass("active");
	 			
	 			}else if($("a[name='sideBtns']").eq(i).attr("id").indexOf(thisfilefullname2)!= -1){
	 			
	 				$("a[name='sideBtns']").eq(i).addClass("active");
	 				
	 			}
	 		}
	  		
			</script>
			