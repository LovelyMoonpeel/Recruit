<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/aheader.jsp"%>

<!-- 기업회원리스트 페이지 -->
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="col-md-9">
	<h1>기업회원 리스트</h1>

	<table class="table table-hover">
		<tr>
			<th>아이디</th>
			<th>회사명</th>
			<th>담당자명</th>
			<th>이메일</th>
			<th>사업자번호</th>
			<th>회원정보수정</th>
		</tr>		
	<c:forEach items="${list}" var="UserVO">
		<tr>
			<td>${UserVO.id}</td>
			<td>${UserVO.cname}</td>
			<td>${UserVO.pname}</td>
			<td>${UserVO.email}</td>
			<td>${UserVO.registnum}</td>
			<td><input class="btn btn-success" type="button" onclick="location.href='/admin/cmodify${pageMaker.makeSearch(pageMaker.cri.page)}&id=${UserVO.id }'" value="기업정보수정"></td>
		</tr>
	</c:forEach>
			
	</table>

	<!-- pagination -->
	<div style="text-align: center">
		<ul class="pagination">
		
			<c:if test="${pageMaker.prev }">
				<li><a href="company?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
					<a href="company${pageMaker.makeSearch(idx)}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="company?page=${pageMaker.endPage + 1}">&raquo;</a></li>
			</c:if>
			
		</ul>
	</div>
	<!-- //pagination-->

	<!-- 검색 -->
	<div class="box-body">
		<select name="searchType">
			<option value="non" <c:out value="${cri.searchType == null?'selected':'' }"/>>----</option>
			<option value="id" <c:out value="${cri.searchType eq 'id'?'selected':'' }"/>>아이디</option>
			<option value="cname" <c:out value="${cri.searchType eq 'cname'?'selected':'' }"/>>회사명</option>
			<option value="pname" <c:out value="${cri.searchType eq 'pname'?'selected':'' }"/>>이름</option>
			<option value="email" <c:out value="${cri.searchType eq 'email'?'selected':'' }"/>>이메일</option>
			<option value="registnum" <c:out value="${cri.searchType eq 'registnum'?'selected':'' }"/>>사업자번호</option>
		</select>
	<input type = "text" name='keyword' id="keywordInput" value='${cri.keyword }'>
	<button id='searchBtn'>검색</button>
	</div>
	<!-- //검색 -->
	
<!-- 검색 스크립트  -->
<script type="text/javascript">
	$(function(){
		$('#searchBtn').on("click", function(event){
			self.location = "company"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
		
		/* Enter입력시 검색 */
		$('#keywordInput').keypress(function(event){
			if(event.which == 13){
				$('#searchBtn').click();
			}
		});
	});
</script>
<!-- //검색 스크립트  -->
</div>
<!-- //기업회원리스트 페이지 -->
<!-- /.container -->




<!-- 수정, 삭제 처리시 -->
<script type="text/javascript">
var result = '${msg}';

if(result == 'modify'){
	alert("수정 처리가 완료 되었습니다.");
}else if(result == 'remove'){
	alert("삭제가 완료 되었습니다.");
}
</script>
<!-- //수정, 삭제 처리시 -->

<%@include file="../include/cfooter.jsp"%>