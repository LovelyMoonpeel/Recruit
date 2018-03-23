<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<form role="form">
		<input type='hidden' name='id' value="${PUserVO.id}">
</form>
<!-- 지원현황 페이지 -->
<div class="col-md-9">
	<h1 class="ci_name">${PUserVO.pname}</h1><h4>님의 지원 현황</h4>
	<br> <br>
	<div>
		<!-- 본 바디 틀 -->
		<table class="table table-bordered">
			<!-- 공고 메인 공고 테이블 순서 번호는 java문 counter로 처리-->
			<tr class="active">
				<th style="width: 55px;">번호</th>
				<th>회사명</th>
				<th style="width: 200px;">공고 제목</th>
				<th>등록 날짜</th>
				<th>모집 마감 기한</th>
				<th>지원자 수</th>
				<th>지원한 이력서</th>
			</tr>
			<c:forEach items = "${CRecruitVOList}" var = "CRecruitVO" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${CRecruitVO.cid}</td>
				<td><a href = 'http://localhost:8080/company/C_recruitMent?recruitNum=${CRecruitVO.bno}'>${CRecruitVO.title}</a></td>
				<td>${CRecruitVO.regdate}</td>
				<td>${CRecruitVO.period}</td>
				<td>select rcno, count(*) from tblapply group by rcno;</td>
				<!--  매퍼에서 일치하는 bno 번호 받아오기  -->
				<td><a href = 'http://localhost:8080/personal/detail?bno=${ResumeVO.bno}'>resumeVO title이랑 bno받아오기 ${ResumeVO.title}</a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<br> <br>
</div>
<script>
</script>

<%@include file="../include/cfooter.jsp"%>
