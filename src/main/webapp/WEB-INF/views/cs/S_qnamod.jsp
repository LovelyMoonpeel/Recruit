<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/sheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>


<!-- Q&A 수정 페이지 -->
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="container col-md-9">



	<h1>Q&A</h1>	
	<form role="form" method="POST">
		<input type="hidden" name="bno" value="${CsqnaVO.bno}">
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
			<td><input class="form-control" type="password" name="bpw" id="bpw"></td>
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
			<td><textarea class="form-control" name="content" rows="10" style="resize: none;">${CsqnaVO.content}</textarea></td>
		</tr>
	</table>
	</form>
	
	<form role="formlist">
    	<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	</form>
	
	<form role="formback">
		<input type="hidden" name="bno" value="${CsqnaVO.bno}">
    	<input type='hidden' name='page' value="${cri.page}">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	</form>
	
	<input type="submit" class="btn btn-warning" value="수정">
	<input type="submit" class="btn btn-primary" value="목록">
	<input type="submit" class="btn btn-default" value="취소">
		
</div>
<!-- //관리자정보수정 페이지 -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");
var formObjlist = $("form[role='formlist']");
var formObjback = $("form[role='formback']");

$(".btn-warning").on("click", function(){
	var title = $('#title').val();
	var bpw = $('#bpw').val();
	var bpwc = $('#bpwc').val();
	var content = $('#content').val();	
	
	if(title != "" && content != ""){
		if(bpw == bpwc){
			if(confirm("수정하시겠습니까?")){
				formObj.attr("action", "/cs/S_qnamod");
				formObj.attr("method", "post");
				formObj.submit();
			}
		}else{
			alert("비밀번호를 확인해주세요.");
		}
	}else{
		alert("제목이나 내용을 입력해주세요.");
	}
});

$(".btn-primary").on("click", function(){
	formObjlist.attr("method", "GET");
	formObjlist.attr("action", "/cs/qna");
	formObjlist.submit();
});

$(".btn-default").on("click", function(){
	formObjback.attr("method", "GET");
	formObjback.attr("action", "/cs/qnaread");
	formObjback.submit();
});

</script>
<!-- //버튼에 대한 스크립트  -->

<!-- 비밀번호 일치 여부  -->
<script>
	/* keyup을 통해 비밀번호가 맞는지 확인하는 작업 */

	var bpwchk = $('#bpwchk');  /* 비밀번호 일치여부 받아 줄 텍스트 */
	
	$('#bpwc').keyup(function(){
		if($('#bpwc').val() != ""){
			if($('#bpw').val() == $('#bpwc').val()){
				document.getElementById("bpwchk").innerHTML = "비밀번호가 일치합니다.";
				bpwchk.attr("style", "color:blue")
			}else{
				document.getElementById("bpwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
				bpwchk.attr("style", "color:red")
			}
		}
	})
	
	$('#bpw').keyup(function(){
		if($('#bpw').val() != ""){
			if($('#bpw').val() == $('#bpwc').val()){
				document.getElementById("bpwchk").innerHTML = "비밀번호가 일치합니다.";
				bpwchk.attr("style", "color:blue")
			}else{
				document.getElementById("bpwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
				bpwchk.attr("style", "color:red")
			}
		}
	})
</script>
<!-- //비밀번호 일치 여부  -->

<%@include file="../include/cfooter.jsp"%>