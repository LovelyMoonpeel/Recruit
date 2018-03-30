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
		<table class="table" id="my-tbody">
			<tr>
				<th class="col-sm-3 text-center">공고제목</th>
				<td><input type="text" name="title" class="form-control" 
						value="${RecruitVO.title}" required></td>
			</tr>
		
			<tr>
				<th class="text-center">모집직종</th>
				<td>
					<%-- <input type="text" value="${RecruitVO.jobgroupid}" name="jobgroupid"> --%>
					<select id="jobGroup" name="jobgroupid">
						<option value="0">모집직종</option>
						<c:forEach items="${jobgroupList}" var="JobGroupVO">
							<option value="${JobGroupVO.id}">${JobGroupVO.jobgroup}</option>
						</c:forEach>
					</select> 
					
					<select id="subjobGroup" name="jobgroupid2" style="display:none">
					
					</select> 
				
				</td>

			</tr>
			
			<tr>
				<th class="text-center">근무지역</th>
				<td>
					<select id="region" name='rgbid'>
						<option value="Z">근무지역</option>
							<c:forEach items="${regionList}" var="RegionVO">
								<option value="${RegionVO.rgbid}">${RegionVO.rgbname}</option>
							</c:forEach>
					</select> 				
					<select id="subRegion" name='rgsid' style="display:none"></select>
				</td>
			</tr>
			
			<tr>
				<th class="text-center">담당업무</th>
				<td>
					<textarea class="form-control" style="resize: none"
						name="jobdesc" cols="30" rows="5">${RecruitVO.jobdesc}</textarea>
				</td>
			</tr>
			
			<tr>
				<th class="text-center">모집인원</th>
				<td>
				<input type="checkbox"><label class="form-check-label" for="defaultCheck1">1명</label>
				<input type="checkbox"><label class="form-check-label" for="defaultCheck1">2명</label>
				<input type="checkbox"><label class="form-check-label" for="defaultCheck1">3명</label>
				<input type="checkbox"><label class="form-check-label" for="defaultCheck1">4명</label>
				<input type="text"/>
				</td>
			</tr>
			
			<script>
			$(document).ready(function(){
				
				
				
			})
			</script>
			<tr>
				<th class="text-center">근무형태</th>
				<td>
					<div id="states">
						<c:forEach items="${codeList}" var="CodeVO">
							<c:if test="${CodeVO.tid==4}">
								<input type="checkbox" id="statesChk" value="${CodeVO.id}" name><label class="form-check-label" for="defaultCheck1"> ${CodeVO.career} </label>
							</c:if>
						</c:forEach>
					</div>
				</td>
			</tr>
			
			<Script>
			
			$(document).on("click","#statesChk",function(){
				
				$("#states > * ").checked = true;




				
				/* $(this).attr('checked','checked'){
					$("#statesChk").not(this).attr('checked',"");
					} */
				
			})
			
			/* $("#states >  *"). */
			
			</Script>
			<tr>
				<th class="text-center">급여사항</th>
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
			
				<th class="text-center">학력</th>
				<td>
				<input type="radio">학력무관 <input type="radio">제한
					<select name="edu" class="selectpicker">
						<option value="102">학력</option>

						<c:forEach items="${codeList}" var="CodeVO">
							<c:if test="${CodeVO.tid==2}">

								<option value="${CodeVO.id}">${CodeVO.career}</option>

							</c:if>
						</c:forEach>

				</select></td>
			</tr>
			<tr>
				<th class="text-center">경력</th>
				<td>
				
				<input type="checkbox" value="${CodeVO.id}"><label class="form-check-label" for="defaultCheck1">신입</label>
				<input type="checkbox" value="${CodeVO.id}"><label class="form-check-label" for="defaultCheck1">경력</label>
				<input type="checkbox" value="${CodeVO.id}"><label class="form-check-label" for="defaultCheck1">경력무관</label>
				
				</td>
			</tr>
			<tr>
				<th class="text-center">상세내용 및 우대사항</th>
				<td><textarea style="resize: none" class="form-control"
						name="adddesc" cols="30" rows="10" required>${RecruitVO.adddesc}</textarea></td>
			</tr>
		
			<tr>
				<th class="text-center">접수기간</th>
				<td>
				
				<input type="checkbox"/>1개월
				<input type="checkbox"/>2개월
				
					<div class="form-group">
						<div class="input-group date" data-provide="datepicker">
							<input type="text" class="form-control" name="period" /> <span
								class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
					</div>

				</td>
			</tr>
			<tr>
				<th class="text-center">접수방법</th>
				<td><input type="radio" name="acceptmethod" value="홈페이지접수">홈페이지접수
					&nbsp; <input type="radio" name="acceptmethod" value="즉시지원">즉시지원</td>
			</tr>

		</table>

		<br> 
		<br> 
		<input class="btn btn-primary" type="submit"
			value="등록"> <br>
	</form>
	
	<button id="test">테스트</button>

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

$("#test").on("click",function(){
alert("hi");
	alert($("#subjobGroup option").index($("#subjobGroup option:selected")).val());
	
})



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
		$("#subjobGroup").css("display","")
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
			$("#subRegion").css("display","");
		})
	}
</script>

<%@include file="../include/cfooter.jsp"%>