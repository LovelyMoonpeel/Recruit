<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<!-- 개인 페이지 -->
<div class="col-xs-9 col-md-7 col-md-offset-1">
	<!-- 개인 페이지 첫번째(이미지, 이름) -->
	<div class="top_cont">
				<h1 class="ci_name">${PUserVO.pname}</h1>
			<br>
	</div>
	<br> <br>
	<div class="company_info_content">
		<!-- ★아래 두 줄의 class 설정으로 인해 테이블이 반응형으로 적용됨 -->
		<div class="table-responsive">
			<!-- ★클래스를 여러 개 쓰고 싶으면 한 칸 띄우고 쓰기/table-striped는 홀수번째마다 색칠하기 -->
			<table class="table table-bordered">
				<tbody>
					<tr>
						<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
						<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
						<th class="table-active" style="text-align:center; vertical-align:middle;" scope="row">아이디</th>
						<td style="text-align:center; vertical-align:middle;">${PUserVO.id}</td>
					</tr>
					<tr>
						<th class="table-active" style="text-align:center; vertical-align:middle;" scope="row">이름</th>
						<td colspan="3" style="text-align:center; vertical-align:middle;">${PUserVO.pname}</td>
					</tr>
					<tr>
						<th class="table-active" style="text-align:center; vertical-align:middle;" scope="row">이메일</th>
						<td colspan="3" style="text-align:center; vertical-align:middle;">${PUserVO.email}</td>
					</tr>
					<tr>
						<th class="table-active" style="text-align:center; vertical-align:middle;" scope="row">생일</th>
						<td colspan="3" style="text-align:center; vertical-align:middle;">${PUserVO.birth}</td>
					</tr>
				</tbody>
			</table>
			<!-- //table class -->
		</div>
		<!-- //table-responsive -->
	</div>
	<br> <br>
		<button type = "button" id = "modify-button" class="btn btn-success col-md-offset-11" onclick="location.href='/personal/modify'">수정</button>
	<!-- //수정 버튼 -->
	<br> <br>
</div>
<!-- //개인 페이지 -->

<%@include file="../include/cfooter.jsp"%>
