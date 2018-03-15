<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/pheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css"
	href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- r.추가  -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js">
	
</script>
<!-- Main content -->

<div class="col-md-9">
	<h1>이력서 작성</h1>

	<form role="form" method="post">
		<!-- r.code 03/15 -->
		<input type="hidden" name="bno" value="${bno}">
		<!-- end of r.code -->
		<input type="hidden" class="form-control" id="userid" name="userid"
			value="${PUserVO.id}"> <input type="hidden"
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
				<input type="text" class="form-control" id="birth" name="birth"
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

		<!-- r.code 03/13 : 학력/경력 폼 수정-->
		<hr style="border: solid 1px #ccc;">

		<h4>
			<b>학력</b>
		</h4>
		<div id="edu_div"></div>
		<!-- r.code 03/13 : 학력폼을  handlebars(template_edu)로 적용 -->
		<hr style="border: solid 1px #ccc;">
		<h4>
			<b>경력</b>
		</h4>
		<div id="exp_div"></div>
		<!-- r.code 03/13 : 경력폼을  handlebars(template_exp)로 적용 -->
		<hr style="border: solid 1px #ccc;">
		<!-- end of r.code -->

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

<script id="template_edu" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">
	<div class="form-group col-md-3">
		<input class="edu" type="hidden" name="listEdu[].resumenum" value="{{resumenum}}">
		<label>입학일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control enterdate edu"
				name="listEdu[].enterdate" value="{{enterdate}}"> <span
				class="input-group-addon"> </span>
		</div>
		<!-- <input class="form-control" id="enterdate" name="enterdate" -->
		<!-- value="${ResumeEduVO.enterdate}"></input> -->
	</div>
	<div class="form-group col-md-3">
		<label>졸업일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control gradudate edu"
				name="listEdu[].gradudate" value="{{gradudate}}"> <span
				class="input-group-addon"> </span>
		</div>
		<!-- <input class="form-control" id="gradudate" name="gradudate" -->
		<!-- value="${ResumeEduVO.gradudate}"></input> -->
	</div>
	<div class="form-group col-md-5">
		<label for="schoolname">학교명</label> <input class="form-control schoolname edu"
			name="listEdu[].schoolname" value="{{schoolname}}"></input>
	</div>
	<div class="form-group col-md-4">
		<label for="major">학과</label> <input class="form-control major edu"
			name="listEdu[].major" value="{{major}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="edustatus">졸업상태</label>
		<select class="form-control edustatus edu" name="listEdu[].edustatus">
			{{#select edustatus}}
			<option value="0" selected>선택</option>
			<option value="15">재학</option>
			<option value="16">졸업</option>
			<option value="17">중퇴</option>
			<option value="18">졸업예정</option>
			<option value="19">휴학</option>
			{{/select}}
		</select>
		<!-- <input class="form-control" id="edustatus" name="edustatus" -->
		<!-- value="${ResumeEduVO.edustatus}"></input> -->
	</div>
	<div class="form-group col-md-2">
		<label>추가/삭제</label><br />
		<button class="btn btn-default edu_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default edu_minus_btn" type="button"
			onclick="$(this).closest('.row').remove();">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>

<script id="template_exp" type="text/x-handlebars-template">
<div class="row">
	<input class="career" type="hidden" name="listCareer[].resumenum" value="{{resumenum}}">
	<hr style="border: solid 0.5px #ccc;">
	<div class="form-group col-md-3">
		<label>입사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career" name="listCareer[].startjob"
				value="{{startjob}}"> <span
				class="input-group-addon"> </span>
		</div>
		<!-- <input class="form-control" name="startjob" -->
		<!-- value="${ResumeCareerVO.startjob}"></input> -->
	</div>
	<div class="form-group col-md-3">
		<label>퇴사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career"
				name="listCareer[].finishjob" value="{{finishjob}}"> <span
				class="input-group-addon"> </span>
		</div>
		<!-- <input class="form-control" name="finishjob" -->
		<!-- value="${ResumeCareerVO.finishjob}"></input> -->
	</div>
	<div class="form-group col-md-5">
		<label for="cname">회사명</label>
		<input class="form-control career" name="listCareer[].cname" value="{{cname}}"></input>
	</div>
	<div class="form-group col-md-4">
		<label for="jobdescription">담당업무</label>
		<input class="form-control career" name="listCareer[].jobdescription" value="{{jobdescription}}">
		</input>
	</div>
	<div class="form-group col-md-3">
		<label for="salary">연봉</label>
		<select class="form-control career" name="listCareer[].salary">
			{{#select salary}}
			<option value="0" selected>선택</option>
			<option value="34">~ 2,000</option>
			<option value="35">2,000 ~ 2,500</option>
			<option value="36">2,500 ~ 3,000</option>
			<option value="37">3,000 ~ 3,500</option>
			<option value="38">3,500 ~ 4,000</option>
			<option value="39">4,000 ~ 4,500</option>
			<option value="40">4,500 ~ 5,000</option>
			<option value="41">5,000 ~ 6,000</option>
			<option value="42">6,000 ~ 6,500</option>
			<option value="43">6,500 ~ 7,000</option>
			<option value="44">7,000 ~ 7,500</option>
			<option value="45">7,500 ~ 8,000</option>
			<option value="46">8,000 ~ 8,500</option>
			<option value="47">8,500 ~ 9,000</option>
			<option value="48">9,000 ~ 9,500</option>
			<option value="49">9,500 ~ 10,000</option>
			<option value="50">10,000 ~ 10,500</option>
			<option value="51">10,500 ~</option>
			{{/select}}
		</select>
		<!-- <input class="form-control" id="salary" name="salary" -->
		<!-- value="${ResumeCareerVO.salary}"></input> -->
	</div>
	<div class="form-group col-md-2">
		<label>추가/삭제</label><br />
		<button class="btn btn-default exp_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default exp_minus_btn" type="button"
			onclick="$(this).closest('.row').remove();">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>

<script type='text/javascript'>
	$(document).ready(function() {
		
		// r.code 03/14 Handlebars Helper 등록
		Handlebars.registerHelper('select', function( value, options ){
	        var $el = $('<select />').html( options.fn(this) );
	        $el.find('[value="' + value + '"]').attr({'selected':'selected'});
	        return $el.html();
	    });
	
		var formObj = $("form[role = 'form']");

		// $(function() {
		// 	$('.input-group.date').datepicker({
		// 		calendarWeeks : false,
		// 		todayHighlight : true,
		// 		autoclose : true,
		// 		format : "yyyy-mm-dd",
		// 		language : "kr"
		// 	});
		// });

		function datepick() {
			$('.input-group.date').datepicker({
				calendarWeeks : false,
				todayHighlight : true,
				autoclose : true,
				format : "yyyy-mm-dd",
				language : "kr"
			});
		}

		$("#btn-success").on("click", function() {
			formObj.attr("action", "/personal/Rmodify");
			formObj.attr("method", "post");
			numberingList();
			formObj.submit();
		});
		
		// r.code 03/14 edu, career 객체번호 붙힘
		function numberingList() {
			$(".edu").each(function(index){
				var num = 6;
				var name = $(this).attr("name");
				name = name.substring(0, 8) + parseInt(index/num) + name.substring(8);
				$(this).attr("name", name);
				console.log($(this).attr("name"));
			});
				
			$(".career").each(function(index){
				var num = 6;
				var name = $(this).attr("name");
				name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
				$(this).attr("name", name);
				console.log($(this).attr("name"));
			});
		}

		// edu 추가버튼 이벤트
		$("#edu_div").on("click", ".edu_plus_btn", add_edu);

		// exp 추가버튼 이벤트
		$("#exp_div").on("click", ".exp_plus_btn", add_exp);

		// add_edu(); // edu 공란 추가
		// add_exp(); // exp 공란 추가

		function add_edu(item) {
			var source_edu = $("#template_edu").html();
			var template_edu = Handlebars.compile(source_edu);
			$("#edu_div").append(template_edu(item));
			datepick();
		}

		function add_exp(item) {
			var source_exp = $("#template_exp").html();
			var template_exp = Handlebars.compile(source_exp);
			$("#exp_div").append(template_exp(item));
			datepick();
		}
		
		function edu_list() {
			var len = (${eduVOlist.size()});
			<c:forEach items="${eduVOlist}" var="eduVO">
				var eduVO = new Object();
				var item = {
						resumenum : ${eduVO.resumenum},
						schoolname : "${eduVO.schoolname}",
						major : "${eduVO.major}",
						enterdate : "${eduVO.enterdate}",
						gradudate : "${eduVO.gradudate}",
						edustatus : ${eduVO.edustatus}
					};
				add_edu(item);
			</c:forEach>
		}
		
		function exp_list() {
			var len = (${careerVOList.size()});
			<c:forEach items="${careerVOList}" var="careerVO">
				var careerVO = new Object();
				var item = {
						resumenum : ${careerVO.resumenum},
						cname : "${careerVO.cname}",
						jobdescription : "${careerVO.jobdescription}",
						startjob : "${careerVO.startjob}",
						finishjob : "${careerVO.finishjob}",
						salary : ${careerVO.salary}
					};
				add_exp(item);
			</c:forEach>
		}		
		edu_list();
		exp_list();
	});
</script>
<%@include file="../include/cfooter.jsp"%>
