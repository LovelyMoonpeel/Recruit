<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<form role="form">
		<input type='hidden' name='id' value="${PUserVO.id}">
</form>

<!-- 개인 페이지 -->
<div class="col-md-9">
	<!-- 개인 페이지 첫번째(이미지, 이름) -->
	<div class="top_cont">
		<div class="corp_logo">
			<img id="프로필사진" alt="프로필사진"
				src="http://webpds.saramin.co.kr/pds/united_company/logo/8008_logo_2.jpg"
				width="209" height="117"> <br> <br>
				<h1 class="ci_name">${PUserVO.pname}</h1>
			<br>
		</div>
	</div>
	<!-- //개인 페이지 첫번째 -->
	<br> <br>
	<!-- 개인 정보 페이지 두번째(기본 정보) -->
	<div class="company_info_content">
		<!-- ★아래 두 줄의 class 설정으로 인해 테이블이 반응형으로 적용됨 -->
		<div class="table-responsive">
			<!-- ★클래스를 여러 개 쓰고 싶으면 한 칸 띄우고 쓰기/table-striped는 홀수번째마다 색칠하기 -->
			<table class="table table-bordered">
				<tbody>
					<tr>
						<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
						<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
						<th class="table-active" scope="row">아이디</th>
						<td>${PUserVO.id}</td>
						<th class="table-active" scope="row">비밀번호</th>
						<td>${PUserVO.pw}</td>
						
					</tr>
					<!-- <tr>
                        <th class="table-active" scope="row">소속그룹</th>
                        <td colspan="3">동국제약</td>
                      </tr> -->
					<tr>
						<th class="table-active" scope="row">이름</th>
						<td colspan="3">${PUserVO.pname}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">이메일</th>
						<td colspan="3">${PUserVO.email}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">생일</th>
						<td colspan="3">${PUserVO.birth}</td>
					</tr>
					<!--<tr>
						<th class="table-active" scope="row">사원수</th>
						<td>${cinfoVO.numemp} 명</td>
						<th class="table-active" scope="row">매출액</th>
						<td>${cinfoVO.sales}</td>
					</tr>
					 	<tr>
                          <th scope="row">자본금</th>
                          <td> 222억 3,000만원
                              <span class="standard_year">(2016년 기준)</span>
                          </td>
                          <th scope="row">영업이익</th>
                          <td>
                              466억 5,773만원
                              <span class="standard_year">(2016년 기준)</span>
                          </td>
                      </tr> 
					<tr>
						<th class="table-active" scope="row">대표전화</th>
						<td>${cinfoVO.tel}</td>
						<th class="table-active" scope="row">FAX</th>
						<td>${cinfoVO.fax}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">홈페이지</th>
						<td><a href="${cinfoVO.homepage}" class="link_site"
							target="_blank" rel="nofollow">${cinfoVO.homepage}</a></td>
						<th class="table-active" scope="row">SNS</th>
						<td><a href="${cinfoVO.sns}"
							class="link_site" target="_blank" rel="nofollow">${cinfoVO.sns}</a></td>
					</tr>
					<tr>
						<th class="table-active" scope="row">기업주소</th>
						<td colspan="3">${cinfoVO.location}</td>
					</tr>-->
					<!-- ★복지는 2차 개발 -->
					<!-- <tr>
                        <th class="table-active" scope="row">복지</th>
                        <td colspan="3">하하하하하하 </td>
                      </tr> -->
				</tbody>
			</table>
			<!-- //table class -->
		</div>
		<!-- //table-responsive -->
	</div>
	<!-- //기업 페이지 두번째(company_info_content) -->
	<br> <br>
	<!-- 수정 버튼 -->
	<!--<form method = "post">
		<input type = "hidden" name ="pid" value= "${PUserVO.id}">
	</form>
		 <input class="btn btn-success" type='button' value='수정'
			onClick="javascript:self.location='/personal/modify';"> -->
		<button type = "submit" id = "modify-button" class="btn btn-success">수정</button>
	
	<!-- //수정 버튼 -->
	<br> <br>
</div>
<!-- //개인 페이지 -->
<script>
$(document).ready(function(){
	var formObj = $("form[role = 'form']");
	
	console.log(formObj);
	
	$("#modify-button").on("click", function(){
		formObj.attr("action", "/personal/modify");
		formObj.attr("method", "get");
		formObj.submit();
		console.log("#modify-button");
	});
	/* $("a").click(function(event){
		event.preventDefault();
	}); 
	$("#P_favor").on("click", function(){
		formObj.attr("action", "/personal/favor");
		formObj.attr("method", "get");
		formObj.submit();
		console.log("#modify-button");
	});*/
});

</script>

<%@include file="../include/cfooter.jsp"%>
