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
<div class="col-md-9">



<input type="hidden" id="bno" value="${RecruitVO.bno}">
<input type="hidden" id="job2" value="${RecruitVO.jobgroupid2}">
<input type="hidden" id="rg2" value="${RecruitVO.rgsid}">
		
			<form role="form" method="POST">
	<input type="hidden" name="cid" value="${CInfoVO.id}"/>
	<h3>공고제목</h3>
	
	<div class="form-group">
	
			<label>타이틀</label> <input type="text" name="title" class="form-control" id=""
				value="${RecruitVO.title}">
		</div>
		<table class="table table-bordered" id="my-tbody">
			<tr>
				<th class="active">모집직종</th>
				<td>
				<%-- <input type="text" value="${RecruitVO.jobgroupid}" name="jobgroupid"> --%>
				<select id="jobGroup" name="jobgroupid">
				<option value="">모집직종</option>
					<c:forEach items="${jobgroupList}" var="JobGroupVO">
					
					<c:choose>
					<c:when test="${JobGroupVO.id == RecruitVO.jobgroupid}">
					<option value="${JobGroupVO.id}" id="${JobGroupVO.id}" selected="selected">${JobGroupVO.jobgroup}</option>
					</c:when>
					<c:otherwise>
					<option value="${JobGroupVO.id}" id="${JobGroupVO.id}">${JobGroupVO.jobgroup}</option>
					</c:otherwise>
					</c:choose>
					</c:forEach>
				</select> 
				
				<select id="subjobGroup" name="jobgroupid2">
				
				</select>
				
				<a id="jobgroupZone">
				
				</a>
				</td> 
				
			</tr>
			<tr>
				<th class="active">근무지역</th>
				<td>
				<select id="region" name='rgbid'>
					<option value="">근무지역</option>
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
				
				<select id="subRegion" name='rgsid'>
				</select>				
				</td>
			</tr>
			<tr>
				<th class="active">담당업무</th>
				<td><textarea name="jobdesc" cols="30" rows="5">${RecruitVO.jobdesc}</textarea></td>
			</tr>
			<tr>
				<th class="active">모집인원</th>
				<td><input type="text" name="recruitnum" value="${RecruitVO.recruitnum }">명</td>
			</tr>
			<tr>
				<th class="active">근무형태</th>
				<td>
				<select name="employstatusid">
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
				</td>
			</tr>
			<tr>
				<th class="active">급여사항</th>
				<td>
				<select name="salaryid">
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
				</td>
			</tr>
			<tr>
				<th class="active">학력</th>
				<td><select name="edu">
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
						
				</select></td>
			</tr>
			<tr>
				<th class="active">경력</th>
				<td><select name="exp">
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
						
				</select></td>
			</tr>
			<tr>
				<th class="active">상세내용 및 우대사항</th>
				<td><textarea name="adddesc" cols="30" rows="10">${RecruitVO.adddesc}</textarea></td>
			</tr>
		<!-- 	<tr>
				<th>접수기간</th>
				<td><input type="date" name="period"> -> <input type="date">
				</td>
			</tr> -->
			<tr>
			<th class="active">접수기간</th>
			<td>
				
				
		<div class="form-group"> 
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" name="period"/ value="${RecruitVO.period}"><span
					class="input-group-addon"> <i
					class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
		</div>
	
			</td>
			</tr>
			<tr>
				<th class="active">접수방법</th>
				<td>
				<c:choose>
				
				<c:when test="${RecruitVO.acceptmethod eq '홈페이지지원'}">
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
				</td>
			</tr>
		
			<%-- <%=request.getParameter("jobgroupid2")%>
			 --%>
		</table>
	</form>
		<br> <br> <input class="btn btn-primary" type="submit"
			value="등록">
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

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		$(".btn-primary").on("click", function() {			
			formObj.submit();
		});
	});
</script>

<script>



	$("#region").change(function() {
		var largeNum = $(this).val();
		SubRegion(largeNum)
	})
	
		$("#region option").each(function() {
			var largeNum = $(this).val();
		if($(this).is(':selected')){
			SubRegion(largeNum)
	}
	}) 
	
	var selectedOption = $("#jobGroup option:selected").val();
	
	
		
 	$("#jobGroup").change(function(){
 		
 		$("#"+selectedOption).removeAttr("selected");
 		
 		
 	 /* $("#"+selectedOption+" > option[@value="+selectedOption+"]").prop("selected", false);
 	 */	
 	 	$(this).find("option:eq("+$(this).val()+")").attr("selected", "selected");
 		
 		selectedOption = $(this).val();
 		SubJobGroup(selectedOption);
		
	}) 
	
	$("#jobGroup option").each(function() {
		var largeNum = $(this).val();
		if($(this).is(':selected')){
		SubJobGroup(largeNum);
	}
	}) 
	function SubJobGroup(largeNum) {
		$.getJSON("/companyAjax/jobGroup/" + largeNum, function(data) {
			var str = "";
			$(data).each(
					function() {
						str += "<option name='jobgruopid' value="+this.id+">"
								+ this.jobgroup + "</option>";
					});
			$("#subjobGroup").html(str);
		})
	}
	function SubRegion(largeNum) {
		$.getJSON("/companyAjax/region/" + largeNum, function(data) {
			var str = "";
			$(data).each(
					function() {
						str += "<option name='rgsid' value="+this.rgsid+">" + this.rgsname
								+ "</option>";
					});
			$("#subRegion").html(str);
		})
	}
</script>

<script>
$(document).ready(function(){

	var rg2 = $('#rg2').val();
	var job2 = $('#job2').val();
	
	$("#subjobGroup").val(job2);
	$("#subRegion").val(rg2);
})


</script>

<%@include file="../include/cfooter.jsp"%>