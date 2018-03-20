<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 채용공고 목록 -->
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
		
		
					<% int manage = 0; %>
						<c:forEach items="${recruitList}" var="RecruitVO" varStatus="status">
					<%manage++; %>
					<tr>
					<th><%=manage%></th>
					<th><a href="C_recruitInfo?recruitNum=${RecruitVO.bno}" target="_blank">${RecruitVO.title}</a></th>
					<th>~
					<fmt:parseDate value="${RecruitVO.period}" var="printper" pattern="yyyymmdd"/>
					<fmt:formatDate value="${printper}" var="printper2" pattern="yyyy/mm/dd"/>
					<c:out value="${printper2}"/>
					</th>
					<th>${RecruitVO.viewcnt}</th>
					<th></th>
					<th>
					<!-- 날짜 비교를 통해 모집중/완료 구분 -->
					<!-- 오늘 날짜를 받아옴 -->
					<jsp:useBean id="now" class="java.util.Date" />
					<!-- 날짜의 형태를 변환 -->
					<fmt:formatDate value="${now}" var="now2" pattern="yyyyMMdd"/>
					<!-- 날짜를 숫자로 변환(비교를 위해) -->
					<fmt:parseNumber value="${now2}" var="now3"/>
					<!-- DB의 날짜를 숫자로 변환(비교를 위해) -->
					<fmt:parseNumber value="${RecruitVO.period}" var="period2"/>
					<!-- if/else (JSTL은 choose로 if/else 사용) 구문으로 비교 -->
					<c:choose>
						<c:when test="${now3 - period2 < 0}">모집중</c:when>
						<c:otherwise>모집완료</c:otherwise>
					</c:choose>
					<!-- // 날짜 비교를 통해 모집중/완료 구분 -->
					</th>
					</tr>
					
						</c:forEach>
		
	</table>
</div>
<!-- //기업 채용공고 목록 끝 -->

<%@include file="../include/cfooter.jsp"%>