<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/cheader.jsp"%>
<!-- Include dependencies -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/2.9.0/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3.3.2/css/bootstrap.css" />
<!-- Include date range picker plugin -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/1/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/1/daterangepicker-bs3.css" />
 

<!-- Main content -->
<!-- 공고 작성 바디 -->
<div class="col-md-9">
	<input type="hidden" id="bno" value="${RecruitVO.bno}"> <input type="hidden" id="job2" value="${RecruitVO.jobgroupid2}"> <input type="hidden" id="rg2" value="${RecruitVO.rgsid}">
	<form role="form" method="POST">
		<input type="hidden" name="cid" value="${CInfoVO.id}" />
		
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
			
			<tr>
			
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
			
			
					<th class="text-center" id="jobGroupTxt" style="vertical-align:middle;"><h4>직종/직무</h4></th>
				<td>
				
				 <div style="padding:15px 15px 15px 0px;">
				 	<a id="jobGroupDiv">
		 	
					<%-- <input type="text" value="${RecruitVO.jobgroupid}" name="jobgroupid"> --%>
					<select  class="selectpicker" data-live-search="true" id="jobGroup" name="jobgroupid" title="선택">
						<c:forEach items="${jobgroupList}" var="JobGroupVO">
						
							<c:if test="${JobGroupVO.id!=0}">		
								<c:choose>
									<c:when test="${JobGroupVO.id == RecruitVO.jobgroupid}">
										<option value="${JobGroupVO.id}" id="${JobGroupVO.id}" selected="selected">${JobGroupVO.jobgroup}</option>
									</c:when>
									<c:otherwise>
										<option value="${JobGroupVO.id}" id="${JobGroupVO.id}">${JobGroupVO.jobgroup}</option>
									</c:otherwise>
								</c:choose>		
							</c:if>
							
						</c:forEach>
					</select>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<span class="glyphicon glyphicon-remove form-control-feedback" id="jobGroupXIcon" aria-hidden="true" style="display:none; right:0;" ></span>
					 <span class="glyphicon glyphicon-ok form-control-feedback" id="jobGroupOKIcon" aria-hidden="true" style="display:none; right:0"></span>
					 
			</a>
			
				<a id="subJobgroupDiv">	
					
					<c:forEach begin="1" end="${jobGroupCount}" varStatus="status">
						
						<select class="selectpicker" data-live-search="true" id="subJob${status.index}" value="${status.index}" name="subJobgroup" title="선택">
						
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
					$("#jobgroupid2").prop("value","");
				})
				
				
				$("select[name=subJobgroup]").on("change",function(){  /* 대분류 선택하면 대분류에 맞는 소분류 show */
					var sJ = $(this).val();
					$("#jobgroupid2").prop("value",sJ);
				})
				
				
				</script>
				
				<input type="hidden" name="jobgroupid2" id="jobgroupid2" value="${RecruitVO.jobgroupid2}" > <!-- jobgroupid2 전송용  -->
				
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
					
				<span class="glyphicon glyphicon-remove form-control-feedback" id="subJobgroupXIcon" aria-hidden="true" style="display:none;  right:0" ></span>
				<span class="glyphicon glyphicon-ok form-control-feedback" id="subJobgroupOKIcon" aria-hidden="true" style="display:none;  right:0"></span>
				
			</a>	
					
			</div>	 	
			
				</td>
			</tr>
			
			
			
			<tr>
				
				<th class="text-center" id="rgbidTxt" style="vertical-align:middle;"><h4>근무지역</h4></th>
				<td>
				<div style="padding:15px 15px 15px 0px;">
				
				<a id="rgbidDiv" >
				
					<select  class="selectpicker" data-live-search="true" id="region" name='rgbid'>
						<c:forEach items="${regionList}" var="RegionVO">
							<c:choose>
								<c:when test="${RegionVO.rgbid == RecruitVO.rgbid}">
									<option value="${RegionVO.rgbid}" selected="selected">${RegionVO.rgbname}</option>
								</c:when>
								<c:otherwise>
									<option value="${RegionVO.rgbid}">${RegionVO.rgbname}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<span class="glyphicon glyphicon-remove form-control-feedback" id="rgbidXIcon" aria-hidden="true" style="display:none; right:0;" ></span>
					 <span class="glyphicon glyphicon-ok form-control-feedback" id="rgbidOKIcon" aria-hidden="true" style="display:none; right:0"></span>
			
					</a>


					<% int subRegionNum;
				   subRegionNum = 65; /* A~Q 출력을 위한 스크립틀릿 */
				%>
				
				
				<a id="subRegion"> 
					
					
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
				
				<!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				<span class="glyphicon glyphicon-remove form-control-feedback" id="subRegionXIcon" aria-hidden="true" style="display:none; " ></span>
				<span class="glyphicon glyphicon-ok form-control-feedback" id="subRegionOKIcon" aria-hidden="true" style="display:none; "></span>
		 -->
				</a>
					
				</div>
				
				
				<script>
				$("select[name=subRegion]").selectpicker('hide');       /* 소분류 forEach문으로 출력한거 숨기기 위해 사용 */
				
				$("select[name='rgbid']").on("change",function(){  /* 대분류 선택하면 대분류에 맞는 소분류 show */
					var regionId = $(this).val();
					$("select[name=subRegion]").selectpicker('hide');
				
					$("#subRegion"+regionId).selectpicker('show');
					$("#rgsid").prop("value","");
				})
				
				$("select[name=subRegion]").on("change",function(){  
					var sR = $(this).val();
					$("#rgsid").prop("value",sR);
				})
				
				</script>


				<input type="hidden" name="rgsid" id="rgsid" value="${RecruitVO.rgsid}"> <!-- rgsid 전송용 -->
				
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
				
					<input type="text" name="recruitnum" id="recruitnum" value="${RecruitVO.recruitnum }">명
				
				
				
			
				</div>
				</td>
			</tr>
			<tr>
				<th class="text-center" id="employstatusidTxt" style="vertical-align:middle;"><h4>근무형태</h4></th>
				<td>
				
				<div style="padding:15px 15px 15px 0px;">
				
				<a id="employstatusidDiv">
									<select class="selectpicker" name="employstatusid">
						<option value="">근무형태</option>
						<c:forEach items="${codeList}" var="CodeVO">
							<c:choose>
								<c:when test="${CodeVO.id == RecruitVO.employstatusid}">
									<option value="${CodeVO.id}" selected>${CodeVO.career}</option>
								</c:when>
								<c:otherwise>
									<c:if test="${CodeVO.tid==4}">
										<option value="${CodeVO.id}">${CodeVO.career}</option>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						<span class="glyphicon glyphicon-remove form-control-feedback" id="employstatusidXIcon" aria-hidden="true" style="display:none"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback" id="employstatusidOKIcon" aria-hidden="true" style="display:none"></span>
						
				</a>
				
				</div>
			
				</td>
			</tr>
			
			<tr>
				<th class="text-center" id="salaryidTxt" style="vertical-align:middle;"><h4>급여사항</h4></th>
				<td>
				<div style="padding:15px 15px 15px 0px;">
				
				<a id="salaryidDiv">
					<select class="selectpicker" name="salaryid">
						<option value="">급여사항</option>
						<c:forEach items="${codeList}" var="CodeVO">
							<c:choose>
								<c:when test="${CodeVO.id == RecruitVO.salaryid}">
									<option value="${CodeVO.id}" selected>${CodeVO.career}</option>
								</c:when>
								<c:otherwise>
									<c:if test="${CodeVO.tid==7}">
										<option value="${CodeVO.id}">${CodeVO.career}</option>
									</c:if>
								</c:otherwise>
							</c:choose>
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
					<select class="selectpicker" name="edu">
						<option value="">학력</option>
						<c:forEach items="${codeList}" var="CodeVO">
							<c:choose>
								<c:when test="${CodeVO.id == RecruitVO.edu}">
									<option value="${CodeVO.id}" selected>${CodeVO.career}</option>
								</c:when>
								<c:otherwise>
									<c:if test="${CodeVO.tid==2}">
										<option value="${CodeVO.id}">${CodeVO.career}</option>
									</c:if>
								</c:otherwise>
							</c:choose>
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
				
					<select class="selectpicker" name="exp">
						<option value="">경력</option>
						<c:forEach items="${codeList}" var="CodeVO">
							<c:choose>
								<c:when test="${CodeVO.id == RecruitVO.exp}">
									<option value="${CodeVO.id}" selected>${CodeVO.career}</option>
								</c:when>
								<c:otherwise>
									<c:if test="${CodeVO.tid==1}">
										<option value="${CodeVO.id}">${CodeVO.career}</option>
									</c:if>
								</c:otherwise>
							</c:choose>
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
			<!-- 	<tr>
				<th>접수기간</th>
				<td><input type="date" name="period"> -> <input type="date">
				</td>
			</tr> -->
			<tr>
				<th class="text-center" id="periodTxt" style="vertical-align:middle;"><h4>접수기간</h4></th>
				<td>
				
				<div class="form-inline">
						
							<div class=input-group style="vertical-align:middle;">
								<input type="text" class="form-control" id="startPicker" name="periodstart" value="${RecruitVO.periodstart}" style="width:150px;">
								<span class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i>	
								</span>
							</div>
							~ 
							<div class="input-group" style="vertical-align:middle;">
						<input type="text" class="form-control" id="endPicker" name="period" value="${RecruitVO.period}" style="width:150px;"/>  
						<span class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
						
						</div>
						
			
				</td>
			</tr>
		<tr>
		
			<th class="text-center" id="acceptmethodTxt" style="vertical-align:middle;"><h4>접수방법</h4></th>
			
			<td>
				
				
				<div style="padding:15px 15px 15px 0px;">
					<c:choose>
					
						<c:when test="${RecruitVO.acceptmethod eq '홈페이지접수'}">
							<input type="radio" name="acceptmethod" id="acceptmethod1" value="홈페이지접수" checked><label class="form-check-label" for="acceptmethod1" style="cursor:pointer">&nbsp;<font style="font-size:14px">홈페이지접수</font></label>&nbsp;
							<input type="radio" name="acceptmethod" id="acceptmethod2" value="즉시지원"><label class="form-check-label" for="acceptmethod2" style="cursor:pointer">&nbsp;<font style="font-size:14px">즉시지원</font></label>
						</c:when>
					
						<c:when test="${RecruitVO.acceptmethod eq '즉시지원'}">
					
							<input type="radio" name="acceptmethod" id="acceptmethod1" value="홈페이지접수"><label class="form-check-label" for="acceptmethod1" style="cursor:pointer">&nbsp;<font style="font-size:14px">홈페이지접수</font></label>&nbsp;
							<input type="radio" name="acceptmethod" id="acceptmethod2" value="즉시지원" checked><label class="form-check-label" for="acceptmethod2" style="cursor:pointer">&nbsp;<font style="font-size:14px">즉시지원</font></label>
						
						</c:when>
						
						<c:otherwise>
						<input type="radio" name="acceptmethod" value="홈페이지접수"><label class="form-check-label" for="acceptmethod1" style="cursor:pointer">&nbsp;<font style="font-size:14px">홈페이지접수</font></label>&nbsp;
						<input type="radio" name="acceptmethod" value="즉시지원"><label class="form-check-label" for="acceptmethod2" style="cursor:pointer">&nbsp;<font style="font-size:14px">즉시지원</font></label>
						</c:otherwise>
						
					</c:choose>
				</div>
			</td>
		</tr>

			<%-- <%=request.getParameter("jobgroupid2")%>
			 --%>
		</table>
		<div class="text-center">
	<input type="submit" class="btn btn-primary btn-lg" id="sbm" value="수정">
	
	<input type="button" class="btn btn-danger btn-lg" id="cancel" value="취소">
