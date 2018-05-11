<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<form role="form" method="post">
	<input type="hidden" value="${id}" name="id">
</form>	 

<div class="col-md-9">			
	<p class="lead"><strong>탈퇴하기</strong></p>

	<div class="well">
		<span class="glyphicon glyphicon-exclamation-sign" style="font-size:18px; color:#7F0000"></span>&nbsp;<font style="color:#7F0000; font-size:18px">지금 RecruIT를 탈퇴하시면,</font> 
		<hr>
		<font style="color:#6ca024;">* 그동안 진행했던 채용 이력이 모두 삭제됩니다.</font>
		<br>
		탈퇴를 하시면 진행했던 채용이력이 모두 삭제되며, 삭제된 데이터는 복구가 불가능합니다.
		<br>
		나중에 다시 채용을 진행하실때, 모든 정보를 처음부터 다시 입력해야하는 번거로움이 있습니다.
		<br><br>
		<font style="color:#6ca024;">* 귀사에 지원한 지원자 보기가 불가능해 집니다.</font>
		<br>
		진행 중인 공고 뿐만 아니라 마감된 공고의 지원자까지 관리할 수 있는 ‘지원자 보기’ 서비스는 recruIT 회원에게만 제공됩니다.
		<br>
		지원자들의 이력서가 삭제되어 나중에 다시 보실 수 없게 됩니다.
		<br><br>
		<font style="color:#6ca024;">* 귀사가 관심있게 본 인재들의 정보가 모두 삭제됩니다.</font>
		<br>
		탈퇴를 하시면, 관심있게 지켜보고 스크랩한 인재들의 정보가 모두 삭제됩니다.
		<br>
		또, 마음에 드는 인재를 발견하셔도 연락처를 보실 수 없게 됩니다.
		<br>
		
		
	</div>
	<div class="text-center">
	<button type="button" class="btn btn-danger btn-lg">탈퇴하기</button>
	</div>
</div> 	

<script type="text/javascript">

var formobj = $("form[role='form']");

$(".btn").on("click", function(){
	if(confirm("탈퇴하시겠습니까?")){
	    formobj.submit();
	}
});
</script>


<%@include file="../include/cfooter.jsp"%>