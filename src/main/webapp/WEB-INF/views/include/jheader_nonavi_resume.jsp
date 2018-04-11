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

 <!-- Navigation -->
	<!-- <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			Brand and toggle get grouped for better mobile display
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/" style="font-size:25px;">RecruIT</a>
			</div>
			Collect the nav links, forms, and other content for toggling
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#business_information"><span class="glyphicon glyphicon-briefcase"></span> 기업정보</a></li>
					<li><a href="#detail_content"><span class="glyphicon glyphicon-list-alt"></span> 모집내용</a></li>
					<li><a href="#accept_method"><span class="glyphicon glyphicon-envelope"></span> 접수방법</a></li>
					<li><a href="#human_resources_manager"><span class="glyphicon glyphicon-user"></span> 담당자 정보</a></li>
				</ul>
			</div>
			/.navbar-collapse
		</div>
		/.container
	</nav>
 -->

<%@ include file="../include/login.jsp"%>