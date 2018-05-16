<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header_nonavi.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style>
#back-top { 
position: fixed; 
bottom: 30px; 
right:10%;
z-index:10000;
/*margin-right: 150px;*/ 
} 
#back- a { 
width: 50px; 
display: block; 
text-align: center; 
font: 11px/100% Arial, Helvetica, sans-serif; 
text-transform: uppercase; 
text-decoration: none; 
color: #bbb; 
z-index:10000;
/* transition */ 
-webkit-transition: 1s; 
-moz-transition: 1s; 
transition: 1s; 
} 
#back-top a:hover { 
color: #000; 
} 
/* arrow icon (span tag) */ 
#back-top span { 
width: 50px; 
height: 50px; 
display: block; 
margin-bottom: 7px; 
background: #ddd url(/resources/rpjt/img/up-arrow.png) no-repeat center center; 
/* rounded corners */ 
-webkit-border-radius: 15px; 
-moz-border-radius: 15px; 
border-radius: 15px; 
/* transition */ 
-webkit-transition: 1s; 
-moz-transition: 1s; 
transition: 1s; 
} 
#back-top a:hover span { 
background-color: #777; 
} 

.startDay{
	float: left;
    margin: 3px 0 2px;
    width: 78px;
    height: 22px;
    border: 1px solid #d9d9d9;
    border-radius: 22px;
    color: #999;
    font-size: 13px;
    font-weight: bold;
    line-height: 21px;
    text-align: center;
	
}
.lastDay{
 
    float: left;
    margin: 3px 0 2px;
    width: 78px;
    height: 22px;
    border: 1px solid #fa6a71;
    border-radius: 22px;
    color: #f66;
    font-size: 13px;
    font-weight: bold;
    line-height: 21px;
    text-align: center;
}
.dDay{
    display: inline-block;
    margin-left: 3px;
    padding: 0 12px 0 11px;
    height: 23px;
    border-radius: 12px;
    color: #fff;
    font-size: 16px;
    letter-spacing: -1px;
    vertical-align: top;
    background-color: #fa6a71;
}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css"> <!-- selectpicker용 스크립트 링크 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script> <!-- selectpicker용 스크립트 -->

<!-- Main content -->
<div class="col-md-12 ">


	<!-- 버튼 -->

	<p id="back-top"> 
   		<a href="#top"><span></span></a> 
	</p>
	
	
	<!-- 소연 버튼 -->
	<!-- 메인 바디 입력 부분 -->
	
	<br>


