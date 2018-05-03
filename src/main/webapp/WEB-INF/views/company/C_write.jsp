<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/cheader.jsp"%>


<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

 <link rel="stylesheet" type="text/css" href="/resources/rpjt/css/button.css" /> <!-- 버튼용 css -->

<style>
 #map {
      		width:	100%;
            height: 300px; 
        }

r{
color:rgb(255, 79, 0);
}
.container1 {
        width: 100%;
        height: 600px;
        overflow: scroll; /* showing scrollbars */
  }
</style>	

<!-- Main content -->
<!-- 공고 작성 바디 -->
<div class="col-md-9 ">

	<p class="lead">
		<h2>채용공고작성</h2>
	</p>


	<!-- 공고 입력 부분 -->
	<form role="form" method="POST">	
	
		<table class="table table-hover" id="my-tbody">
		
	
			<tr>
				<th class="col-sm-3 text-center"  id="titleTxt" style="vertical-align:middle;" ><h4>공고 제목</h4></th>
				<td style="vertical-align:middle; padding:15px 15px 15px 0px;">
				<div id="titleDiv" style="margin-bottom:0px;">
				<input type="text" class="form-control" tabindex="0" name="title"  id="title" 
				value="${RecruitVO.title}" data-toggle="popover"  title="구직자를 사로잡는 채용공고 제목 작성법(예시)" data-trigger="focus"  data-placement="auto top" 
				data-content="-UX 디자인팀 일러스트레이터 경력자 모집" aria-describedby="inputError2Status"> 
				 <span class="glyphicon glyphicon-remove form-control-feedback" id="titleXIcon" aria-hidden="true" style="display:none"></span>
  				 <span class="glyphicon glyphicon-ok form-control-feedback" id="titleOKIcon" aria-hidden="true" style="display:none"></span>
  				
  				</div>
				</td>
	
			</tr>
			
<script>
$(function () {
    $('[data-toggle="popover"]').popover({
    	container: 'body'
    })
});
</script>
<style>

