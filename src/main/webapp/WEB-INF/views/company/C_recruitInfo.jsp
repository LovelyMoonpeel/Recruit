<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 메인 바디 부분 -->
<div class="col-md-9">
	<!-- 메인 바디 입력 부분 -->
	
	<br><br>
	
	<span>${RecruitVO.period}</span>
	<span>조회수 ${RecruitVO.viewcnt}</span>
	|<span>스크랩 수</span><span>지원자수</span>
	<span>공유하기</span> 
	<br>
	
	<div class="row" style="border: 1px solid gray; border-top:2px solid black; padding-left: 15px; padding-top: 15px;" >

	<font size="3px">${CInfoVO.cname}</font><br>
	<font size="6px">${RecruitVO.title}</font>
	
	<hr>
	
	<div class="col-md-4">
	
	<h3>지원자격</h3>
	<small>경력</small><a>${RecruitVO.exp}</a><br>
	<small>학력</small><a>${RecruitVO.edu}</a>
	
	</div>
	
	
	<div class="col-md-4">
	<h3>근무조건</h3>
	<a>${RecruitVO.rgbid}</a> <a>${RecruitVO.rgsid}</a><br>
	<a>${RecruitVO.salaryid}</a><br>
	<a>${RecruitVO.employstatusid}</a>
	</div>
	<div class="col-md-4">
	<h3>기업정보</h3>
	
	산업(업종) ${CInfoVO.ctype}<br>
	사원수 ${CInfoVO.numemp}<br>
	설립년도 ${CInfoVO.establish}<br>
	기업형태 ${CInfoVO.form}<br>
	홈페이지 ${CInfoVO.homepage}<br>
	<button>기업상세정보</button>
	</div>
		</div>
		<br><br>

	
	<br><br>
	
	

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
			<th scope="row" class="active" >경력</th>
			<td td colspan="3">${RecruitVO.exp }</td>
		</tr>
		<tr>
			<th scope="row" class="table-active" >접수기간</th>
			<td td colspan="3">${RecruitVO.period }</td>
		</tr>
		<tr>
			<th scope="row" class="table-active" >접수방법</th>
			<td td colspan="3">${RecruitVO.acceptmethod }</td>
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
	
	
	
	
	
	<div class="row">
	<h3>접수방법</h3>

	${RecruitVO.period }
	
	<div class="text-center">
	<button>스크랩하기</button><button>지원하기</button>
	</div>x<br>
	지원양식 ${RecruitVO.recruitform }
	
	</div>
	
<table class="table table-bordered">
			
			
				<tbody>
					<tr>
						<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
						<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
						<th class="table-active" scope="row">기업명</th>
						<td>${CInfoVO.cname}</td>
						<th class="table-active" scope="row">대표자명</th>
						<td>${CInfoVO.ceo}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">업종</th>
						<td colspan="3">${CInfoVO.ctype}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">기업형태</th>
						<td colspan="3">${CInfoVO.form}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">설립일</th>
						<td colspan="3">${CInfoVO.establish}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">사원수</th>
						<td>${CInfoVO.numemp} 명</td>
						<th class="table-active" scope="row">매출액</th>
						<td>${CInfoVO.sales}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">대표전화</th>
						<td>${CInfoVO.tel}</td>
						<th class="table-active" scope="row">FAX</th>
						<td>${CInfoVO.fax}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">홈페이지</th>
						<td><a href="${CInfoVO.homepage}" class="link_site"
							target="_blank" rel="nofollow">${CInfoVO.homepage}</a></td>
						<th class="table-active" scope="row">SNS</th>
						<td><a href="${CInfoVO.sns}"
							class="link_site" target="_blank" rel="nofollow">${CInfoVO.sns}</a></td>
					</tr>
					<tr>
						<th class="table-active" scope="row">기업주소</th>
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
<!-- //메인 바디 끝 -->

<%@include file="../include/cfooter.jsp"%>