<!--  <a id="kakao-link-btn" href="javascript:;"> 카카오
    <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a>  -->

	<div
		style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px;">
		<div class="row">

			<div class="col-md-8 col-sm-12 col-xs-12"
				style="border-bottom: 1px solid #dde2eb; padding-left: 15px; padding-top: 10px; padding-bottom: 10px; padding-right:0px; border-right: 1px solid #dde2eb;">
				<font size="3px">${CInfoVO.cname}</font><br> <font size="6px">${RecruitVO.title}</font>
				
				<font style="font-size: 16px;">~${RecruitVO.endday}</font>
				<c:choose>
				<c:when test="${RecruitVO.dday > 0}">
				<font style="font-size: 16px;">(${RecruitVO.week})</font><font class="dDay">D - ${RecruitVO.dday}</font>
				</c:when>
				<c:when test="${RecruitVO.dday == 0}">
				<font style="font-size: 16px;">(${RecruitVO.week})</font><font class="dDay">오늘까지</font>
				</c:when>
				<c:when test="${RecruitVO.dday < 0}">
				<font class="dDay">모집완료</font>
				</c:when>
				</c:choose>
			</div>
			<div class="col-md-4 text-center"  style="padding-left: 0px; padding-right: 0px; border-left: 1px solid #dde2eb;">
			<br>
			<div style="height:104px; align:center; vertical-align:middle">
				<img src="${CInfoVO.img}" class="img-rounded"
					id="imgsrc" name="img" value="${CInfoVO.img}" style=" max-width:90%;  max-height:100%; align: center; vertical-align: middle; " />
			</div>
			</div>
		</div>
		
		<div class="row">
		
			<div class="col-md-4 col-sm-4 col-xs-4">
				<!-- 첫번쨰 칸 -->
		
		
		
					<h4>지원자격</h4>

					<small>경력&emsp;</small>
					<a>${RecruitVO.exp}</a>
					<br>
					<br>
					<small>학력&emsp;</small>
					<a>${RecruitVO.edu}</a>
					<br>
					<br>
					
			</div>
			
			<!-- /첫번째 칸 -->

	
			<div class="col-md-4 col-sm-4 col-xs-4">
				<!-- 두번째 칸 -->
					<h4>근무조건</h4>

					<small>고용형태&emsp;</small>
					<a>${RecruitVO.employstatusid}</a>
					<br>
					<br>

					<small>급여&emsp;</small>
					<a>${RecruitVO.salaryid}</a>
					<br>
					<br>

					<small>지역&emsp;</small>
					<a>${RecruitVO.rgbid}</a>
					<a>${RecruitVO.rgsid}</a>
					<br>

			</div>
			<!-- /두번째 칸 -->

			<div class="col-md-4 col-sm-4 col-xs-4" style="border-left: 1px solid #dde2eb;">
				<h4>기업정보</h4>
				산업(업종) ${CInfoVO.ctype}<br> 사원수 ${CInfoVO.numemp}명<br> 설립년도
				${CInfoVO.establish}<br> 기업형태 ${CInfoVO.form}<br> 홈페이지
				${CInfoVO.homepage}<br> <br>
				<div class="text-center">
					<a href = '/company/C_info_nonavi?cName=${CInfoVO.cname}'>
					<button class="btn btn-info">기업정보</button></a>
				</div>
				<br>
			</div>
		</div>
	</div>
	<br>

	<div id="apply_div" class="text-center">
		<c:choose>
		<c:when test="${RecruitVO.acceptmethod=='즉시지원'}">
		<button id="applynow" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok"></span>즉시지원</button>
		</c:when>
		<c:when test="${RecruitVO.acceptmethod!='즉시지원'}">
		<button id="homeApplyNow" class="btn btn-primary btn-lg" value="${CInfoVO.homepage}"><span class="glyphicon glyphicon-ok"></span>홈페이지지원</button>
		</c:when>
		</c:choose>
		<button id="clipping" class="btn btn-default btn-lg">관심채용등록</button>
	</div>

	<!-- 소연 모달 -->
	<div class="modal" id="applynow_modal">
		<div class="modal-dialog">
			<!--★ 뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->
			<div class="modal-content col-xs-12 col-md-8">
				<!--★ col-xs-8을 아래 붙이면 css적용이 안 됨 , col-xs-8을 써서 모달 가로 폭을 조정 -->
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!--x표시 누르면 창 사라지게 하는 코드 -->

					<form role="form">
						<div class="row">
							<h4>즉시지원하기 - [${PUserVO.pname }]님의 이력서 목록</h4>
							<br> <input type="hidden" id="modal_pid" name="pid"
								value="${PUserVO.id }">
							<!--★ row로 인해서 여러 개를 한 줄에 나열 -->
							<table class="table table-bordered">
								<tr>
									<th style="width: 55px;">관리</th>
									<th style="width: 55px;">순번</th>
									<th>이력서 제목</th>
								</tr>
								<c:forEach items="${ResumeVOList}" var="ResumeVO">
									<tr>
										<td><input type="radio" name="bno"
											value="${ResumeVO.bno}"></td>
										<td>${ResumeVO.bno}</td>
										<td><a href="/personal/detail?bno=${ResumeVO.bno}"
											target="_blank">${ResumeVO.title}</a></td>
									</tr>
								</c:forEach>
							</table>
							<input type="hidden" id="modal_recruitNum" name="recruitNum"
								value="${RecruitVO.bno}">
							<div class="col-xs-6 col-md-4">
								<!--즉시지원 버튼 -->
								<button id="applynow_btn"
									class="btn btn-primary btn-block btn-flat">즉시 지원</button>
							</div>
						</div>
						<!--//row -->
					</form>
				</div>
				<!--//class="modal-body"  -->
			</div>
			<!--//class="modal-content col-xs-8"-->
		</div>
		<!--//modal-dialog -->
	</div>
	<input type='hidden' id='RecruitVO_regdate' value='${RecruitVO.regdate}'>
	<input type='hidden' id='RecruitVO_period' value='${RecruitVO.period}'>
	<input type="hidden" id="pC" value="<%=pid%>">
	<!-- 소연 코드 -->
	
	<script>
	
	$(document).on("click","#homeApplyNow",function(){
		
		var result = confirm("해당공고는 홈페이지 지원 방식입니다. 기업 홈페이지로 이동하시겠습니까?"); 

		if(result){
			
			window.location.href = $("#homeApplyNow").val();
		}
	
	})
	
	</script>
	<script>
		$(document).ready(function() {
			var RecruitVO_regdate = $('#RecruitVO_regdate').val();//현재날짜
			var RecruitVO_period = $('#RecruitVO_period').val();//마감날짜
			
			if(RecruitVO_regdate>RecruitVO_period){
				$("#applynow").removeClass('btn-primary');
				$("#applynow").text('지원 마감');
				$('#applynow').attr('id','applyend');
				$("#applynow2").removeClass('btn-primary');
				$("#applynow2").text('지원 마감');
				$('#applynow2').attr('id','applyend2');
			}
			
			$('#applyend').click(function(){
				alert('모집이 마감된 채용공고입니다.')
			});
			$('#applyend2').click(function(){
				alert('모집이 마감된 채용공고입니다.')
			});
		
			var formObj = $("form[role = 'form']");
			var rcno = $("#modal_recruitNum").val();
			var pid = $("#modal_pid").val();
			
			$("#applynow").click(function(e) {
				
				if("<%=pid%>"==""&&"<%=cid%>"==""){
					alert("로그인해주시길바랍니다.")
				}else if("<%=pid%>"==""){
					alert("개인회원으로 로그인 해주시길바랍니다.")
				}else{
					$.ajax({//ajax로 비교해서 true/false 값 받아와야 함.
						type : 'post',
						url : '/companyAjax/applycheck',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							rcno : rcno,
							pid : pid
						}),
						success : function(result) {
							console.log("result가 뭐냐?" + result);
							if (result == 'TRUE') {
								$("#applynow_modal").modal();
							} else if (result == 'FALSE') {
								alert("이미 지원한 공고 입니다.");
								//location.href='/personal/index'; 어케하는거임 어쨌든 안움직여도 됨
							} else {
								alert("어느 if문에도 들어가지 못함.");
								console.log("어느 if문에도 들어가지 못함.");
							}
						}//success end
					})//ajax end
				}
				
			});
			$("#applynow2").click(function() {
				if("<%=pid%>"==""&&"<%=cid%>"==""){
					alert("로그인해주시길바랍니다.")
				}else if("<%=pid%>"==""){
					alert("개인회원으로 로그인 해주시길바랍니다.")
				}else{
					$.ajax({//ajax로 비교해서 true/false 값 받아와야 함.
						type : 'post',
						url : '/companyAjax/applycheck',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							rcno : rcno,
							pid : pid
						}),
						success : function(result) {
							console.log("result가 뭐냐?" + result);
							if (result == 'TRUE') {
								$("#applynow_modal").modal();
							} else if (result == 'FALSE') {
								alert("이미 지원한 공고 입니다.");
								//location.href='/personal/index'; 어케하는거임 어쨌든 안움직여도 됨
							} else {
								alert("어느 if문에도 들어가지 못함.");
								console.log("어느 if문에도 들어가지 못함.");
							}
						}//success end
					})//ajax end
				}
			});
			$("#applynow_btn").on("click", function(e) {
				console.log("applynow_btn clicked");
				
				var rsno = $('input[name="bno"]:checked').val();
				
				console.log("rsno : " + rsno + "rcno : " + rcno + "pid : " + pid);
				
				if(rsno==undefined){
					alert("이력서를 선택하세요!");
					return false;
				}else{
					$.ajax({//ajax로 비교해서 true/false 값 받아와야 함.
						type : 'post',
						url : '/companyAjax/applycheck',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							rsno : rsno,
							rcno : rcno,
							pid : pid
						}),
						success : function(result) {
							console.log("result가 뭐냐?" + result);
							if (result == 'TRUE') {
								alert("지원하였습니다.");
								//이제 체크된 value에  id="bno" name="bno"를 주고 넘긴다.
								formObj.attr("action", "/company/applynow");
								formObj.attr("method", "post");
								formObj.submit(); //button type이 submit라서 필요 없음
							} else if (result == 'FALSE') {
								alert("이미 지원한 공고 입니다.");
								//location.href='/personal/index'; 어케하는거임 어쨌든 안움직여도 됨
							} else {
								alert("어느 if문에도 들어가지 못함.");
								console.log("어느 if문에도 들어가지 못함.");
							}
						}//success end
					})//ajax end
				}
			});
			
			$("#clipping").click(function() {
				
				if("<%=pid%>"==""&&"<%=cid%>"==""){
					alert("로그인해주시길바랍니다.")
				}else if("<%=pid%>"==""){
					alert("개인회원으로 로그인 해주시길바랍니다.")
				}else{
					
					$.ajax({
						type : 'post',
						url : '/companyAjax/clipping',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({ //name에 설정해줘야 함
							rcbno : rcno,
							userid : pid
						}),
						success : function(result) {
							console.log("result가 뭐냐?" + result);
							if (result == 'TRUE') {
								alert("관심채용공고에 스크랩하였습니다.");
							} else if (result == 'FALSE') {
								alert("이미 스크랩했습니다.");
							} else {
								alert("어느 if문에도 들어가지 못함.");
								console.log("어느 if문에도 들어가지 못함.");
							}
						}//success end
					})//ajax end
					
				}
			});
		});
	</script>

	<br>
	<!-- 공고 메인 -->
	<div id="detail_content"></div>
	<br><br>
	<div style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">

		<h4>모집내용 및 자격조건</h4>

		<table class="table">
			<tr>
				<th scope="row" class="active">모집직종</th>
				<td>${RecruitVO.jobgroupid}->${RecruitVO.jobgroupid2}</td>

				<th scope="row" class="active">근무지역</th>
				<td>${RecruitVO.rgbid}->${RecruitVO.rgsid}</td>
			</tr>
			<tr>
				<th scope="row" class="active">모집인원</th>
				<td colspan="3">${RecruitVO.recruitnum }명</td>
			</tr>
			<tr>
				<th scope="row" class="active">근무형태</th>
				<td colspan="3">${RecruitVO.employstatusid }</td>
			</tr>
			<tr>
				<th scope="row" class="active">급여사항</th>
				<td colspan="3">${RecruitVO.salaryid }</td>
			</tr>
			<tr>
				<th scope="row" class="active">학력</th>
				<td colspan="3">${RecruitVO.edu }</td>
			</tr>
		</table>
		<br>

		<h4>담당업무</h4>
		<table class="table">
			<tr>
				<td style="word-break:break-all;">${jobdesc}</td>
			</tr>
		</table>		
	
		<h4>상세모집내용</h4>

		<table class="table">
			<tr>
				<td style="word-break:break-all;">${adddesc }</td>
			</tr>
		</table>
			
		
	</div>
	
	
		<p id="accept_method">	
	<!-- /공고 메인 -->
	<br> <br>
	
		

	<div style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
		<div class="row">
			<!-- 접수기간  -->
			<div class="col-md-5" >
				
				<h4>접수기간</h4>
				 <div>
				 <span class="startDay">시작일 </span> <span style="vertical-align:middle;">&nbsp;&nbsp;${RecruitVO.periodstart }</span>
				 </div>
				 <br>
				 <div>
				 <span class="lastDay">마감일</span> <span style="vertical-align:middle;">&nbsp;&nbsp;${RecruitVO.period }</span>
				</div>
				<br>
				<div style="border-top: 0.1px solid #c0c6d3;">
				<span class="glyphicon glyphicon-exclamation-sign" style="color:rgb(221,221,221)"></span><span style="color:rgb(144,144,144)">마감일은 기업의 사정, 조기마감 등으로 변경될 수 있습니다.</span>
				</div>
				<br>
			</div>



