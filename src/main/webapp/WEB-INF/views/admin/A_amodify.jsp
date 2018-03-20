<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../include/aheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>


<!-- 개인정보수정 페이지 -->
<div class="col-md-9">



	<h1>관리자정보 수정</h1>
	<form role="form" action="A_amodify" method="POST">
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<td><input class="form-control" type="text" name="id" value="${BoardVO.id}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input class="form-control" type="text" name="pw" id="pw"
					placeholder="변경할 비밀번호를 입력하세요." value="${BoardVO.pw}"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input class="form-control" type="text" name="pwc" id="pwc"
					placeholder="비밀번호를 다시 입력하세요.">
				<span id="pwchk"></span>				
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input class="form-control" type="text" name="pname" value="${BoardVO.pname}"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input class="form-control" type="text" name="email"
					value="${BoardVO.email}"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
				<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" name="birth" value="${BoardVO.birth}" required>
				<span class="input-group-addon">
				<i class="glyphicon glyphicon-calendar"></i>
				</span>
				</div>
				</td>
			</tr>
			<%-- <fmt:formatDate pattern="yyyy-MM-dd" value="${BoardVO.birth}" /> --%>
		</table>
	</form>
		<input type="submit" class="btn btn-warning" value="수정">
		
</div>
<!-- //관리자정보수정 페이지 -->

<!-- 달력 나오게 하는 스크립트  -->
<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy/mm/dd",
			language : "kr"
		});
	});
</script>
<!-- //달력 나오게 하는 스크립트  -->

<!-- 비밀번호 일치 여부  -->
<script>
	/* keyup을 통해 비밀번호가 맞는지 확인하는 작업 */

	var pwchk = $('#pwchk');
	
	$('#pwc').keyup(function(){
		if($('#pw').val() == $('#pwc').val()){
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치합니다.";
			pwchk.attr("style", "color:blue")
		}else{
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
			pwchk.attr("style", "color:red")
		}
	})
	
	$('#pw').keyup(function(){
		if($('#pw').val() == $('#pwc').val()){
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치합니다.";
			pwchk.attr("style", "color:blue")
		}else{
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
			pwchk.attr("style", "color:red")
		}
	})
</script>
<!-- //비밀번호 일치 여부  -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

$(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();
		
		if(pw==pwc&&(pw!="" || pwc!="")){
			if(confirm("수정하시겠습니까?")){
				formObj.submit();
			}
		}else{
			alert("비밀번호를 확인해주세요.");
		}
	});
	
});
</script>
<!-- //버튼에 대한 스크립트  -->

<%@include file="../include/cfooter.jsp"%>