</div>

	</form>
	<br>
	<br>
	<br>
	<!-- // 공고 입력 부분 끝 -->
</div>
<!-- // 공고 작성 바디 끝 -->
<script>
$("#endPicker").on("click",function(){
	
	$("#startPicker").trigger("click");
	
})


//Apply the date range picker with default settings to the button
$('#startPicker').daterangepicker();

//Apply the date range picker with custom settings to the button
$('#startPicker').daterangepicker({


format: 'MM/DD/YYYY',
startDate: moment(),
endDate: moment(),
minDate: 'today',

showDropdowns: false,
showWeekNumbers: true,
timePicker: false,
timePickerIncrement: 1,
timePicker12Hour: false
,
ranges: {
'일주일':	[moment(), moment().add(6, 'days') ],
'1개월': [moment(), moment().add(1, 'month')],
'2개월': [moment(), moment().add(2, 'month')],
'3개월': [moment(), moment().add(3, 'month')]

},
opens: 'right',
drops: 'down',
buttonClasses: ['btn', 'btn-sm'],
applyClass: 'btn-primary',
cancelClass: 'btn-default',
separator: ' to ',
locale: {
applyLabel: '완료',
cancelLabel: '취소',
fromLabel: '시작일',
toLabel: '마감일',
customRangeLabel: '날짜지정하기',
daysOfWeek: ['일', '월', '화', '수', '목', '금','토'],
monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
firstDay: 1
}
}, function(start, end, label) {

var stt = start.format('YYYY-M-D');
var end = end.format('YYYY-M-D');


$("input[name='periodstart']").val(stt);
$("#endPicker").val(end); 
}); 


