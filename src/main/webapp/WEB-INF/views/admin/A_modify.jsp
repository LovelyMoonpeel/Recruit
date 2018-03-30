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
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<!-- <div class="col-md-9"> -->



	<h1>회원정보 수정</h1>
	<form role="form" action="A_modify" method="POST">
     <input type='hidden' name='page' value="${cri.page}">
     <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
     <input type='hidden' name='searchType' value="${cri.searchType}">
     <input type='hidden' name='keyword' value="${cri.keyword}">
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<td><input class="form-control" type="text" name="id" value="${BoardVO.id}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input class="form-control" type="password" name="pw" id="pw"
					placeholder="변경할 비밀번호를 입력하세요." value="${BoardVO.pw}" required></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input class="form-control" type="password" name="pwc" id="pwc"
					placeholder="비밀번호를 다시 입력하세요." required>
				<span id="pwchk"></span>				
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input class="form-control" type="text" name="pname" value="${BoardVO.pname}" required></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input class="form-control" type="text" name="email"
					value="${BoardVO.email}" required></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
				<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" id="birth" name="birth" value="${BoardVO.birth}" required>
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
		<input type="submit" class="btn btn-danger" value="삭제">
		<input type="submit" class="btn btn-primary" value="목록">
		
	<!-- 이력서 보기  -->
	<h1>이력서 수정</h1>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>이력서 제목</th>
			<th>수정</th>
		</tr>
		
	<c:forEach items="${reslist}" var="ResumeVO">
	
		<tr>
			<td>${ResumeVO.bno}</td>
			<td>${ResumeVO.title}</td>
			<td><input type="button" onclick="location.href='/admin/rmodify?bno=${ResumeVO.bno}'" value="이력서수정"></td>
		</tr>
	</c:forEach>
	</table>
	<!-- //이력서 보기 -->
</div>
<!-- //개인정보수정 페이지 -->

<!-- 달력 나오게 하는 스크립트  -->
<script type='text/javascript'>
	$(function() {
		$('.input-group .date').datepicker({
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
	
	var pwReg = /[A-Za-z0-9]$/;
	var pexpReg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/i;

	$('#pwc').keyup(function(){	
		var pwcval = $('#pwc').val();
		var pwval = $('#pw').val();
		
		if(pwcval.search(/\s/) != -1){
			alert("공백 금지");
			$('#pwc').val(pwcval.slice(0, -1));
		}
		
		if(!(pwReg.test(pwcval)) && pexpReg.test(pwcval)){
			alert("특수문자 금지");
			$('#pwc').val(pwcval.slice(0, -1));
		}

		pwcval = $('#pwc').val();
		pwval = $('#pw').val();
		
		if(!(pwcval.length > 5 && pwcval.length <= 20)){
        	document.getElementById("pwchk").innerHTML = "비밀번호가 유효하지 않습니다.(6~20자)";
			pwchk.attr("style", "color:red");
			pwc = "no";
		}else{
			if(pwval == pwcval){
				document.getElementById("pwchk").innerHTML = "비밀번호가 일치합니다.";
				pwchk.attr("style", "color:blue");
				pwc = "ok";
			}else{
				document.getElementById("pwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
				pwchk.attr("style", "color:red");
				pwc = "no";
			}
		}
		
	})
	
	
	$('#pw').keyup(function(){
		var pwval = $('#pw').val();
		var pwcval = $('#pwc').val();
		
		if(pwval.search(/\s/) != -1){
			alert("공백 금지");
			$('#pw').val(pwval.slice(0, -1));
		}
		
		if(!(pwReg.test(pwval)) && pexpReg.test(pwval)){
			alert("특수문자 금지");
			$('#pw').val(pwcval.slice(0, -1));
		}
		
		pwval = $('#pw').val();
		pwcval = $('#pwc').val();
		
		if(!(pwval.length > 5 && pwval.length <= 20)){
        	document.getElementById("pwchk").innerHTML = "비밀번호가 유효하지 않습니다.(6~20자)";
			pwchk.attr("style", "color:red");
			pwc = "no";
		}else{
			if(pwval == pwcval){
				document.getElementById("pwchk").innerHTML = "비밀번호가 일치합니다.";
				pwchk.attr("style", "color:blue");
				pwc = "ok";
			}else{
				document.getElementById("pwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
				pwchk.attr("style", "color:red");
				pwc = "no";
			}
		}
	})
</script>
<!-- //비밀번호 일치 여부  -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

$(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	/* 수정버튼 */
	$(".btn-warning").on("click", function(){
		if($('#birth').val()==''){
			console.log("#birth.val()==''");
			$('#birth').val("0000-00-00");
		}
	
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();

		if(pw==pwc){
			if(confirm("수정하시겠습니까?")){
				formObj.submit();
				}
			}else{
			alert("비밀번호를 확인해주세요.");
		}
	});
	
	/* 삭제버튼 */
	$(".btn-danger").on("click", function(){
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();
		
		if(pw==pwc){
			if(confirm("삭제하시겠습니까?")){
				formObj.attr("action", "/admin/premove");
				formObj.submit();
			}
		}else{
			alert("비밀번호를 확인해주세요.");
		}
	});
	
	/* 목록버튼 */
	$(".btn-primary").on("click", function(){
		self.location = "/admin/main?page=${cri.page}&perPageNum=${cri.perPageNum}"
			+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
});
</script>
<!-- //버튼에 대한 스크립트  -->

<%@include file="../include/cfooter.jsp"%>