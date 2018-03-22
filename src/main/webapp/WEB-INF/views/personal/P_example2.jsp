<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 수정</h1>
	<form role="form" method="post">
	 	<input type="text" class="form-control" id="bno" name="bno" value="${ResumeVO.bno}" readonly>
	 	<input type="text" class="form-control" value="${ResumeLanguageVO.rid}" readonly>
		<br>	
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title"
				name="title" value="${ResumeVO.title}">
		</div>
  <div class="company_info_content">
      <div class="table-responsive">
         <table class="table table-bordered">
            <tbody>
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
					
				   	<input type = 'hidden' id = 'xornot' value = '0'> 
				   	<!--  x버튼을 눌렀는지 안눌렀는지 판별 -->
				   	<input type = 'hidden' id = 'originalimgnull' value = '1'>
				   	<!--  처음에 null이미지였는지 아닌지 판별 -->
               	 </td>
               </tr>
               <tr>
                  <th class="table-active" scope="row"><label>생년월일</label></th>
                  <td>
                  	<div class="form-group">
						<div class="input-group date" data-provide="datepicker">
							<input type="text" class="form-control" id="birth" name="birth" value="${PUserVO.birth}">
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
               
             </tbody>
         </table>
  </div>             
     <div class="table-responsive">
       <table class="table table-bordered">
          <tbody>
            <tr>
               <th class="table-active" colspan="5" scope="row" style="text-align: center;">자기소개서</th>
            </tr> 
            <tr>
             <td colspan="5" rowspan="2">
               	<div class="form-group">
				<textarea class="form-control" rows="13" id="coverletter" name="coverletter" style = "resize:none;">${ResumeVO.coverletter}</textarea>
				</div>
             </td>   
            </tr>
           </tbody>
       </table>      
    </div>
   </div>
   <br>
   	</form>
		<button id="write-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';" type="button">취소</button>
	</div>


