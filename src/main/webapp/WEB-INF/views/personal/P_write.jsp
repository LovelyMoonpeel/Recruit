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
<%--       	      
      <div class="form-group">
        <label for="userid">아이디</label>
        <input type="text" class="form-control" id="userid" name="userid" value="${ResumeVO.userid}">                          
      </div>
       --%>

     <div class="form-group">
       <label for="title">제목</label>
       <input class="form-control" id="title" name="title" value = "${ResumeVO.title}">
     </div>
     <div class="form-group">
       <label for="coverletter">자기소개서</label>
       <textarea class="form-control" rows="10" id="coverletter" name="coverletter" style="resize:none;" value="${ResumeVO.coverletter}"></textarea>
     </div>
     
    
     <div class = 'fileDrop' style = 'width : 100%; height : 200px; border : 1px dotted blue;'>
     </div>
     
     <div class = 'uploadedList'>
     </div>
     
     
 </form> 
      <br>
  <br>
 <%--    <div class="form-group">
	    <label for="img">img</label>
	    <input type = 'file' class="form-control" id="img" name="img" value = "${ResumeVO.img}">
    </div> --%>
  <div class = "form-group">
    <form id = 'form1' action = "uploadForm" method = "post" enctype = "multipart/form-data">
     	<input type = 'file' name = 'file'>
     	<button id = "write-success" class="btn btn-success col-md-offset-10"  type='submit'> 등록 </button>
     	<button id = "write-cancel" class="btn btn-danger" type='submit'>취소</button>
    </form>
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
   
   $("#btn-success").on("click", function(){
      formObj.attr("action", "/personal/write");
      formObj.attr("method", "post");
      formObj.submit();
   });
   
   $(".fileDrop").on("drageneter dragover", function(event){
	   event.preventDefault();
   });
    $(".fileDrop").on("drop", function(event){
    	
	   event.preventDefault();
	   
	   var files = event.originalEvent.dataTransfer.files;
	   
	   var file = files[0];
	   
	   console.log(file);
	   
	   var formData = new FormData();
	   
	   formData.append("file", file);
	   
	   
	   $.ajax({
		  url:'/uploadAjax',
		  data: formData,
		  dataType : 'text',
		  processData : false,
		  contentType : false,
		  type : 'POST',
		  success : function(data){
			  
			  var str = "";
			  
			  console.log(data);
			  console.log(checkImageType(data));
			  
			  if(checkImageType(data)){
				  str = "<div><a href='/displayFile?fileName="+getImageLink(data)+"'>"
				  +"<img src='../displayFile?fileName="+data+"'/>"
				  +getImageLink(data) 
				  +"</a><small data-src="+data+">X</small></div>";
			
			  }else{
				  str = "<div><a href='/displayFile?fileName="+data+"'>"
						  +getOriginalName(data)+"</a>"
						  +"<small data-src="+data+">X</small></div>";
			  }
			  $(".uploadedList").append(str);
		  }
	   });
   });
    $(".uploadedList").on("click","small",function(event){
    	var that = $(this);
    	
    	$.ajax({
    		url:"/deleteFile",
    		type:"post",
    		data:{fileName:$(this).attr("data-src")},
    		dataType:"text",
    		success:function(result){
    			if(result=='deleted'){
    				that.parent("div").remove();
    				console.log("div.remove()")
    				//alert("deleted");
    			}
    		}
    	});
    });
    
    function checkImageType(fileName){
    	
    	var pattern = /jpg$|gif$|png$|jpeg$/i;
    	
    	return fileName.match(pattern);
    }
    
    function getOriginalName(fileName){
    	if(checkImageType(fileName)){
    		return;
    	}
    	var idx = fileName.indexOf("_")+1;
    	return fileName.substr(idx);
    }
    
    function getImageLink(fileName){
    	if(!checkImageType(fileName)){
    		return;
    	}
    	
    	var front = fileName.substr(0,12);
    	var end = fileName.substr(14);
    	
    	return front + end;
    }
});
</script>
<%@include file="../include/cfooter.jsp"%>
