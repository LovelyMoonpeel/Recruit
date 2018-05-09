<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

<%
	String btn = "hidden";
	try{
		if(id.equals("admin")){
			btn = "submit";
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!-- 공지사항 Read 페이지 -->
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="container col-md-9">



	<h1>공지사항</h1>	
	<form role="form" method="GET">
		<input class="form-control" type="hidden" name="bno" value="${CsVO.bno}" readonly>
	</form>
	<table class="table table-bordered">
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td>${CsVO.title}</td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td>${content}</td>
		</tr>
	</table>
	
	<input type=<%=btn %> class="btn btn-warning" value="수정">
	<input type=<%=btn %> class="btn btn-danger" value="삭제">
	<input type="submit" class="btn btn-primary" value="목록">
		
</div>
<!-- //관리자정보수정 페이지 -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");

$(".btn-warning").on("click", function(){
	if(confirm("수정하시겠습니까?")){
		formObj.attr("action", "/cs/noticemod")
		formObj.submit();
	}
});

$(".btn-danger").on("click", function(){
	if(confirm("삭제하시겠습니까?")){
		formObj.attr("action", "/cs/noticeremove");
		formObj.attr("method", "POST");
		formObj.submit();
	}
});

$(".btn-primary").on("click", function(){
	self.location = "/cs/notice";
});

</script>
<!-- //버튼에 대한 스크립트  -->

<%@include file="../include/cfooter.jsp"%>