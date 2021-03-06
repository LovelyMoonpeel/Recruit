<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/aheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>


<!-- FAQ 수정 페이지 -->
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="col-md-9">



	<h1>FAQ</h1>	
	<form role="form" action="A_faqmod" method="POST">
		<input class="form-control" type="hidden" name="bno" value="${CsVO.bno}" readonly>
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" name="title"
					value="${CsVO.title}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control" name="content" rows="10" style="resize: none;">${CsVO.content}</textarea>
				</td>
			</tr>
		</table>
	</form>
	
	<input type="submit" class="btn btn-warning" value="수정">
	<input type="submit" class="btn btn-danger" value="삭제">
	<input type="button" class="btn btn-primary" value="목록">
		
</div>
<!-- //FAQ 수정 페이지 -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");

/* 수정 버튼 */
$(".btn-warning").on("click", function(){
	if(confirm("수정하시겠습니까?")){
		formObj.submit();
	}
});
/* 삭제 버튼 */
$(".btn-danger").on("click", function(){
	if(confirm("삭제하시겠습니까?")){
		formObj.attr("action", "/admin/sremove");
		formObj.submit();
	}
});
/* 목록 버튼 */
$(".btn-primary").on("click", function(){
	self.location = "/admin/faq";
});

</script>
<!-- //버튼에 대한 스크립트  -->

<%@include file="../include/cfooter.jsp"%>