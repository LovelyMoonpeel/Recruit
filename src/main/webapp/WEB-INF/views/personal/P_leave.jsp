<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>

<form role="form" method='post'>
	<input type="hidden" value="${PUser.id}" >
</form>
<div class="col-md-9">			
	<p class="lead"><strong>탈퇴하기</strong></p>

	<div class="well">
		지금 RecruIT를 탈퇴하시면, 
		<br>
		<br>
		정성껏 작성한 이력서가 모두 삭제됩니다.
		<br>
		<br>
		혹시 지원회사별로 작성한 이력서가 여러 개 있진 않으신가요? 
		<br>
		<br>
		탈퇴를 하시면 모든 이력서가 삭제 처리됩니다.
		<br>
		<br>
		<span style="color:red"><strong><big>삭제된 데이터는 복구가 불가능합니다.</big></strong></span> 
		<br>
		<br>
		입사지원을 하시려면 이력서를 또!! 작성하셔야 하는 번거로움이 있습니다.
		<br>
		<br>
		정말 탈퇴하시겠습니까?
	</div>

	<button type="submit" id ="delete-id" class="btn btn-danger">탈퇴하기</button>
</div> 	

<script type="text/javascript">

var formobj = $("form[role='form']");

$(".btn").on("click", function(){
	if(confirm("탈퇴하시겠습니까?")){
		alert("탈퇴되었습니다.");
		formobj.attr("action", "leave");
		formobj.submit();
	}
});
</script>


<%@include file="../include/cfooter.jsp"%>