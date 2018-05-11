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
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="col-md-9">



	<h1>회원정보 수정</h1>
	<form role="form" action="A_modify" method="POST">
     <input type='hidden' name='page' value="${cri.page}">
     <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
     <input type='hidden' name='searchType' value="${cri.searchType}">
     <input type='hidden' name='keyword' value="${cri.keyword}">
		<table class="table table-bordered">
			<tr>
				<th style="padding-top:22px;">ID</th>
				<td>
					<input class="form-control" type="text" id="userid" name="id" value="${UserVO.id}" readonly>
					<input type="hidden" name="userid" value="${UserVO.id}">
				</td>
			</tr>
			<tr>
				<th style="padding-top:22px;">비밀번호</th>
				<td>
					<div class="form-group" id="PWDiv" style="margin-bottom:0;">
	                    <input type="password" class="form-control" id='pw' name='pw' 
	                    	data-rule-required="true" data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top"  placeholder="변경할 비밀번호를 입력하세요." maxlength="30">
	               		<span class="glyphicon glyphicon-remove form-control-feedback" 
	               			id="PWXIcon" aria-hidden="true" style="visibility:hidden"></span>
	  				 	<span class="glyphicon glyphicon-ok form-control-feedback" 
	  				 		id="PWOKIcon" aria-hidden="true" style="visibility:hidden"></span> 
	            	</div>
				<%-- <input class="form-control" type="password" name="pw" id="pw" placeholder="변경할 비밀번호를 입력하세요." value="${UserVO.pw}" required> --%>
				</td>
			</tr>
			<tr>
				<th style="padding-top:22px;">비밀번호확인</th>
				<td>
				<div class="form-group" id="PWCDiv" style="margin-bottom:0;">
                    <input type="password" class="form-control" id="pwc" data-rule-required="true" placeholder="비밀번호를 다시 입력하세요." 
                    	data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top" maxlength="30">
                	<span class="glyphicon glyphicon-remove form-control-feedback" 
                		id="PWCXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 	<span class="glyphicon glyphicon-ok form-control-feedback" 
  				 		id="PWCOKIcon" aria-hidden="true" style="visibility:hidden"></span>
            	</div>
				<!-- <input class="form-control" type="password" name="pwc" id="pwc"
					placeholder="비밀번호를 다시 입력하세요." required> -->
				</td>
			</tr>
			<tr>
				<th style="padding-top:22px;">이름</th>
				<td><input class="form-control" type="text" name="pname" value="${UserVO.pname}" required></td>
			</tr>
			<tr>
				<th style="padding-top:22px;">E-mail</th>
				<td><input class="form-control" type="text" name="email"
					value="${UserVO.email}" required></td>
			</tr>
			<tr>
				<th style="padding-top:22px;">생년월일</th>
				<td>
				<div class="input-group date" data-provide="datepicker">
					<input type="text" class="form-control" id="birth" name="birth" value="${UserVO.birth}" required>
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
						</span>
				</div>
				</td>
			</tr>
			<tr>
				<th height="63" style="padding-top:22px;">이메일 인증</th>
					<c:choose>
					<c:when test="${UserVO.authCode eq null}">
					<td style="padding-top: 22px;padding-left: 15px;">
						<div id="authDiv">인증완료</div>
					</td>
					</c:when>
					<c:otherwise>
					<td style="padding-top: 15px;padding-left: 15px;" id="emailCheck">
						<div id="authDiv">인증이 필요합니다.&nbsp;&nbsp;<button type="button" class="btn btn-info" id="emailAuth">인증</button></div>
					</td>
					</c:otherwise>
					</c:choose>
			</tr>
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
			<td><input type="button" class="btn btn-success" onclick="location.href='/admin/resmodify?bno=${ResumeVO.bno}'" value="이력서수정"></td>
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
	var pwcheck = "ok";
	var pwReg = /^[A-Za-z0-9]{1,20}$/;
	var expReg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{1,20}/i;

	function PWCXcheck(){
		$("#PWCDiv").removeClass();
		$("#PWCOKIcon").css("visibility","hidden");
		$("#PWCDiv").addClass("form-group has-error has-feedback"); 
		$("#PWCXIcon").css("visibility","visible");
		$("#pwc").attr("data-content", "사용 불가능한 비밀번호 입니다.");
		$("#pwc").focusout();
		$("#pwc").focus();
		pwcheck = "no";
	}
	
	function PWXcheck(){
		$("#PWDiv").removeClass();
		$("#PWOKIcon").css("visibility","hidden");
		$("#PWDiv").addClass("form-group has-error has-feedback"); 
		$("#PWXIcon").css("visibility","visible");
		$("#pw").attr("data-content", "사용 불가능한 비밀번호 입니다.");
		$("#pw").focusout();
		$("#pw").focus();
		pwcheck = "no";
	}
	
	function PWCOcheck(){
		$("#PWCDiv").removeClass();
		$("#PWCXIcon").css("visibility","hidden");
		$("#PWCDiv").addClass("form-group has-success has-feedback"); 
		$("#PWCOKIcon").css("visibility","visible");
		$("#pwc").attr("data-content", "사용 가능한 비밀번호 입니다.");
		$("#pwc").focusout();
		$("#pwc").focus();
		pwcheck = "ok";
	}
	
	function PWOcheck(){
		$("#PWDiv").removeClass();
		$("#PWXIcon").css("visibility","hidden");
		$("#PWDiv").addClass("form-group has-success has-feedback"); 
		$("#PWOKIcon").css("visibility","visible");
		$("#pw").attr("data-content", "사용 가능한 비밀번호 입니다.");
		$("#pw").focusout();
		$("#pw").focus();
		pwcheck = "ok";
	}
	
	$('#pwc').keyup(function(){	
		var pwcval = $('#pwc').val();
		var pwval = $('#pw').val();
		
		//1. 대소문자, 숫자가 들어왔는가
		if(pwReg.test(pwcval)){
			//2. 공백이나 특수문자가 들어왔는가
			if(pwcval.search(/\s/) == -1 || !pexpReg.test(pwcval)){
				//3. 길이가 일치하는가
				if(pwcval.length > 5 && pwcval.length <= 20){
					//4. 두개의 값이 같은가
					if(pwval == pwcval){
						PWOcheck();
						PWCOcheck();
					}else{
						PWCXcheck();
					}
				}else{
					PWCXcheck();
				}
			}else{
				PWCXcheck();
			}
		}else{
			PWCXcheck();
		}
	})
	
	
	$('#pw').keyup(function(){
		var pwval = $('#pw').val();
		var pwcval = $('#pwc').val();
		
		//1. 대소문자, 숫자가 들어왔는가
		if(pwReg.test(pwval)){
			//2. 공백이나 특수문자가 들어왔는가
			if(pwcval.search(/\s/) == -1 || !pexpReg.test(pwval)){
				//3. 길이가 일치하는가
				if(pwval.length > 5 && pwval.length <= 20){					
					//4. 두개의 값이 같은가
					if(pwcval.length != 0){
						if(pwval == pwcval){
							PWCOcheck();
							PWOcheck();
						}else{
							if(pwcval.length>0){
								PWCXcheck();							
							}
							PWXcheck();
						}						
					}else{
						PWOcheck();						
					}
				}else{
					if($("#PWCDiv").hasClass("has-success")){
						PWCXcheck();
					}
					PWXcheck();
				}
			}else{
				if($("#PWCDiv").hasClass("has-success")){
					PWCXcheck();
				}
				PWXcheck();
			}
		}else{
			if($("#PWCDiv").hasClass("has-success")){
				PWCXcheck();
			}
			PWXcheck();
		}
		
	})
