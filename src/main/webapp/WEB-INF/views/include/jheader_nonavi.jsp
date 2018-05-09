<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.recruit.domain.UserVO"%>


<%
	String pid = "";
	String cid = "";

	UserVO login = null;
	String cname = "";
	String location = "";

	try {
		login = (UserVO) session.getAttribute("login");
		if (login != null) {

			cname = login.getCname();
		}
		if (cname == null) {

			if (login != null) {

				pid = login.getId();

			}

		} else {

			cid = login.getId();

		}

	} catch (Exception e) {

		e.printStackTrace();
	}
%>

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
					<li><a href='#' style="color:white;"><span class="glyphicon glyphicon-briefcase"></span> 기업정보</a></li>
					<li><a href="#detail_content" style="color:white;"><span class="glyphicon glyphicon-list-alt"></span> 모집내용</a></li>
					<li><a href="#accept_method" style="color:white;"><span class="glyphicon glyphicon-envelope"></span> 접수방법</a></li>
					<li><a href="#human_resources_manager" style="color:white;"><span class="glyphicon glyphicon-user"></span> 담당자 정보</a></li>
				</ul>
				
				<br>
				
				<span class="glyphicon glyphicon-eye-open" style="color:white;">조회수${RecruitVO.viewcnt}  </span>
				<span class="glyphicon glyphicon-thumbs-up" style="color:white;">스크랩수${RecruitVO.interestcnt}  </span>
				<span class="glyphicon glyphicon-user" style="color:white;">지원자수${RecruitVO.applycnt}  </span>
				<span class="glyphicon glyphicon-link" style="color:white; cursor: pointer" id="kakao-link-btn" href="javascript:;">공유하기  </span>
	
			</div>
			<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>
