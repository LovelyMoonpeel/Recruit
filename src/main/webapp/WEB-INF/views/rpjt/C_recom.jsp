<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9">
	<br> <br>
	<div>
		<!-- 본 바디 틀 -->
		<table class="table table-bordered">
			<!-- 공고 메인 공고 테이블 순서 번호는 java문 counter로 처리-->
			<tr class="active">
				<th style="width: 35px;">번호</th>
				<th>공고 제목</th>
				<th>모집 기간</th>
				<th>지원자 수</th>
				<th>인재보기</th>
			</tr>
			<tr>
				<td>1</td>
				<td>IT 금융 및 연구소 경력사원 채용공고</td>
				<td>~3/02(금)</td>
				<td>13</td>
				<td style="width: 20px;"><input id="btns" type="button"
					name="btns" value="인재 보기" style="height: 30px;"></td>
			</tr>
		</table>

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


		<table class="table table-bordered">
			<!-- 공고 메인 공고 테이블 순서 번호는 java문 counter로 처리-->
			<tr class="active">
				<th style="width: 35px;">번호</th>
				<th>공고 제목</th>
				<th>모집 기간</th>
				<th>지원자 수</th>
				<th>인재보기</th>
			</tr>


			<tr>
				<td>1</td>
				<td>IT 금융 및 연구소 경력사원 채용공고</td>
				<td>~3/02(금)</td>
				<td>13</td>
				<td style="width: 20px;"><input id="btns" type="button"
					name="btns" value="인재 보기" style="height: 30px;"></td>
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