<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>
	
<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- Main content -->
<!-- 개인 수정 페이지 -->

<div class="col-md-9">
	<form role = "form" method = "post">
		<br> <br>
		<!-- <div class="row">
			<div class="form-group col-lg-6">
				<label>프로필이미지</label> <br> <input type="file"
					id="exampleInputFile">
			</div>
		</div> -->
		<div class="row">
			<div class="form-group col-lg-6">
				<label>아이디</label> <input type="text" name="id" class="form-control" id=""
					value="${PUserVO.id}" readonly="readonly">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-lg-6">
				<label>비밀번호</label> <input type="text" name="pw" class="form-control" id="pw"
					value="${PUserVO.pw}">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-lg-6">
				<label>비밀번호 확인</label> <input type="text" name="pwc" class="form-control" id="pwc"
					>
					<span id="pwchk"></span>	
			</div>
		</div>
		<div class="row">
			<div class="form-group col-lg-6">
				<label>이름</label> <input type="text" name="pname" class="form-control" id=""
					value="${PUserVO.pname}">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-lg-6">
				<label>email</label>
				<input type="text" name = "email" class="form-control" id=""
					value ="${PUserVO.email}">
			</div>
		</div>
		<div class="row">
			<!-- ☆google search : datepicker -->
			<div class="form-group col-lg-6">
				<label>생일</label>
				<div class="input-group date" data-provide="datepicker">
					<input type="text" name ="birth" class="form-control" id = ""
					value ="${PUserVO.birth}">
					<span
						class="input-group-addon"> <i
						class="glyphicon glyphicon-calendar"></i>
					</span>
				</div>
			</div>
		</div>
		<br> <br>
		<!-- 수정 완료, 취소 버튼 -->
		
</form>
	
		<button id = "modify-finish" class="btn btn-success" type='submit'>완료</button>
		<button id = "modify-cancel" class="btn btn-danger" type='submit'>취소</button>
			<!--  onClick="javascript:self.location='C_index_r04.html';"-->

	<!-- //수정 버튼 -->
	<br> <br>
</div>
<!-- //기업 페이지 -->

<script type='text/javascript'>
$(document).ready(function(){
	
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
	//수정버튼 누르면 제출되고 post방식으로 modify controller로  Mapping된다.
	$('#modify-finish').on("click", function(){
		//self.location = "/person/modify";
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();
			
		if(pw==pwc){
			if(confirm("수정하시겠습니까?")){
				formObj.attr("action", "/personal/modify");
				formObj.attr("method", "post");
				formObj.submit();
			}
		}else{
			alert("비밀번호를 확인해주세요.");
		}
		console.log("#modify-finish");
		//controller안바뀌고 form method = "post"대로 제출됨
	});
	//취소버튼 누르면 이력서 관리 페이지로 넘어간다. index controller로 Mapping된다.
	$('#modify-cancel').on("click", function(){
		//formObj.attr("action", "/personal/modify");
		console.log("#modify-cancel");
		self.location = "/personal/index";
	});
	
	/*<!-- 비밀번호 일치 여부  -->*/
	/* keyup을 통해 비밀번호가 맞는지 확인하는 작업 */
	var pwchk = $('#pwchk');
	
	$('#pwc').keyup(function(){
		if($('#pwc').val()!=""&&$('#pw').val() == $('#pwc').val()){
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치합니다.";
			pwchk.attr("style", "color:blue")
		}else{
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
			pwchk.attr("style", "color:red")
		}
	});
	
 	$('#pw').keyup(function(){
		if($('#pw').val()!=""&&$('#pw').val() == $('#pwc').val()){
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치합니다.";
			pwchk.attr("style", "color:blue")
		}else{
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
			pwchk.attr("style", "color:red")
		}
	}); 
	<!-- //비밀번호 일치 여부  -->
});
	
</script>

<%@include file="../include/cfooter.jsp"%>