</script>
<!-- //비밀번호 일치 여부  -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

$(function(){
	var formObj = $("form[role='form']");
	
	//console.log(formObj);
	
	/* 수정버튼 */
	$(".btn-warning").on("click", function(){
		if($('#birth').val()==''){
			//console.log("#birth.val()==''");
			$('#birth').val("0000-00-00");
		}
	
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();

		if(pw==pwc){
			if(confirm("수정하시겠습니까?")){
				if(pwcheck=="ok"){
						formObj.submit();
					}else{
						alert("비밀번호를 확인해주세요.");
					}
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
	
	$("#emailAuth").on("click", function(){
		if(confirm("이메일 인증을 하시겠습니까?")){
			var id = $("#userid").val();
			
			$.ajax({
				type:'put',
				url:'/admin/emailAuth',
				headers:{
					"Content-Type": "application/json; charset=UTF-8",
					"X-HTTP-Method-Override":"PUT"},
				data:JSON.stringify({id:id}),
				dataType:'text',
				success:function(result){
					if(result == 'success'){
						alert("이메일 인증이 완료되었습니다.");
						document.getElementById("authDiv").innerHTML = "인증완료";
						$("#emailCheck").css("padding-top", "20px");
					}
				}});			
		}
	});
});
</script>
<!-- //버튼에 대한 스크립트  -->

<script>
var result = '${msg}';

if(result == 'resume_mod'){
	alert("이력서 수정 처리가 완료 되었습니다.");
}else if(result == 'remove'){
	alert("이력서 삭제가 완료되었습니다.");
}
</script>

<%@include file="../include/cfooter.jsp"%>