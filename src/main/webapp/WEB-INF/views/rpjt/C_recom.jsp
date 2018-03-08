<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9">
	
	<div class="col-md-9">
	<h1>채용 공고 목록</h1>
	<table class="table table-bordered">
		<tr>
			<th>순번</th>
			<th>공고 제목</th>
			<th style="text-align: center">기간</th>
			<th>조회수</th>
			<th style="text-align: center">지원자수</th>
			<th>진행/완료</th>
		</tr>
		

${CInfoVO.id}

					<% int manage = 0; %>
						<c:forEach items="${recruitList}" var="RecruitVO">
					<%manage++; %>
					<tr>
					<th><%=manage%></th>
					<th>${RecruitVO.title}</th>
					<th>~${RecruitVO.period}</th>
					<th></th>
					<th></th>
					<th>모집중</th>
					</tr>
						
						</c:forEach>
		
	</table>
</div>

</div>
<!-- //기업 페이지 -->



<%@include file="../include/cfooter.jsp"%>
