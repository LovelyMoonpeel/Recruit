<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>


<link rel="stylesheet" type="text/css"
	href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script type="text/javascript" src="/resources/rpjt/js/upload.js"></script>

<!-- Main content -->
<!-- 기업 페이지 -->
<form role="form" method="post" enctype="multipart/form-data">
	<div class="col-md-9">
			<!--enctype 기입 필수 -->
		<div class="row">	
			<div class="form-group col-lg-6">
				<label><h2>&nbsp;&nbsp;회사 정보 수정</h2></label>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-lg-6">
				<label>로고이미지</label> 
				<br> 
				<input type="file" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp">
				
				
				
				----------------------------------------
				<div id='uploadedList' style='width: 127px; height: 152px; border: 1px dotted blue;'>
								<img id='imgsrc' height="150px;" alt="${ResumeVO.img}" />
							</div> 
							<!--  사진 보이는 div  --> 
							
							<input id='imgsrccheck' type='hidden' value="${ResumeVO.img}" /> 
							<!-- db에 있는 file img 이름 받아오는 hidden input -->
							
							<input type='hidden' id='uploadfilename' name='img'> 
							<!-- db에 올라갈 file img 이름 받아오는 hidden input -->

							<br> 
							
							<input type='file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp"> 
							<!--파일 업로드 하는 버튼--> 
							
							<input type='hidden' id='xornot' value='0'> 
							
							<input type='hidden' id='preexistenceimg' value='0'>
				----------------------------------------
				
				
				
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-lg-12">
				<label>기업소개</label>
				<textarea class="form-control" cols="7" rows="10" name="intro" 
						style="resize:none;">${CInfoVO.intro}</textarea>	
			</div>
		</div>
		
		<div class="row">	
			<div class="form-group col-lg-6">
				<label>기업명</label> <input type="text" name="cname"
					class="form-control" id="" value="${CInfoVO.cname}" readonly>
			</div>
			<div class="form-group col-lg-6">
				<label>대표자명</label> <input type="text" name="ceo"
					class="form-control" id="" value="${CInfoVO.ceo}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>업종</label> <input type="text" name="ctype"
					class="form-control" id="" value="${CInfoVO.ctype}">
			</div>
		
			<div class="form-group col-lg-6">
				<label>기업형태</label> <input type="text" name="form"
					class="form-control" id="" value="${CInfoVO.form}">
			</div>

		</div>
		
		
					<!-- ☆google search : datepicker -->
		<div class="row">
			<div class="form-group col-lg-12">
				<label>설립일</label>
				<div class="input-group date" data-provide="datepicker">
					<input type="text" class="form-control" name="establish"
						value="${CInfoVO.establish}" /> <span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i>
					</span>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-lg-6">
				<label>사원수</label> <input type="text" name="numemp"
					class="form-control" id="" value="${CInfoVO.numemp}">
			</div>
			<div class="form-group col-lg-6">
				<label>매출액</label> <input type="text" name="sales"
					class="form-control" id="" value="${CInfoVO.sales}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>대표전화</label> <input type="text" name="tel"
					class="form-control" id="" value="${CInfoVO.tel}">
			</div>
			<div class="form-group col-lg-6">
				<label>FAX</label> <input type="text" name="fax"
					class="form-control" id="" value="${CInfoVO.fax}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>홈페이지</label> <input type="text" name="homepage"
					class="form-control" id="" value="${CInfoVO.homepage}">
			</div>
			<div class="form-group col-lg-6">
				<label>SNS</label> <input type="text" name="sns"
					class="form-control" id="" value="${CInfoVO.sns}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-12">
				<label>기업주소</label> <input type="text" name="location"
					class="form-control" id="" value="${CInfoVO.location}">
			</div>
		</div>

		
		<!-- 컨트롤러 request에서 인식할 수 있게 임의의 name값을 지정해줘야한다 (controller랑 맞출 필요 X) -->
		<input type="hidden" name="img" value="${CInfoVO.img}"> 
		
		<br> 
		<br>
		
		
		<div class="row">	
			<div class="form-group col-lg-6">
				<label><h2>&nbsp;&nbsp;담당자 정보 수정</h2></label>
			</div>
		</div>
		
		<div class="row">	
			<div class="form-group col-lg-6">
				<label>회사 아이디</label> <input type="text" name="id"
					class="form-control" id="" value="${CInfoVO.id}" readonly>
			</div>
			<div class="form-group col-lg-6">
				<label>담당자</label> <input type="text" name="pname"
					class="form-control" id="" value="${boardVO.pname}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>휴대폰 번호</label> <input type="text" name="phone"
					class="form-control" id="" value="${CInfoVO.phone}">
			</div>
		
			<div class="form-group col-lg-6">
				<label>이메일</label> <input type="text" name="email"
					class="form-control" id="" value="${CInfoVO.email}" readonly>
			</div>
	
		</div>
		
		<br> 
		<br>
		
		<!-- 수정 버튼 -->
		<div class="box-footer">
			<button type="submit" class="btn btn-primary">SAVE</button>
			<button type="button" class="btn btn-warning" id="modify">CANCEL</button>
		</div>
		<!-- //수정 버튼 -->
		<br> 
		<br>
	</div>
