<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script type="text/javascript" src="/resources/rpjt/js/upload.js"></script>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9">
	<br> <br>
	<div class="row">
	
	<form role="form" method="post" enctype="multipart/form-data"> <!--enctype 기입 필수 -->
					
					
	

<a>test ${CInfoVO.id}</a>
		<div class="form-group col-lg-6">
			<label>기업명</label> <input type="text" name="cname" class="form-control" id=""
				value="${CInfoVO.cname}">
		</div>

		<div class="form-group col-lg-6">
			<label>대표자명</label> <input type="text" name="ceo" class="form-control" id=""
				value="${CInfoVO.ceo}">
		</div>
	</div>

	<div class="row">
		<div class="form-group col-lg-6">
			<label>업종</label> <input type="text" name="ctype" class="form-control" id=""
				value="${CInfoVO.ctype}">
		</div>

	
	</div>
	<div class="row">
		<div class="form-group col-lg-12">
			<label>기업소개</label>
			<textarea class="form-control" rows="2" name="intro">${CInfoVO.intro}</textarea>
		</div>
	</div>

	<div class="row">
		<div class="form-group col-lg-6">
			<label>기업형태</label> <input type="text" name="form" class="form-control" id=""
				value="${CInfoVO.form}">
		</div>

		<!-- ☆google search : datepicker -->
		<div class="form-group col-lg-6">
			<label>설립일</label>
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" name="establish" value="${CInfoVO.establish}"/>  <span
					class="input-group-addon"> <i
					class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-lg-6">
			<label>사원수</label> <input type="text" name="numemp" class="form-control" id=""
				value="${CInfoVO.numemp}">
		</div>

		<div class="form-group col-lg-6">
			<label>매출액</label> <input type="text" name="sales" class="form-control" id=""
				value="${CInfoVO.sales}">
		</div>
	</div>
	



	<div class="row">
		<div class="form-group col-lg-6">
			<label>대표전화</label> <input type="text" name="tel" class="form-control" id=""
				value="${CInfoVO.tel}">
		</div>

		<div class="form-group col-lg-6">
			<label>FAX</label> <input type="text" name="fax" class="form-control" id=""
				value="${CInfoVO.fax}">
		</div>
	</div>


	<div class="row">

		<div class="form-group col-lg-6">
			<label>홈페이지</label> <input type="text" name="homepage" class="form-control" id=""
				value="${CInfoVO.homepage}">
		</div>

		<div class="form-group col-lg-6">
			<label>SNS</label> <input type="text" name="sns" class="form-control" id=""
				value="${CInfoVO.sns}">
		</div>
	</div>


	<div class="row">
		<div class="form-group col-lg-12">
			<label>기업주소</label> <input type="text" name="location" class="form-control" id=""
				value="${CInfoVO.location}">
		</div>
	</div>
	
	<div class="form-group col-lg-6">
			<label>로고이미지</label> <br> <input type="file" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp">
		</div>  <!-- 컨트롤러 request에서 인식할 수 있게 임의의 name값을 지정해줘야한다 (controller랑 맞출 필요 X) -->
		
		<input type="hidden" name="img" value="${CInfoVO.img}">
	</form>
	
	
		


	<br> <br>
	<!-- 수정 버튼 -->
	
	<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning" id="modify">CANCEL</button>
				</div>
	<!-- //수정 버튼 -->
	<br> <br>
</div>
<!-- //기업 페이지 -->

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		var fileformObj = $("form[role='fileForm']");
		var fileObject = document.getElementById("file1");
		
	
		console.log(formObj);
		$(".btn-warning").on("click", function() {
			self.location = "/company/C_index";
		});
		$(".btn-primary").on("click", function() {
					
			formObj.submit();
		});
	});
</script>

<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			language : "kr"
		});
	});
	
	
</script>

<%@include file="../include/cfooter.jsp"%>