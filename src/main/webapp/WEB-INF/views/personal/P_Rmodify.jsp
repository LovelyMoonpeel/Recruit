<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css"
	href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- Main content -->

<div class="col-md-9">
	<h1>이력서 작성</h1>

	<form role="form" method="post">
		<input type="hidden" class="form-control" id="bno" name="bno"
			value="${ResumeVO.bno}"> 

		<input type="hidden" class="form-control" id="userid" name="userid"
			value="${PUserVO.id}"> 
			<input type="hidden"
			class="form-control" id="id" name="id" value="${PUserVO.id}">

		<div class="form-group">
			<label for="pname">이름</label> <input type="text" class="form-control"
				id="pname" name="pname" value="${PUserVO.pname}">
		</div>
		<div class="form-group">
			<label for="img">사진</label>
			<!--  input type="file" class="form-control" id="img" value="${ResumeVO.img}">-->
			<input type="text" class="form-control" id="img"
				value="${ResumeVO.img}">
		</div>
		<div class="form-group">
			<!-- ☆google search : datepicker -->
			<!--   <div class="form-group col-lg-6"> -->
			<label>생년월일</label>
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" id="" name="birth"
					value="${PUserVO.birth}"> <span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
			<!--  </div>  -->
		</div>
		<div class="form-group">
			<label for="email">이메일</label> <input type="text"
				class="form-control" id="email" name="email"
				value="${PUserVO.email}">
		</div>
		<div class="form-group">
			<label for="teltitle">전화번호(종류)</label> <input type="text"
				class="form-control" id="teltitle" name="teltitle"
				value="${PTelVO.teltitle}">
		</div>
		<div class="form-group">
			<label for="tel">전화번호</label> <input type="text" class="form-control"
				id="tel" name="tel" value="${PTelVO.tel}">
		</div>
		<div class="form-group">
			<label for="webtitle">웹사이트(종류)</label> <input type="text"
				class="form-control" id="webtitle" name="webtitle"
				value="${PWebSiteVO.title}">
		</div>
		<div class="form-group">
			<label for="webadd">웹사이트</label> <input type="text"
				class="form-control" id="webadd" name="webadd"
				value="${PWebSiteVO.webadd}">
		</div>
		<div class="form-group">
			<label for="address">주소</label> <input class="form-control"
				id="address" name="address" value="${ResumeVO.address}"></input>
		</div>
		<div class="form-group">
			<label for="postcode">우편번호</label> <input class="form-control"
				id="postcode" name="postcode" value="${ResumeVO.postcode}"></input>
		</div>


		<div class="form-group">
			<label for="schoolname">학교명</label> <input class="form-control"
				id="schoolname" name="schoolname" value="${ResumeEduVO.schoolname}"></input>
		</div>
		<div class="form-group">
			<label for="major">학과</label> <input class="form-control" id="major"
				name="major" value="${ResumeEduVO.major}"></input>
		</div>
		<div class="form-group">
			<label for="enterdate">입학일</label> <input class="form-control"
				id="enterdate" name="enterdate" value="${ResumeEduVO.enterdate}"></input>
		</div>
		<div class="form-group">
			<label for="gradudate">졸업일</label> <input class="form-control"
				id="gradudate" name="gradudate" value="${ResumeEduVO.gradudate}"></input>
		</div>
		<div class="form-group">
			<label for="edustatus">졸업상태</label> <input class="form-control"
				id="edustatus" name="edustatus" value="${ResumeEduVO.edustatus}"></input>
		</div>


		<div class="form-group">
			<label for="cname">회사명</label> <input class="form-control" id="cname"
				name="cname" value="${ResumeCareerVO.cname}"></input>
		</div>
		<div class="form-group">
			<label for="jobdescription">담당업무</label> <input class="form-control"
				id="jobdescription" name="jobdescription"
				value="${ResumeCareerVO.jobdescription}"></input>
		</div>
		<div class="form-group">
			<label for="startjob">입사일</label> <input class="form-control"
				id="startjob" name="startjob" value="${ResumeCareerVO.startjob}"></input>
		</div>
		<div class="form-group">
			<label for="finishjob">퇴사일</label> <input class="form-control"
				id="finishjob" name="finishjob" value="${ResumeCareerVO.finishjob}"></input>
		</div>
		<div class="form-group">
			<label for="salary">연봉</label> <input class="form-control"
				id="salary" name="salary" value="${ResumeCareerVO.salary}"></input>
		</div>


		<div class="form-group">
			<label for="test">자격증명</label> <input class="form-control" id="test"
				name="test" value="${RLicenseVO.test}"></input>
		</div>
		<div class="form-group">
			<label for="publeoffice">발행기관</label> <input class="form-control"
				id="publeoffice" name="publeoffice"
				value="${RLicenseVO.publeoffice}"></input>
		</div>
		<div class="form-group">
			<label for="acquidate">취득일자</label> <input class="form-control"
				id="acquidate" name="acquidate" value="${RLicenseVO.acquidate}"></input>
		</div>
		<div class="form-group">
			<label for="testname">공인인증시험명</label> <input class="form-control"
				id="testname" name="testname" value="${ResumeLanguageVO.test}"></input>
		</div>
		<div class="form-group">
			<label for="score">점수</label> <input class="form-control" id="score"
				name="score" value="${ResumeLanguageVO.score}"></input>
		</div>
		<div class="form-group">
			<label for="lanpubleoffice">발행기관</label> <input class="form-control"
				id="lanpubleoffice" name="lanpubleoffice"
				value="${ResumeLanguageVO.publeoffice}"></input>
		</div>
		<div class="form-group">
			<label for="lanacquidate">취득일자</label> <input class="form-control"
				id="lanacquidate" name="lanacquidate"
				value="${ResumeLanguageVO.acquidate}"></input>
		</div>


		<div class="form-group">
			<label for="jobstateid">구직상태</label> <input class="form-control"
				id="jobstateid" name="jobstateid" value="${ResumeVO.jobstateid}">
		</div>
		<div class="form-group">
			<label for="jobgroupid">희망직종</label> <input class="form-control"
				id="jobgroupid" name="jobgroupid" value="${ResumeVO.jobgroupid}">
		</div>
		<div class="form-group">
			<label for="employstatusid">희망근무형태</label> <input
				class="form-control" id="employstatusid" name="employstatusid"
				value="${ResumeVO.employstatusid}">
		</div>
		<div class="form-group">
			<label for="rgbid">희망근무지(시/도)</label> <input class="form-control"
				id="rgbid" name="rgbid" value="${ResumeVO.rgbid}"></input>
		</div>
		<div class="form-group">
			<label for="rgsid">희망 근무지</label> <input class="form-control"
				id="rgsid" name="rgsid" value="${ResumeVO.rgsid}"></input>
		</div>
		<div class="form-group">
			<label for="salaryid">희망연봉</label> <input class="form-control"
				id="salaryid" name="salaryid" value="${ResumeVO.salaryid}"></input>
		</div>

		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title"
				name="title" value="${ResumeVO.title}">
		</div>
		<div class="form-group">
			<label for="coverletter">자기소개서</label>
			<textarea class="form-control" rows="10" id="coverletter"
				name="coverletter">${ResumeVO.coverletter}</textarea>
		</div>

		<button id="btn-success" class="btn btn-success" type="submit">등록</button>
	</form>
</div>

<script type='text/javascript'>
	$(document).ready(function() {

		var formObj = $("form[role = 'form']");

		$(function() {
			$('.input-group.date').datepicker({
				calendarWeeks : false,
				todayHighlight : true,
				autoclose : true,
				format : "yyyy-mm-dd",
				language : "kr"
			});
		});

		$("#btn-success").on("click", function() {
			formObj.attr("action", "/personal/Rmodify");
			formObj.attr("method", "post");
			formObj.submit();
		});
	});
</script>
<%@include file="../include/cfooter.jsp"%>
