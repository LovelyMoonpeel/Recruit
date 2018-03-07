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
		<input type='hidden' name='bno' value="${ResumeVO.bno}">
            
      <div class="form-group">
        <label for="userid">아이디</label>
        <input type="text" class="form-control" id="userid" name="userid" value="${ResumeVO.userid}">                          
      </div>
      
     <div class="form-group">
       <label for="title">제목</label>
       <input class="form-control" id="title" name="title" value = "${ResumeVO.title}">
     </div>
     <div class="form-group">
       <label for="coverletter">자기소개서</label>
       <textarea class="form-control" rows="10" id="coverletter" name="coverletter" value="${ResumeVO.coverletter}"></textarea>
     </div>
     <div class="form-group">
       <label for="coverletter">jobstateid</label>
       <input class="form-control" id="jobstateid" name="jobstateid" value = "${ResumeVO.jobstateid}">
     </div>
      <div class="form-group">
    <label for="pname">이름</label>
    <input type="text" class="form-control" id="pname" value="${PUserVO.pname}">                          
  </div>
  <div class="form-group">
    <label for="img">사진</label>
    <!--  input type="file" class="form-control" id="img" value="${ResumeVO.img}">-->
     <input type="text" class="form-control" id="img" value="${ResumeVO.img}">
  </div>
  
  <div class="row">
  
    <!-- ☆google search : datepicker -->
    <div class="form-group col-lg-6">
       <label>생년월일</label>
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
 
 <div class="form-group">
   <label for="email">이메일</label>
   <input type="text" class="form-control" id="email" value="${PUserVO.email}">
 </div>
 
 <div class="form-group">
   <label for="address">주소</label>
   <input class="form-control" rows="10" id="address" value="${ResumeVO.address}"></input>
 </div>
 <div class="form-group">
   <label for="postcode">우편번호</label>
   <input class="form-control" rows="10" id="postcode" value="${ResumeVO.postcode}"></input>
 </div>
 <div class="form-group">
   <label for="jobstateid">구직상태</label>
   <input class="form-control" rows="10" id="jobstateid" value="${ResumeVO.jobstateid}"></input>
 </div>
 <div class="form-group">
       <label for="jobgroupid">jobgroupid</label>
       <input class="form-control" id="jobgroupid" name="jobgroupid" value = "${ResumeVO.jobgroupid}">
  </div>
 <div class="form-group">
   <label for="rgbid">희망근무지(시/도)</label>
   <input class="form-control" rows="10" id="rgbid" value="${ResumeVO.rgbid}"></input>
 </div>
  <div class="form-group">
   <label for="rgbid">rgsid 희망 근무지(시/도)</label>
   <input class="form-control" rows="10" id="rgbid" value="${ResumeVO.rgsid}"></input>
 </div>
 <div class="form-group">
       <label for="jobgroupid">희망근무형태</label>
       <input class="form-control" id="employstatusid" name="employstatusid" value = "${ResumeVO.employstatusid}">
  </div>
 <div class="form-group">
   <label for="salaryid">희망연봉</label>
   <input class="form-control" rows="10" id="salaryid" name = "salaryid" value="${ResumeVO.salaryid}"></input>
 </div>

     <button id = "btn-success" class="btn btn-success" type="submit">등록 </button>
 </form> 
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
      formObj.attr("action", "/personal/Rmodify");
      formObj.attr("method", "post");
      formObj.submit();
   });
});
</script>
<%@include file="../include/cfooter.jsp"%>
