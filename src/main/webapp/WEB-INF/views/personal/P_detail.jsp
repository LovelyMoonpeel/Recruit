<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@include file="../include/pheader.jsp"%>

         
<div class="col-md-9">
   
   <br> <br>
   
<!-- 이력서 페이지 두번째(기본 정보) -->
   <div class="company_info_content">
      <!-- ★아래 두 줄의 class 설정으로 인해 테이블이 반응형으로 적용됨 -->
      <div class="table-responsive">
         <!-- ★클래스를 여러 개 쓰고 싶으면 한 칸 띄우고 쓰기/table-striped는 홀수번째마다 색칠하기 -->
         <table class="table table-bordered">
            <tbody>
               <tr>
                  <!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
                  <!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
                  <th class="table-active" scope="row">이름</th>
                  <td class="col-sm-4">${PUserVO.pname}</td>
                  <th class="table-active" scope="row">사진</th>
                  <td class="col-sm-4">${ResumeVO.img}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">생년월일</th>
                  <td>${PUserVO.birth}</td>
                  <th class="table-active" scope="row">이메일</th>
                  <td>${PUserVO.email}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">제목</th>
                  <td colspan="3">${ResumeVO.title}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">주소</th>
                  <td colspan="3">${ResumeVO.address}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">우편번호</th>
                  <td>${ResumeVO.postcode}</td>
                  <th class="table-active" scope="row">구직상태</th>
                  <td>${ResumeVO.jobstateid}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">희망직종</th>
                  <td>${ResumeVO.jobgroupid}</td>
                  <th class="table-active" scope="row">희망근무형태</th>
                  <td colspan="3">${ResumeVO.employstatusid}</td>
               </tr>
               <tr>
                     <th class="table-active" scope="row">희망근무지(시/도)</th>
                  <td>${ResumeVO.rgbid}</td>
                  <th class="table-active" scope="row">희망근무지</th>
                  <td>${ResumeVO.rgsid}</td>

               </tr>
               <tr>
                  <th class="table-active" scope="row">희망연봉</th>
                  <td colspan="3">${ResumeVO.salaryid}</td>
               </tr>
               
               <tr>
                  <th class="table-active" scope="row">자기소개서</th>
                  <td colspan="3">${ResumeVO.coverletter}</td>
               </tr>                     
            </tbody>
         </table>
         <!-- //table class -->
      </div>
      <!-- //table-responsive -->
   </div>
         
   <!-- //개인 페이지 두번째(company_modify_content) -->
   <br> <br>
   <!-- 수정 버튼 -->
   <form>
   <input class="btn btn-success" type='button' value='수정'
      onClick="javascript:self.location='/personal/Rmodify?bno=${ResumeVO.bno}';">
   </form>
   <!-- //수정 버튼 -->
   <br> <br>
</div>
         
<!--       </div>
   </div> -->
   
<!-- //기업 페이지 -->
</body>
         
<%@include file="../include/cfooter.jsp"%>