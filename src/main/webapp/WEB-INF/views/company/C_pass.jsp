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
			<td>&nbsp;8~32자의 영문 대문자, 소문자, 숫자, 특수문자를 조합하여 비밀번호를 사용하실 수 있습니다.</td>
		</tr>
		<tr>
			<td>&nbsp;개인정보 보호를 위해 <b>6개월마다 주기적으로 비밀번호를 변경</b>해 사용하는 것이
				안전합니다.
			</td>
		</tr>
		<tr>
			<td>&nbsp;여러 사이트에 동일한 비밀번호를 사용하면 도용되기 쉬우므로 비밀번호를 주기적으로 변경해 주는 것이
				안전합니다.</td>
		</tr>
	</table>


	<form role="form" class="form-horizontal" method="post">

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
				<input type="password" class="form-control" id="pw2" name="pw2input"
					placeholder="Password입력해주세여.">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">다시
				확인</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="pw3"
					name="pw3reinput" placeholder="한 번 더 입력해주세여.">
			</div>
			<span id="chk"></span>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" id="changePw">확인</button>
			</div>
		</div>

	</form>




	<script>

		$("#changePw").on("click", function(event) { //changePw는 확인 버튼 id값
			var formObj = $("form[role='form']");
			var ajaxchk = "no";
			var Pw = $("#pw1"); //pw1은 기존 비번 확인할 때 입력받은 값
			var inputPw = Pw.val();
			var answer = "";

			//브라우저의 콘솔창 확인 차
			console.log("★★inputPw:" + inputPw);

			//alert("event.preventDefault()앞");
			
			event.preventDefault();
			
			
			
			
			
			/* if (result != "success") {
				event.preventDefault();
			} */
			
			//alert("event.preventDefault()뒤");
			console.log("★pw3:" + pw3);

			
			$.ajax({
				type : 'POST',
				url : '/companyAjax/changePassword',
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',

				//dto의 pw로 보낸다
				data : JSON.stringify({
					pw : inputPw
					
				}),

				//result값을 데리고 온다.
				success : function(result) {

					//비밀번호가 이전 거랑 맞으면 진행
					if (result == 'success') {
						//alert("비밀번호가 맞았어요.");

						//비밀번호 두 값이 같으면 진행 
						if ($("#pw2").val() == $("#pw3").val()) {
							//alert("두 값이 일치합니다.");
							ajaxchk = "ok";
								
						} else {
							alert("비밀번호를 확인해주세요.");
							$("#pw2").focus();
							console.log("★★pw3:" + pw3);
						}

						//비밀번호 이전 거랑 다르면 진행	
					} else {
						alert("비밀번호가 틀렸습니다.");
						$("#pw1").focus();

					}

				}
			}); //$.ajax 끝났음
			
			setTimeout(function(event){
				alert("1");
				if(ajaxchk=="ok"){
					alert("2");
					formObj.submit();
				}
			}, 200);
		});
	</script>


	<script>
		var ppwc = "";
		var chk = $('#chk');

		$('#pw3').keyup(function() {
			if ($('#pw2').val() == $('#pw3').val()) {
				document.getElementById("chk").innerHTML = "비밀번호가 일치합니다.";
				chk.attr("style", "color:blue");
				pw3 = "ok";
			} else {
				document.getElementById("chk").innerHTML = "비밀번호가 일치하지 않습니다.";
				chk.attr("style", "color:red");
				pw3 = "no";
			}
		})

		$('#pw2').keyup(function() {
			if ($('#pw2').val() == $('#pw3').val()) {
				document.getElementById("chk").innerHTML = "비밀번호가 일치합니다.";
				chk.attr("style", "color:blue");
				pw3 = "ok";
			} else {
				document.getElementById("chk").innerHTML = "비밀번호가 일치하지 않습니다.";
				chk.attr("style", "color:red");
				pw3 = "no";
			}
		})
	</script>




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