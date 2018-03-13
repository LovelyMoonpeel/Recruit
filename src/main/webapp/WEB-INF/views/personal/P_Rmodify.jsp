<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
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
	<h1>${PUserVO.id}님의 이력서 수정</h1>
	<form role="form" method="post">
		<br>
		<input type="text" class="form-control" id="bno" name="bno" value="ResumeVO의 bno값 : ${ResumeVO.bno}" readonly> 
		<input type="text" class="form-control" id="userid" name="userid" value="ResumeVO의 userid값  : ${ResumeVO.userid}" readonly> 
		<input type="text" class="form-control" id="id" name="id" value="PUserVO의 id값  : ${PUserVO.id}" readonly>
		<br>	
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title"
				name="title" value="${ResumeVO.title}">
		</div>
   <!--  -------------------------------------------------------------------------- -->
		 <div class="company_info_content">
      <!-- ★아래 두 줄의 class 설정으로 인해 테이블이 반응형으로 적용됨 -->
      <div class="table-responsive">
         <!-- ★클래스를 여러 개 쓰고 싶으면 한 칸 띄우고 쓰기/table-striped는 홀수번째마다 색칠하기 -->
         <table class="table table-bordered">
            <tbody>
                <!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
                <!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
               <tr>
                <th class="table-active" scope="row"><label for="pname">이름</label> </th>
	          	<td class="col-sm-4">
	           		<input type="text" class="form-control" id="pname" name="pname" value="${PUserVO.pname}">
	           	</td>
                <th class="table-active" scope="row"><label for="img">사진</label></th>
                <td class="col-sm-4">
                
                   <div id= 'uploadedList' style = 'width : 127px; height : 152px; border : 1px dotted blue;'>
				    <img id = 'imgsrc' height = "150px;" alt="${ResumeVO.img}" /> 
				   </div>
				   	<!--  사진 보이는 div  -->
				   	
                   	<input id='imgsrccheck' type='hidden' value = "${ResumeVO.img}"/>
                   	 <!-- db에 있는 file img 이름 받아오는 hidden input -->
                   	 <input type = 'hidden' id='uploadfilename' name = 'img' >
					<!-- db에 올라갈 file img 이름 받아오는 hidden input -->
					
					<br>
					<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
					<!--파일 업로드 하는 버튼-->
					
				   
               	 </td>
               </tr>
               <tr>
                  <th class="table-active" scope="row"><label>생년월일</label></th>
                  <td>
                  	<div class="form-group">
						<div class="input-group date" data-provide="datepicker">
							<input type="text" class="form-control" id="" name="birth" value="${PUserVO.birth}">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
				  </td>
                  <th class="table-active" scope="row"><label for="email">이메일</label></th>
            	  <td>
				  	<div class="form-group">
					 <input type="text" class="form-control" id="email" name="email" value="${PUserVO.email}">
					</div>
				</td>
               </tr>
               
               <tr>
               	  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">연락처 목록</th>            
               </tr>
               <c:forEach items="${PTellist}" var="PTelVO">
	               <tr>
	                  <th class="table-active" scope="row"><label for="title">전화번호(종류)</label></th>
	                  <td>
						<div class="form-group">
							<input type="text" class="form-control" name="title" value="${PTelVO.title}">
						</div>
					  </td>
	                  <th class="table-active" scope="row"><label for="tel">전화번호</label></th>
	                  <td>
	                	<div class="form-group">
							<input type="text" class="form-control" name="tel" value="${PTelVO.tel}">
						</div>
	                  </td>
	               </tr>
               </c:forEach> 
               
				<tr>
                  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">웹사이트 목록</th>
               </tr> 
               
               <c:forEach items="${PWebSitelist}" var="PWebSiteVO">
	               <tr>
	                  <th class="table-active" scope="row"><label for="webtitle">웹사이트(종류)</label></th>
	                  <td>
	                  	<div class="form-group">
						 <input type="text" class="form-control" name="webtitle" value="${PWebSiteVO.title}">
						</div>
	                  </td>
	                  <th class="table-active" scope="row"><label for="webadd">웹사이트</label></th>
	                  <td>
	                  	<div class="form-group">
						 <input type="text" class="form-control" name="webadd" value="${PWebSiteVO.webadd}">
						</div>
	                  </td>
	               </tr>  
	           </c:forEach> 
	           
               <tr>
               	  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">보유자격증 목록</th>            
               </tr>
                <th class="table-active" scope="row"><label for="test">자격증명</label></th>
                <th class="table-active" scope="row">상세</th>
                <th class="table-active" scope="row"><label for="publeoffice">발행기관</label></th>
                <th class="table-active" scope="row"><label for="acquidate">취득일자</label></th>
          	  
          	   <c:forEach items="${RLicenselist}" var="RLicenseVO">
	               <tr>
	                  <td>
						<div class="form-group">
							<input class="form-control" name="test" value="${RLicenseVO.test}"></input>
						</div>
					  </td>
	                  <td>
	            	    <div class="form-group">
							 <input class="form-control" name="test" value="${RLicenseVO.test}"></input>
					    </div>
					  </td>
					  <td>
					 	<div class="form-group">
							<input class="form-control" name="publeoffice" value="${RLicenseVO.publeoffice}"></input>
						</div>
					  </td>
					  <td>
					  	<div class="form-group">
							<input class="form-control" name="acquidate" value="${RLicenseVO.acquidate}"></input>
						</div>
					  </td>
	               </tr>
                </c:forEach>
               
               <tr>
               	  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">어학능력 자격증 목록</th>            
               </tr>
               
               	<th class="table-active" scope="row"><label for="testname">공인인증시험명</label></th>
                <th class="table-active" scope="row"><label for="score">점수</label> </th>
                <th class="table-active" scope="row"><label for="lanpubleoffice">발행기관</label></th>
                <th class="table-active" scope="row"><label for="lanacquidate">취득일자</label></th>
                
                <c:forEach items="${RLanguagelist}" var="ResumeLanguageVO">
	               <tr>
	                  <td>
	                  	<div class="form-group">
						 <input class="form-control" name="testname" value="${ResumeLanguageVO.test}"></input>
						</div>
					  </td>
	                  <td>
	                  	<div class="form-group">
							<input class="form-control" name="score" value="${ResumeLanguageVO.score}"></input>
						</div>
	                  </td>
	                  <td>
						<div class="form-group">
						 <input class="form-control" name="lanpubleoffice" value="${ResumeLanguageVO.publeoffice}"></input>
						</div>
					 </td>
	                  <td>
	                  	<div class="form-group">
						 <input class="form-control" name="lanacquidate" value="${ResumeLanguageVO.acquidate}"></input>
						</div>
	                  </td>
	               </tr>  
                </c:forEach>
                       
               <tr>
                  <th class="table-active" colspan="4" scope="row" style="text-align: center;">자기소개서</th>
               </tr> 
               <tr>
                <td colspan="4" rowspan="2">
                  	<div class="form-group">
						<textarea class="form-control" rows="13" id="coverletter" name="coverletter" style = "resize:none;">${ResumeVO.coverletter}</textarea>
					</div>
              	 </td>   
               </tr>
            </tbody>
         </table>
         <!-- //table class -->
      </div>
      <!-- //table-responsive -->
   </div>
   <br>
   <!--  -------------------------------------------------------------------------- -->
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
		
		console.log('${PWebSitelist}');
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
		}else{
			console.log(" val이 널값이다");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		}
		
	  ////////////img uploadedList start//////////////////////////////////////////////////////////
	  // var upload = document.getElementsByTagName('input')[0];
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
				  // img.width = 200;
				 image.height = 150;
				 uploadedList.appendChild(image);
			 };//reader.onload end
			 
		 //img uploadedList에 추가 하는거 end //////////////////////////////////////////////////////////
		 //img 서버에 저장되도록 ajax start //////////////////////////////////////////////////////////  
		   //  $(".fileDrop").on("drop", function(event){
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
					  	//alert(data);
						   var str = "";
						  
						 	console.log(data);
						 	
							  str = 
								  "<a href='displayFile?fileName="+getImageLink(data)+"' target='_blank'; return false;'>원본 확인"
								  +"</a>"
								  +"<small data-src="+data+">X</small>";
	
						  $("#uploadedList").append(str); 
						  document.getElementById('uploadfilename').value = getImageLink(data);
					  }//success : function(data){ end
		 		  });//ajax end
			//});//filedrop end
		 console.log(file);
		 reader.readAsDataURL(file);
		};//upload change end
		
		$("#uploadedList").on("click", "small", function(event){
			event.preventDefault();
			var that = $(this);
			//$("#uploadedList").remove();
			$("#fileupload").val("");
			$("#uploadedList").empty();
			//$("#fileupload").remove();
			console.log("img File appended deleted");
			
			$.ajax({
				url:"deleteFile",
				type:"post",
				data : {fileName:$(this).attr("data-src")},
				dataType:"text",
				succss:function(result){
					if(result=='deleted'){
						console.log("img File on server deleted");
						that.parent("div").remove();
					}
				}
			});
		});
		
		function getOriginalName(fileName){
	      	var idx = fileName.indexOf("_")+1;
	      	return fileName.substr(idx);
	      }
		function getImageLink(fileName){
	      	var front = fileName.substr(0,12);
	      	var end = fileName.substr(14);
	      	
	      	return front + end;
	      }
	});
</script>
<%@include file="../include/cfooter.jsp"%>
