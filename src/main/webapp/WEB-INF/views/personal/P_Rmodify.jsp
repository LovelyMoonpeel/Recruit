<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		<div class="form-group">
			<label for="pname">이름</label> <input type="text" class="form-control"
				id="pname" name="pname" value="${PUserVO.pname}">
		</div>
		<div class="form-group">
			<label for="img">사진</label>
			<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
     		<input type = 'hidden' id='uploadfilename' name = 'img' >
		</div>
		<div class="form-group">
			<!-- ☆google search : datepicker -->
			<!--   <div class="form-group col-lg-6"> -->
			<label>생년월일</label>
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" id="" name="birth"
					value="${PUserVO.birth}"> <span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
			<!--  </div>  -->
		</div>
		<div class="form-group">
			<label for="email">이메일</label> <input type="text"
				class="form-control" id="email" name="email"
				value="${PUserVO.email}">
		</div>
		<div class="form-group">
			<label for="teltitle">전화번호(종류)</label> <input type="text"
				class="form-control" id="teltitle" name="teltitle"
				value="${PTelVO.teltitle}">
		</div>
		<div class="form-group">
			<label for="tel">전화번호</label> <input type="text" class="form-control"
				id="tel" name="tel" value="${PTelVO.tel}">
		</div>
		<div class="form-group">
			<label for="webtitle">웹사이트(종류)</label> <input type="text"
				class="form-control" id="webtitle" name="webtitle"
				value="${PWebSiteVO.title}">
		</div>
		<div class="form-group">
			<label for="webadd">웹사이트</label> <input type="text"
				class="form-control" id="webadd" name="webadd"
				value="${PWebSiteVO.webadd}">
		</div>
		<div class="form-group">
			<label for="test">자격증명</label> <input class="form-control" id="test"
				name="test" value="${RLicenseVO.test}"></input>
		</div>
		<div class="form-group">
			<label for="publeoffice">발행기관</label> <input class="form-control"
				id="publeoffice" name="publeoffice"
				value="${RLicenseVO.publeoffice}"></input>
		</div>
		<div class="form-group">
			<label for="acquidate">취득일자</label> <input class="form-control"
				id="acquidate" name="acquidate" value="${RLicenseVO.acquidate}"></input>
		</div>
		<div class="form-group">
			<label for="testname">공인인증시험명</label> <input class="form-control"
				id="testname" name="testname" value="${ResumeLanguageVO.test}"></input>
		</div>
		<div class="form-group">
			<label for="score">점수</label> <input class="form-control" id="score"
				name="score" value="${ResumeLanguageVO.score}"></input>
		</div>
		<div class="form-group">
			<label for="lanpubleoffice">발행기관</label> <input class="form-control"
				id="lanpubleoffice" name="lanpubleoffice"
				value="${ResumeLanguageVO.publeoffice}"></input>
		</div>
		<div class="form-group">
			<label for="lanacquidate">취득일자</label> <input class="form-control"
				id="lanacquidate" name="lanacquidate"
				value="${ResumeLanguageVO.acquidate}"></input>
		</div>
		<div class="form-group">
			<label for="coverletter">자기소개서</label>
			<textarea class="form-control" rows="10" id="coverletter"
				name="coverletter">${ResumeVO.coverletter}</textarea>
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
                  <th class="table-active" scope="row">이름</th>
                  <td class="col-sm-4">${PUserVO.pname}</td>
                  <th class="table-active" scope="row">사진</th>
                  <td class="col-sm-4">
                  <img id = 'imgsrc' height = "150px;" alt="${ResumeVO.img}" /> 
                  <input id='imgsrccheck' type='hidden' value = "${ResumeVO.img}"/>
                  </td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">생년월일</th>
                  <td>${PUserVO.birth}</td>
                  <th class="table-active" scope="row">이메일</th>
                  <td>${PUserVO.email}</td>
               </tr>
               
               <c:forEach items="${PTellist}" var="PTelVO">
	               <tr>
	                  <th class="table-active" scope="row">전화번호(종류)★</th>
	                  <td>${PTelVO.title}</td>
	                  <th class="table-active" scope="row">전화번호★</th>
	                  <td>${PTelVO.tel}</td>
	               </tr>
               </c:forEach>
               
               <c:forEach items="${PWebSitelist}" var="PWebSiteVO">
            
	               <tr>
	                  <th class="table-active" scope="row">웹사이트(종류)★</th>
	                  <td>${PWebSiteVO.title}</td>
	                  <th class="table-active" scope="row">웹사이트주소★</th>
	                  <td>${PWebSiteVO.webadd}</td>
	               </tr>  
	           </c:forEach> 
	                        
	               <tr>
	                  <th class="table-active" scope="row">주소</th>
	                  <td>${ResumeVO.address}</td>
	                  <th class="table-active" scope="row">우편번호</th>
	                  <td>${ResumeVO.postcode}</td>
	               </tr>
               
               
               <tr>
               	  <th>학력사항</th>            
               </tr>
               <tr>
                  <th class="table-active" scope="row">학교명</th>
                  <td>${ResumeEduVO.schoolname}</td>
                  <th class="table-active" scope="row">학과</th>
                  <td>${ResumeEduVO.major}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">입학일</th>
                  <td>${ResumeEduVO.enterdate}</td>
                  <th class="table-active" scope="row">졸업일</th>
                  <td>${ResumeEduVO.gradudate}</td>
               </tr>
               <tr>
               	  <th class="table-active" scope="row">졸업상태</th>
                  <td>${ResumeEduVO.edustatus}</td>
               </tr>
               
               <tr>
               	  <th>경력사항</th>            
               </tr>
               <tr>
                  <th class="table-active" scope="row">회사명</th>
                  <td>${ResumeCareerVO.cname}</td>
                  <th class="table-active" scope="row">담당업무</th>
                  <td>${ResumeCareerVO.jobdescription}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">입사일</th>
                  <td>${ResumeCareerVO.startjob}</td>
                  <th class="table-active" scope="row">퇴사일</th>
                  <td>${ResumeCareerVO.finishjob}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">연봉</th>
                  <td>${ResumeCareerVO.salary}</td>
               </tr>
               
               <tr>
               	  <th>보유자격증 목록~~~~</th>            
               </tr>
               
               <c:forEach items="${RLicenselist}" var="RLicenseVO">
               <tr>
                  <th class="table-active" scope="row">자격증명★</th>
                  <td>${RLicenseVO.test}</td>
                  <th class="table-active" scope="row">발행기관★</th>
                  <td>${RLicenseVO.publeoffice}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">취득일자★</th>
                  <td>${RLicenseVO.acquidate}</td>
               </tr>     
                         
                </c:forEach>
               
               <tr>
               	  <th>어학능력 자격증 목록~~~~</th>            
               </tr>
               
               <c:forEach items="${RLanguagelist}" var="ResumeLanguageVO">
	               <tr>
	                  <th class="table-active" scope="row">공인인증시험명★</th>
	                  <td>${ResumeLanguageVO.test}</td>
	                  <th class="table-active" scope="row">점수★</th>
	                  <td>${ResumeLanguageVO.score}</td>
	               </tr>
	               <tr>
	                  <th class="table-active" scope="row">발행기관★</th>
	                  <td>${ResumeLanguageVO.publeoffice}</td>
	                  <th class="table-active" scope="row">취득일자★</th>
	                  <td>${ResumeLanguageVO.acquidate}</td>
	               </tr>  
                </c:forEach>             
               
               <tr>
               	  <th>희망 구직 정보</th>            
               </tr>
               <tr>
                  <th class="table-active" scope="row">구직상태</th>
                  <td>${ResumeVO.jobstateid}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">희망직종</th>
                  <td>${ResumeVO.jobgroupid}</td>
                  <th class="table-active" scope="row">희망근무형태</th>
                  <td>${ResumeVO.employstatusid}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">희망근무지(시/도)</th>
                  <td>${ResumeVO.rgbid}</td>
                  <th class="table-active" scope="row">희망근무지</th>
                  <td>${ResumeVO.rgsid}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">희망연봉</th>
                  <td>${ResumeVO.salaryid}</td>
               </tr>
                              
               <tr>
                  <th class="table-active" scope="row">제목</th>
                  <td>${ResumeVO.title}</td>
               </tr>
               <tr>
                  <th class="table-active" scope="row">자기소개서</th>
                  <td>${ResumeVO.coverletter}</td>
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
