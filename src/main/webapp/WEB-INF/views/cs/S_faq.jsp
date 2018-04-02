<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

<!-- 개인관리 페이지 -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<h1>FAQ</h1>

	<table class="table table-bordered">
		<tr>
			<th>제목</th>
		</tr>		
	<c:forEach items="${list}" var="CsfaqVO">
		<tr>
			<td><a href='/cs/faqread?bno=${CsfaqVO.bno}'>${CsfaqVO.title}</a></td>
		</tr>
	</c:forEach>
			
	</table>
	
	<!-- <button class="btn btn-success" type="button" onclick="location.href='/cs/S_faqreg'">작성</button> -->
<!-- <br><br><br><br><br><br><br><br><br><br><br><br> -->
</div>

<!-- 수정, 삭제 처리시 -->
<script type="text/javascript">
var result = '${msg}';

if(result == 'modify'){
	alert("수정 처리가 완료 되었습니다.");
}else if(result == 'remove'){
	alert("삭제가 완료 되었습니다.");
}else if(result == 'regist'){
	alert("FAQ가 등록 되었습니다..");
}else if(result == 'login'){
	alert("로그인이 필요합니다.");
}else if(result == 'NO_per'){
	alert("기업 회원이 아닙니다.");
}else if(result == 'logout'){
	alert("로그아웃 되었습니다.");
}
</script>
<!-- //수정, 삭제 처리시 -->

<%@include file="../include/cfooter.jsp"%>