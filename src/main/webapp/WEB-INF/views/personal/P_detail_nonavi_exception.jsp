<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header_nonavi_resume.jsp"%>

<div class="col-md-9">
	<h1>${bno }번 이력서는 이미 삭제된 이력서 입니다.</h1>
	<br> <br>
</div>
</body>

<script>
$(document).ready(function() {
	alert("                  해당 이력서는 이미 삭제되었습니다.\n                             창이 닫힙니다.");
	window.close();
})
</script>
<%@include file="../include/cfooter.jsp"%>