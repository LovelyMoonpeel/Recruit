<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>


<!-- 개인정보수정 페이지 -->
<div class="col-md-9">



	<h1>Q&A</h1>	
	<form role="form" method="POST">
		<input class="form-control" type="hidden" name="bno" value="${CsqnaVO.bno}" readonly>
	</form>
	<table class="table table-bordered">
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td><input class="form-control" type="text" name="title"
				value="${CsqnaVO.title}" readonly></td>
		</tr>
		<tr>
			<th>아이디</th>
		</tr>
		<tr>
			<td><input class="form-control" type="text" name="user"
				value="${CsqnaVO.user}" readonly></td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td><textarea class="form-control" name="content" 
			readonly>${CsqnaVO.content}</textarea></td>
		</tr>
	</table>
	
	<input type="submit" class="btn btn-warning" value="수정">
	<input type="submit" class="btn btn-danger" value="삭제">
	<input type="submit" class="btn btn-primary" value="목록">
		
</div>
<!-- //관리자정보수정 페이지 -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");

console.log(formObj);

$(".btn-warning").on("click", function(){
	if(confirm("수정할랭?")){
		formObj.attr("action", "/cs/S_qnamod");
		formObj.attr("method", "GET");
		formObj.submit();
	}
});

$(".btn-danger").on("click", function(){
	if(confirm("삭제하시겠습니까?")){
		formObj.attr("action", "/cs/qremove");
		formObj.submit();
	}
});

$(".btn-primary").on("click", function(){
	self.location = "/cs/S_qna";
});

</script>
<!-- //버튼에 대한 스크립트  -->

<%@include file="../include/cfooter.jsp"%>