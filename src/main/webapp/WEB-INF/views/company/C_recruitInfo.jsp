<!-- o.Merge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 메인 바디 부분 -->
<div class="col-md-9 ">
	<!-- 메인 바디 입력 부분 -->

	<br>
	<br>
	<span>${RecruitVO.period}</span> <span>조회수${RecruitVO.viewcnt}</span> | <span>스크랩 수</span> | <span>지원자수</span> | <span>공유하기</span>
	<br>

	<!-- 문> 첫번째 판  -->
	<div style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
		
		<!-- 문> 회사명, 공고 제목, 사진 같이 한 줄로 묶은 거 같음  -->
		<div class="row">
			<div class="col-md-8" style="border-bottom: 1px solid #dde2eb; padding-left: 15px; padding-top: 10px; padding-bottom: 10px">
				<font size="3px">${CInfoVO.cname}</font>
				<br>
				<font size="6px">${RecruitVO.title}</font>
			</div>
			<div class="col-md-4" style="border-left: 1px solid #dde2eb;">
				<img src="${CInfoVO.img}" id="imgsrc" name="img" value="${CInfoVO.img}" style="width: 200px;" />
			</div>
		</div>

		<!-- 문> 지역자격, 근무조건  -->
		<div class="row">
			<!-- 문> c:if test="조건판별식" var="변수명" scope="변수공유범위" -->
			<!-- 첫번쨰 칸 -->
			<!-- 문> exp는 경력, edu는 학력, ne는 같지 않다 , eq는 같다, ||는 or, &&는 and-->
			<c:if test="${RecruitVO.exp ne null || RecruitVO.edu ne null}">
				<div class="col-md-4">
					<h4>지원자격</h4>
			</c:if>

			<c:if test="${RecruitVO.exp eq null || RecruitVO.edu eq null}">
			</c:if>

			<c:if test="${RecruitVO.exp ne null}">
				<!-- 문> &nbsp; 1칸 띄워쓰기, &ensp; 2칸 띄워쓰기, &emsp; 3칸 띄워쓰기    -->
				<small>경력&emsp;</small>
				<a>${RecruitVO.exp}</a>
				<br>
				<br>
			</c:if>

			<c:if test="${RecruitVO.edu ne null}">
				<small>학력&emsp;</small>
				<a>${RecruitVO.edu}</a>
				<br>
				<br>
			</c:if>

			<c:if test="${RecruitVO.exp ne null || RecruitVO.edu ne null}">
				</div>
			</c:if>
			<!-- /첫번째 칸 -->

			<!-- 두번째 칸 -->
			<c:if test="${RecruitVO.employstatusid ne null || RecruitVO.salaryid ne null || RecruitVO.rgbid ne 'NULL' || RecruitVO.rgbid ne 'NULL'}">
				<div class="col-md-4">
					<h4>근무조건</h4>
			</c:if>


			<c:if test="${RecruitVO.employstatusid ne null}">
				<small>고용형태&emsp;</small>
				<a>${RecruitVO.employstatusid}</a>
				<br>
				<br>
			</c:if>

			<c:if test="${RecruitVO.salaryid ne null}">
				<small>급여&emsp;</small>
				<a>${RecruitVO.salaryid}</a>
				<br>
				<br>
			</c:if>

			<c:if test="${RecruitVO.rgbid ne 'NULL' || RecruitVO.rgbid ne 'NULL'}">
				<small>지역&emsp;</small>
				<a>${RecruitVO.rgbid}</a>
				<a>${RecruitVO.rgsid}</a>
				<br>
			</c:if>

			<c:if test="${RecruitVO.employstatusid ne null || RecruitVO.salaryid ne null || RecruitVO.rgbid ne 'NULL' || RecruitVO.rgbid ne 'NULL'}">
				</div>
			</c:if>
			<!-- /두번째 칸 -->
			<!-- 문> //지역자격, 근무조건  -->
		
		<!-- 문> 사진쪽 밑에 text  -->
		<!-- 문> word-break:break-all;은 글자 줄바꿈하는 기능 -->
		<div class="col-md-4" style="border-left: 1px solid #dde2eb; word-break:break-all;">
			<h4>기업정보</h4>
			산업(업종) ${CInfoVO.ctype}
			<br>
			사원수 ${CInfoVO.numemp}
			<br>
			설립년도 ${CInfoVO.establish}
			<br>
			기업형태 ${CInfoVO.form}
			<br>
			홈페이지 ${CInfoVO.homepage}
			<br>
			<br>
			<div class="text-center">
				<button class="btn btn-info" id="CInfo">기업정보</button>
			</div>
			<br>
		</div><!-- 문> //사진쪽 밑에 text  -->
	
	</div><!-- 문> //첫번째 판  -->
	
</div><!-- 문> //메인 바디 부분  -->
	
<br>

<!-- 문> c:choose --switch문과 동일, 여러 개의 c:when 태그와 하나의 c:otherwise 태그를 가진다.  -->
<c:choose>
	<c:when test="${CInfoVO.id != null}">
		<div class="text-center">
			<button type="button" id="delete" class="btn btn-default btn-lg active">공고보기</button>
			<button type="submit" id="modify" class="btn btn-primary btn-lg active" value="${RecruitVO.bno}">수정하기</button>
		</div>
	</c:when>
	<c:when test="${CInfoVO.id == null}">
		<div class="text-center">
			<button class="btn btn-primary btn-lg disabled">즉시지원</button>
			<button class="btn btn-default btn-lg disabled">스크랩하기</button>
		</div>
	</c:when>
