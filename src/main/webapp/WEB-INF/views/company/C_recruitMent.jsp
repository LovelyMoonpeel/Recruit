<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 메인 바디 부분 -->
<div class="col-md-9 ">
	<!-- 메인 바디 입력 부분 -->
	
	<br><br>
	
	<span>${RecruitVO.period}</span>
	<span>조회수 ${RecruitVO.viewcnt}</span>
	|<span>스크랩 수</span><span>지원자수</span>
	<span>공유하기</span> 
	<br>
	
	<div style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;" >
	<div class="row" >
	
	<div class="col-md-8"  style="border-bottom: 1px solid #dde2eb; padding-left: 15px; padding-top: 10px; padding-bottom:10px ">
	<font size="3px">${CInfoVO.cname}</font><br>
	<font size="6px">${RecruitVO.title}</font>
	</div>
	<div class="col-md-4" style="border-left: 1px solid #dde2eb;">
	<img src="/resources/rpjt/img/${CInfoVO.img}" class="img-rounded" name="img" value="${CInfoVO.img}" style="width:240px; height:100px"/>
	</div>
	
	
	<!-- 첫번쨰 칸 -->
	<c:if test="${RecruitVO.exp ne null || RecruitVO.edu ne null}">
	<div class="col-md-4">
	<h4>지원자격</h4>
	</c:if>
	
	<c:if test="${RecruitVO.exp eq null || RecruitVO.edu eq null}">
	</c:if>
	
	<c:if test="${RecruitVO.exp ne null}">
	<small>경력&emsp;</small><a>${RecruitVO.exp}</a>
	<br><br>
	</c:if>
	
	<c:if test="${RecruitVO.edu ne null}">
	<small>학력&emsp;</small><a>${RecruitVO.edu}</a>
	<br><br>
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
	<small>고용형태&emsp;</small><a>${RecruitVO.employstatusid}</a><br><br>
	</c:if>
	
	<c:if test="${RecruitVO.salaryid ne null}">
	<small>급여&emsp;</small><a>${RecruitVO.salaryid}</a><br><br>
	</c:if>
	
	<c:if test="${RecruitVO.rgbid ne 'NULL' || RecruitVO.rgbid ne 'NULL'}">
	<small>지역&emsp;</small><a>${RecruitVO.rgbid}</a>
	<a>${RecruitVO.rgsid}</a><br>
	</c:if>
	
	<c:if test="${RecruitVO.employstatusid ne null || RecruitVO.salaryid ne null || RecruitVO.rgbid ne 'NULL' || RecruitVO.rgbid ne 'NULL'}">
	</div>
	</c:if>
	<!-- /두번째 칸 -->
	
	<div class="col-md-4" style="border-left: 1px solid #dde2eb;">
	<h4 >기업정보</h4>
	

	
	산업(업종) ${CInfoVO.ctype}<br>
	사원수 ${CInfoVO.numemp}<br>
	설립년도 ${CInfoVO.establish}<br>
	기업형태 ${CInfoVO.form}<br>
	홈페이지 ${CInfoVO.homepage}<br>
	<br>
	<div class="text-center">
	<button class="btn btn-info" id="CInfo" value="${RecruitVO.bno}">기업정보</button>
	</div>
	<br>
	</div>
	
	</div>
		</div>
		<br>


<div class="text-center">
<button class="btn btn-primary btn-lg disabled">즉시지원</button>
<button class="btn btn-default btn-lg disabled">스크랩하기</button>
</div>




	<br>
	
	<!-- 공고 메인 -->
	<div style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">

     <h4>모집내용 및 자격조건</h4> 

	<table class="table">
		<tr>
			<th scope="row" class="active" >모집직종</th>
			<td>${RecruitVO.jobgroupid} -> ${RecruitVO.jobgroupid2}</td>
		
			<th scope="row" class="active" >  근무지역</th>
			<td>${RecruitVO.rgbid} -> ${RecruitVO.rgsid}</td>
		</tr>
		
		<tr>
			<th scope="row" class="active" >담당업무</th>
			<td td colspan="3">${RecruitVO.jobdesc}</td>
		</tr>
		<tr>
			<th scope="row" class="active" >모집인원</th>
			<td td colspan="3">${RecruitVO.recruitnum }명</td>
		</tr>
		<tr>
			<th scope="row" class="active" >근무형태</th>
			<td td colspan="3"> ${RecruitVO.employstatusid }</td>
		</tr>
		<tr>
			<th scope="row" class="active" >급여사항</th>
			<td td colspan="3">${RecruitVO.salaryid }</td>
		</tr>
		<tr>
			<th scope="row" class="active" >학력</th>
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
		<td td colspan="3">${RecruitVO.adddesc }</td>
		
		</tr>
	</table>
	
	</div> <!-- /공고 메인 -->
	
	<br><br>
	
	<div  style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;" >
	
	<div class="row"> <!-- 접수기간  -->
	<div class="col-md-3">
	<font size="6px">접수방법</font>
	<br>
	<span>마감일</span>
	<span>${RecruitVO.period }</span>
	</div>
	
	<div class="col-md-9">
	<button class="btn btn-primary btn-lg disabled">지원하기</button>
	
	<br>
	
	<table>
	<tr>
	접수방법 ${RecruitVO.acceptmethod }
	</tr>
	<tr>
	<td>지원양식</td><td>${RecruitVO.recruitform }</td>
	</tr>
	<tr>
	<td>모집인원</td><td> ${RecruitVO.recruitnum }명 </td><br>
	</tr>
	
	</table>
	</div>
	</div> <!-- /접수기간  -->
	</div>
	
	<br><br>
	
	<div  style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;" >
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
						<td>${CInfoVO.numemp} 명</td>
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
						<td><a href="${CInfoVO.homepage}" class="link_site"
							target="_blank" rel="nofollow">${CInfoVO.homepage}</a></td>
						<th class="active" scope="row">SNS</th>
						<td><a href="${CInfoVO.sns}"
							class="link_site" target="_blank" rel="nofollow">${CInfoVO.sns}</a></td>
					</tr>
					<tr>
						<th class="active" scope="row">기업주소</th>
						<td colspan="3">${CInfoVO.location}</td>
					</tr>
					<!-- ★복지는 2차 개발 -->
					<!-- <tr>
                        <th class="table-active" scope="row">복지</th>
                        <td colspan="3">하하하하하하 </td>
                      </tr> -->
				</tbody>
			</table>
			</div>
			<br><br>
			
		
			
			</div>
			</div>
			
			<form role="form" method="post">
			<input type='hidden' name="bno" value="${RecruitVO.bno}">
			<input type='hidden' name="id" value="${RecruitVO.cid}">
			</form>
			
</div>


<script>
$('#CInfo').on("click",function(){
	
	self.location = "/company/C_info?recruitNum="+$('#CInfo').val()
	
})
		
</script>

<!-- //메인 바디 끝 -->

<%@include file="../include/cfooter.jsp"%>