<script>
var timeInMs = Date.now();

$("#t1").html(timeInMs);
</script>
			<div class="col-md-7" style="border-left: 0.1px solid #c0c6d3;">
			<h4>접수방법 및 모집인원</h4>
	
			<table>
					<tr>
						<td>접수방법 &nbsp; </td>
						<td>${RecruitVO.acceptmethod}<br></td>
					</tr>
					
					<tr>
						<td>모집인원</td>
						<td>${RecruitVO.recruitnum }명<br></td>
					</tr>
				</table>
				
			<c:choose>
		<c:when test="${RecruitVO.acceptmethod=='즉시지원'}">
		<br><button id="applynow2" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok"></span>즉시지원</button>
		
		</c:when>
		<c:when test="${RecruitVO.acceptmethod!='즉시지원'}">
		<br><button id="homeApplyNow" class="btn btn-primary btn-lg" value="${CInfoVO.homepage}"><span class="glyphicon glyphicon-ok"></span>홈페이지지원</button>
		
		</c:when>
		</c:choose>
				<br>
				
			</div>
		</div>
		<!-- /접수기간  -->
	</div>
	<br> <br>

	<div
		style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
					<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
					<th class="active" scope="row">기업명</th>
					<td>${CInfoVO.cname}</td>
					<th class="active" scope="row">대표자명</th>
					<td>${CInfoVO.ceo}</td>
				</tr>
				<tr>
					<th class="active" scope="row">업종</th>
					<td colspan="3">${CInfoVO.ctype}</td>
				</tr>
				<tr>
					<th class="active" scope="row">기업형태</th>
					<td colspan="3">${CInfoVO.form}</td>
				</tr>
				<tr>
					<th class="active" scope="row">설립일</th>
					<td colspan="3">${CInfoVO.establish}</td>
				</tr>
				<tr>
					<th class="active" scope="row">사원수</th>
					<td>${CInfoVO.numemp}명</td>
					<th class="active" scope="row">매출액</th>
					<td>${CInfoVO.sales}</td>
				</tr>
				<tr>
					<th class="active" scope="row">대표전화</th>
					<td>${CInfoVO.tel}</td>
					<th class="active" scope="row">FAX</th>
					<td>${CInfoVO.fax}</td>
				</tr>
				<tr>
					<th class="active" scope="row">홈페이지</th>
					<td><a href="${CInfoVO.homepage}" class="link_site"
						target="_blank" rel="nofollow">${CInfoVO.homepage}</a></td>
					<th class="active" scope="row">SNS</th>
					<td><a href="${CInfoVO.sns}" class="link_site" target="_blank"
						rel="nofollow">${CInfoVO.sns}</a></td>
				</tr>
				<tr>
					<th class="active" scope="row">기업주소</th>
					<td colspan="3">${CInfoVO.location}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br> <br>

	<p class="lead">
	
		<strong>지도 위치</strong>
		
	</p>
			
		
	<div id="map"></div>
	
			
	<br>
	
	
