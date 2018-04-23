<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<div class="col-md-9">			
	<p class="lead"><strong>탈퇴하기</strong></p>

	<div class="well">
		지금 RecruIT를 탈퇴하시면, 
		<br>
		<br>
		그동안 진행했던 채용 이력이 모두 삭제되고, 삭제된 데이터는 복구가 불가능합니다.
		<br>
		<br>
		나중에 다시 채용을 진행하실때, 모든 정보를 처음부터 다시 입력해야하는 번거로움이 있습니다.
		<br>
		<br>
		또한, 지원자들의 이력서, 포트폴리오 등의 자료가 삭제되어 나중에 다시 보실 수 없게 됩니다.
	</div>

	<button type="button" class="btn btn-default">모든 회원 혜택 포기하고 탈퇴하기</button>
</div> 	

<script type="text/javascript">

$(".btn").on("click", function(){
	if(confirm("탈퇴하시겠습니까?")){
	    location.href="/company/C_leaveGo";
	}
});
</script>


<%@include file="../include/cfooter.jsp"%>