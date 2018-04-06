<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="../include/cheader.jsp"%>


<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>



<!-- Main content -->
<!-- 공고 작성 바디 -->
<div class="col-md-9 ">

	<p class="lead">
		<strong>채용공고작성</strong>
	</p>

<style>
</style>

	<!-- 공고 입력 부분 -->
	<form role="form" method="POST">	
	
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
       
    })
   
</script>
<style>
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
					<th class="text-center" id="jobGroupTxt" style="vertical-align:middle;">직종/직무</th>
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
				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
			<span class="glyphicon glyphicon-remove form-control-feedback" id="subRegionXIcon" aria-hidden="true" style="display:none; " ></span>
			<span class="glyphicon glyphicon-ok form-control-feedback" id="subRegionOKIcon" aria-hidden="true" style="display:none; "></span>
			
				</a>
					
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
				
	
				<input type="hidden" name="rgsid" id="rgsid"> <!-- rgsid 전송용 -->
				
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
				
				<div id="numChk">
				<input type="radio" name="recruitnum" id="num1" value="1"><label class="form-check-label" for="num1">&nbsp;1명</label>
				<input type="radio" name="recruitnum" id="num2" value="2"><label class="form-check-label" for="num2">&nbsp;2명</label>
				<input type="radio" name="recruitnum" id="num3" value="3"><label class="form-check-label" for="num3">&nbsp;3명</label>
				<input type="radio" name="recruitnum" id="num4" value="4"><label class="form-check-label" for="num4">&nbsp;4명</label>
				<input type="radio" name="recruitnum" id="num5">&nbsp;<input type="text" name="recruitnum" id="numText" style="background-color: rgb(249, 249, 249);" />명
				</div>
				
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
						<span class="glyphicon glyphicon-remove form-control-feedback" id="recruitnumXIcon" aria-hidden="true" style="display:none"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback" id="recruitnumOKIcon" aria-hidden="true" style="display:none"></span>
					
				</div>
				</td>
			</tr>
			
			<script>
			$("#numChk > input[type='checkbox']").on("click",function(){
				
				
				$("#numChk > input[type='checkbox'] ").prop("checked",false);
				$("#numChk > input[type='checkbox'] ").prop("name","");	
				
				$(this).prop("checked",true)
				$(this).prop("name","recruitnum");
				$("#numText").prop("value","")
				
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
				<th class="text-center" id="employstatusidTxt" style="vertical-align:middle;">근무형태</th>
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
				<th class="text-center" id="salaryidTxt" style="vertical-align:middle;">급여사항</th>
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
			
				<th class="text-center" id="eduTxt" style="vertical-align:middle;">학력</th>
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
				<th class="text-center" id="expTxt" style="vertical-align:middle;">경력</th>
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
		
			<tr>
				<th class="text-center" id="periodTxt" style="vertical-align:middle;">접수기간</th>
				<td>
				
					<div style="padding:15px 15px 15px 0px;">
				
					<div class="form-group" style="vertical-align:middle;">
						<div class="input-group date" data-provide="datepicker" >
							<input type="text" class="form-control" id="period" name="period" /> <span
								class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
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
				
				
				
				<input type="radio" name="acceptmethod" id="acceptmethod1" value="홈페이지접수"><label class="form-check-label" for="acceptmethod1">&nbsp;홈페이지접수</label>&nbsp;
				<input type="radio" name="acceptmethod" id="acceptmethod2" value="즉시지원"><label class="form-check-label" for="acceptmethod2">&nbsp;즉시지원</label>
			
			</div>
				</td>
			</tr>

		</table>



		<br> 
		<br> 
		<input class="btn btn-primary" type="submit" id="sbm"
			value="등록"> <br>
	</form>
	
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



<%@include file="../include/cfooter.jsp"%>

<div class="progress">
  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
    100%
  </div>
</div>