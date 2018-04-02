<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/pheader.jsp"%>

<link rel="stylesheet" type="text/css"
	href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="col-md-9">
	<h1>${PUserVO.id}님의이력서수정</h1>
	<form role="form" method="post">
		<input type="text" class="form-control" id="bno" name="bno"
			value="${ResumeVO.bno}" readonly> <br>

		<hr style="border: solid 4px #ccc;">
		<h4>
			<b>연락처 목록</b>
		</h4>
		<div id="tel_div"></div>
		<hr style="border: solid 4px #ccc;">

		<!-- r.code 03/13 : 학력/경력 폼 수정-->
		<hr style="border: solid 1px #ccc;">
		<h4>
			<b>학력사항</b>
		</h4>
		<div id="edu_div"></div>
		<hr style="border: solid 1px #ccc;">
		<h4>
			<b>경력사항</b>
		</h4>
		<div id="exp_div"></div>
		<hr style="border: solid 1px #ccc;">
		<!-- end of r.code -->
		<hr style="border: solid 4px #ccc;">
		<h4>
			<b>사이트 목록</b>
		</h4>
		<div id="web_div"></div>
		<hr style="border: solid 4px #ccc;">
		<hr style="border: solid 4px #ccc;">
		<h4>
			<b>보유 자격증 목록</b>
		</h4>
		<div id="license_div"></div>
		<hr style="border: solid 4px #ccc;">
		<hr style="border: solid 4px #ccc;">
		<h4>
			<b>어학 능력(자격증) 목록</b>
		</h4>
		<div id="language_div"></div>
		<hr style="border: solid 4px #ccc;">

	</form>
	<button id="write-success" class="btn btn-success col-md-offset-10"
		type="submit">등록</button>
	<button id="write-cancel" class="btn btn-danger"
		onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';"
		type="button">취소</button>
</div>

<script id="template_tel" type="text/x-handlebars-template">
<div class="row tel_row_number">
	<hr style="border: solid 0.5px #ccc;">

	<input type="hidden" class="form-control telid" value="{{telid}}"></input>
	<input type="hidden" class="form-control rid telclass" name="ptelvolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="teltitle">전화번호 (종류)</label> 
		<input class="form-control teltitle telclass" name="ptelvolist[].teltitle" value="{{teltitle}}"></input>
	</div>
	
	<div class="form-group col-md-4">
		<label for="tel">전화번호</label> 
		<input class="form-control tel telclass" name="ptelvolist[].tel" value="{{tel}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label id="tel_label">추가/삭제</label>
		<br>
		<button class="btn btn-default btn-sm tel_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm tel_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script id="template_edu" type="text/x-handlebars-template">
