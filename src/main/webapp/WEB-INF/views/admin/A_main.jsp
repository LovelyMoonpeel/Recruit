<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/aheader.jsp"%>


<!-- 개인관리 페이지 -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<!-- <div class="col-md-9"> -->
	<h1>개인회원 리스트</h1>

	<table class="table table-hover">
		<tr>
			<th>아이디</th>
			<th>회원이름</th>
			<th>이메일</th>
			<th>생년월일</th>
			<th>회원정보수정</th>
		</tr>		
	<c:forEach items="${list}" var="BoardVO">
		<tr>
			<td>${BoardVO.id}</td>
			<td>${BoardVO.pname}</td>
			<td>${BoardVO.email}</td>
			<td>${BoardVO.birth}</td>
			<td><input class="btn btn-success" type="button" onclick="location.href='/admin/modify${pageMaker.makeSearch(pageMaker.cri.page)}&id=${BoardVO.id }'" value="회원정보수정"></td>
		</tr>
	</c:forEach>
			
	</table>

	<!-- pagination -->
	<div style="text-align: center">
		<ul class="pagination">
		
			<c:if test="${pageMaker.prev }">
				<li><a href="main?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
					<a href="main${pageMaker.makeSearch(idx)}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="main?page=${pageMaker.endPage + 1}">&raquo;</a></li>
			</c:if>
			
		</ul>
	</div>
	<!-- //pagination-->

<!-- 검색 스크립트  -->
<script type="text/javascript">
	$(function(){
		$('#searchBtn').on("click", function(event){
			self.location = "main"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
		
		$('#keywordInput').keypress(function(event){
			if(event.which == 13){
				$('#searchBtn').click();
			}
		});
	});
	
	
</script>
<!-- //검색 스크립트  -->

	<!-- 검색 -->
	<div class="box-body">
		<select name="searchType">
			<option value="non" <c:out value="${cri.searchType == null?'selected':'' }"/>>----</option>
			<option value="id" <c:out value="${cri.searchType eq 'id'?'selected':'' }"/>>아이디</option>
			<option value="pname" <c:out value="${cri.searchType eq 'pname'?'selected':'' }"/>>이름</option>
			<option value="email" <c:out value="${cri.searchType eq 'email'?'selected':'' }"/>>이메일</option>
		</select>
	<input type = "text" name='keyword' id="keywordInput" value='${cri.keyword }'>
	<button id='searchBtn'>검색</button>
	</div>
	<!-- //검색 -->
</div>
<!-- //개인관리 페이지 -->
<!-- /.container -->




<!-- 수정, 삭제 처리시 -->
<script type="text/javascript">
var result = '${msg}';

if(result == 'modify'){
	alert("수정 처리가 완료 되었습니다.");
}else if(result == 'remove'){
	alert("삭제가 완료 되었습니다.");
}else if(result == 'amodify'){
	alert("관리자 정보가 수정 되었습니다.");
}
</script>
<!-- //수정, 삭제 처리시 -->

<%@include file="../include/cfooter.jsp"%>