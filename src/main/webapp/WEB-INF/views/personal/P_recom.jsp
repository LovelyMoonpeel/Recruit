<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/pheader.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Main content -->
<form role="form">
		<input type='hidden' name='id' value="${PUserVO.id}">
</form>
<!--  스크랩한채용공고 페이지 -->
<div class="col-md-9">
	<h1 class="ci_name">${PUserVO.pname}</h1><h4>님에게 추천드리는 채용 공고</h4>
	<br>
	
	<div style = 'width : 100%; height : 300px; border : 1px solid #c0c6d3; padding:30px;'>
		<ul>
			<li>이력서는 기본적으로 비공개로 저장되며, 이력서 관리 페이지에서 하나의 이력서만 공개로 설정이 가능합니다.</li>
			<li>이력서를 <b>공개</b>하신 회원님께 해당이력서를 기반으로  <b>추천 공고 서비스</b>를 무료로 제공합니다.
			<li>공개된 이력서에서 <b>[희망 구직정보 - 희망 근무지, 희망직종], 최종학력, 최종경력</b>을 입력하시면<br>더 정확한 추천 공고 서비스를 이용하실 수 있습니다.<br><br></li>
			
			<li><b>직무, 지역, 근무형태, 학력, 경력</b> 총 5가지 항목을 기준으로 추천 채용공고를 제공합니다. </li>
			<li>5가지 항목을 따로 설정하신 중요도에 따라 막대를 조절을 하시면 해당 기준따라 채용공고를 추천합니다. </li>
		</ul>
		<br>※ 퍼펙트 매칭 채용정보 등록 규정상 부적합한 이력서로 판별된 경우, 별도 통보 없이 이력서가 비공개/삭제 처리될 수 있습니다.<br>
	</div>
	
	<br>항목 중요도 조절<br>
	<div class="container col-md-12" style="border : 1px solid #c0c6d3; padding:30px; margin-top:30px; margin-bottom:30px;">
		<div class="w3-light-grey w3-round-xlarge">
		 1	2	3	4	5
		</div>
		<div class="w3-light-grey w3-round-xlarge">
			<div class="w3-container w3-round-xlarge" style="width: 20%; pointer:cursor; background-color:#c0c6d3;">1</div>
		</div><br>
		<div class="w3-light-grey w3-round-xlarge">
			<div class="w3-container w3-blue w3-round-xlarge" style="width: 40%; pointer:cursor;">2</div>
		</div><br>
		<div class="w3-light-grey w3-round-xlarge">
			<div class="w3-container w3-round-xlarge" style="width: 60%; pointer:cursor; background-color:#c0c6d3;">3</div>
		</div><br>
		<div class="w3-light-grey w3-round-xlarge">
			<div class="w3-container w3-round-xlarge" style="width: 80%; pointer:cursor; background-color:#c0c6d3;">4</div>
		</div><br>
		<div class="w3-light-grey w3-round-xlarge">
			<div class="w3-container w3-round-xlarge" style="width: 100%; pointer:cursor; background-color:#c0c6d3;">5</div>
		</div><br>
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