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
});
</script>
<%@include file="../include/cfooter.jsp"%>
