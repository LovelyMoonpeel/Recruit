<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<form role="form">
		<input type='hidden' name='id' value="${PUserVO.id}">
</form>
<!--  스크랩한채용공고 페이지 -->
<div class="col-md-9">
	<h1 class="ci_name">${PUserVO.pname}</h1><h4>님의 관심 채용공고 페이지</h4>
	<br> <br>
	<div>
		<!-- 본 바디 틀 -->
		<table class="table table-bordered">
			<!-- 공고 메인 공고 테이블 순서 번호는 java문 counter로 처리-->
			<tr class="active">
				<th style="width: 55px;">번호</th>
				<th>회사명</th>
				<th style="width: 200px;">공고 제목</th>
				<th>모집 기간</th>
				<th  style="width: 100px;">등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items = "${CRecruitVOList}" var = "CRecruitVO">
			
			<tr>
				<td>${CRecruitVO.bno}</td>
				<td>${CRecruitVO.cid}</td>
				<td><a href = ''>${CRecruitVO.title}</a></td>
				<td>${CRecruitVO.period}</td>
				<td>${CRecruitVO.regdate}</td>
				<td>${CRecruitVO.viewcnt}</td>
			</tr>
			</c:forEach>
		</table>
	</div>

	<!-- //스크랩한 채용공고 페이지 첫번째 -->
	<br> <br>
</div>
<!-- //스크랩한 채용공고 페이지 -->

<%@include file="../include/cfooter.jsp"%>
