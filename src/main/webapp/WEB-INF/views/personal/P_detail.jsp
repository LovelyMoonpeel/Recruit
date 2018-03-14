<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>

         
<div class="col-md-9">
   	<h1>${PUserVO.id}님의 이력서 상세</h1>
   <br> <br>
<!-- 이력서 페이지 두번째(기본 정보) -->
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
	          	<td class="col-sm-4" id="pname" name="pname">${PUserVO.pname}</td>
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
               	 </td>
               </tr>
               <tr>
                  <th class="table-active" scope="row"><label>생년월일</label></th>
                  <td>${PUserVO.birth}</td>
                  <th class="table-active" scope="row"><label for="email">이메일</label></th>
            	  <td>${PUserVO.email}</td>
               </tr>
               
               <tr>
               	  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">연락처 목록</th>            
               </tr>
               <c:forEach items="${PTellist}" var="PTelVO">
	               <tr>
	                  <th class="table-active" scope="row"><label for="title">전화번호(종류)</label></th>
	                  <td>${PTelVO.title}</td>
	                  <th class="table-active" scope="row"><label for="tel">전화번호</label></th>
	                  <td>${PTelVO.tel}</td>
	               </tr>
               </c:forEach> 
               
				<tr>
                  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">웹사이트 목록</th>
               </tr> 
               
               <c:forEach items="${PWebSitelist}" var="PWebSiteVO">
	               <tr>
	                  <th class="table-active" scope="row"><label for="webtitle">웹사이트(종류)</label></th>
	                  <td>${PWebSiteVO.title}</td>
	                  <th class="table-active" scope="row"><label for="webadd">웹사이트</label></th>
	                  <td>${PWebSiteVO.webadd}</td>
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
	                  <td>${RLicenseVO.test}</td>
	                  <td>${RLicenseVO.test}</div>
					  </td>
					  <td>${RLicenseVO.publeoffice}</td>
					  <td>${RLicenseVO.acquidate}</td>
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
	                  <td>${ResumeLanguageVO.test}</td>
	                  <td>${ResumeLanguageVO.score}</td>
	                  <td>${ResumeLanguageVO.publeoffice}</td>
	                  <td>${ResumeLanguageVO.acquidate}</td>
	               </tr>  
                </c:forEach>
                       
               <tr>
                  <th class="table-active" colspan="4" scope="row" style="text-align: center;">자기소개서</th>
               </tr> 
               <tr>
                <td colspan="4" rowspan="2">${ResumeVO.coverletter}</td>   
               </tr>
            </tbody>
         </table>
         <!-- //table class -->
      </div>
      <!-- //table-responsive -->
   </div>
         
   <!-- //개인 페이지 두번째(company_modify_content) -->
   <br> <br>
   <!-- 수정, 목록 버튼 -->
    <div class = "form-group">
     	<button id = "write-success" class="btn btn-success col-md-offset-10"  type='button' onClick="javascript:self.location='/personal/Rmodify?bno=${ResumeVO.bno}';">수정</button>
     	<button id = "write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/manage?id=${PUserVO.id}';">목록</button>
  	</div>
   <!-- //수정, 목록 버튼 -->
   <br> <br>
</div>
<script>
$(document).ready(function(){
	console.log('${PWebSitelist}');
	
	var imgsrccheck = ('#imgsrccheck');
	
	if($('#imgsrccheck').val()!=""){
		console.log(" val이 널값아님");
		$('#imgsrc').attr("src", 'displayFile?fileName=${ResumeVO.img}');
	}else{
		console.log(" val이 널값이다");
		$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
		$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
	}
});
</script>
</body>
         
<%@include file="../include/cfooter.jsp"%>