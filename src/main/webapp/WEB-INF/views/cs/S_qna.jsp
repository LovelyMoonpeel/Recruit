<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

<!-- 개인관리 페이지 -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
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
			<td><input class="qnamodal ${CsqnaVO.bno}" type="hidden" data-toggle="modal" data-target="#bpwModal" data-bno="${CsqnaVO.bno}">
				<a href='javascript:;' class="qnadetail" data-bno="${CsqnaVO.bno}">${CsqnaVO.title}<strong> [ ${CsqnaVO.reply} ]</strong>
				<c:if test="${!empty CsqnaVO.bpw}"><img src="/resources/rpjt/img/Lock-icon.png" width="15px"></c:if>
				</a></td>
			<td>${CsqnaVO.user}</td>
			<td>${CsqnaVO.regdate }</td>
			<td><span class="badge bg-info">${CsqnaVO.viewcnt }</span></td>
		</tr>
	</c:forEach>
			
	</table>
	
	<button class="btn btn-success" type="button" onclick="location.href='/cs/qnareg'">작성</button>

	<!-- pagination -->
	<div style="text-align: center">
		<ul class="pagination">
		
			<c:if test="${pageMaker.prev }">
				<li><a href="qna?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
					<a href="qna?page=${idx}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="qna?page=${pageMaker.endPage + 1}">&raquo;</a></li>
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
     <button type="button" class="close" data-dismiss="modal">&times;</button>
     <h4 class="modal-title"></h4>
    </div>
    <div class="modal-body" data-bno>
     <p><input type="password" id="bpwchk" class="form-control" placeholder="비밀번호를 입력해주세요." autofocus></p>
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
var sbno = "";
console.log(formObj);

/* 비밀번호 확인 Modal */
$(".qnadetail").on("click", function(){
	var bnoObj = $(this);
	var bno = bnoObj.attr("data-bno");

	$.ajax({
		type:'POST',
		url:'/cs/S_qnaread/pwc/'+bno,
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override":"POST"},
		data:JSON.stringify({bno:bno}),
		dataType:'text',
		success:function(result){
			if(result == ""){
				self.location = "/cs/qnaread?bno="+bno;
			}else{
				$("."+bno).click();
			}
		}});
	/* $(".modal-title").html(bno); */
/* 	sbno = bno;
	alert("bno : " + bno);
	alert("sbno : "+sbno); */
});
/* alert(sbno); */
$(".qnamodal").on("click", function(){
	/* alert("qnamodal"+sbno);
	console.log("qnamodal"+sbno); */
	var bnoObj = $(this);
	var bno = bnoObj.attr("data-bno");
	
	$(".modal-title").html(bnoObj.attr("data-bno"));
	document.getElementById('bpwchk').focus();
	$('#bpwchk').focus();
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
/* 			console.log("result: "+result);
			alert("result : "+result); */
			if(result == bpw){
				/* alert("비밀번호가 일치합니다."); */
				bpwObj.val("");
				self.location = "/cs/qnaread?bno="+bno;
			}else{
				alert("비밀번호 불일치");
				bpwObj.val("");
			}
		}});
});

$('#bpwchk').keypress(function(event){
	if(event.which == 13){
		$('#qnabpw').click();
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
}else if(result == 'login'){
	alert("로그인이 필요합니다.");
}else if(result == 'fail'){
	alert("잘못된 접근입니다.");
}
</script>
<!-- //수정, 삭제 처리시 -->

<%@include file="../include/cfooter.jsp"%>