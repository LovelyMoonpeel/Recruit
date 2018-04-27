<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	} catch (Exception e) {
		e.printStackTrace();
	}

	if (cname!=null) { %>
    <jsp:include page="include/cheader.jsp" flush="true"/>
<% }else{%>
	<jsp:include page="include/pheader.jsp" flush="true"/>
<% }%>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>RecruIT 알림</title>
</head>
<body>

<div class="container col-md-9">
	<div class="top_cont">
		<h1 class="ci_name">RecruIT 알림창</h1>
	</div>
	<br><br>

	<div class="container col-md-12">
	
		<c:forEach items="${MessageVOlist }" var="MessageVO">
			<div class="alert alert-success alert-dismissible fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>${MessageVO.bno}</strong>${MessageVO.message}
			</div>
		</c:forEach>
			<div class="alert alert-info alert-dismissible fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Info!</strong> This alert box could indicate a neutral
				informative change or action.
			</div>
			<div class="alert alert-warning alert-dismissible fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Warning!</strong> This alert box could indicate a warning
				that might need attention.
			</div>
			<div class="alert alert-danger alert-dismissible fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Danger!</strong> This alert box could indicate a dangerous or
				potentially negative action.
			</div>
			<br><br>
	</div>
</div>
</body>

<script>
$(document).ready(function () {
	$(document).scroll(function() {
		
	    var maxHeight = $(document).height();
	    var currentScroll = $(window).scrollTop() + $(window).height();
	
	    if (maxHeight <= currentScroll + 100) {
	    	console.log("scroll if문");
	    	
	      /* $.ajax({
	    	  console.log
	        // Append next contents
	      }); */
	    }
	});
});


</script>
</html>