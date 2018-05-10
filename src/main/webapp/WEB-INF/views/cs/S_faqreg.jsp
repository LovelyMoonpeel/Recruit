<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

<!-- FAQ 등록 페이지 -->
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="col-md-9">



	<h1>FAQ</h1>	
	<form role="form" action="S_faqreg" method="POST">
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control" cols="7" rows="10"  name="content" style="resize:none;"></textarea>
				</td>
				
			</tr>
		</table>
	</form>
	
	<input type="submit" class="btn btn-warning" value="등록">
	<input type="button" class="btn btn-primary" value="목록">
		
</div>
<!-- //FAQ 등록 페이지 -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");

//console.log(formObj);

/* 등록버튼 */
$(".btn-warning").on("click", function(){
	if(confirm("등록하시겠습니까?")){
		formObj.submit();
	}
});

/* 목록버튼 */
$(".btn-primary").on("click", function(){
	self.location = "/cs/faq";
});

</script>
<!-- //버튼에 대한 스크립트  -->

<%@include file="../include/cfooter.jsp"%>