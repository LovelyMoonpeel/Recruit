<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

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
			<td><a id="bpwc" class="qnadetail" data-toggle="modal" data-target="#bpwModal" data-bno="${CsqnaVO.bno}">${CsqnaVO.title}<strong> [ ${CsqnaVO.reply} ]</strong></a></td>
			<td>${CsqnaVO.user}</td>
			<td>${CsqnaVO.regdate }</td>
			<td><span class="badge bg-red">${CsqnaVO.viewcnt }</span></td>
		</tr>
	</c:forEach>
			
	</table>
	
	<button class="btn btn-success" type="button" onclick="location.href='/cs/S_qnareg'">작성</button>

	<!-- pagination -->
	<div style="text-align: center">
		<ul class="pagination">
		
			<c:if test="${pageMaker.prev }">
				<li><a href="S_qna?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
					<a href="S_qna?page=${idx}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="S_qna?page=${pageMaker.endPage + 1}">&raquo;</a></li>
			</c:if>
			
		</ul>
	</div>
	<!-- //pagination-->

<!-- 비밀번호 Modal -->
<div id="bpwModal" class="modal modal-primary fade" role="dialog">
 <div class="modal-dialog">
  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
     <input type='hidden' id='bno' name='bno' value="${CsqnaVO.bno}">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
     <h4 class="modal-title"></h4>
    </div>
    <div class="modal-body" data-bno>
     <p><input type="text" id="bpwchk" class="form-control"></p>
    </div>
    <div class="modal-footer">
     <button type="button" class="btn btn-info" id="qnabpw">확인</button>
     <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
    </div>
  </div>
 </div>
</div>
<!-- //비밀번호 Modal -->
</div>
<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");

console.log(formObj);

/* 비밀번호 확인 Modal */
$(".qnadetail").on("click", function(){
	var bno = $(this);
	
	$(".modal-title").html(bno.attr("data-bno"));
});

/* 비밀번호 확인 스크립트 */
$("#qnabpw").on("click", function(){
	var bno = $(".modal-title").html();
	var bpwObj = $("#bpwchk");
	var bpw = $("#bpwchk").val();
	
	$.ajax({
		type:'POST',
		url:'/cs/S_qnaread/'+bno,
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override":"POST"},
		data:JSON.stringify({bno:bno, bpw:bpw}),
		dataType:'text',
		success:function(result){
			console.log("result: "+result);
			if(result == bpw){
				alert("비밀번호가 일치합니다.");
				bpwObj.val("");
				self.location = "/cs/S_qnaread?bno="+bno;
			}else{
				alert("비밀번호 불일치");
				bpwObj.val("");
			}
		}});
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