</form>

<!-- //기업 페이지 -->

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		var fileObject = document.getElementById("file1");

		console.log(formObj);
		$(".btn-warning").on("click", function() {
			self.location = "/company/C_index";
		});
		$(".btn-primary").on("click", function() {
			formObj.submit();     
			// 문> 이 페이지를 보면 수정하기 버튼을 눌렀을 때 어디로 가란 정보가 없다.
			// 그럴 땐 컨트롤러에서 jsp파일명이 적힌 곳을 봐라 그럼 된다.CompanyController의 /C_modify
		});
	});
</script>

<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			dateFormat : "yy-mm-dd",
			language : "kr"
		});
	});
</script>


<script>
var imgsrccheck = ('#imgsrccheck');

if($('#imgsrccheck').val()!=""){
console.log(" val이 널값아님");
$('#imgsrc').attr("src", 'displayFile?fileName=${ResumeVO.img}');
var str = "";
str = 
	  "<a href='displayFile?fileName=${ResumeVO.img}' target='_blank'; return false;'>원본 확인"
	  +"</a>"
	  +"<small data-src=${ResumeVO.img}>X</small>";
 $("#uploadedList").append(str); 
 console.log("uploadedlist에 x버튼 추가");
 $("#preexistenceimg").val("1");
}else{
console.log(" val이 널값이다");
$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
$("#preexistenceimg").val("0");
}  
var upload = document.getElementById('fileupload');
var uploadedList = document.getElementById('uploadedList');

if (typeof window.FileReader === 'undefined') {
console.log("window.FileReader 'fail'");
} else {
console.log("window.FileReader 'success'");
}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때

upload.onchange = function (e) {

var file = upload.files[0];
var reader = new FileReader();
//p542다시 보기
$("#uploadedList").empty();
//reader.onload start
reader.onload = function (event) {
	 var image = new Image();
	 image.src = event.target.result;
	  
	 uploadedList.innerHTML = '';
	 image.height = 150;
	 uploadedList.appendChild(image);
};//reader.onload end

	 event.preventDefault();
	 //var files = event.originalEvent.dataTransfer.files;
	 
	 console.log("file name");
	 console.log(file);
	 
	 var formData = new FormData();
	 
	 formData.append("file", file);
	 
	 $.ajax({
		 url:'uploadAjax',
		 data: formData,
		 dataType : 'text',
		 processData : false,
		 contentType : false,
		 type : 'POST',
		 success : function(data){
			   var str = "";
			  
			 	console.log(data);
			 	
				  str = 
					  "<a href='displayFile?fileName="+getImageLink(data)+"' target='_blank'; return false;'>원본 확인"
					  +"</a>"
					  +"<small data-src="+data+">X</small>";

			  $("#uploadedList").append(str); 
			  console.log("uploadAjax 들어갔냐? getImageLink(data)가 뭐냐" + getImageLink(data));
			  document.getElementById('uploadfilename').value = getImageLink(data);
		  }//success : function(data) end
	  });//ajax end
console.log(file);
reader.readAsDataURL(file);
};//upload change end   






</script>

<%@include file="../include/cfooter.jsp"%>