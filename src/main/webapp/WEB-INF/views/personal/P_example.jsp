<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- Main content -->
<!-- 기업 채용공고 목록 -->
<div class="col-md-9">
   <h1>이력서 상세</h1>
   <table class="table table-bordered">
      
      <%-- <form role = "form" method="post">
         <input type='hidden' name='bno' value="${ResumeVO.bno}">      
      </form> --%>
      
      <%-- <div class="box-body">
         <div class="form-group">
            <label for="exampleInputEmail1">Title</label>
            <input type="text" name='title' class="form-control" value="${Resume.title}" readonly="readonly">
         </div>
         <div class="form-group">
            <label for="exampleInputPassword1">Content</label>
            <textarea class="form-control" name="content" rows="3" readonly="readonly">${Resume.content}</textarea>
         </div>
         <div class="form-group">
            <label for="exampleInputEmail1">Writer</label>
            <input type="text" name="writer" class="form-control" value="${Resume.title}" readonly="readonly">
         </div>
      </div> --%>
      
      
      
      <div class="company_info_content">
            <!-- ★아래 두 줄의 class 설정으로 인해 테이블이 반응형으로 적용됨 -->
            <div class="table-responsive">
               <!-- ★클래스를 여러 개 쓰고 싶으면 한 칸 띄우고 쓰기/table-striped는 홀수번째마다 색칠하기 -->
               <table class="table table-bordered">
                  <tbody>
                     <tr>
                        <!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
                        <!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
                        <%-- <th class="table-active" scope="row">이름</th>
                        <td class="col-sm-4">${PUserVO.pname}</td> --%>
                        
                        <form>
                         <div class="form-group">
                           <label for="pname">이름</label>
                           <input type="text" class="form-control" id="pname" value="${PUserVO.pname}">                          
                         </div>
                         <div class="form-group">
                           <label for="img">사진</label>
                           <input type="file" class="form-control" id="img" value="${ResumeVO.img}">
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
                          <label for="form">제목</label>
                          <input class="form-control" id="form" value="${ResumeVO.title}">
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
                          <label for="jobgroupid">희망직종</label>
                          <input class="form-control" rows="10" id="jobgroupid" value="${ResumeVO.jobgroupid}"></input>
                        </div>
                        <div class="form-group">
                          <label for="rgbid">희망근무지(시/도)</label>
                          <input class="form-control" rows="10" id="rgbid" value="${ResumeVO.rgbid}"></input>
                        </div>
                        <div class="form-group">
                          <label for="employstatusid">희망근무형태</label>
                          <input class="form-control" rows="10" id="employstatusid" value="${ResumeVO.employstatusid}"></input>
                        </div>
                        <div class="form-group">
                          <label for="salaryid">희망연봉</label>
                          <input class="form-control" rows="10" id="salaryid" value="${ResumeVO.salaryid}"></input>
                        </div>
                        
                         <div class="form-group">
                          <label for="coverletter">자기소개서</label>
                          <textarea class="form-control" rows="10" id="coverletter" value="${ResumeVO.coverletter}"></textarea>
                        </div>
                        <a href="/personal/listAll" type="button" class="btn btn-success">등록</a>
                        
                        <a href="/personal/detail" type="button" class="btn btn-danger">취소</a>
                       </form>                       
                        
                     </tr>                     
                  </tbody>
               </table>
               <!-- //table class -->
            </div>
            <!-- //table-responsive -->
         </div>
         
      
      
   
            
   </table>
</div>
<!-- //기업 채용공고 목록 끝 -->

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
   
   
});
</script>




<%@include file="../include/cfooter.jsp"%>
