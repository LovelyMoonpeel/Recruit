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
               <tr>
                  <!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
                  <!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
                  <th class="table-active" scope="row"><label for="pname">이름</label> </th>
                 	<td class="col-sm-4" colspan="3">
                  		<input type="text" class="form-control" id="pname" name="pname" value="${PUserVO.pname}">
                  	</td>
                  <th class="table-active" scope="row"><label for="img">사진</label></th>
                  	<td class="col-sm-4" colspan="3">
                  		<img id = 'imgsrc' height = "150px;" alt="${ResumeVO.img}" /> 
                  		<input id='imgsrccheck' type='hidden' value = "${ResumeVO.img}"/>
                  	<div class="form-group">
						<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
			     		<input type = 'hidden' id='uploadfilename' name = 'img' >
		     		</div>
                 	</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row"><label>생년월일</label></th>
                  	<td colspan="3">
                  	<div class="form-group">
						<div class="input-group date" data-provide="datepicker">
							<input type="text" class="form-control" id="" name="birth" value="${PUserVO.birth}">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
					</td>
                  <th class="table-active" scope="row"><label for="email">이메일</label></th>
                  	<td colspan="3">
						<div class="form-group">
							 <input type="text" class="form-control" id="email" name="email" value="${PUserVO.email}">
						</div>
					</td>
               </tr>
               
               <c:forEach items="${PTellist}" var="PTelVO">
	               <tr>
	                  <th class="table-active" scope="row"><label for="title">전화번호(종류)</label></th>
	                  <td colspan="3">
						<div class="form-group">
							<input type="text" class="form-control" id="title" name="title" value="${PTelVO.title}">
						</div>
					  </td>
	                  <th class="table-active" scope="row"><label for="tel">전화번호</label></th>
	                  <td colspan="3">
	                	<div class="form-group">
							<input type="text" class="form-control" id="tel" name="tel" value="${PTelVO.tel}">
						</div>
	                  </td>
	               </tr>
               </c:forEach> 
               
				<tr>
                  <th class="table-active" colspan="8" scope="row" style = "text-align: center;">웹사이트 목록</th>
               </tr> 
               
               <c:forEach items="${PWebSitelist}" var="PWebSiteVO">
	               <tr>
	                  <th class="table-active" scope="row"><label for="webtitle">웹사이트(종류)</label></th>
	                  <td colspan="3">
	                  	<div class="form-group">
						 <input type="text" class="form-control" id="webtitle" name="webtitle" value="${PWebSiteVO.title}">
						</div>
	                  </td>
	                  <th class="table-active" scope="row"><label for="webadd">웹사이트</label></th>
	                  <td colspan="3">
	                  	<div class="form-group">
						 <input type="text" class="form-control" id="webadd" name="webadd" value="${PWebSiteVO.webadd}">
						</div>
	                  </td>
	               </tr>  
	           </c:forEach> 
	           
               <tr>
               	  <th class="table-active" colspan="8" scope="row" style = "text-align: center;">보유자격증 목록</th>            
               </tr>
               
          	   <c:forEach items="${RLicenselist}" var="RLicenseVO">
	               <tr>
	                  <th class="table-active" scope="row">자격증명</th>
	                  <td colspan="2">${RLicenseVO.test}</td>
	                  <th class="table-active" scope="row">발행기관</th>
	                  <td colspan="2">${RLicenseVO.publeoffice}</td>
	                  <th class="table-active" scope="row">취득일자</th>
	                  <td>${RLicenseVO.acquidate}</td>
	               </tr>
                </c:forEach>
               
               <tr>
               	  <th class="table-active" colspan="8" scope="row" style = "text-align: center;">어학능력 자격증 목록</th>            
               </tr>
               
                <c:forEach items="${RLanguagelist}" var="ResumeLanguageVO">
	               <tr>
	                  <th class="table-active" scope="row">공인인증시험명</th>
	                  <td>${ResumeLanguageVO.test}</td>
	                  <th class="table-active" scope="row">점수</th>
	                  <td>${ResumeLanguageVO.score}</td>
	                  <th class="table-active" scope="row">발행기관</th>
	                  <td>${ResumeLanguageVO.publeoffice}</td>
	                  <th class="table-active" scope="row">취득일자</th>
	                  <td>${ResumeLanguageVO.acquidate}</td>
	               </tr>  
                </c:forEach>
                       
               <tr>
                  <th class="table-active" colspan="8" scope="row" style = "text-align: center;">자기소개서</th>
               </tr> 
               <tr>
                <td colspan="8" rowspan="2">
                  	<div class="form-group">
						<textarea class="form-control" rows="10" id="coverletter" name="coverletter">${ResumeVO.coverletter}</textarea>
					</div>
              	 </td>   
               </tr>
            </tbody>
         </table>
         <!-- //table class -->
      </div>
      <!-- //table-responsive -->
   </div>
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
		}else{
			console.log(" val이 널값이다");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		}
	});
</script>
<%@include file="../include/cfooter.jsp"%>
