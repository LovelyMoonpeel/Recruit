<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<div class="col-md-9">
	<div class="row">
		<label><h2>&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 변경</h2></label>
	</div>


	<table class="table">
		<tr>
			<td class="warning">&nbsp;8~32자의 영문 대문자, 소문자, 숫자, 특수문자를 조합하여
				비밀번호를 사용하실 수 있습니다.</td>
		</tr>
		<tr>
			<td class="warning">&nbsp;개인정보 보호를 위해 <b>6개월마다 주기적으로 비밀번호를
					변경</b>해 사용하는 것이 안전합니다.
			</td>
		</tr>
		<tr>
			<td class="warning">&nbsp;여러 사이트에 동일한 비밀번호를 사용하면 도용되기 쉬우므로 비밀번호를
				주기적으로 변경해 주는 것이 안전합니다.</td>
		</tr>
	</table>


	<form class="form-horizontal" role="form" method="post">

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">현재
				비밀번호</label>
			<div class="col-sm-6" id="beforePw">
				<input type="password" class="form-control" id="pw1" name="pw" 
					placeholder="기존의 Password를 입력해주세요.">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">새
				비밀번호</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="" name="pw2" 
					placeholder="Password입력해주세여.">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">다시
				확인</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="inputPassword3"
					placeholder="한 번 더 입력해주세여.">
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" id="changePw">확인</button>
			</div>
		</div>

	</form>

<!-- 	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);
			$(".btn btn-default").on("click", function() {
				self.location = "/company/C_pass";
			});
		});
	</script>
 -->


	<script>
		$("#changePw").on("click", function() {     //changePw는 확인 버튼 id값
			var Pw = $("#pw1");        //pw1은 기존 비번 확인할 때 입력받은 값
			var inputPw = Pw.val();
			console.log("★★inputPw:"+inputPw);     //브라우저의 콘솔창
			
			$.ajax({
				type : 'POST',
				url : '/companyAjax/changePassword',
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					pw : inputPw   //dto의 pw로 보내고
				}),
				success : function(result) {        //result값을 데리고 온다.
					/* console.log("☆☆inputPw2:"+inputPw2);   */
					console.log("result: " + result);
					if (result == 'success') {
						alert("비밀번호가 맞았습니다.");
					} else {
						alert("비밀번호가 틀렸습니다.");
					}
				}
			});
			alert();
		});
	</script>








	<div class="row">
		<label><h3>&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;비밀번호 이렇게
				작성하세요.♥</h3></label>
	</div>

	<table class="table">
		<tr>
			<td class="danger">&nbsp;영문, 숫자, 특수문자를 모두 조합하여 비밀번호를 만드는 것이 가장
				안전합니다..</td>
		</tr>
		<tr>
			<td class="danger">&nbsp;아이디와 동일한 비밀번호는 사용할 수 없습니다.</td>
		</tr>
		<tr>
			<td class="danger">&nbsp;영문만, 숫자만, 특수문자만 이용하여 만든 비밀번호는 사용할
				없습니다.(예: iam1004, 022025)</td>
		</tr>
		<tr>
			<td class="danger">&nbsp;3자리 이상 반복되는 숫자, 영문, 특수문자는 비밀번호로 사용할 수
				없습니다.(111,aaa,!!!)</td>
		</tr>
		<tr>
			<td class="danger">&nbsp;3자리 이상 연속되는 숫자, 영문, 특수문자는 비밀번호로 사용할 수
				없습니다.(123,abc, !@#)</td>
		</tr>
		<tr>
			<td class="danger">&nbsp;비밀번호 변경 시 현재 사용중인 비밀번호를 재사용하실 수 없으며 다른
				비밀번호로 변경하셔야 합니다.</td>
		</tr>
	</table>

</div>

<!-- <Script>
	$(document).ready(function() {
		
		var formObj = $("form[role='form']");
		
		$("#beforePw").focusout(function() {
			/* $(this).css("background-color", "#FFFFFF"); */
			/* alert("성공ㄴ"); */
			/* self.location = "/company/C_pass"; */
			formObj.submit();
		});
	});
</Script> -->

<%@include file="../include/cfooter.jsp"%>