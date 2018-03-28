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
	<div class="row">
		<label><h2>&nbsp;&nbsp;&nbsp;&nbsp;채용공고작성</h2></label>
	</div>

	<!-- 공고 입력 부분 -->
	<form role="form" method="POST">
	
	<h3>공고제목</h3>
	<input type="text" name="title" class="form-control" value="${RecruitVO.title}" required> <br>
	
		<table class="table table-bordered" id="my-tbody">
			<tr>
				<th>모집직종</th>
				<td>
				<%-- <input type="text" value="${RecruitVO.jobgroupid}" name="jobgroupid"> --%>
				<select id="jobGroup" name="jobgroupid">
				<option value="0">모집직종</option>
					<c:forEach items="${jobgroupList}" var="JobGroupVO">
				
					<option value="${JobGroupVO.id}">${JobGroupVO.jobgroup}</option>
					
				
				
					</c:forEach>
				</select> 
				
				<select id="subjobGroup" name="jobgroupid2">
				</select>
				
				<a id="jobgroupZone">
				
				</a>
				</td> 
				
			</tr>
			<tr>
				<th>근무지역</th>
				<td>
				<select id="region" name='rgbid'>
					<option value="Z">근무지역</option>
					<c:forEach items="${regionList}" var="RegionVO">
						<option value="${RegionVO.rgbid}">${RegionVO.rgbname}</option>
					</c:forEach>
				</select>
				
				<select id="subRegion" name='rgsid'>
				</select>				
				</td>
			</tr>
			<tr>
				<th>담당업무</th>
				<td><textarea class="form-control" style="resize:none" name="jobdesc" cols="30" rows="5">${RecruitVO.jobdesc}</textarea></td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td><input type="text" name="recruitnum" value="${RecruitVO.recruitnum }">명</td>
			</tr>
			<tr>
				<th>근무형태</th>
				<td>
				<select name="employstatusid">
					<option value="102">근무형태</option>
						
					<c:forEach items="${codeList}" var="CodeVO">
					<c:if test="${CodeVO.tid==4}">
					
					<option value="${CodeVO.id}">${CodeVO.career}</option>
					
					</c:if>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>급여사항</th>
				<td>
				<select name="salaryid">
					<option value="102">급여사항</option>
					<c:forEach items="${codeList}" var="CodeVO">
						<c:if test="${CodeVO.tid==7}">
							<option value="${CodeVO.id}">${CodeVO.career}</option>
						</c:if>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>학력</th>
				<td><select name="edu">
						<option value="102">학력</option>
						
						<c:forEach items="${codeList}" var="CodeVO">
						<c:if test="${CodeVO.tid==2}">
						
						<option value="${CodeVO.id}">${CodeVO.career}</option>
						
						</c:if>
						</c:forEach>
						
				</select></td>
			</tr>
			<tr>
				<th>경력</th>
				<td><select name="exp">
						<option value="102">경력</option>
						
						<c:forEach items="${codeList}" var="CodeVO">
						<c:if test="${CodeVO.tid==1}">
						
						<option value="${CodeVO.id}">${CodeVO.career}</option>
						
						</c:if>
						</c:forEach>
						
				</select></td>
			</tr>
			<tr>
				<th>상세내용 및 우대사항</th>
				<td><textarea style="resize:none" class="form-control" name="adddesc" cols="30" rows="10" required>${RecruitVO.adddesc}</textarea></td>
			</tr>
		<!-- 	<tr>
				<th>접수기간</th>
				<td><input type="date" name="period"> -> <input type="date">
				</td>
			</tr> -->
			<tr>
			<th>접수기간</th>
			<td>
				
				
		<div class="form-group">
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" name="period"/>  <span
					class="input-group-addon"> <i
					class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
		</div>
	
			</td>
			</tr>
			<tr>
				<th>접수방법</th>
				<td><input type="radio" name="acceptmethod" value="홈페이지접수">홈페이지접수 &nbsp;
				<input type="radio" name="acceptmethod" value="즉시지원">즉시지원</td>
			</tr>
			
		</table>
		
			<br> <br> <input class="btn btn-primary" type="submit"
			value="등록">
	<br>
	</form>
		
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
	$("#jobGroup").change(function() {
		var largeNum = $(this).val();
		SubJobGroup(largeNum);
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
			var str2 = "";
			$(data).each(
					function() {
						str += "<option name='rgsid' value="+this.rgsid+">" + this.rgsname
								+ "</option>";
					});
			/* str2 += "<option value=102>선택하세요</option>"; */
			
			str2 += str;
			
			$("#subRegion").html(str);
		})
	}
</script>

<%@include file="../include/cfooter.jsp"%>