<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.recruit.domain.BoardVO"%>


<%
	String id = "";
	BoardVO login = null;
	String cname = "";
	String location = ""; //mypage 경로 설정 변수
	String c_chk = null; //company_check
	String myPage = "MyPage"; //myPage 이름 변경

	try {
		login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			id = login.getId();
			cname = login.getCname();
			c_chk = login.getCname();
		}
		if (cname == null) {
			if (id.equals("admin")) {
				location = "/admin/main";
				myPage = "관리자 페이지";
			} else {
				location = "/personal/index";
			}
		} else {
			location = "/company/C_index";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<style>
.badge-danger {
  background-color: #dc3545;
}
.badge-danger:hover {
  background-color: #bd2130;
}
</style>
<div class="wrap">
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
				<a class="navbar-brand" href="/" style="font-size: 25px;">RecruIT</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/cs/notice">공지사항</a></li>
					<li><a href="/srch/main?stype=1">기업찾기</a></li>
					<li><a id="p_search" style="cursor: pointer;">인재찾기</a></li>

					<!--회원가입, 로그인 부분 -->
					<!--★ a href="#" 삭제하면 안됨  -->
					<!--c태그를 이용해서 로그인 되면 MyPage,로그아웃이 나오게 함  -->
					<c:if test="${empty sessionScope.login}">
						<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_join모달이 뜬다-->
						<li id="myBtn_join"><a style="cursor: pointer;"> <span
								class="glyphicon glyphicon-user"></span> 회원가입
						</a></li>

						<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_login모달이 뜬다-->
						<li id="myBtn_login"><a style="cursor: pointer;"> <span
								class="glyphicon glyphicon-log-in"></span> 로그인
						</a></li>
					</c:if>
					<!--//회원가입, 로그인 부분  -->

					<!--MyPage, 로그아웃 부분  -->
					<c:if test="${not empty sessionScope.login}">

						<li><a href="<%=location%>"><%=myPage %></a></li>


						<!--버튼을 누르면 UserController에  /user/logout을 찾아간다 -->
						<li><a href="/user/logout"> <span
								class="glyphicon glyphicon-log-out"></span>로그아웃
						</a></li>
						<li><a style="color: white;">${sessionScope.login.pname}님
								환영합니다.</a></li>
								
						
						 <li class="dropdown">
							<a href="#">
								<span style="cursor:pointer; font-size:20px;" class="glyphicon glyphicon-bell dropdown-toggle" data-toggle="dropdown"></span>
								<span id="message_notice" class="badge badge-danger">1</span>
							</a>
							
							<c:forEach items="result" var="MessageVO">
								<input type="text" value="">
							</c:forEach>							


							 <ul class="dropdown-menu">
						      <li><a href="#">HTML</a></li>
						      <li><a href="#">CSS</a></li>
						      <li><a href="#">JavaScript</a></li>
						    </ul> 
						</li>
					</c:if>
					<!--//MyPage, 로그아웃 부분  -->

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- 인재찾기 접근 가능 스크립트 -->
<script>
$(document).ready(function(){
	var id = '<%=id%>';
	
	$.ajax({
		type:'POST',
		url:'/message_count',
		headers:{
			"Content-Type":"application/json; charset=UTF-8",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType:'text',
	/* 	data:JSON.stringify({
		
		}), */
		success:function(result){
			if(result!=''){
				$("#message_notice").text(result);		
				console.log(result);
				console.log("성공함");
			}else{
				console.log("실패함");
			}
		}//success end
	});//ajax end
});

$("#message_notice").on("click", function(){
	var id = '<%=id%>';
	
	$.ajax({
		type:'POST',
		url:'/message_read',
		headers:{
			"Content-Type":"application/json; charset=UTF-8",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType:'text',
	/* 	data:JSON.stringify({
		
		}), */
		success:function(result){
			if(result!=''){
				console.log(result);
				console.log("성공함");
				
				for(var i=0;i<result.length;i++){
					console.log("몇개냐"+result.length);
				}
				
			}else{
				console.log(result);
				console.log("실패함");
			}
		}//success end
	});//ajax end
	
});
	
$("#p_search").on("click",function(){
	var c_chk = "<%=c_chk%>";
	
	if(c_chk=="null"){
		if("<%=location%>" != "/admin/main") {
					alert("접근 권한이 없습니다.");
				} else {
					self.location = "/srch/main?stype=2";
				}
			} else {
				self.location = "/srch/main?stype=2";
			}
		});
	</script>
	<%@ include file="../include/login.jsp"%>
