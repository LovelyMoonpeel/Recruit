<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- 문> 이 페이지는 천문필이 작성 -->
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
			<label for="inputEmail3" class="col-sm-2 control-label">현재 비밀번호</label>
			<div class="col-sm-6" id="beforePw">
				<input type="password" class="form-control" id="pw1" name="pw"
					placeholder="기존의 Password를 입력해주세요.">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">새 비밀번호</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="pw2" name="pw2input"
					placeholder="Password입력해주세여.">
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">다시 확인</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="pw3"
					name="pw3reinput" placeholder="한 번 더 입력해주세여.">
			</div>
			<!--여기 span태그 속에는 잘못된 비밀번호라고 알려줌  -->
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
			
			var Pw2 = $("#pw2"); //pw1은 기존 비번 확인할 때 입력받은 값
			var inputPw2 = Pw2.val();
			
			//일단, 확인 버튼이 안 먹도록 만들었다. 되는 것들을 밖으로 빼서 실핼시킬 예정임
			event.preventDefault();
			
			$.ajax({
				type : 'POST',
				//아래 코드에 적힌 컨트롤러를 찾아간다.
				url : '/companyAjax/changePassword',
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',

				//dto의 pw로 비밀번호 확인하는 과정에서 받은 값(inputPw)을 보낸다. pw2는 새로받은 비밀번호이다.
				//왜 dto냐? 컨트롤러쪽에서 @RequestBody를 dto앞에 붙였기때문에, 그리고 @RequestBody는 한 번만 사용할 수 있다.
				data : JSON.stringify({
					pw : inputPw,
					pw2 : inputPw2
					
				}),

				//result값을 데리고 온다.
				success : function(result) {

					//비밀번호가 이전 거랑 맞으면 진행하는데 result값이 success이면 된다.
					if (result == 'success') {
						
						//새로운 비밀번호와 다시 입력받은 두 값이 같으면 진행 
						if ($("#pw2").val() == $("#pw3").val()) {
							
							//ajaxchk에 ok값을 주입한다.왜냐? 얘는 되는거니깐 풀어야지
							ajaxchk = "ok";
							alert("비밀번호가 성공적으로 바뀌었습니다.")
								
						} else {
							
							//위에서 진행한 두 비밀번호가 다를 때
							alert("비밀번호를 확인해주세요.");
							
							//다음 코드는 alert창을 껐을 때, id가 pw2인 곳에 커서가 위치하게 하는 코드
							$("#pw2").focus();
						}

					//비밀번호가 이전 비밀번호랑 맞는지 확인하는 과정에서 삑사리 난 경우
					} else {
						alert("비밀번호가 틀렸습니다.");
						
						//다음 코드는 alert창을 껐을 때, id가 pw1인 곳에 커서가 위치하게 하는 코드
						$("#pw1").focus();

					}

				}
			}); //$.ajax 끝났음
			
			
			//setTimeout함수는 일정시간 뒤에 코드가 실행되게 하는 함수이다.
			//확인을 누르는 동시에 비밀번호 테스트 동작이 돌아간다. 그런데 다 끝나면 페이지가 새로고침이 된다.
			//그 시간을 지정하는 것이다.
			setTimeout(function(event){
				if(ajaxchk=="ok"){
					formObj.submit();
					
				} //if끝
				
			}, 500); //setTimeout끝
			
			
			
		});
		
	</script>


	<script>
		var ppwc = "";
		
		//chk는 잘못된 값이 들어갔을 때 제대로 값을 입력하라고 문구를 뿌리는 span태그 공간이다.
		var chk = $('#chk');

		//pw3는 새로운 비밀번호 확인 값, pw2는 새로운 비밀번호 값
		$('#pw3').keyup(function() {
			if ($('#pw2').val() == $('#pw3').val()) {
				document.getElementById("chk").innerHTML = "비밀번호가 일치합니다.";
				chk.attr("style", "color:blue");
			} else {
				document.getElementById("chk").innerHTML = "비밀번호가 일치하지 않습니다.";
				chk.attr("style", "color:red");
			}
		})

		// Q> 얜 모지??
		$('#pw2').keyup(function() {
			if ($('#pw2').val() == $('#pw3').val()) {
				document.getElementById("chk").innerHTML = "비밀번호가 일치합니다.";
				chk.attr("style", "color:blue");
			} else {
				document.getElementById("chk").innerHTML = "비밀번호가 일치하지 않습니다.";
				chk.attr("style", "color:red");
			}
		})
	</script>

</div>

<%@include file="../include/cfooter.jsp"%>