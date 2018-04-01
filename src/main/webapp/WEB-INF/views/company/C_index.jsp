
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>


<!-- Main content -->
<!-- 기업 페이지 -->





<div class="col-md-9">

	<p class="lead"><strong>기업 정보</strong></p>
	
	<!-- 문> 바꾸기 전에 이렇게 썼음, 어떻게 될 지 몰라서 그냥 냅둠  -->
	<!-- <div class="row">
		<label><h2>&nbsp;&nbsp;&nbsp;&nbsp;기업 정보</h2></label>
	</div>	 -->


	<!-- 기업 페이지 첫번째(이미지, 이름, 소개) -->
	<div class="top_cont">
	
	

	
		<div class="corp_logo">
			<img src="${CInfoVO.img}" id="imgsrc"
				 name="img" value="${CInfoVO.img}" style="width:200px;"/> <br> <br>
			<h1 class="ci_name">${CInfoVO.cname}</h1>
			<br>
		</div>
		<div class="ci_desc">
			<!-- 문> 아래 ${content}는 model.addAttribute("content", content4);로 인해서 저렇게 쓸 수 있다 -->
			<p class="txt">${content}</p>
		</div>
	</div>
	<!-- //기업 페이지 첫번째 -->
	<br>
	<!-- 기업 페이지 두번째(기본 정보) -->
	<div class="company_info_content">
		<!-- ★아래 두 줄의 class 설정으로 인해 테이블이 반응형으로 적용됨 -->
		<div class="table-responsive">
			<!-- ★클래스를 여러 개 쓰고 싶으면 한 칸 띄우고 쓰기/table-striped는 홀수번째마다 색칠하기 -->
			<table class="table table-bordered ">
				<tbody>
					<tr>
						<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
						<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
						<th class="table-activec col-lg-2" scope="row" style="text-align: center;">기업명</th>
						<td class="table-activec col-lg-4">${CInfoVO.cname}</td>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">대표자명</th>
						<td class="table-activec col-lg-4">${CInfoVO.ceo}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;">업종</th>
						<td colspan="3">${CInfoVO.ctype}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;">기업형태</th>
						<td colspan="3">${CInfoVO.form}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;">설립일</th>
						<td colspan="3">${CInfoVO.establish}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;">사원수</th>
						<td>${CInfoVO.numemp} 명</td>
						<th class="table-active" scope="row" style="text-align: center;">매출액</th>
						<td>${CInfoVO.sales}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;">대표전화</th>
						<td>${CInfoVO.tel}</td>
						<th class="table-active" scope="row" style="text-align: center;">FAX</th>
						<td>${CInfoVO.fax}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;">홈페이지</th>
						<td><a href="${CInfoVO.homepage}" class="link_site"
							target="_blank" rel="nofollow">${CInfoVO.homepage}</a></td>
						<th class="table-active" scope="row" style="text-align: center;">SNS</th>
						<td><a href="${CInfoVO.sns}"
							class="link_site" target="_blank" rel="nofollow">${CInfoVO.sns}</a></td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;">기업주소</th>
						<td colspan="3">${CInfoVO.location}</td>
					</tr>
				</tbody>
			</table>


			<br>
			<br>
			<p class="lead"><strong>담당자 정보</strong></p>

			<table class="table table-bordered ">	
				<tbody>		
					<tr>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">회사 아이디</th>
						<td class="table-activec col-lg-4">${CInfoVO.id}</td>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">회사 이메일</th>
						<td class="table-activec col-lg-4">${CInfoVO.email}</td>
					</tr>
					<tr>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">담당자</th>
						<td class="table-activec col-lg-4">${boardVO.pname}</td>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">담당자 전화번호</th>
						<td class="table-activec col-lg-4">${CInfoVO.phone}</td>
					</tr>
				</tbody>
			</table>
			
			<form role="form" method="post">
			
			</form>
	
			<!-- //table class -->
		</div>
		<!-- //table-responsive -->
	</div>
	<!-- //기업 페이지 두번째(company_info_content) -->
	<br> <br>

			
	<!-- 수정 버튼 -->
	<div class="box-footer">
	<button type="submit" class="btn btn-warning" id="cinfoModify">수정하기</button>
</div>



	<!-- //수정 버튼 -->
	<br> <br>
</div>
<!-- //기업 페이지 -->

			<script>
				
$(document).ready(function(){
		
	var formObj = $("form[role='form']");

	console.log(formObj);
	
	$("#cinfoModify").on("click", function(){
		formObj.attr("action", "/company/C_modify");
		formObj.attr("method", "get");		
		formObj.submit();
		
		
	});
	
	
});
var result = '${msg}';
if (result == 'SUCCESS') {
	alert("수정이 완료됐습니다.");
}

$(document).ready(function() {
    console.log('${PWebSitelist}');
    var imgsrccheck = ('#imgsrccheck');
    if ($('#imgsrccheck').val() != "") {
       console.log(" val값 뭐임? "+$('#imgsrccheck').val());
       console.log(" val이 널값아님");
       $('#imgsrc').attr("src", 'displayFile?fileName=${CInfoVO.img}');
    } else {
       console.log(" val이 널값이다");
       $('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
       $('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
    }
 });
</script>

<%@include file="../include/cfooter.jsp"%>