<button class="btn btn-primary" id="questionCall" type="button" style="float:right" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
<span class="glyphicon glyphicon-pencil">인사담당자에게 질문하기</span>
</button>

<div class="collapse" style="width:100%" id="collapseExample">
<br><br>
  <div class="well">
			
			<h4 style="border-bottom: 2px solid #dce1eb; padding: 10px 0px 10px 10px">인사담당자에게 질문하기</h4>
			
			<br>
			
			<div style="padding: 10px 0px 10px 10px">
				질문분류 
				<select class="selectpicker" id="questionType">
					<option>채용일반</option><option>경력사항</option><option>근무환경</option>
				</select>
				
				<select class="selectpicker" id="questionDetailType" name="staa">
					<option>채용</option><option>자격요건</option><option>서류전형</option><option>면접</option><option>업무</option><option>기타</option>
				</select>
				
		
			</div>
			
			
			
			<div style="padding: 10px 10px 10px 10px">
				<textarea placeholder="*인사담당자에게 채용 관련하여 궁금한 사랑이 있으면 질문해 주세요." style="width:70%;" id="questionText"></textarea>
				<button id="questionSbm" style="margin-bottom:10px">등록</button>
			</div>


		
      </div>
</div>

	<br><br>
	<div id="human_resources_manager" style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
		
		
		<%
    		pageContext.setAttribute("cid", cid);
		%>

		<c:set var="cid" value="${pageScope.cid}" /> 
		
		<div id="qna_div"></div>
		
		
		<div class="text-center">
		<ul class="pagination" id="listPage">
		
		</ul>
		</div>
		
		
		
	</div>


