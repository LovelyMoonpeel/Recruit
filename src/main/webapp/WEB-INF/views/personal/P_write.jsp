<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- Main content -->
<div class="col-md-9">
   <h1>이력서 작성</h1>
   
<form role ="form" method="post">

  	 <input type='hidden' name='id' value="${PUserVO.id}"> 
	<%--  <input type='hidden' name='puser' value="${PUserVO}">  --%>
 	 <input type='hidden' name='pw' value="${PUserVO.pw}">
	 <input type='hidden' name='pname' value="${PUserVO.pname}">
	 <input type='hidden' name='email' value="${PUserVO.email}">
	 <input type='hidden' name='birth' value="${PUserVO.birth}">
	 
     <div class="form-group">
       <label for="title">제목</label>
       <input class="form-control" id="title" name="title" value = "${ResumeVO.title}">
     </div>
     
     <div class="form-group">
       <label for="coverletter">자기소개서</label>
       <textarea class="form-control" rows="10" id="coverletter" name="coverletter" style="resize:none;" value="${ResumeVO.coverletter}"></textarea>
     </div>
     
     <input type = 'file' id='fileupload' name = 'img' value = "${ResumeVO.img}" accept=".jpg,.jpeg,.png,.gif,.bmp">
  <br>
 </form>
      
  <p id="status">File API & FileReader API not supported</p>
      <div id= 'uploadedList' style = 'width : 120px; height : 150px; border : 1px dotted blue;'>
     </div> 
  <br>
  <div class = "form-group">
     	<button id = "write-success" class="btn btn-success col-md-offset-10"  type='submit'> 등록 </button>
     	<button id = "write-cancel" class="btn btn-danger" type='submit'>취소</button>
  </div>
  <br>
  <br>
</div>

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
   
   $("#write-success").on("click", function(){
	  alert("write-success clicked");
      formObj.attr("action", "/personal/write");
      formObj.attr("method", "post");
      formObj.submit();
   });
   
  ////////////img uploadedList start//////////////////////////////////////////////////////////
  // var upload = document.getElementsByTagName('input')[0];
   var upload = document.getElementById('fileupload');
   var uploadedList = document.getElementById('uploadedList');
   var state = document.getElementById('status');
  
	if (typeof window.FileReader === 'undefined') {
	 state.className = 'fail';
	 console.log("state.className = 'fail'");
	} else {
	 state.className = 'success';
	 console.log("state.className = 'success'");
	 state.innerHTML = 'File API & FileReader available';
	}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
	
	upload.onchange = function (e) {
	
		 var file = upload.files[0];
		 var reader = new FileReader();
		 //p542다시 보기
	
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
					 	
					 	 /* str = "<a href='displayFile?fileName='"+ getImageLink(data) 
					 			 onclick="window.open(this.href, '_blank'); return false;"+">원본확인"
					 			+"<img src=data alt='' style='height:150px;' /></a>" */
					 	
					 /*  	str = 
						  "<a href='displayFile?fileName="+getImageLink(data)+"' onclick='window.open(this.href, '_blank'); return false;'>원본 확인"
						  +"</a>"
						  +"<small data-src="+data+">X</small>";  */
						  str = 
							  "<a href='displayFile?fileName="+getImageLink(data)+"' target='_blank'; return false;'>원본 확인"
							  +"</a>"
							  +"<small data-src="+data+">X</small>";

					  $("#uploadedList").append(str); 
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
		$("#uploadedList").empty();
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
