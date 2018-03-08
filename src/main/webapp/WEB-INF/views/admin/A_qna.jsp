<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/aheader.jsp"%>

<!-- 개인관리 페이지 -->
<div class="col-md-9">
	<h1>Q&A</h1>

	<table class="table table-bordered">
		<tr>
			<th>순번</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>		
	<c:forEach items="${list}" var="CsqnaVO">
		<tr>
			<td>${CsqnaVO.bno}</td>
			<td><a href='/admin/A_qnamod${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${CsqnaVO.bno}'>${CsqnaVO.title}</a></td>
			<td>${CsqnaVO.user}</td>
			<td>${CsqnaVO.regdate }</td>
			<td><span class="badge bg-red">${CsqnaVO.viewcnt }</span></td>
		</tr>
	</c:forEach>
			
	</table>
	
	<!-- pagination -->
	<div style="text-align: center">
		<ul class="pagination">
		
			<c:if test="${pageMaker.prev }">
				<li><a href="A_qna?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
					<a href="A_qna?page=${idx}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="A_qna?page=${pageMaker.endPage + 1}">&raquo;</a></li>
			</c:if>
			
		</ul>
	</div>
	<!-- //pagination-->
</div>
<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");

console.log(formObj);

$("#bpwc").on("click", function(){
	var bpw = $('#bpw').val();
	var bpwchk = $('#bpwc');
	
	if(bpw != ""){
		var bpwchk = prompt("비밀번호를 입력해주세요.");
		if(bpw != bpwchk){
			alert("비밀번호가 일치하지않습니다.");
			/* bpwchk.attr("href", "/cs/S_qna"); */
			self.location = "/cs/S_qna";
		}
	}
		
});

</script>
<!-- //버튼에 대한 스크립트  -->
<!-- 수정, 삭제 처리시 -->
<script type="text/javascript">
var result = '${msg}';

if(result == 'modify'){
	alert("수정 처리가 완료 되었습니다.");
}else if(result == 'remove'){
	alert("삭제가 완료 되었습니다.");
}else if(result == 'regist'){
	alert("Q&A가 등록 되었습니다..");
}
</script>
<!-- //수정, 삭제 처리시 -->

<%@include file="../include/cfooter.jsp"%>