<script>


	$(document).on("click","button[name='aTextModifyBtns']",function(){ /* 답변 소환 버튼 */		
		var num = $(this).val();
		var txt = $("textarea[name="+num+"]").val();
		
		
		$.ajax({
			type:'POST',
			url:'/companyAjax/recruitAnswer/',
			headers:{
				"Content-Type": "application/json; charset=UTF-8",
				"X-HTTP-Method-Override": "POST"},
			dataType:'text',
			data: JSON.stringify({qbno:num, atext:txt}),
			success : function(result) {
				
				$("#qna_div > *").remove();
				
				alert("등록이 완료됐습니다.")
				
				location.reload();
	 			
			}	
			      		      
	 
	 }); 
		
		
		
	})
</script>

	<script>

	$("#questionType").change(function(){ /* 채용일반이면 서브 옵션 추가 */
		
		if($("#questionType option:selected").html() != "채용일반"){
			
			$("#questionDetailType").selectpicker('hide');
			
		}else{
			
			$("#questionDetailType").selectpicker('show');
			
		}
		
	})
	
	</script>
	
	<script>
	
	$(document).on("click","#questionCall",function(){ /* 숨어있는 인사담당자 질문하기 소환 */
		
		
		if("<%=pid%>"==""&&"<%=cid%>"==""){
			alert("로그인해주시길 바랍니다.");
			$("#collapseExample").prop("id","1212");
		}else if("<%=pid%>"==""){
			alert("개인회원으로 로그인해주시길바랍니다.");
			$("#collapseExample").prop("id","1212");
		}else{
			$("#questionBox").css("display","");
		}
	
	})
	
	</script>
	
	<script>
	
	$(document).on("click","#questionSbm",function(){ /* 처음에 인사담당자 질문하기 클릭시  */
		
		var questionType = $("#questionType option:selected").html();
		if($("#questionType option:selected").html() != "채용일반"){
			var questionDetailType = null;
		}else{
			var questionDetailType =  $("#questionDetailType option:selected").html()		
		}
		var questionText = $("#questionText").val();
		var id = "<%=pid%>";
		var rbno = <c:out value="${RecruitVO.bno}"/>
		
		
			if("<%=pid%>"==""&&"<%=cid%>"==""){
				alert("로그인 후 사용 가능합니다");
			}else if("<%=pid%>"==""){
				alert("개인회원으로 로그인 후 사용 가능합니다");
			}else{
				
				
				
				$.ajax({
					type:'POST',
					url:'/companyAjax/recruitQuestion/',
					headers:{
						"Content-Type": "application/json; charset=UTF-8",
						"X-HTTP-Method-Override": "POST"},
					dataType:'text',
					data: JSON.stringify({rbno:rbno, id:id, qtext:questionText, qtype:questionType, rqtype:questionDetailType}),
					success : function(result) {
					
						alert("작성이 완료됐습니다.")
						location.reload();
			 
					}	
					      		      
			 
			 }); 
				
				
				
				
				
				
				
				
				
			}
		
	})
	
	
		
		
		


	
	</script>
	
			
	<h4>담당자 정보</h4>
		
		<%-- <input type="text" id="test" value="${CInfoVO.location}"/> --%>
			
	
	<div id="human_resources_manager" 
		style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
			<table class="table table-bordered ">
			
			
				<tr>
					<th class="table-active" scope="row">담당자</th>
					<td colspan="3">${CInfoVO.pname}</td>
				</tr>

				<tr>
					<th class="table-active" scope="row">이메일</th>
					<td colspan="3">${CInfoVO.email}</td>
				</tr>
		
			</table>
		</div>
	</div>



