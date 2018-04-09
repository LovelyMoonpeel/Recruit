<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/aheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />


<!-- 개인정보수정 페이지 -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<!-- <div class="col-md-9"> -->



	<h1>Q&A</h1>	
	<form role="form" action="A_qnamod" method="POST">
		<input type='hidden' name='bno' value="${CsqnaVO.bno}">
		<table class="table table-bordered">
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td><input class="form-control" type="text" name="title"
				value="${CsqnaVO.title}"></td>
		</tr>
		<tr>
			<th>아이디</th>
		</tr>
		<tr>
			<td><input class="form-control" type="text" name="user"
				value="${CsqnaVO.user}" readonly></td>
		</tr>
		<tr>
			<th>게시글 비밀번호</th>
		</tr>
		<tr>
			<td><input class="form-control" type="password" name="bpw" id="bpw"
				value="${CsqnaVO.bpw}"></td>
		</tr>
		<tr>
			<th>게시글 비밀번호 확인</th>
		</tr>
		<tr>
			<td><input class="form-control" type="password" name="bpwc" id="bpwc">
			<span id="bpwchk"></span></td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td><textarea class="form-control" id="decontent" rows="10" name="content" style="resize: none;">${CsqnaVO.content}</textarea></td>
		</tr>
	</table>
	</form>
	
	<form role="formlist">
    	<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	</form>

	<input type="submit" id="smodify" class="btn btn-warning" value="수정">
	<input type="submit" id="sremove" class="btn btn-danger" value="삭제">
	<input type="submit" class="btn btn-primary" value="목록">
	
	<!-- 댓글달기 창 -->
	<div class="row">
	<div class="col-md-12">
	 <div class="box box-success">
	  <div class="box-header">
	   <h3 class="box-title">댓글 달기</h3>
	  </div>
	  <div class="box-body">
	   <input type='hidden' id='bno' name='bno' value="${CsqnaVO.bno}">
	   <textarea class="form-control" placeholder="댓글 내용" id="newReplyText" rows="5" style="resize: none;"></textarea>
	  </div>
	  <div class="box-footer">
	   <button type="submit" class="btn btn-success" id="replyAddBtn">댓글 달기</button>
	  </div>
	 </div>
	</div>
	</div>
	
	<ul class="timeline">
	 <li class="time-label" id="repliesDiv">
	  <button type="button" class="btn btn-info">댓글<small id='replycntSmall'> [ ${CsqnaVO.reply} ] </small></button>
	 </li>
	</ul>
	<ul id="replies"></ul>

<!-- 댓글 수정 Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
 <div class="modal-dialog">
  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
     <input type='hidden' id='bno' name='bno' value="${CsqnaVO.bno}">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
     <h4 class="modal-title"></h4>
    </div>
    <div class="modal-body" data-rno>
     <p><textarea id="content" class="form-control" rows="5" style="resize: none;"></textarea></p>
    </div>
    <div class="modal-footer">
     <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
     <button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
     <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
    </div>
  </div>
 </div>
</div>
<!-- //댓글 수정 Modal -->

</div>
<!-- //관리자정보수정 페이지 -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item">
  <span class="time">
   <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <div class="timeline-body"><textarea class="form-control" readonly rows="5" style="resize: none;">{{content}}</textarea> </div>
   <a class="btn btn-primary btn-xs"
     data-toggle="modal" data-target="#modifyModal">Modify</a>
  </div>
 </div>
</li>
{{/each}}
</script>



<script>
Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year+"/"+month+"/"+date;
});

