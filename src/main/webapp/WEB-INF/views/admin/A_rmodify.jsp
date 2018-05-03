<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/aheader.jsp"%>


<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

<!-- Main content -->
<!-- 공고 작성 바디 -->
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="col-md-9">


	<!-- 회사 기본 정보  -->
	<!-- DB에서 값을 불러와서 td에 채워 넣어야 함  -->
	
	<h3>기본정보</h3>
	<table class="table table-bordered">
		<tr>
			<th>기업명</th>
			<td>${CInfoVO.cname}</td>
			<th>대표자명</th>
			<td>${CInfoVO.ceo}</td>
		</tr>
		<tr> 
			<th>업종</th>
			<td colspan="3">${CInfoVO.ctype}</td>
		</tr>
		<tr>
			<th>기업형태</th>
			<td colspan="3">${CInfoVO.form}</td>
		</tr>
		<tr>
			<th>설립일</th>
			<td colspan="3">${CInfoVO.establish}</td>
		</tr>
		<tr>
			<th>매출액</th>
			<td colspan="3">${CInfoVO.sales}</td>
		</tr>
		<tr>
			<th>대표전화</th>
			<td>${CInfoVO.tel}</td>
			<th>FAX</th>
			<td>${CInfoVO.fax}</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td><a href="${CInfoVO.homepage}" class="link_site"
				target="_blank" rel="nofollow">${CInfoVO.homepage}</a></td>
			<th>SNS / 블로그</th>
			<td><a href="${CInfoVO.sns}" class="link_site"
				target="_blank" rel="nofollow">${CInfoVO.sns}</a></td>
		</tr>
		<tr>
			<th>기업주소</th>
			<td colspan="3">${CInfoVO.location}</td>
		</tr>
	</table>
	<br> <br> <br>
	<!-- // 회사 기본 정보 끝 -->
	<!-- 공고 입력 부분 -->
	<h3>모집부문</h3>
	<input type="hidden" id="bno" value="${RecruitVO.bno}"> <input type="hidden" id="job2" value="${RecruitVO.jobgroupid2}"> <input type="hidden" id="rg2" value="${RecruitVO.rgsid}">
	<form role="form" method="POST">
		<input type="hidden" name="cid" value="${CInfoVO.id}" />
		<input type="hidden" name="userid" value="${CInfoVO.id}" />
		<input type="hidden" name="rcno" value="${RecruitVO.bno}" />
		
		<table class="table table-hover" id="my-tbody">
	
			<tr>
				<th class="col-sm-3 text-center"  id="titleTxt" style="vertical-align:middle;" >제목</th>
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
					<th class="text-center" id="jobGroupTxt" style="vertical-align:middle;">직종/직무</th>
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
				
				<th class="text-center" id="rgbidTxt" style="vertical-align:middle;">근무지역</th>
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
				<th class="text-center" id="jobdescTxt" style="vertical-align:middle;">담당업무</th>
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
				<th class="text-center" id="recruitnumTxt" style="vertical-align:middle;">모집인원</th>
				<td>
					<div style="padding:15px 15px 15px 0px;">
				
					<input type="text" name="recruitnum" id="recruitnum" value="${RecruitVO.recruitnum }">명
				
				
				
			
				</div>
				</td>
			</tr>
			<tr>
				<th class="text-center" id="employstatusidTxt" style="vertical-align:middle;">근무형태</th>
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
				<th class="text-center" id="salaryidTxt" style="vertical-align:middle;">급여사항</th>
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
				<th class="text-center" id="eduTxt" style="vertical-align:middle;">학력</th>
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
				<th class="text-center" id="expTxt" style="vertical-align:middle;">경력</th>
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
				<th class="text-center" id="adddescTxt" style="vertical-align:middle;">상세내용 및 우대사항</th>
				
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
				<th class="text-center" id="periodTxt" style="vertical-align:middle;">접수기간</th>
				<td>
				
				<div style="padding:15px 15px 15px 0px;">
					<div class="form-group" style="vertical-align:middle;">
						<div class="input-group date" data-provide="datepicker">
							<input type="text" class="form-control" name="period" value="${RecruitVO.period}"><span class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
					</div>
					</div>
				</td>
			</tr>
			<tr>
				<th class="text-center" id="acceptmethodTxt" style="vertical-align:middle;">접수방법</th>
				<td>
				
				
				<div style="padding:15px 15px 15px 0px;">
									<c:choose>
						<c:when test="${RecruitVO.acceptmethod eq '홈페이지접수'}">
							<input type="radio" name="acceptmethod" value="홈페이지접수" checked>홈페이지접수
				<input type="radio" name="acceptmethod" value="즉시지원">즉시지원
				</c:when>
						<c:when test="${RecruitVO.acceptmethod eq '즉시지원'}">
							<input type="radio" name="acceptmethod" value="홈페이지접수">홈페이지접수 
				<input type="radio" name="acceptmethod" value="즉시지원" checked>즉시지원
				</c:when>
						<c:otherwise>
							<input type="radio" name="acceptmethod" value="홈페이지접수">홈페이지접수 &nbsp;
				<input type="radio" name="acceptmethod" value="즉시지원">즉시지원
				</c:otherwise>
					</c:choose>
				</div>
				</td>
			</tr>

			<%-- <%=request.getParameter("jobgroupid2")%>
			 --%>
		</table>
	</form>
		<br> <br>
		<input class="btn btn-warning" type="submit" value="수정">
		<input class="btn btn-danger" type="submit" value="삭제">
		<input class="btn btn-primary" type="button" value="목록">
		
	<br>
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

<!-- 버튼에 대한 스크립트 -->
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		$(".btn-warning").on("click", function() {
			formObj.attr("action", "A_rmodify");
			formObj.submit();
		});
		
		$(".btn-danger").on("click", function(){
			
			if(confirm("삭제하시겠습니까?")){
				formObj.attr("action", "/admin/rremove");
				formObj.submit();
			}
		});
		
		$(".btn-primary").on("click", function() {
			self.location = "/admin/cmodify?id=${CInfoVO.id}"
		});
	});
</script>
<!-- //버튼에 대한 스크립트 -->

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
		
		
		if($("#jobgroupid2").val()==""){
			
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
		
		
		if($("#rgsid").val()==""){
			
		
			
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
		
		if($("#recruitnum").val()==""){
				
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
		
	
})
</script>

<script>
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
	
	console.log("rg2 : "+rg2);
	console.log("job2 : "+job2);
	$("#subjobGroup").val(job2);
	$("#subRegion").val(rg2);
});
</script>


<%@include file="../include/cfooter.jsp"%>