<%-- <form role="form" method="post">
	<input type='hidden' name="bno" value="${RecruitVO.bno}"> 
	<input type='hidden' name="id" value="${RecruitVO.cid}">
</form> 소연 수정 이거 name 겹쳐서 에러나서 걍 주석처리함
 --%>
<script>
$(document).ready(function(){ 
	// hide #back-top first
	//$("#back-top").hide();
	
	// fade in #back-top
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 50) {
				$('#back-top').fadeIn();
			} else {
				$('#back-top').fadeOut();
			}
		});
		// scroll body to 0px on click
		$('#back-top').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});
});

$(document).ready(function() {
	
   
    
	var imgsrccheck = ('#imgsrccheck');
	if ($('#imgsrccheck').val() != "") {
		console.log(" val값 뭐임? " + $('#imgsrccheck').val());
		console.log(" val이 널값아님");
		$('#imgsrc').attr("src", 'displayFile?fileName=${CInfoVO.img}');
	} else {
		console.log(" val이 널값이다");
		$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
		$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
	}
});
</script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<script>

    //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('255f0ac190064fdd43c712921a3fbb03');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
        container: '#kakao-link-btn',
        objectType: 'location',
        address: '${CInfoVO.location}',
        addressTitle: '',
        content: {
            title: '${RecruitVO.title}',
            description: '${CInfoVO.cname}',
            imageUrl: 'https://s3.ap-northeast-2.amazonaws.com/matchingbucket/matching/company${CInfoVO.img}',
            link: {
            	mobileWebUrl: 'https://developers.kakao.com',
                webUrl: 'https://developers.kakao.com'
            }
        },
        social: {
            likeCount: ${RecruitVO.interestcnt},
            viewCount: ${RecruitVO.viewcnt}
        },
        buttons: [
            {
                title: '채용공고 보기',
                link: {
                	mobileWebUrl: 'http://recru-it.xyz:8080/company/C_recruitMent?recruitNum=${RecruitVO.bno}',
                    webUrl: 'http://recru-it.xyz:8080/company/C_recruitMent?recruitNum=${RecruitVO.bno}'
                }
            }
        ]
    });
    //]]>
    
	