</script>


	<script>
	
	$("#sbm").on("click",function(e){
		
		<%@include file="/resources/rpjt/js/CompanyValidator.js" %> /* 유효성 검사용 js 파일 */
			
		
	})
	</script>
	


<script>

$("#cancel").on("click",function(){
	if(confirm("취소하겠습니까?")){
	location.href = "/company/C_manage";
	}
})

$(document).ready(function(){
	
	var mainJob = "<c:out value="${RecruitVO.jobgroupid}"/>";
	var subJob  = "<c:out value="${RecruitVO.jobgroupid2}"/>";
	var mainRgn = "<c:out value="${RecruitVO.rgbid}"/>";
	var subRgn  = "<c:out value="${RecruitVO.rgsid}"/>";
	
	$("#subJob"+mainJob).selectpicker('show'); /* 로드될 때 선택된 서브 잡그룹 소환 */
	
	$("#subJob"+mainJob).selectpicker('val', subJob); /* 로드될 때 저장된 소분류 선택 */
	
	$("#subRegion"+mainRgn).selectpicker('show'); /* 로드될 때 선택된 서브 잡그룹 소환 */
	
	$("#subRegion"+mainRgn).selectpicker('val', subRgn); /* 로드될 때 저장된 소분류 선택 */
	
	var rg2 = $('#rg2').val();
	var job2 = $('#job2').val();
	
	$("#subjobGroup").val(job2);
	$("#subRegion").val(rg2);
});


</script>
<%@include file="../include/cfooter.jsp"%>