</c:choose>

<br>

<!-- 공고 메인 -->
<div style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">

	<h4>모집내용 및 자격조건</h4>

	<table class="table">
		<tr>
			<th scope="row" class="active">모집직종</th>
			<td>${RecruitVO.jobgroupid}->${RecruitVO.jobgroupid2}</td>

			<th scope="row" class="active">근무지역</th>
			<td>${RecruitVO.rgbid}->${RecruitVO.rgsid}</td>
		</tr>

		<tr>
			<th scope="row" class="active">담당업무</th>
			<td td colspan="3">${jobdesc }</td>
		</tr>
		<tr>
			<th scope="row" class="active">모집인원</th>
			<td td colspan="3">${RecruitVO.recruitnum }명</td>
		</tr>
		<tr>
			<th scope="row" class="active">근무형태</th>
			<td td colspan="3">${RecruitVO.employstatusid }</td>
		</tr>
		<tr>
			<th scope="row" class="active">급여사항</th>
			<td td colspan="3">${RecruitVO.salaryid }</td>
		</tr>
		<tr>
			<th scope="row" class="active">학력</th>
			<td td colspan="3">${RecruitVO.edu }</td>
		</tr>
		<tr>
			<%-- <th scope="row" class="active" >경력</th>
			<td td colspan="3">${RecruitVO.exp }</td> --%>
		</tr>

	</table>
	<br>


	<h4>상세모집내용</h4>

	<table class="table">
		<tr>

		</tr>

		<tr>
			<td td colspan="3">${adddesc }</td>

		</tr>
	</table>

</div>
<!-- /공고 메인 -->

<br>
<br>


<br>
<br>

<div style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">

	<h4>기업정보</h4>

	<table class="table table-bordered">


		<tbody>
			<tr>
				<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
				<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
				<th class="active" scope="row">기업명</th>
				<td>${CInfoVO.cname}</td>
				<th class="active" scope="row">대표자명</th>
				<td>${CInfoVO.ceo}</td>
			</tr>
			<tr>
				<th class="active" scope="row">업종</th>
				<td colspan="3">${CInfoVO.ctype}</td>
			</tr>
			<tr>
				<th class="active" scope="row">기업형태</th>
				<td colspan="3">${CInfoVO.form}</td>
			</tr>
			<tr>
				<th class="active" scope="row">설립일</th>
				<td colspan="3">${CInfoVO.establish}</td>
			</tr>
			<tr>
				<th class="active" scope="row">사원수</th>
				<td>${CInfoVO.numemp}명</td>
				<th class="active" scope="row">매출액</th>
				<td>${CInfoVO.sales}</td>
			</tr>
			<tr>
				<th class="active" scope="row">대표전화</th>
				<td>${CInfoVO.tel}</td>
				<th class="active" scope="row">FAX</th>
				<td>${CInfoVO.fax}</td>
			</tr>
			<tr>
				<th class="active" scope="row">홈페이지</th>
				<td>
					<a href="${CInfoVO.homepage}" class="link_site" target="_blank" rel="nofollow">${CInfoVO.homepage}</a>
				</td>
				<th class="active" scope="row">SNS</th>
				<td>
					<a href="${CInfoVO.sns}" class="link_site" target="_blank" rel="nofollow">${CInfoVO.sns}</a>
				</td>
			</tr>
			<tr>
				<th class="active" scope="row">기업주소</th>
				<td colspan="3">${CInfoVO.location}</td>
			</tr>
		</tbody>
	</table>
</div>
<br>
<br>

<div style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
	<h4>지원자리스트</h4>
	<div class="row">
		<!-- 
		문> 
		c:forEach var="현재 아이템의 변수 명"
		items="반복 데이터가 있는 아이템 Collection 명"
		begin="시작값, 기본값은 0"
		end="종교 값"
		step="증가 값"
		varStatus="반복 상태 값을 지닌 변수"
		 -->
		<c:forEach items="${ApplyList}" var="ResumeVO">
			<div class="col-md-6">
				<table class="table table-bordered">
					<tr>
						<th class="active">이름</th>
						<th class="active">이력서 요약</th>
					</tr>
					<tr>
						<th>${ResumeVO.img}⃝⃝</th>

						<th><span class=careerLine>경력 3년 5개월</span>${ResumeVO.title}<br> ${ResumeVO.coverletter}${ResumeVO.rgbid}</th>
					</tr>

				</table>
			</div>
		</c:forEach>

	</div>
</div>
<br>
		<br>

<form role="form" method="post">
	<input type='hidden' name="bno" value="${RecruitVO.bno}">
</form>

</div>

<script>
	$('#CInfo').on("click", function() {

		self.location = "/company/C_index";

	})

	var formObj = $("form[role='form']");

	$(document).on("click", '#modify', function() {

		/* var bno = $(this).attr('value'); */

		formObj.attr("action", "/company/C_recruitModify");
		/* self.location = "/company/C_recruitModify"; */
		formObj.attr("method", "get");
		formObj.submit();
	});
</script>



<script>
	$(document).ready(function() {
		console.log('${PWebSitelist}');
		var imgsrccheck = ('#imgsrccheck');
		if ($('#imgsrccheck').val() != "") {
			console.log(" val값 뭐임? " + $('#imgsrccheck').val());
			console.log(" val이 널값아님");
			$('#imgsrc').attr("src", 'displayFile?fileName=${CInfoVO.img}');
		} else {
			console.log(" val이 널값이다");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		}
	});
</script>

<!-- //메인 바디 끝 -->
<%@include file="../include/cfooter.jsp"%>