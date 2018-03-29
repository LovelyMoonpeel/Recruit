<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import = "com.recruit.domain.BoardVO" %>


<%
	String id = "";
	BoardVO login = null;
	String cname = "";
	String location = "";
	
	try{
		login = (BoardVO)session.getAttribute("login");
		if(login != null){
		id = login.getId();
		cname = login.getCname();
		}
		if(cname == null){
			if(id.equals("admin")){
				location = "/admin/main";
			}else{
				location = "/personal/index";
			}
		}else{
			location = "/company/C_index";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

<%-- <!-- Navigation -->
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
				<a class="navbar-brand" href="/">퍼팩트 매칭</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/srch/main?stype=1">기업찾기</a></li>
					<li><a href="/srch/main?stype=2">인재찾기</a></li>

					<!--회원가입, 로그인 부분 -->
					<!--★ a href="#" 삭제하면 안됨  -->
					<!--c태그를 이용해서 로그인 되면 MyPage,로그아웃이 나오게 함  -->
					<c:if test="${empty sessionScope.login}">
						<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_join모달이 뜬다-->
						<li id="myBtn_join"><a href="#"> <span
								class="glyphicon glyphicon-user"></span> 회원가입
						</a></li>

						<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_login모달이 뜬다-->
						<li id="myBtn_login"><a href="#"> <span
								class="glyphicon glyphicon-log-in"></span> 로그인
						</a></li>
					</c:if>
					<!--//회원가입, 로그인 부분  -->

					<!--MyPage, 로그아웃 부분  -->
					<c:if test="${not empty sessionScope.login}">

						<li><a href="<%= location%>">MyPage</a></li>
						
						
						<!--버튼을 누르면 UserController에  /user/logout을 찾아간다 -->
						<li><a href="/user/logout">로그아웃</a></li>
						<li><a href="#">${sessionScope.login.id}등장</a></li>
					</c:if>
					<!--//MyPage, 로그아웃 부분  -->
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav> --%>


<%@ include file="../include/login.jsp"%>