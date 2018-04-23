<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

<%
	String reg = "hidden";
	try{
		if(id.equals("admin")){
			reg = "button";
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!-- 개인관리 페이지 -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<h1>공지사항</h1>

	<table class="table table-hover">
		<tr>
			<th>제목</th>
		</tr>		
	<c:forEach items="${list}" var="CsVO">
		<tr>
			<td><a href='/cs/noticeread?bno=${CsVO.bno}'>${CsVO.title}</a></td>
		</tr>
	</c:forEach>
			
	</table>
	
	<input class="btn btn-success" type=<%=reg %> onclick="location.href='/cs/noticereg'" value="작성">

</div>

<!-- 수정, 삭제 처리시 -->
<script type="text/javascript">
var result = '${msg}';

if(result == 'modify'){
	alert("수정 처리가 완료 되었습니다.");
}else if(result == 'remove'){
	alert("삭제가 완료 되었습니다.");
}else if(result == 'regist'){
	alert("공지사항이 등록 되었습니다.");
}else if(result == 'fail'){
	alert("접근권한이 없습니다.");
}
</script>
<!-- //수정, 삭제 처리시 -->

<%@include file="../include/cfooter.jsp"%>