<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<%-- <form role="form">
		<input type='hidden' name='id' value="${PUserVO.id}">
</form> --%>
<!-- 기업 채용공고 목록 -->
<div class="col-md-9">
	<div class="table-responsive">			
		<h1 class="ci_name">${PUserVO.pname}</h1><h4>님의 이력서 관리 (이력서 목록)</h4>
		<!-- button type = "button" id = "delete-button" class="btn btn-success" onclick="location.href='/personal/Rremove?bno=${ResumeVO.bno}'">삭제</button -->
		<button type = "button" id = "delete-button" class="btn btn-danger col-md-offset-11">삭제</button>
		<br><br>
		<table class="table table-bordered">
			<tr>
				<th style="width: 55px;">관리</th>
				<th style="width: 55px;">순번</th>
				<th>이력서 제목</th>
				<th style="width: 60px;">관리</th>
			</tr>
			
			<c:forEach items="${ResumeVOList}" var="ResumeVO">		
			<tr>
				<td><input id="${ResumeVO.bno}" type="checkbox"></td>
				<td>${ResumeVO.bno}</td>
				<td><a href="/personal/detail?bno=${ResumeVO.bno}">${ResumeVO.title}</a></td>
				<td><button type = "submit" id = "modify-button" class="btn btn-success"  onclick="location.href='/personal/Rmodify?bno=${ResumeVO.bno}'">수정</button></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script>
$(document).ready(function(){
/* 	var formObj = $("form[role = 'form']");
	var formBno = $("form[role = 'formbno']");
	
	$('#delete-button').on("click", function(){
		console.log("#delete-button");
		console.log(formBno);
		formBno.attr("action", "/personal/Rremove");
		formBno.attr("method", "post");
		formBno.submit();
	});
 */	
 var formObj = $("form[role = 'form']");
 
	$('#delete-button').on("click", function(){
		console.log("#delete-button");
		console.log(formObj);
		/* 
		$.ajax({
			type : 'delete',
			url : '/personal' + ${ResumeVO.bno},
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success:function(result){
				console.log("result : " + result);
				if(result == 'SUCCESS'){
					alert("삭제되었습니다.");
				}
			} 
		});*/
		formObj.submit();
	});
});
</script>

<!-- //기업 채용공고 목록 끝 -->

<%@include file="../include/cfooter.jsp"%>
