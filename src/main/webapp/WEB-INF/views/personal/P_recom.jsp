<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<form role="form">
		<input type='hidden' name='id' value="${PUserVO.id}">
</form>
<!--  스크랩한채용공고 페이지 -->
<div class="col-md-9">
	<h1 class="ci_name">${PUserVO.pname}</h1><h4>님에게 추천드리는 채용 공고</h4>
	<br>
	
	<div style = 'width : 100%; height : 190px; border : 1px solid #c0c6d3; padding:30px;'>
		<ul>
			<li>관심 공고로 등록한 채용공고는 최초 관심 등록일로부터 30일간 보관됩니다.</li>
			<li>진행중 공고는 <b> 최대 5개까지 동시 게재</b>가능하며, 5개 초과 등록 시, 대기중 상태가 됩니다.<br></li>
			<li>이력서를 등록하신 회원님께<b>이력서 기반 추천 공고 서비스를 무료</b>로 제공합니다. </li>
		</ul>
		<br>※ recruIT 채용정보 등록 규정상 부적합한 이력서로 판별된 경우, 별도 통보 없이 이력서가 비공개/삭제 처리될 수 있습니다.<br>
	</div>
	<br><br>
	<div>
		<!-- 본 바디 틀 -->
		<table class="table table-bordered">
			<!-- 공고 메인 공고 테이블 순서 번호는 java문 counter로 처리-->
			<tr class="active">
				<th style="width: 80px;">공고 번호</th>
				<th style="text-align:center;">회사명</th>
				<th style="text-align:center;">공고 제목</th>
				<th style="width: 90px; text-align:center;">등록일</th>
				<th style="width: 90px; text-align:center;">마감 기한</th>
				<th style="width: 65px;">조회수</th>
				<th style="width: 80px;">지원여부</th>
			</tr>
			<c:forEach items = "${CRecruitVOList}" var = "CRecruitVO">
			
			<tr>
				<td style="text-align:center;">${CRecruitVO.bno}</td>
				<td style="text-align:center;">${CRecruitVO.cid}</td>
				<td style="text-align:center;"><a href = '/company/C_recruitMent?recruitNum=${CRecruitVO.bno}' onClick="window.open(this.href, '', 'width=1240, height=960'); return false;">${CRecruitVO.title}</a></td>
				<td>${CRecruitVO.regdate}</td>
				<td>${CRecruitVO.period}</td>
				<td style="text-align:center;">${CRecruitVO.viewcnt}</td>
				<td style="text-align:center;">2차개발</td>
			</tr>
			</c:forEach>
		</table>
	</div>

	<!-- //스크랩한 채용공고 페이지 첫번째 -->
	<br> <br>
</div>
<!-- //스크랩한 채용공고 페이지 -->

<%@include file="../include/cfooter.jsp"%>