#jobGroupDiv
{
   text-decoration: none;
  
}
 #subJobgroupDiv
 {
   text-decoration: none;
  
}
 #rgbidDiv 
 {
   text-decoration: none;
  
}
 #subRegion
 {
   text-decoration: none;
  
}
#employstatusidDiv 
{
   text-decoration: none;
  
}
#salaryidDiv
{
   text-decoration: none;
  
}
#eduDiv 
{
   text-decoration: none;
  
}
#expDiv
{
   text-decoration: none;
  
}
.popover{
    max-width: 100%;
   
}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
 -->
		
		<tr>
					<th class="text-center" id="jobGroupTxt" style="vertical-align:middle;"><h4>직종/직무</h4></th>
				<td>
				
				
		 <div style="padding:15px 15px 15px 0px;">
		 	<a id="jobGroupDiv">
		 	
					<select class="selectpicker" data-live-search="true" id="jobGroup" name="jobgroupid" title="선택">
						
						<c:forEach items="${jobgroupList}" var="JobGroupVO">
						<c:if test="${JobGroupVO.id!=0}">
						
							<option value="${JobGroupVO.id}">${JobGroupVO.jobgroup}</option>
							
						</c:if>
						</c:forEach>
						
					</select>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<span class="glyphicon glyphicon-remove form-control-feedback" id="jobGroupXIcon" aria-hidden="true" style="display:none; right:0;" ></span>
					 <span class="glyphicon glyphicon-ok form-control-feedback" id="jobGroupOKIcon" aria-hidden="true" style="display:none; right:0"></span>
					 
			</a>
			
			
				<a id="subJobgroupDiv">
				
				<c:forEach begin="1" end="${jobGroupCount}" varStatus="status">
						
					<select class="selectpicker" data-live-search="true" id="subJob${status.index}" name="subJobgroup" title="선택">
						<c:forEach items="${subJobgroupList}" var="JobGroupVO">
						<c:if test="${JobGroupVO.id2==status.index}">
						
							<option value="${JobGroupVO.id}">${JobGroupVO.jobgroup}</option>
								
							</c:if>
						</c:forEach>
					</select>  
				
				</c:forEach>
					
				<script>
				$("select[name=subJobgroup]").selectpicker('hide');       /* 소분류 forEach문으로 출력한거 숨기기 위해 사용 */
				
				$("select[name=jobgroupid]").on("change",function(){  /* 대분류 선택하면 대분류에 맞는 소분류 show */
					var jobId = $(this).val();
					$("select[name=subJobgroup]").selectpicker('hide');
				
					/* $("select[name=jobgroupid2]").prop("selected",false); */
					$("#subJob"+jobId).selectpicker('show');
				})
				
				
				$("select[name=subJobgroup]").on("change",function(){  /* 대분류 선택하면 대분류에 맞는 소분류 show */
					var sJ = $(this).val();
					$("#jobgroupid2").prop("value",sJ);
				})
				
				
				</script>
					
			<input type="hidden" name="jobgroupid2" id="jobgroupid2" >
			
				
			</a>	
					
			</div>	 		
				</td> 

		</tr>
		
			<tr>
				<th class="text-center" id="rgbidTxt" style="vertical-align:middle;"><h4>근무지역</h4></th>
				<td>
				<div style="padding:15px 15px 15px 0px;">
				
				<a id="rgbidDiv" >
				
					<select class="selectpicker" data-live-search="true" id="rgbid" name='rgbid' title="선택">
							<c:forEach items="${regionList}" var="RegionVO">
								<option value="${RegionVO.rgbid}">${RegionVO.rgbname}</option>
							</c:forEach>
					</select> 				
			
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<span class="glyphicon glyphicon-remove form-control-feedback" id="rgbidXIcon" aria-hidden="true" style="display:none; right:0;" ></span>
					 <span class="glyphicon glyphicon-ok form-control-feedback" id="rgbidOKIcon" aria-hidden="true" style="display:none; right:0"></span>
			
				</a>	
				
				<% int subRegionNum;
				   subRegionNum = 65; /* A~Q 출력을 위한 스크립틀릿 */
				%>
				
				
				<a id="subRegionDiv"> 
					
					
				<c:forEach begin="1" end="${regionCount}" varStatus="status">
					<%	
						String a = Character.toString((char)subRegionNum); /* 숫자를 알파벳으로 바꿈 */
					   request.setAttribute("subRegionNum", a); /* 바꾼 알파벳을 jstl로 사용하기위해 뿌려줌 */
					%>	
					
				
						
				<select class="selectpicker" data-live-search="true" id="subRegion${subRegionNum}" name='subRegion' title="선택">
												
							<c:forEach items="${subRegionList}" var="RegionVO">

								<c:if test="${RegionVO.rgbid==subRegionNum}">
								
									<option value="${RegionVO.rgsid}">${RegionVO.rgsname}</option>
									
								</c:if>
								
							</c:forEach>
					</select> 	

				<%subRegionNum++;%> <!-- 숫자 ++ -->
				
				</c:forEach>
				
			
				</a>
				<br>
				<br>
				<input id="pac-input" class="controls" type="text" placeholder="Search Box">
				<input type="hidden" name="lat" id="lat">
				<input type="hidden" name="lng" id="lng">
				<input type="hidden" name="location" id="test">
				<div id="map"></div>
					
				</div>
				
				<script>
				$("select[name=subRegion]").selectpicker('hide');       /* 소분류 forEach문으로 출력한거 숨기기 위해 사용 */
				
				$("select[name='rgbid']").on("change",function(){  /* 대분류 선택하면 대분류에 맞는 소분류 show */
					var regionId = $(this).val();
					$("select[name=subRegion]").selectpicker('hide');
				
					$("#subRegion"+regionId).selectpicker('show');
					
				})
				
				$("select[name=subRegion]").on("change",function(){  
					var sR = $(this).val();
					$("#rgsid").prop("value",sR);
				})
				
				</script>
				
					<script>
					
					changelatlan = "";
					var e = jQuery.Event( "keypress", { keyCode: 13 } ); 
					
					
			$("#rgbid").change(function(){
				changelatlan = "";
				changelatlan += $(this).children("option:selected").text();	
				
				$("#pac-input").val(changelatlan);
				alert(changelatlan);
				

			})
			$("select[name=subRegion]").change(function(){
				cuts = changelatlan.split(' ');
				changelatlan = cuts[0];
				changelatlan += " "
				changelatlan += $(this).children("option:selected").text();
				$("#pac-input").val(changelatlan);
				alert(changelatlan);
			})
			</script>
			
		<input type="button" id="hohoho" value="hohotest"/>
		
		<script>
		var e = jQuery.Event("keydown");

		e.which = 13; // # Some key code value


		$("#hohoho").on("click",function(){
			
			$("#pac-input").focus();
			alert("hi");
			
			alert("hi");
			alert("hi");
			alert("hi");
			$("#pac-input").trigger(e);
		})
		</script> 
				
	
				<input type="hidden" name="rgsid" id="rgsid"> <!-- rgsid 전송용 -->
				
				</td>
			</tr>
			
			<tr>
				<th class="text-center" id="jobdescTxt" style="vertical-align:middle;"><h4>담당업무</h4></th>
				<td>
					<div id="jobdescDiv">
						<textarea class="form-control" style="resize: none" id="jobdesc"
						name="jobdesc" cols="30" rows="5" >${RecruitVO.jobdesc}</textarea>
						<span class="glyphicon glyphicon-remove form-control-feedback" id="jobdescXIcon" aria-hidden="true" style="display:none"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback" id="jobdescOKIcon" aria-hidden="true" style="display:none"></span>
					</div>
				</td>
			</tr>
			
			<tr>
			
				<th class="text-center" id="recruitnumTxt" style="vertical-align:middle;"><h4>모집인원</h4></th>
				<td>
				
				<div style="padding:15px 15px 15px 0px;">
				
				<div id="numChk">
				<input type="radio" name="recruitnum" id="num1" value="1"><label class="form-check-label" for="num1">&nbsp;<h5>1명</h5></label>
				<input type="radio" name="recruitnum" id="num2" value="2"><label class="form-check-label" for="num2">&nbsp;<h5>2명</h5></label>
				<input type="radio" name="recruitnum" id="num3" value="3"><label class="form-check-label" for="num3">&nbsp;<h5>3명</h5></label>
				<input type="radio" name="recruitnum" id="num4" value="4"><label class="form-check-label" for="num4">&nbsp;<h5>4명</h5></label>
				<input type="radio" name="recruitnum" id="num5">&nbsp;<input type="text" name="recruitnum" id="numText" style="background-color: rgb(249, 249, 249);" />명
				</div>
				
				</div>
				</td>
			</tr>
			
			<script>
			 $("#numChk > input[type='checkbox']").on("click",function(){
			
				$("#numChk > input[type='checkbox'] ").prop("checked",false);
				$("#numChk > input[type='checkbox'] ").prop("name","");	
				
				$(this).prop("checked",true)
				$(this).prop("name","recruitnum");
				
				
			}) 
			
			$("#numText").focusin(function(){
				
				$("#numText").css("background-color","rgb(255,255,255)")
				$("#numChk > input[type='checkbox']").prop("checked",false);
				$("#num5").prop("checked",true)
				
			})
			$("#numText").focusout(function(){
				
				if($("#numText").val().length==0){
				$("#numText").css("background-color","rgb(249,249,249)")
				$("#num5").prop("checked",false)
				}else{
				$("#num5").prop("value",$("#numText").val());
				}
			})
			</script>
			<tr>
				<th class="text-center" id="employstatusidTxt" style="vertical-align:middle;"><h4>근무형태</h4></th>
				<td>
				
				<div style="padding:15px 15px 15px 0px;">
				
				<a id="employstatusidDiv">
				
				<select class="selectpicker" id="employstatusid" name="employstatusid" title="선택">
						
					<c:forEach items="${codeList}" var="CodeVO">
					<c:if test="${CodeVO.tid==4}">
					
					<option value="${CodeVO.id}">${CodeVO.career}</option>
					
					</c:if>
					</c:forEach>
				</select>
				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						<span class="glyphicon glyphicon-remove form-control-feedback" id="employstatusidXIcon" aria-hidden="true" style="display:none"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback" id="employstatusidOKIcon" aria-hidden="true" style="display:none"></span>
						
				</a>
				
				</div>
			
				</td>
			</tr>
			
			
			<script>
			
			$("#states > * ").on("click",function(){
				$("#states > * ").prop("checked",false);
				$("#states > * ").prop("name","");	
				$(this).prop("checked",true)
				$(this).prop("name","employstatusid");
			})
						
			</script>
		
			<tr>
				<th class="text-center" id="salaryidTxt" style="vertical-align:middle;"><h4>급여사항</h4></th>
				<td>
				
				<div style="padding:15px 15px 15px 0px;">
				
				<a id="salaryidDiv">
				
					<select class="selectpicker" id="salaryid" name="salaryid" title="선택">
						
						<c:forEach items="${codeList}" var="CodeVO">
							<c:if test="${CodeVO.tid==7}">
								<option value="${CodeVO.id}">${CodeVO.career}</option>
							</c:if>
						</c:forEach>
					</select>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						<span class="glyphicon glyphicon-remove form-control-feedback" id="salaryidXIcon" aria-hidden="true" style="display:none"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback" id="salaryidOKIcon" aria-hidden="true" style="display:none"></span>
						
						
				</a>
				
				</div>
				
				</td>
				
			</tr>
			<tr>
			
				<th class="text-center" id="eduTxt" style="vertical-align:middle;"><h4>학력</h4></th>
				<td>
				
				<div style="padding:15px 15px 15px 0px;">
				
				<a id="eduDiv">
				
					<select name="edu" id="edu" class="selectpicker" title="선택">

						<c:forEach items="${codeList}" var="CodeVO">
							<c:if test="${CodeVO.tid==2}">

								<option value="${CodeVO.id}">${CodeVO.career}</option>

							</c:if>
						</c:forEach>

				</select>


					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						<span class="glyphicon glyphicon-remove form-control-feedback" id="eduXIcon" aria-hidden="true" style="display:none"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback" id="eduOKIcon" aria-hidden="true" style="display:none"></span>
						
						
						
				</a>
				
			</div>
				</td>
			</tr>
			
			<tr>
				<th class="text-center" id="expTxt" style="vertical-align:middle;"><h4>경력</h4></th>
				<td>
				
				
				<div style="padding:15px 15px 15px 0px;">
				
				<a id="expDiv">
				
				<select name="exp" id="exp" class="selectpicker" title="선택">

						<c:forEach items="${codeList}" var="CodeVO">
							<c:if test="${CodeVO.tid==1}">
								
								<option value="${CodeVO.id}">${CodeVO.career}</option>
								
							</c:if>
						</c:forEach>

				</select>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						<span class="glyphicon glyphicon-remove form-control-feedback" id="expXIcon" aria-hidden="true" style="display:none"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback" id="expOKIcon" aria-hidden="true" style="display:none"></span>
						
				
				</a>
							
				</div>
				
				</td>
			</tr>
			<tr>
				<th class="text-center" id="adddescTxt" style="vertical-align:middle;"><h4>상세내용 및 우대사항<br>(공통자격요건)</h4></th>
				
				<td>
				
				<div id="adddescDiv" style="margin-bottom:0px;">
				
				<textarea style="resize: none" class="form-control" id="adddesc"
					name="adddesc" cols="30" rows="10" required>${RecruitVO.adddesc}</textarea>
				
				 <span class="glyphicon glyphicon-remove form-control-feedback" id="adddescXIcon" aria-hidden="true" style="display:none"></span>
  				 <span class="glyphicon glyphicon-ok form-control-feedback" id="adddescOKIcon" aria-hidden="true" style="display:none"></span>
				
				
				</div>
				
				
				</td>
				
			</tr>
		
			<tr>
				<th class="text-center" id="periodTxt" style="vertical-align:middle;"><h4>접수기간</h4></th>
				<td>
				
					<div class="form-inline">
					
						<div class="input-group date" data-provide="datepicker" >
							<input type="text" class="form-control" id="periodStart" name="periodstart"  style="width:150px;">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
						
						~
						<div class="input-group date" data-provide="datepicker" >
							<input type="text" class="form-control" id="period" name="period" style="width:150px;"> 
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
					</div>
					
				</td>
			</tr>
			<tr>
				<th class="text-center" id="acceptmethodTxt" style="vertical-align:middle;"><h4>접수방법</h4></th>
				<td>
				
				
				<div style="padding:15px 15px 15px 0px;">
				
				
				
				<input type="radio" name="acceptmethod" id="acceptmethod1" value="홈페이지접수"><label class="form-check-label" for="acceptmethod1">&nbsp;홈페이지접수</label>&nbsp;
				<input type="radio" name="acceptmethod" id="acceptmethod2" value="즉시지원"><label class="form-check-label" for="acceptmethod2">&nbsp;즉시지원</label>
			
			</div>
				</td>
			</tr>
			
		

		</table>
		
		<br>
		<br>
		<p class="lead">
			<h2>채용정보 공유 및 등록제한 규정</h2>
		</p>
		
		<div style="text-center">
		<hr>

			<font>등록하신 채용공고는 각종 사이트에 동시 게재됩니다.</font> <input id="TAC" type="checkbox"  style=""/> <b style="font-size:15px">동의합니다.</b>
			
		<hr>
		
			※ 채용공고가 아래와 같은 경우 법에 따라 처벌 받을 수 있으며, 모니터링으로 공고가 게재되지 않을 수 있습니다.<br>
				- 연령에 제한을 두거나 성별을 분리하여 모집하는 경우<br>
				- 최저임금 미만 이거나 채용공고 내용이 법령을 위반하는 경우<br>
				- 불량정보 유형에 속하는 채용정보일 경우 <a style="padding-left:50%" data-toggle=modal data-target=#myModal>공고등록 제한 규정 안내<span style="cursor:pointer" class="glyphicon glyphicon-triangle-bottom"></span></a>

		<br> 
		<br>
		</div> 

	<table>
	<tr class="text-center">
	<th class="text-center " style=" display: inline-table">
	
		<button class="button button--antiman button--inverted button--border-thin button--text-thick button--size-m" name="actionBtns" type="submit" id="sbm"><span id="sbmSpan" style="color:white;">등록</span></button> 
		
		
		<button class="button button--antiman button--inverted button--border-thin button--text-thick button--size-m" name="actionBtns" id="cancle"><span id="cancleSpan" style="color:white;">취소</span></button> <br>
		
	</th>
	</tr>
	
		</table>
		
	</form>
	
		<div id="myModal" class="modal fade" role="dialog">
 	 <div class="modal-dialog modal-md" >
	   <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" name="offLoad" id="off" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">등록 불가 및 주의사항</h3>
        </div>
        <div class="modal-body">
    
    <div class="container1">
    
    <br>
    
	1.채용공고의 내용은 명확하고 상세하게 작성해 주시기 바랍니다.
	<br>
	<br>
	2.<r>
	허위/과장된 채용공고 등록 후, 입사지원자의 개인 정보를 무분별하게 수집하는<br>
	이력서 피싱이 성행하고 있습니다. recruIT의 개인회원을 대상으로 이력서 피싱을 <br>
	벌일 경우, 강력한 법적 조치가 행해질 수 있습니다. </r>
	<br>
	<br>
	3.아래 유형의 공고는 <r>불량 채용정보 정책에 의해 채용공고 등록이 불가하며,</r> <br>
	작성자 동의 없이 삭제될 수 있습니다.
	<br>
	<br>
	4.또한 아래 유형의 공고는 필요에 따라 회원서비스의 이용 제한 및 탈퇴 조치를 <br>
	취할 수 있습니다. <br>
	
	<br>
	<h4>[불량정보 유형]</h4>
	1. 직업안정법, 연령차별금지법, 남녀고용평등법, 최저임금법에 위배되는 공고 
	<br>
	<br>
	2.구직자로부터 임금체납, 허위 공고, 급여, 처우 등에 대한 신고가 접수된 기업의 공고 
	<br>
	<br>
	3.구인 목적이 아닌 창업 관련 홍보, 사이트 홍보, 체인점 모집, 동업자 모집 공고
	<br>
	<br>
	4.불법성인오락실, 도박장, 게임장의 공고
	<br>
	<br>
	5.불법다단계, 피라미드 방식으로 물품을 판매하거나 온라인 홍보 요원, 가입자를<br>
	유치하는 공고
	<br>
	<br>
	6.회원가입비, 등록비, 소개비 등의 선입금을 요구하는 공고
	<br>
	<br>
	7.교육비, 수강료를 요구하는 수강생 모집 공고, 학원 공고
	<br>
	<br>
	8.구직자의 개인 정보 수집을 목적으로 하는 공고
	<br>
	<br>
	9.사업자 등록번호나 기업명 도용 등 기업정보를 허위로 등록하는 기업의 공고
	<br>
	<br>
	10.고소득, 월 000만 원 보장 등의 표현을 기재하여 구직자를 현혹하는 공고
	<br>
	<br>
	11.홍보를 목적으로 동일한 내용의 공고를 반복적으로 기재한 기업의 공고
	<br>
	<br>
	12.기본급이 보장되지 않고, 개인의 실적에 따라 급여가 지급되는 기업의 공고
	<br>
	<br>
	13.근무시간, 근무장소, 급여, 모집 내용이 자세하게 기재되지 않은 공고
	<br>
	<br>
	14.취업 수수료 등 취업 관련 비용이 필요한 공고(지입, 인력 용역, 운송 등)
	<br>
	<br>
	15.홍보를 목적으로 업무 내용과 무관한 업직종을<br>
	선택하거나 근무지와 무관한 지역을 다수 선택한 공고
	<br>
	<br>
	16.선거법 위반 공고 (특정 후보를 지지하는 게시글을 올리는 행위)
	<br>
	<br>
	17.불법파견, 불량직업소개소, 고객사 정보로 가입된 파견·대행의 공고
	<br>
	<br>
	18.기타 관계 법규에 위배되는 내용이거나 사이트의 원활한 운영을 위하여 운영자가
	<br>필요하다고 판단한 경우
	<br>
	<br>
	19.작성자가 제시한 급여, 직종, 업무내용, 근로조건 등이 실제와 현저히 다른 공고
	<br>
	<br>
	20.“회사”의 저작권 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
	<br>
	<br>
	21.온라인으로 통신 상품을 홍보하는 홍보 요원 모집과 가입자를 유치하는 공고

