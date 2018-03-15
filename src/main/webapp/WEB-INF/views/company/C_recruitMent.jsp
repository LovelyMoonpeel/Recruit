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
	<br>
	<h3>${CInfoVO.cname}</h3>
	<h1>${RecruitVO.title}</h1>
	<span>${RecruitVO.period}</span>
	<span>조회수 ${RecruitVO.viewcnt}</span>
	|<span>스크랩 수</span><span>지원자수</span>
	<span>공유하기</span> 
	<br>
	<div class="row">
	<div class="col-md-3">
	<h3>담당업무</h3>
	
	<a>${RecruitVO.jobdesc}</a>
	</div>
	<div class="col-md-3">
	<h3>지원자격</h3>
	<a>${RecruitVO.exp}
	${RecruitVO.edu}</a>
	</div>
	<div class="col-md-3">
	<h3>근무조건</h3>
	<a>${RecruitVO.rgbid}</a> <a>${RecruitVO.rgsid}</a><br>
	<a>${RecruitVO.salaryid}</a><br>
	<a>${RecruitVO.employstatusid}</a>
	</div>
	<div class="col-md-3">
	<h3>기업정보</h3>
	
	산업(업종)${CInfoVO.ctype}<br>
	사원수${CInfoVO.numemp}<br>
	${CInfoVO.establish}<br>
	${CInfoVO.form}<br>
	${CInfoVO.homepage}<br>
	<button>기업상세정보</button>
	</div>
		</div>
		<br><br>

	
	<br><br>

<table class="table">
		<tr>
			<th>모집직종</th>
			<td>${RecruitVO.jobgroupid} -> ${RecruitVO.jobgroupid2}</td>
		</tr>
		<tr>
			<th>근무지역</th>
			<td>${RecruitVO.rgbid} -> ${RecruitVO.rgsid}</td>
		</tr>
		<tr>
			<th>담당업무</th>
			<td>${RecruitVO.jobdesc}</td>
		</tr>
		<tr>
			<th>모집인원</th>
			<td>${RecruitVO.recruitnum }명</td>
		</tr>
		<tr>
			<th>근무형태</th>
			<td>${RecruitVO.employstatusid }</td>
		</tr>
		<tr>
			<th>급여사항</th>
			<td>${RecruitVO.salaryid }</td>
		</tr>
		<tr>
			<th>학력</th>
			<td>${RecruitVO.edu }</td>
		</tr>
		<tr>
			<th>경력</th>
			<td>${RecruitVO.exp }</td>
		</tr>
		<tr>
			<th>상세내용 및 우대사항</th>
			<td>${RecruitVO.adddesc }</td>
		</tr>
		<tr>
			<th>접수기간</th>
			<td>${RecruitVO.period }</td>
		</tr>
		<tr>
			<th>접수방법</th>
			<td>${RecruitVO.acceptmethod }</td>
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
	
	<div class="row">
	<h3>기업정보</h3>
	
	<span class="text-center" style="width:30%">산업(업종)</span> <span class="text-center" style="width:70%">${CInfoVO.ctype}</span><br>
	<span class="text-center" style="width:30%">사원수</span> <span class="text-center" style="width:70%">${CInfoVO.numemp}</span><br>
	<span class="text-center" style="width:30%">설립년도</span> <span class="text-center" style="width:70%">${CInfoVO.establish}</span><br>
	<span class="text-center" style="width:30%">기업형태</span> <span class="text-center" style="width:70%">${CInfoVO.form}</span><br>
	<span class="text-center" style="width:30%">홈페이지</span> <span class="text-center" style="width:70%">${CInfoVO.homepage}</span><br>
	<button>기업상세정보</button>
	</div>
		
			</table>
			
</div>
<!-- //메인 바디 끝 -->

<%@include file="../include/cfooter.jsp"%>