<script type='text/javascript'>
$(document).ready(function() {

		var formObj = $("form[role = 'form']");
		var imgsrccheck = ('#imgsrccheck');
		
 		if($('#imgsrccheck').val()!=""){
			console.log("DB에 이미지가 등록되어있음");
			$('#imgsrc').attr("src", 'displayFile?fileName=${ResumeVO.img}');
			var str = "";
			str = 
				  "<a href='displayFile?fileName=${ResumeVO.img}' target='_blank'; return false;'>원본 확인"
				  +"</a>"
				  +"<small data-src=${ResumeVO.img}>X</small>";
			$("#uploadedList").append(str); 
		}else{
			console.log("DB에 이미지가 등록되지 않음");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		}//DB 이미지 등록 여부 확인  
 		
		if (typeof window.FileReader === 'undefined') {
		 console.log("window.FileReader 'fail'");
		} else {
		 console.log("window.FileReader 'success'");
		}//fileLeader 로딩 확인
		
	   	var upload = document.getElementById('fileupload');
	   	var uploadedList = document.getElementById('uploadedList');
	   	var xornot = document.getElementById('xornot');
	   	
	 	upload.onchange = function (e) {
	 		//img uploadedList start
			var file = upload.files[0];
			var reader = new FileReader();
			 //p542다시 보기
			 
			//thumnamil 비우고 생성된 파일 말고 클라이언트 단에서 직접 이미지 띄우기
			$("#uploadedList").empty();
			reader.onload = function (event) {
				var image = new Image();
				image.src = event.target.result;
				uploadedList.innerHTML = '';
				image.height = 150;
				uploadedList.appendChild(image);
			};//reader.onload end
			//img uploadedList end
			 
		 	//img 서버에 저장되도록 ajax start
			 event.preventDefault();
			 //var files = event.originalEvent.dataTransfer.files;
			 
			 console.log("file name : "+ file);
			 
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
				 	 console.log("uploadAjax로 넘겨지는 data : " + data);
					 	
					 str = 
						  "<a href='displayFile?fileName="+getImageLink(data)+"' target='_blank'; return false;'>원본 확인"
						  +"</a>"
						  +"<small data-src="+data+">X</small>";
					  $("#uploadedList").append(str); 
					  //display되는 원본 파일 링크 append
					  console.log(" uploadAjax지난 파일 & display되는 파일 : " + getImageLink(data));
					  document.getElementById('uploadfilename').value = getImageLink(data);
					  //DB에 전달할 uploadfilename value에 넣기
				  }//success : function(data) end
	 		  });//ajax end
		 reader.readAsDataURL(file);
	};//upload.onchange  
		
	$("#uploadedList").on("click", "small", function(event){
		event.preventDefault();
		var that = $(this);
		console.log("x 눌렀다");
		
		if($("#xornot").val()==0){
			console.log("첫번째 if문에 들어옴 $(#xornot).val()==0");
			console.log("첫번째 if문에 들어옴 이 때 fileName은? : " + $(this).attr("data-src") );
			
			
/* 			fileName = $(this).attr("data-src"); //전역변수로 설정
			var front = fileName.substring(0, 12);
			var end = fileName.substring(12);
			var thumcheck = fileName.substring(12,14);
			
			if(thumcheck!="s_"){
				console.log("thumcheck!='s_'" + thumcheck);
				console.log("thumcheck!='s_'일 때 fileName" + fileName);
				fileName = front + "s_" + end;
				console.log("thumcheck!='s_'일 때 바뀐 fileName" + fileName);
			}else{
				console.log("thumcheck=='s_'" + thumcheck);
				console.log("thumcheck=='s_'일 때 fileName" + fileName);
			}
			 */
			 
			var deletedfromuploadedlistfileName = $(this).attr("data-src");
			 
			$("#fileupload").val("");
			$("#uploadedList").empty();
			console.log("x img File appended deleted");
			console.log("fileName"+deletedfromuploadedlistfileName);
			
			$("#xornot").val("1");
			console.log($("#xornot").val());
			
		}else if($("#xornot").val()==1){
			console.log("첫번째 if문에 들어옴 $(#xornot).val()==1");
			
			var deletedfromuploadedlistfileName = $(this).attr("data-src");
			
			$("#fileupload").val("");
			$("#uploadedList").empty();
			console.log("2번 이상 삭제 누름 img File appended deleted");
			console.log("2번 이상 삭제 누름 fileName"+deletedfromuploadedlistfileName);
			
			$("#xornot").val("1");
			console.log($("#xornot").val());
		}
	}); 
		
	function getOriginalName(fileName){
      	var idx = fileName.indexOf("_")+1;
      	return fileName.substr(idx);
      }
	function getImageLink(fileName){
		//s_ 제거하여 원본 파일 전달하는 함수
      	var front = fileName.substr(0,12);
      	var end = fileName.substr(14);
      	return front + end;
      } 
		 
	$("#write-success").on("click", function() {
		console.log("write-success clicked");
		
		if($("#xornot").val()==0){
			console.log("xornot 0, 사진 삭제 안한거 submit");
			var fileName = $(this).attr("data-src");
			console.log("var fileName = $(this).attr("data-src");" + fileName);
			
			var front = fileName.substring(0, 12);
			var end = fileName.substring(12);
			var thumcheck = fileName.substring(12,14);
			
			if(thumcheck!="s_"){
				console.log("썸네일이냐 아니냐" + thumcheck);
				console.log("썸네일 아닐 때 fileName" + fileName);
				fileName = front + "s_" + end;
				console.log("썸네일 아니라서 바뀐 fileName" + fileName);
			}else{
				console.log("썸네일이냐 아니냐" + thumcheck);
				console.log("썸네일인 fileName" + fileName);
			}
		}else if($("#xornot").val()==1){
			//삭제 시키기 ajax 실행 후에 Rmodify로 넘어가기
			console.log("xornot.val()==1");
			console.log("사진 삭제한거 submit");	
			console.log("img File on server will be deleted FILENAME : " + fileName);
			$.ajax({
				url:"deleteFile",
				type:"post",
				//data : {fileName:$(this).attr("data-src")},
				data: {fileName:fileName},
				dataType:"text",
				succss:function(result){
					if(result=='deleted'){
						console.log("img File on server deleted FILENAME : " + fileName);
						that.parent("div").remove();
					}
				}
			}); 
		} 
		console.log("submit직전");
		formObj.attr("action", "/personal/Rmodify");
		formObj.attr("method", "post");
		//formObj.submit();
	});
});
</script>
<%@include file="../include/cfooter.jsp"%>