var printData = function(replyArr, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

</script>

<!-- 댓글보기 -->
<script>
var bno=${CsqnaVO.bno};

function getPage(pageInfo){
	$.getJSON(pageInfo, function(data){
		printData(data, $("#repliesDiv"), $("#template"));
		
		$("#modifyModal").modal('hide');
	});
}

$("#repliesDiv").on("click", function() {

	getPage("/replies/all/" + bno);

});
</script>
<!-- //댓글보기 -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");
var formObjlist = $("form[role='formlist']");

console.log(formObj);
console.log(formObjlist);

/* QnA 수정 */
$("#smodify").on("click", function(){
	var title = $('#title').val();
	var bpw = $('#bpw').val();
	var bpwc = $('#bpwc').val();
	var content = $('#decontent').val();	
	
	if(title != "" && content != ""){
		if(bpw == bpwc){
			if(confirm("수정할랭?")){
				formObj.submit();
			}
		}else{
			alert("비밀번호를 확인해주세요.");
		}
	}else{
		alert("제목이나 내용을 입력해주세요.");
	}
});

/* QnA삭제 */
$("#sremove").on("click", function(){
	if(confirm("삭제하시겠습니까?")){
		formObj.attr("action", "/admin/qremove");
		formObj.submit();
	}
});


/* QnA목록 */
$(".btn-primary").on("click", function(){
	formObjlist.attr("method", "GET");
	formObjlist.attr("action", "/admin/qna");
	formObjlist.submit();
});

/* 댓글 달기 버튼 */
$("#replyAddBtn").on("click", function(event){
	var contentObj = $("#newReplyText");
	var bnoObj = $("#bno");
	var content = contentObj.val();
	var bno = bnoObj.val();
	
	if(content==""){
		alert("댓글 내용을 입력해주세요.");
		event.preventDefault();
	}else{
	$.ajax({
		type:'post',
		url:'/replies/',
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "POST"},
		dataType:'text',
		data: JSON.stringify({bno:bno, content:content}),
		success:function(result){
			console.log("result: " + result);
			if(result == 'success'){
				alert("등록완료");
				contentObj.val("");
				getPage("/replies/all/" + bno);
			}
		}});		
	}
	
});

/* 댓글 수정 Modal */
$(".timeline").on("click", ".replyLi", function(event){
	var reply = $(this);
	
	$("#content").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
});

/* 댓글 수정 버튼 */
$("#replyModBtn").on("click", function(){
	var rno = $(".modal-title").html();
	var content = $("#content").val();
	
	$.ajax({
		type:'put',
		url:'/replies/'+rno,
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override":"PUT"},
		data:JSON.stringify({content:content}),
		dataType:'text',
		success:function(result){
			console.log("result: "+result);
			if(result == 'success'){
				alert("수정 되었습니다.");
				getPage("/replies/all/"+bno);
			}
		}});
});

/* 댓글 삭제 */
$("#replyDelBtn").on("click",function(){
	var rno = $(".modal-title").html();
	var content = $("#content").val();
	var bno = $("#bno").val();
	
	$.ajax({
		type:'delete',
		url:'/replies/'+bno+"/"+rno,
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override":"PUT"},
		dataType:'text',
		success:function(result){
			console.log("result: "+ result);
			if(result == 'success'){
				alert("삭제 되었습니다.");
				getPage("/replies/all/"+bno);
			}
		}
	})
})


</script>
<!-- //버튼에 대한 스크립트  -->



<!-- 비밀번호 일치 여부  -->
<script>
	/* keyup을 통해 비밀번호가 맞는지 확인하는 작업 */

	var bpwchk = $('#bpwchk');  /* 비밀번호 일치여부 받아 줄 텍스트 */
	
	$('#bpwc').keyup(function(){
		if($('#bpw').val() == $('#bpwc').val() && $('#bpwc').val() != ""){
			document.getElementById("bpwchk").innerHTML = "비밀번호가 일치합니다.";
			bpwchk.attr("style", "color:blue")
		}else{
			document.getElementById("bpwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
			bpwchk.attr("style", "color:red")
		}
	})
	
	$('#bpw').keyup(function(){
		if($('#bpw').val() == $('#bpwc').val() && $('#bpw').val() != ""){
			document.getElementById("bpwchk").innerHTML = "비밀번호가 일치합니다.";
			bpwchk.attr("style", "color:blue")
		}else{
			document.getElementById("bpwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
			bpwchk.attr("style", "color:red")
		}
	})
</script>
<!-- //비밀번호 일치 여부  -->



<%@include file="../include/cfooter.jsp"%>