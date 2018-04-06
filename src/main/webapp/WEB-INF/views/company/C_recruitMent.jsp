<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header_nonavi.jsp"%>

<style>
#back-top { 
position: fixed; 
bottom: 30px; 
right:10%;
/*margin-right: 150px;*/ 
} 
#back-top a { 
width: 50px; 
display: block; 
text-align: center; 
font: 11px/100% Arial, Helvetica, sans-serif; 
text-transform: uppercase; 
text-decoration: none; 
color: #bbb; 
z-index:10;
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
</style>

<!-- Main content -->
<div class="col-md-12 ">
	<!-- 버튼 -->

	<p id="back-top"> 
   		<a href="#top"><span></span></a> 
	</p>
	<!-- 소연 버튼 -->
	<!-- 메인 바디 입력 부분 -->
	<br> <br> <span>${RecruitVO.period}</span> <span>조회수
		${RecruitVO.viewcnt}</span> |<span>스크랩 수</span><span>지원자수</span> <span>공유하기</span>
	<br>



	<div
		style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
		<div class="row">
			<div class="col-md-8"
				style="border-bottom: 1px solid #dde2eb; padding-left: 15px; padding-top: 10px; padding-bottom: 10px">
				<font size="3px">${CInfoVO.cname}</font><br> <font size="6px">${RecruitVO.title}</font>
			</div>
			<div class="col-md-4 text-center" style="border-left: 1px solid #dde2eb;">
				<img src="${CInfoVO.img}" class="img-rounded"
					id="imgsrc" name="img" value="${CInfoVO.img}"
					style="width: 200px; height: 150px;" />
			</div>

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
					<a href = '/company/C_info_nonavi?recruitNum=${RecruitVO.cid}'>
					<button class="btn btn-info">기업정보</button></a>
				</div>
				<br>
			</div>
		</div>
	</div>
	<br>

	<div class="text-center">
		<c:choose>
		<c:when test="${RecruitVO.acceptmethod=='즉시지원'}">
		<button id="applynow" class="btn btn-primary btn-lg">즉시지원</button>
		</c:when>
		<c:when test="${RecruitVO.acceptmethod!='즉시지원'}">
		<button id="homeApplyNow" class="btn btn-primary btn-lg" value="${CInfoVO.homepage}">홈페이지지원</button>
		</c:when>
		</c:choose>
		<button id="clipping" class="btn btn-default btn-lg">관심채용등록</button>
	</div>

	<!-- 소연 모달 -->
	<div class="modal" id="applynow_modal">
		<div class="modal-dialog">
			<!--★ 뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->
			<div class="modal-content col-xs-8">
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
							<input type="text" id="modal_recruitNum" name="recruitNum"
								value="${RecruitVO.bno}">
							<div class="col-xs-4">
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
			var formObj = $("form[role = 'form']");
			var rcno = $("#modal_recruitNum").val();
			var pid = $("#modal_pid").val();
			$("#applynow").click(function(e) {
				
				if("<%=pid%>"==""&&"<%=cid%>"==""){
					alert("로그인해주시길바랍니다.")
				}else if("<%=pid%>"==""){
					alert("개인회원으로 로그인 해주시길바랍니다.")
				}else{
					$("#applynow_modal").modal();
				}
				
			});
			$("#applynow2").click(function() {
				
				if("<%=pid%>"==""&&"<%=cid%>"==""){
					alert("로그인해주시길바랍니다.")
				}else if("<%=pid%>"==""){
					alert("개인회원으로 로그인 해주시길바랍니다.")
				}else{
					$("#applynow_modal").modal();
				}
				
			});
			$("#applynow_btn").on("click", function(e) {
				
			
				
				console.log("applynow_btn clicked");
				var rsno = $('input[name="bno"]:checked').val();
				alert("rsno : " + rsno + "rcno : " + rcno + "pid : " + pid);
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
							alert("submit됐니");
						} else if (result == 'FALSE') {
							alert("이미 지원한 공고 입니다.");
							//location.href='/personal/index'; 어케하는거임 어쨌든 안움직여도 됨
						} else {
							alert("어느 if문에도 들어가지 못함.");
							console.log("어느 if문에도 들어가지 못함.");
						}
					}//success end
				})//ajax end
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
	
	
		
	<!-- /공고 메인 -->
	<br> <br>
	<div id="accept_method"
		style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
		<div class="row">
			<!-- 접수기간  -->
			<div class="col-md-3">
				<font size="6px">접수방법</font> <br> <span>마감일</span> <span>${RecruitVO.period }</span>
			</div>

			<div class="col-md-9">
			
			<c:choose>
		<c:when test="${RecruitVO.acceptmethod=='즉시지원'}">
		<button id="applynow2" class="btn btn-primary btn-lg">지원하기</button>
		</c:when>
		<c:when test="${RecruitVO.acceptmethod!='즉시지원'}">
		<button id="homeApplyNow" class="btn btn-primary btn-lg" value="${CInfoVO.homepage}">지원하기</button>
		</c:when>
		</c:choose>
				<br>
				<table>
					<tr>
						<td>접수방법</td>
						<td>${RecruitVO.acceptmethod }</td>
					</tr>
					<tr>
						<td>지원양식</td>
						<td>${RecruitVO.recruitform }</td>
					</tr>
					<tr>
						<td>모집인원</td>
						<td>${RecruitVO.recruitnum }명<br></td>
					</tr>
				</table>
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

	
			
			
	<h4>담당자 정보</h4>
		

	<div id="human_resources_manager" 
		style="border: 1px solid #dce1eb; border-top: 2px solid #c0c6d3; solid black; padding-left: 15px; padding-top: 15px;">
		<table class="table table-bordered ">
			
			
				<tr>
					<th class="table-active" scope="row">담당자</th>
					<td colspan="3">${CInfoVO.pname}</td>
				</tr>

				<tr>
					<th class="table-active" scope="row" name="phone">휴대폰 번호</th>
					<td colspan="3">${CInfoVO.phone}</td>
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
<!-- //메인 바디 끝 -->

<%@include file="../include/cfooter.jsp"%>