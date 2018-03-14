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
				<th>모집 기간</th>
				<th>지원자 수</th>
				<th>내가 지원한 이력서</th>
			</tr>
			<c:forEach items = "${CRecruitVOList}" var = "CRecruitVO">
			<tr>
				<td>${CRecruitVO.bno}</td>
				<td>${CRecruitVO.cid}</td>
				<td><a href = 'http://localhost:8080/company/C_recruitment?recruitNum=${CRecruitVO.bno}'>${CRecruitVO.title}</a></td>
				<td>${CRecruitVO.period}</td>
				<td>${CRecruitVO.regdate}</td>
				<td style="width: 20px;"><input id="btns" type="button"
					name="btns" value="지원 이력서 확인" style="height: 30px;"></td>
			</tr>
			</c:forEach>
		</table>

		<!-- 내가 지원한 이력서 -->
		<table class="table" id="none" name="list">
			<tr class="active">
				<th style="width: 5%;"></th>
				<th style="width: 20%;" class="text-center">이름</th>
				<th class="text-center">이력서 요약</th>
				<th style="width: 15%;" class="text-center">업데이트일</th>
			</tr>

			<tr>
				<td class="text-right" style="vertical-align: middle"><img
					src="img/non.png" id="non"></td>
				<td class="text-center" style="vertical-align: middle"><strong>박형훈</strong>
					<br> <span>1991년, 28세</span></td>
				<td><span
					style="border: 1px solid blue; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">경력
						3년 5개월</span> <a target="_blank" href="">front</a>
					<p>대학(2년제) 통신과</p>
					<p>일러스트레이터,코렐드로우</p>
					<div>
						<a>핵심역량 마케팅전략·기획, 시장조사·분석, 프로모션, 온라인마케팅, 광고기획, 지배인</a>
					</div></td>
				<td class="text-center" style="vertical-align: middle">1분전</td>
			</tr>
		</table>
	</div>

	<!-- //기업 페이지 첫번째 -->
	<br> <br>
</div>
<!-- //기업 페이지 -->

<script>
	$(document).ready(function() { // 인재 추천 창 온오프
		var btnz = document.getElementsByName('btns');
		var list = document.getElementsByName('list');
		var fav = document.getElementsByTagName('img');

		$("#btns").click(function() {
			for (var i = 0; btnz.length; i++) {
				if (list[i].id == 'none') {
					$('#none').attr('id', 'inline')
				} else {
					$('#inline').attr('id', 'none')
				}
			}
		})

		$("#non").click(function() {
			for (var i = 0; fav.length; i++) {
				if (fav[i].id == 'non') {
					$('#non').attr('id', 'on')
				} else {
					$('#on').attr('id', 'non')
				}
			}
		})
	}) // .인재 추천 창 온오프
</script>

<%@include file="../include/cfooter.jsp"%>