<div class="row edu_row_number">
	<hr style="border: solid 0.5px #ccc;">
	
	<input class="edu" type="hidden" name="eduVOlist[].resumenum" value="{{resumenum}}">
	
	<div class="form-group col-md-2">
		<label for="enterdate">입학일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control enterdate edu" name="eduVOlist[].enterdate" value="{{enterdate}}">
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	
	<div class="form-group col-md-2">
		<label for="gradudate">졸업일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control gradudate edu" name="eduVOlist[].gradudate" value="{{gradudate}}">
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	
	<div class="form-group col-md-3">
		<label for="schoolname">학교명</label>
		<input class="form-control schoolname edu" name="eduVOlist[].schoolname" value="{{schoolname}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label for="major">학과</label>
		<input class="form-control major edu" name="eduVOlist[].major" value="{{major}}"></input>
	</div>
	<div class="form-group col-md-2">
		<label for="edustatus">졸업상태</label>
		<select class="form-control edustatus edu" name="eduVOlist[].edustatus">
			{{#select edustatus}}
			<option value="0">선택</option>
			<option value="15">재학</option>
			<option value="16">졸업</option>
			<option value="17">중퇴</option>
			<option value="18">졸업예정</option>
			<option value="19">휴학</option>
			{{/select}}
		</select>
	</div>
	
	<div class="form-group col-md-2">
		<label id="edu_label">추가/삭제</label><br />
		<button class="btn btn-default btn-sm edu_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm edu_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
</script>
<script id="template_exp" type="text/x-handlebars-template">
<div class="row exp_row_number">
	<input class="career" type="hidden" name="listCareer[].resumenum" value="{{resumenum}}">
	<hr style="border: solid 0.5px #ccc;">
	<div class="form-group col-md-3">
		<label>입사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career" name="listCareer[].startjob"
				value="{{startjob}}"> <span
				class="input-group-addon"> </span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label>퇴사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career"
				name="listCareer[].finishjob" value="{{finishjob}}"> <span
				class="input-group-addon"> </span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label for="cname">회사명</label>
		<input class="form-control career" name="listCareer[].cname" value="{{cname}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="jobdescription">담당업무</label>
		<input class="form-control career" name="listCareer[].jobdescription" value="{{jobdescription}}">
		</input>
	</div>
	<div class="form-group col-md-3">
		<label for="salary">연봉</label>
		<select class="form-control career" name="listCareer[].salary">
			{{#select salary}}
			<option value="0">선택</option>
			<option value="34">~ 2,000</option>
			<option value="35">2,000 ~ 2,500</option>
			<option value="36">2,500 ~ 3,000</option>
			<option value="37">3,000 ~ 3,500</option>
			<option value="50">10,000 ~ 10,500</option>
			<option value="51">10,500 ~</option>
			{{/select}}
		</select>
	</div>
	<div class="form-group col-md-2">
		<label id="exp_label">추가/삭제</label><br />
		<button class="btn btn-default exp_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default exp_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
</script>
<script id="template_web" type="text/x-handlebars-template">
<div class="row web_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control webid" value="{{webid}}"></input>
	<input type="hidden" class="form-control webclass rid" name="pwebsitesvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-3">
		<label for="webtitle">사이트 (종류)</label> 
		<input class="form-control webtitle webclass" name= "pwebsitesvolist[].webtitle" value="{{webtitle}}"> </input>
	</div>

	<div class="form-group col-md-4">
		<label for="webadd">주소</label> 
		<input class="form-control webadd webclass" name="pwebsitesvolist[].webadd" value="{{webadd}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label id="web_label">추가/삭제</label><br />
		<button class="btn btn-default btn-sm web_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm web_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script id="template_license" type="text/x-handlebars-template">
<div class="row license_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control licenseid" value="{{licenseid}}"></input>
	<input type="hidden" class="form-control rid licenseclass" name="rlicensevolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="licensename">자격증명</label> 
		<input class="form-control licensename licenseclass" name="rlicensevolist[].licensename" value="{{licensename}}"></input>
	</div>

	<div class="form-group col-md-3">
		<label for="publeoffice">발행기관</label> 
		<input class="form-control publeoffice licenseclass" name="rlicensevolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>
	
	<div class="form-group col-md-3">
		<label for="acquidate">취득일자</label> 
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="input-group date form-control acquidate licenseacquidate licenseclass" name="rlicensevolist[].acquidate" value="{{acquidate}}">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
	</div>

	<div class="form-group col-md-2">
		<label id="license_label">추가/삭제</label><br/>
		<button class="btn btn-default btn-sm license_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm license_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>

</div>
<!-- end of row -->
</script>

<script id="template_language" type="text/x-handlebars-template">
<div class="row lang_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control resumelangid" value="{{resumelangid}}"></input>
	<input type="hidden" class="form-control rid langclass" name="rlangvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-2">
		<label for="lid">언어 선택</label>
		<select class="form-control lid langclass" name="rlangvolist[].lid" value="{{lid}} >
			{{#select lid}}
			<option value="102">선택</option>
			<option value="102" selected>선택</option>
			<option value="52">영어</option>
			<option value="53">일본어</option>
			<option value="54">중국어</option>
			{{/select}}
		</select>
	</div>
	
	<div class="form-group col-md-2">
		<label for="test">공인인증시험명</label> 
		<input class="form-control test langclass" name="rlangvolist[].test" value="{{test}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label for="score">점수</label> 
		<input class="form-control score langclass" name="rlangvolist[].score" value="{{score}}"></input>
	</div>
	<div class="form-group col-md-2">
		<label for="publeoffice">발행기관</label> 
		<input class="form-control publeoffice langclass" name="rlangvolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>
	<div class="form-group col-md-2">
		<label for="acquidate">취득일자</label> 
		<div class="input-group date" data-provide="datepicker">
				<input type="text" class="input-group date form-control acquidate languageacquidate langclass"  name="rlangvolist[].acquidate" value="{{acquidate}}">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-2">
		<label id="lang_label">추가/삭제</label><br/>
		<button class="btn btn-default btn-sm lang_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm lang_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script type='text/javascript'>
$(document).ready(function() {
		
	Handlebars.registerHelper('select', function( value, options ){
        var $el = $('<select />').html( options.fn(this) );
        $el.find('[value="' + value + '"]').attr({'selected':'selected'});
        return $el.html();
    });
	
	var formObj = $("form[role = 'form']");
	
	function datepick() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			language : "kr"
		});
	}
	
	$("#write-success").on("click", function() {
		
		console.log("write-success clicked");
		
		if($('#birth').val()==''){
			console.log("#birth.val()==''");
			$('#birth').val("0000-00-00");
		}
		$('.licenseacquidate').each(function(){ 
			if($(this).val()==''){
				console.log($(this).val());
				console.log(".licenseacquidate.val()==''");
				$(this).val("0000-00-00");
				console.log($(this).val());
			}
		});
		$('.languageacquidate').each(function(){ 
			if($(this).val()==''){
				console.log($(this).val());
				console.log(".languageacquidate.val()==''");
				$(this).val("0000-00-00");
				console.log($(this).val());
			}
		});
		
		if($("#xornot").val()==0){
			console.log("xornot.val()==0");
			console.log("사진 삭제 안함");

		}else if($("#xornot").val()==1&&$("#preexistenceimg").val()==1){
			//삭제 시키기 ajax 실행 후에 Rmodify로 넘어가기
			console.log("사진 삭제 후 filename" + fileName);
			console.log("사진 삭제함");		
			$.ajax({
				url:"deleteFile",
				type:"post",
				//data : {fileName:$(this).attr("data-src")},
				data: {fileName:fileName},
				dataType:"text",
				success:function(result){
					if(result=='deleted'){
						console.log("img File on server deleted");
						$(this).parent("div").remove();
					}
				}
			}); 
		}else if($("#xornot").val()==1&&$("#preexistenceimg").val()==0){
			console.log("preexistenceimg가 없었고 삭제 버튼을 누른 상태 : img File on server deleted");
			//$(this).parent("div").remove();
		}else{
			console.log("Exception : 어느 if문에도 들어가지 못함");
			console.log(("#preexistenceimg").val());
		}
		console.log("submit직전");
		formObj.attr("action", "/personal/Rmodify");
		formObj.attr("method", "post");
		numberingList();
		formObj.submit();
	});
	
	function numberingList() {
		$(".telclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		});
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
		$(".webclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 16) + parseInt(index/num) + name.substring(16);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
	 	$(".langclass").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 12) + parseInt(index/num) + name.substring(12);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
		$(".licenseclass").each(function(index){
			var num = 4;
			var name = $(this).attr("name");
			name = name.substring(0, 15) + parseInt(index/num) + name.substring(15);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
	}
	// tel 추가버튼 이벤트
	$("#tel_div").on("click", ".tel_plus_btn", function(){
		 var item = {
			rid : ${ResumeVO.bno}
		}; 
		add_tel(item);
	});
	// tel 삭제버튼 이벤트
	$("#tel_div").on("click", ".tel_minus_btn", function(){
		 var tel_index = $(".tel_minus_btn").index(this);  // 존재하는 tel_minus_btn를 기준으로 index
		 console.log(tel_index);
		 if(tel_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	// edu 추가버튼 이벤트
	$("#edu_div").on("click", ".edu_plus_btn", function(){
		var item = {
			resumenum : ${ResumeVO.bno}
		};
		add_edu(item);
	});
	//edu minus 버튼 이벤트
	$("#edu_div").on("click", ".edu_minus_btn", function(){
		 var edu_index = $(".edu_minus_btn").index(this);  // 존재하는 edu_minus_btn를 기준으로 index
		 console.log(edu_index);
		 if(edu_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	// exp 추가버튼 이벤트
	$("#exp_div").on("click", ".exp_plus_btn", function(){
		var item = {
			resumenum : ${ResumeVO.bno}
		};
		add_exp(item);
	});
	//exp minus 버튼 이벤트
	$("#exp_div").on("click", ".exp_minus_btn", function(){
		 var exp_index = $(".exp_minus_btn").index(this);  // 존재하는 exp_minus_btn를 기준으로 index
		 console.log(exp_index);
		 if(exp_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//웹 추가 버튼 이벤트
	$("#web_div").on("click", ".web_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_web(item);
	});
	//웹 삭제 버튼 이벤트
	$("#web_div").on("click", ".web_minus_btn", function(){
		 var web_index = $(".web_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(web_index);
		 if(web_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//자격증 추가 버튼 이벤트
	$("#license_div").on("click", ".license_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_license(item);
	});
	//자격증 삭제 버튼 이벤트
	$("#license_div").on("click", ".license_minus_btn", function(){
		 var license_index = $(".license_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(license_index);
		 if(license_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//언어 추가 버튼 이벤트
	$("#language_div").on("click", ".lang_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_language(item);
	});
	//언어 삭제 버튼 이벤트
	$("#language_div").on("click", ".lang_minus_btn", function(){
		var lang_index = $(".lang_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(lang_index);
		 if(lang_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	function add_tel(item) {
		var source_tel = $("#template_tel").html();
		var template_tel = Handlebars.compile(source_tel);
		$("#tel_div").append(template_tel(item));
		datepick();
		//minus_btn();
	}
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
	function add_web(item) {
		var source_web = $("#template_web").html();
		var template_web = Handlebars.compile(source_web);
		$("#web_div").append(template_web(item));
		datepick();
	}
	function add_license(item) {
		var source_license = $("#template_license").html();
		var template_license = Handlebars.compile(source_license);
		$("#license_div").append(template_license(item));
		datepick();
	}
	function add_language(item) {
		var source_language = $("#template_language").html();
		var template_language = Handlebars.compile(source_language);
		$("#language_div").append(template_language(item));
		datepick();
	}
	function tel_list() {
		var len = (${PTelVOlist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${PTelVOlist}" var="PTelVO">
			var item = {
				telid : ${PTelVO.telid},
				rid : ${PTelVO.rid},
				teltitle : "${PTelVO.teltitle}", 
				tel : "${PTelVO.tel}" 
			};
			add_tel(item);
			</c:forEach>
		}else{
			var item = {
				telid : """,
				rid : ${ResumeVO.bno},
				teltitle : "", 
				tel : "" 
			};
			add_tel(item);
		}
	}
/* 	function edu_list() {
		var len = (${eduVOlist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${eduVOlist}" var="eduVO">
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
		} else {
			var item = {
					resumenum : ${ResumeVO.bno},
					schoolname : "",
					major : "",
					enterdate : "",
					gradudate : "",
					edustatus : "",
				};
			add_edu(item);
		}
	}
	
	function exp_list() {
		var len = (${careerVOList.size()});
		
		if( len > 0 ) {
			<c:forEach items="${careerVOList}" var="careerVO">
				var item = {
					resumenum : ${ResumeVO.bno},
					cname : "",
					jobdescription : "",
					startjob : "",
					finishjob : "",
					salary : ""
				};
				
				add_exp(item);
			</c:forEach>
		}else{
			var item = {
					resumenum : ${careerVO.resumenum},
					cname : "${careerVO.cname}",
					jobdescription : "${careerVO.jobdescription}",
					startjob : "${careerVO.startjob}",
					finishjob : "${careerVO.finishjob}",
					salary : ${careerVO.salary}
				};
				
			add_exp(item);
		}
		
	}		
	function web_list() {
		var len = (${PWebSiteVOlist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${PWebSiteVOlist}" var="PWebSiteVO">
				var item = {
					webid : ${PWebSiteVO.webid},
					rid : ${PWebSiteVO.rid},
					webtitle : "${PWebSiteVO.webtitle}", 
					webadd : "${PWebSiteVO.webadd}"
				};
			add_web(item);
			</c:forEach>
		}else{
			var item = {
					webid : "",
					rid : ${ResumeVO.bno},
					webtitle : "", 
					webadd : ""
				};
			add_web(item);
		}
	}

	function license_list() {
		var len = (${RLicenselist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${RLicenselist}" var="RLicenseVO">
			var item = {
				rid : ${RLicenseVO.rid},
				licensename : "${RLicenseVO.licensename}", 
				publeoffice : "${RLicenseVO.publeoffice}",
				acquidate : "${RLicenseVO.acquidate}"
			};
			add_license(item);
			</c:forEach>
		}else{
			var item = {
					rid : ${ResumeVO.bno},
					licensename : "", 
					publeoffice : "",
					acquidate : ""
				};
			add_license(item);
		}
		
	}
	function language_list() {
		var len = (${RLanguagelist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${RLanguagelist}" var="ResumeLanguageVO">
			var item = {
				rid : ${ResumeLanguageVO.rid},
				lid : ${ResumeLanguageVO.lid},
				test : "${ResumeLanguageVO.test}", 
				score : "${ResumeLanguageVO.score}",
				publeoffice : "${ResumeLanguageVO.publeoffice}",
				acquidate : "${ResumeLanguageVO.acquidate}"
			};
			add_language(item);
			</c:forEach>
		}else{
			var item = {
					rid :${ResumeVO.bno},
					lid : "",
					test : "", 
					score : "",
					publeoffice : "",
					acquidate : ""
				};
			add_language(item);
		}
		
	} */
	tel_list();
	//edu_list();
	//exp_list();
	//web_list();
	//license_list();
	//language_list();
});

</script>//이거 수정중

<%@include file="../include/cfooter.jsp"%>