</script>

<style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>

 <script>

      function initMap() {
    	  var uluru = {lat: <c:out value="${CInfoVO.lat}"/>, lng: <c:out value="${CInfoVO.lng}"/>};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    
    <script async defer
    	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJUtblZh2z-lZFLFNeHDQ95o5a5-Q32s0&callback=initMap">
    </script>
    

 <script>
 
 var num = 1;
 
 load(num);
 
function load(num){
	

 var recruitNum = <c:out value="${RecruitVO.bno}"/>
	 
 		$("#qna_div > *").remove();
	 	
 		page = num;
 
	   var chr = "";
	   $.ajax({
		   
	   
			type:'POST',
			url:'/companyAjax/qnaList/',
			headers: { 
			      "Content-Type": "application/json; ",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'JSON',
			data: JSON.stringify({recruitNum:recruitNum, page:page}),
			success : function(data) {
			
				var qbno ="";
				var length = data.length;
				var len = 0;  
				var item;
				
				$(data).each(function(){
					
					len++;
					
					if(length > len){    	
						
					var item = {
							qbno : this.qbno,
							qtype : this.qtype, 
							qtext : this.qtext,
							atext : this.atext
					};
					
					createTemplate(item)
					
					}else{
					
					if(this.prev){
						chr += "<li style=cursor:pointer><a id=qnaFirstPage name=all value="+this.startPage+">&laquo;</a></li>";
					}
					
					for(var z = this.startPage; z<=this.endPage; z++){
						chr += "<li style=cursor:pointer id=qnaListListLi name="+z+"><a id=qnaPageList name=all>"+z+"</a></li>"
						
					} 
				 	if(this.next&&this.endPage>0){
				 		chr += "<li style=cursor:pointer><a id=qnaLastPage value="+this.endPage+" name=all>&raquo;</a></li>";
					}
					
				}
				
				})
		
				  $("#listPage").html(chr); 
				
				$("li[name="+page+"]").addClass("active");
				
			}
			      
			      
			      
	   })
 
}



 function createTemplate(item){
	    
	    var source_tel = $("#template_qnaList").html();
		var template = Handlebars.compile(source_tel);
		$("#qna_div").append(template(item));
		
	   }
 
    </script>
    
    <script>
    
    $(document).on("click",'#qnaFirstPage',function(){
    	
		var num = "1";
		
		load(num);

	})
	
	  $(document).on("click",'#qnaLastPage',function(){
    	
		var num = $(this).val();
		
		load(num);

	})
	
	 $(document).on("click",'#qnaPageList',function(){
    	
		var num = $(this).html();
		
		load(num);

	})


    </script>

  <script id="template_qnaList" type="text/x-handlebars-template">


		
<div class="panel-group" id="accordion{{qbno}}" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading{{qbno}}">
      <h4 class="panel-title">
      	<a><font class="badge" style="width:8%">{{qtype}}</font></a>
        <a data-toggle="collapse" data-parent="#accordion{{qbno}}" href="#collapse{{qbno}}" aria-expanded="false" aria-controls="collapse{{qbno}}">
			Q. <font class="text-center" style="width:58%; cursor:pointer;" value="{{qbno}}" name="txtClick">{{qtext}}</font>    
        </a>
        <a data-toggle="collapse" data-parent="#accordion{{qbno}}" href="#collapse{{qbno}}" aria-expanded="false" aria-controls="collapse{{qbno}}">
			<span style="float:right; width:2%; cursor:pointer;" class="glyphicon glyphicon-menu-down" id="span{{qbno}}" value="{{qbno}}" name="spanClick"></span>     
        </a>
		<a data-toggle="collapse" data-parent="#accordion{{qbno}}" href="#collapse{{qbno}}" value="{{qbno}} aria-expanded="false" aria-controls="collapse{{qbno}}">
			<c:if test="${RecruitVO.cid == cid}"><button class="btn btn-default" name="aBtns" id="aBtn{{qbno}}" value="{{qbno}}" style="right:0">답변/수정하기</button></c:if> 
		</a>
      </h4>
    </div>
    <div id="collapse{{qbno}}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading{{qbno}}">
      <div class="panel-body">
		<font style="font-size:16px; padding-left:9%;" id="Answer{{qbno}}"> {{#Answer}} {{atext}} {{/Answer}}</font>
      </div>
		<div id="answerDiv{{qbno}}"  style="display:none">
		<textarea class="form-control" name="{{qbno}}" value="{{atext}}">{{atext}}</textarea>
		<br>
		<div class="text-center" style="text-align: center;">
		<button class="btn btn-danger btn-lg" name="cancelBtns" value="{{qbno}}">취소</button><button class="btn btn-success btn-lg" value="{{qbno}}" name="aTextModifyBtns">등록</button>
		</div>
		<br>
		</div>	
    </div>
  </div>
  
</div>
	


</script> 

<script>

	$(document).on("click","button[name='aBtns']",function(){ /* 답변 소환 버튼 */		

				
		var num = $(this).val();
	
		$("#answerDiv"+num).css("display","");
		$(this).css("display","none");
		
		
		if($('#collapse'+num).attr("aria-expanded")=="true"){
			
			$("#aBtn"+num).trigger("click");
		
		} 
			
		
		
		
		
		
	})
	
	$(document).on("click","button[name='cancelBtns']", function(){
		
		var num = $(this).val();
		$("#aBtn"+num).css("display","")
		$("#answerDiv"+num).css("display","none");
		
	})
	


	$(document).on("click","span[name='spanClick']",function(){
	
		var num = $(this).attr("value");
		
		
		
		if($("#answerDiv"+num).css("display") == "block"){
			$("#answerDiv"+num).css("display","none");
			$("#aBtn"+num).css("display","");
		}  
		$("#Answer"+num).css("display","block");
		
	
	})

</script>

<script type="text/javascript">
	
	
  
        Handlebars.registerHelper("Answer", function(option) {
        	
        	if(this.atext == null){
        		
        		return "등록된 답변이 없습니다.";
        	}else{
        		
        		return "A. "+this.atext+"";
        	}
        	
        	
        	
        });
        	
 </script>
<!-- //메인 바디 끝 -->

<%@include file="../include/cfooter.jsp"%>