</div>
		</div>
					
  
          
      
        </div>
        
        
      
       </div>
       
       
    </div>
	
	<script>
	
	$("button[name='actionBtns']").mouseenter(function(){
		
		span = $(this).attr("id")+"Span";
		
		$("#"+span).css("color","black");
		
	})
	
	$("button[name='actionBtns']").mouseout(function(){
		
		span = $(this).attr("id")+"Span";
		
		$("#"+span).css("color","white");
	})
	</script>
	
	<script>
	
	$("#cancle").on("click",function(){
		
		self.location = "/company/C_manage";
		
	})
	</script>
	
	<script>

var map;

 function initAutocomplete() {
	 
	 llat = "";
	 llng = "";
	 
	 llat1 = "<c:out value="${CInfoVO.lat}"/>";
	 llng1 = "<c:out value="${CInfoVO.lng}"/>";
	 
	 llat = Number(llat1);
	 llng = Number(llng1);
	 
	 
		 if("<c:out value="${CInfoVO.lat}"/>"==""){
			var map = new google.maps.Map(document.getElementById('map'), {
	        	
		          center: {lat: 37.49794199999999, lng: 127.02762099999995},
		          zoom: 13,
		          mapTypeId: 'roadmap'
		        });
		}else if("<c:out value="${CInfoVO.lat}"/>"!=""){ 
			 
			
			
			var map = new google.maps.Map(document.getElementById('map'), {
		        	
		          center: {lat: llat, lng: llng},
		          zoom: 13,
		          mapTypeId: 'roadmap'
		        });
		}
		
       
        
        

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));
            
            var lat = place.geometry.location.lat()
            var lng = place.geometry.location.lng()
				
           		$("#lat").attr("value","");
            	$("#lng").attr("value","");
            	
            	$("#lat").attr("value",lat);
            	$("#lng").attr("value",lng);
			
				
            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
        
        map.addListener('click', function(event) {
        	
        	
            deleteMarkers();
        
            addMarker(event.latLng);
        
           
           
          });
        
        function addMarker(location) {
    	    var marker = new google.maps.Marker({
    	      position: location,
    	      map: map
    	    });
    	 	
    	    
    	    
    	    markers.push(marker);
    	    
    	    var lat = location.lat();
            var lng = location.lng();
				
           		$("#lat").attr("value","");
            	$("#lng").attr("value","");
            	
            	$("#lat").attr("value",lat);
            	$("#lng").attr("value",lng);
            
            	
           		
           		
    	  }
    	  
    	//Sets the map on all markers in the array.
    	  function setMapOnAll(map) {
    	    for (var i = 0; i < markers.length; i++) {
    	      markers[i].setMap(map);
    	    }
    	  }
    	  
    	  function deleteMarkers() {
    	      clearMarkers();
    	      markers = [];
    	    }
    	  
    	  function clearMarkers() {
    	      setMapOnAll(null);
    	  }
    	 
          addMarker(map.center);
          
      } 
 
 </script>
	
	<script>
	$("#sbm").on("click",function(e){
		
		if($("#title").val()==""){   /* 타이틀 유효성 검사 */
			
			$("#titleDiv").addClass("form-group has-error has-feedback"); 
			$("#titleTxt").css("color","#a94442")
			$("#titleXIcon").css("display","");
			$("#title").focus();
			
			e.preventDefault();
			
		}else{
			$("#titleDiv").removeClass(); 
			$("#titleXIcon").css("display","none");
			$("#titleDiv").addClass("form-group has-success has-feedback");
			$("#titleTxt").css("color","#3c763d")
			$("#titleOKIcon").css("display","");
			
		}
		
		if($("#jobdesc").val()==""){
			
			$("#jobdescDiv").addClass("form-group has-error has-feedback"); 
			$("#jobdescTxt").css("color","#a94442")
			$("#jobdescXIcon").css("display","");
			$("#jobdesc").focus();
			
		}else{
			
			$("#jobdescDiv").removeClass(); 
			$("#jobdescXIcon").css("display","none");
			$("#jobdescDiv").addClass("form-group has-success has-feedback");
			$("#jobdescTxt").css("color","#3c763d")
			$("#jobdescOKIcon").css("display","");
			
		}
		
		if($("#adddesc").val()==""){
			
			$("#adddescDiv").addClass("form-group has-error has-feedback"); 
			$("#adddescTxt").css("color","#a94442")
			$("#adddescXIcon").css("display","");
			$("#adddesc").focus();
			
		}else{
			
			$("#adddescDiv").removeClass(); 
			$("#adddescXIcon").css("display","none");
			$("#adddescDiv").addClass("form-group has-success has-feedback");
			$("#adddescTxt").css("color","#3c763d")
			$("#adddescOKIcon").css("display","");
			
		}
		
		if($("#jobGroup").val()==""){
			
			$("#jobGroupDiv").addClass("form-group has-error has-feedback"); 
			$("#jobGroupTxt").css("color","#a94442")
			$("#jobGroupXIcon").css("display","");
			$("#jobGroup").focus();
			
			
		}else{
			
			$("#jobGroupDiv").removeClass(); 
		 	$("#jobGroupXIcon").css("display","none"); 
			$("#jobGroupDiv").addClass("form-group has-success has-feedback"); 
			$("#jobGroupTxt").css("color","#3c763d")
			$("#jobGroupOKIcon").css("display","");
			$("#jobGroup").focus();
			
			var jN = $("#jobGroup").val();
			
			if($("#subJob"+jN).val()==""){
				
				$("#subJobgroupDiv").addClass("form-group has-error has-feedback"); 
				$("#jobGroupTxt").css("color","#a94442")
				$("#subJobgroupXIcon").css("display","");
				$("#subJobgroup").focus();
				e.preventDefault(); 
			
			
				}else{
					
					
					$("#subJobgroupDiv").removeClass(); 
					$("#subJobgroupDiv").addClass("form-group has-success has-feedback"); 
					$("#jobGroupTxt").css("color","#3c763d");
					$("#subJobgroupXIcon").css("display","none");
					$("#subJobgroupOKIcon").css("display","");
					$("#subJobgroup").focus();
			
					
				}
			
		}
		
		
		
		
		if($("#rgbid").val()==""){
			
			$("#rgbidDiv").addClass("form-group has-error has-feedback"); 
			$("#rgbidTxt").css("color","#a94442")
			$("#rgbidXIcon").css("display","");
			$("#rgbid").focus();
			e.preventDefault();
			
		}else{
			
			$("#rgbidDiv").removeClass(); 
			$("#rgbidXIcon").css("display","none");
			$("#rgbidDiv").addClass("form-group has-success has-feedback");
			$("#rgbidTxt").css("color","#3c763d")
			$("#rgbidOKIcon").css("display","");
			
			var jN = $("#rgbid").val();
			
			
			if($("#subRegion"+jN).val()==""){
				
			
				
				$("#subRegionDiv").addClass("form-group has-error has-feedback"); 
				$("#rgbidTxt").css("color","#a94442")
				$("#subRegionXIcon").css("display","");
				$("#subRegion").focus();
				e.preventDefault(); 
			
			
				}else{
					
					
					$("#subRegionDiv").removeClass(); 
					$("#subRegionDiv").addClass("form-group has-success has-feedback"); 
					$("#rgbidTxt").css("color","#3c763d");
					$("#subRegionXIcon").css("display","none");
					$("#subRegionOKIcon").css("display","");
					$("#subRegion").focus();
			
					
				}
			
			}
		
	
			if($("#employstatusid").val()==""){
			
			
			
				$("#employstatusidDiv").addClass("form-group has-error has-feedback"); 
				$("#employstatusidTxt").css("color","#a94442")
				$("#employstatusidXIcon").css("display","");
				$("#employstatusid").focus();
				e.preventDefault(); 
		
		
				}else{
				
				
				$("#employstatusidDiv").removeClass(); 
				$("#employstatusidDiv").addClass("form-group has-success has-feedback"); 
				$("#employstatusidTxt").css("color","#3c763d");
				$("#employstatusidXIcon").css("display","none");
				$("#employstatusidOKIcon").css("display","");
				$("#employstatusid").focus();
				
				}
		
				if($("#salaryid").val()==""){
			
			
			
				$("#salaryidDiv").addClass("form-group has-error has-feedback"); 
				$("#salaryidTxt").css("color","#a94442")
				$("#salaryidXIcon").css("display","");
				$("#salaryid").focus();
				e.preventDefault(); 
		
			
				}else{
				
				
				$("#salaryidDiv").removeClass(); 
				$("#salaryidDiv").addClass("form-group has-success has-feedback"); 
				$("#salaryidTxt").css("color","#3c763d");
				$("#salaryidXIcon").css("display","none");
				$("#salaryidOKIcon").css("display","");
				$("#salaryid").focus();
				
				}
			
				if($("#edu").val()==""){
				
				
				
				$("#eduDiv").addClass("form-group has-error has-feedback"); 
				$("#eduTxt").css("color","#a94442")
				$("#eduXIcon").css("display","");
				$("#edu").focus();
				e.preventDefault(); 
			
			
				}else{
					
					
					$("#eduDiv").removeClass(); 
					$("#eduDiv").addClass("form-group has-success has-feedback"); 
					$("#eduTxt").css("color","#3c763d");
					$("#eduXIcon").css("display","none");
					$("#eduOKIcon").css("display","");
					$("#edu").focus();
					
				}
			
			
				if($("#exp").val()==""){
				
				
				
				$("#expDiv").addClass("form-group has-error has-feedback"); 
				$("#expTxt").css("color","#a94442")
				$("#expXIcon").css("display","");
				$("#exp").focus();
				e.preventDefault(); 
			
			
				}else{
					
					
					$("#expDiv").removeClass(); 
					$("#expDiv").addClass("form-group has-success has-feedback"); 
					$("#expTxt").css("color","#3c763d");
					$("#expXIcon").css("display","none");
					$("#expOKIcon").css("display","");
					$("#exp").focus();
					
				}
			
			if($("input[type=radio][name='recruitnum']:checked").val()==undefined){
					
				$("#recruitnumTxt").css("color","#a94442")
				$("#recruitnumXIcon").css("display","");
				$("#recruitnum").focus();
				e.preventDefault(); 
			
				
			}else{
				$("#recruitnumTxt").css("color","#3c763d");
				$("#recruitnumXIcon").css("display","none");
				$("#recruitnumOKIcon").css("display","");
				$("#recruitnum").focus();
				
				
			}
			
			
			if($("input[type=radio][name='acceptmethod']:checked").val()==undefined){
				
				$("#acceptmethodTxt").css("color","#a94442")
				$("#recruitnum").focus();
				e.preventDefault(); 
			
				
			}else{
				$("#acceptmethodTxt").css("color","#3c763d");
				
				$("#acceptmethod").focus();
				
				
			}
		
			if($("#period").val()==""){
				
				$("#periodTxt").css("color","#a94442")
				$("#period").focus();
				e.preventDefault(); 
			
				
			}else{
				$("#periodTxt").css("color","#3c763d");
				
				$("#period").focus();
				
				
			}
			
			if($("#TAC").is(":checked")==false){
				e.preventDefault(); 
				alert("이용약관에 동의해주세요");		
			}
			
			
			
		
	})
	</script>
	

	<!-- // 공고 입력 부분 끝 -->
</div>
<!-- // 공고 작성 바디 끝 -->

<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy/mm/dd",
			language : "kr"
		});
	});	
</script>



<script>
	$(document).ready(function(){
		
		$(".btn-group bootstrap-select").css("background","red");
		
	})
</script>

 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3xjt6_kAjGLYyJN4Mjvd_3coDo3nB7tg&libraries=places&callback=initAutocomplete"
    async defer></script> <!--api 스크립트 -->



<%@include file="../include/cfooter.jsp"%>
