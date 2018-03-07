<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9" style="border: 1px;">
	<br> <br> <br>
	<h1>관심인재</h1>

	<div style="width: 740px; padding: 0 0 15px 0; margin: 0;">
		<div
			style="border: 1px solid #c1d1f2; background-color: #f4f9ff; padding: 13px 0 8px 12px;">
			<ul>
				<li>관심 인재로 등록한 이력서는 최초 관심 등록일로부터 30일간 보관됩니다.</li>
				<li>관심 등록한 이력서는 <b>채용을 목적으로 하는 경우</b>에만 이용할 수 있으며, <br> <b>최초
						개인정보 수집한 목적이 달성되면</b> <r>지체 없이 파기</r>하여야 합니다. <br>채용이 아닌 <r>영업이나
					마케팅 등으로 이용하실 경우,</r> <br> <r>정보통신망법 제71조 3에 의거 5년 이하 징역 또는
					5,000만원 이하의 벌금에 처해질 수 있습니다.</r>
				</li>

			</ul>
		</div>
	</div>

	<table class="table table-bordered">
		<tr class="active">
			<th style="width: 5%;"></th>
			<th style="width: 20%;" class="text-center">이름</th>
			<th class="text-center">이력서 요약</th>
			<th style="width: 15%;" class="text-center">업데이트일</th>
		</tr>

		<tr>
			<td class="text-right" style="vertical-align: middle"><img
				src="img/on.png" id="non"></td>
			<td class="text-center" style="vertical-align: middle"><strong>박형훈</strong>
				<br> <span>1991년, 28세</span></td>
			<td><span class="careerLine">경력 3년 5개월</span> <a target="_blank"
				href="">front</a>
				<p>대학(2년제) 통신과</p>
				<div>
					<div>정보처리산업기사</div>
					<div>서울</div>
				</div>
				<p>일러스트레이터,코렐드로우</p>
				<div>
					<a>핵심역량 마케팅전략·기획, 시장조사·분석, 프로모션, 온라인마케팅, 광고기획, 지배인</a>
				</div></td>
			<td class="text-center" style="vertical-align: middle">1분전</td>
		</tr>
	</table>

	<!-- //기업 페이지 -->
</div>

<script>
	$(document).ready(function() { // 인재 추천 창 온오프
		$("#non").click(function() { //즐겨찾기
			$(this).attr('src', 'img/non.png');
		})
	}) // .인재 추천 창 온오프
</script>

<%@include file="../include/cfooter.jsp"%>
