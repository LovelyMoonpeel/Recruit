<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- ------------------------------------------------------------
 문> 이 페이지는 천문필이 작성, 비밀번호 변경 jsp페이지입니다. 자동 줄 맞춤 실행 금지!!  
 -------------------------------------------------------------->

<div class="col-md-9">			
	<p class="lead"><strong>비밀번호 변경</strong></p>			<!--맨 위에 타이틀 제목  -->
	<!--★★비밀번호 변경 제시 글★★  -->
	<table class="table table-bordered">			<!--테이블 생성  -->
		<tr class="active gobox2">			<!-- active는 바탕색을 말하고 gobox2는 따로 css지정  -->
		<td style="line-height: 200%">			<!-- 줄과 줄 사이 간격  -->
			<ul style="list-style-type : circle">			<!-- li 앞에 동그라미  -->
				<li><small><b style="color:#7F0000">6~20자의 영문 대문자, 소문자, 숫자</b>를 조합하여 비밀번호를 만드실 수 있습니다.</small></li>
				<li><small>개인정보 보호를 위해 <b style="color:#7F0000">6개월마다 주기적으로 비밀번호를 변경</b>해 사용하는 것이 안전합니다.</small></li>
				<li><small>여러 사이트에 동일한 비밀번호를 사용하면 도용되기 쉬우므로 비밀번호를 주기적으로 변경해 주는 것이 안전합니다.</small> </li>
			</ul>
		</td>
		</tr>
	</table>

	<br>

	<!--★★입력 버튼★★  -->
	<form role="form" class="form-horizontal" method="post">				<!-- form인데 따로 컨트롤러 주소를 지정하지 않았다. 그러면 submit을 날리면 companycontroller의 C_pass로 날라간다.  -->
		<div class="form-group">			
			<label class="col-sm-2 control-label">현재 비밀번호</label>			<!-- control-label이 뭔지는 모르나 빼면 글씨가 왼쪽에 달라붙는다. -->
			<div class="col-sm-6" id="beforePw">
				<input type="password" class="form-control" id="pw1" name="pw"			
					placeholder="기존의 Password를 입력해주세요.">			<!-- id값은 밑에 스크립트에서 쓰임 -->
																	<!-- placeholder는 글씨를 박아놓는 역할  -->
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">새 비밀번호</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="pw2" name="pw2"
					placeholder="Password입력해주세요.">
			</div>
			<span id="chk2"></span>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">다시 확인</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="pw3"
					name="pw3reinput" placeholder="한 번 더 입력해주세요.">
			</div>
			<span id="chk3"></span>			<!--여기 span태그 속에는 잘못된 비밀번호라고 알려줌  -->
		</div>

		<br>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">			<!-- col-sm-2 으로 하면 이상해짐 --> 
				<button type="submit" class="btn btn-success btn-lg" id="changePw">변경하기</button>   <!-- 확인 id값은 밑에 스크립트에서 사용됨 -->
			</div>
		</div>

	</form>




	<script>
		$("#changePw").on("click", function(event) {  	//#changePw에서 changePw는 확인 버튼 id값
			var formObj = $("form[role='form']");  	//칸에 입력된 값
			var ajaxchk = "no";  	//ajaxchk의 값을 no라고 설정
			
			var Pw = $("#pw1");  	//#pw1은 기존 비번 확인할 때 입력받은 값으로 Pw에 입력함
			var inputPw = Pw.val();  	//Pw의 값을 inputPw에 대입
			var Pw2 = $("#pw2");  	//#pw2는 새로운 비번 입력받은 값으로 Pw2에 입력함
			var inputPw2 = Pw2.val();  	//Pw2의 값을 inputPw2에 대입 

			event.preventDefault();   //일단, 확인 버튼이 안 먹도록 만들었다. 되는 것들을 밖으로 빼서 실핼시킬 예정임
			
			// ★★아래 ajax는 기존 비밀번호와 사용자가 입력한 기존 비밀번호 일치 여부를 따지기 위해 만든 코드★★
			$.ajax({
				type : 'POST',
				url : '/companyAjax/changePassword',   // $("#changePw").on("click", function(event)에 의해 확인 버튼을 누르면 여기에 적힌 주소의 컨트롤러를 찾아간다.
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					pw : inputPw,     //기존 비밀번호 확인차 받은 값(inputPw)을 dto의 pw로 보낸다. pw2는 새로받은 비밀번호이다.
									  //왜 dto냐? 컨트롤러쪽 매개변수에 쓴 코드 때문에 --> @RequestBody LoginDTO dto, 그리고 @RequestBody는 한 번만 사용할 수 있다.
					pw2 : inputPw2
					
				}),
				
				// ★★ 기존 비밀번호와 사용자가 입력한 기존 비밀번호 일치 여부 결과를 가지고 돌리는 내용★★
				success : function(result) {       //위에서 보낸 pw로 컨트롤러 돌리고 난 뒤의 result값을 데리고 온다.
				 	// ★★ 기존 비밀번호와 사용자가 입력한 기존 비밀번호 일치할 때, 새로운 비밀번호와 새로운 비밀번호 확인 값을 가지고 돌리는 내용★★
				    if (result == 'success') {			//비밀번호가 이전 거랑 맞으면 진행하는데, 맞으면 result값이 success이면 된다.
						if ($("#pw2").val() == $("#pw3").val()) {			//새로운 비밀번호와 다시 입력받은 두 값이 같냐? 같으면 진행
							ajaxchk = "ok";			//ajaxchk에 ok값을 주입한다.왜냐? 위에서 preventDefault()이걸 선언했는데 얘는 되는거니깐 풀어야지
					
									alert("비밀번호가 성공적으로 바뀌었습니다. 다시 로그인 해주세요~");	
							if(ajaxchk=="ok"){
								formObj.submit();
							}
						} else {
							alert("새로운 비밀번호를 확인해주세요.");			//위에서 진행한 두 비밀번호가 다를 때
							$("#pw2").focus();			//다음 코드는 alert창을 껐을 때, id가 pw2인 곳에 커서가 위치하게 하는 코드
						}
					// ★★ 기존 비밀번호와 사용자가 입력한 기존 비밀번호 일치하지 않을 때 ★★
					} else {
						alert("입력한 현재 비밀번호가 틀렸습니다.");			//기존 비밀번호 확인차 진행하는 과정 중 삑사리 난 경우
						$("#pw1").focus();			//다음 코드는 alert창을 껐을 때, id가 pw1인 곳에 커서가 위치하게 하는 코드
					}
				} 
			}); 		//$.ajax 끝났음

			
			
			
			/* 
			// ★★ ajax돌고 나서 진행되게 하는 코드★★
	 	 	setTimeout(function(event){			//setTimeout함수는 일정시간 뒤에 코드가 실행되게 하는 함수이다.
	 	 	    								//1000=1초
	 	 	    								//현재 코드는 위에서 아래로 순차적으로 진행되지 않는다.
	 	 	    								//ajax가 
	 	 	    								//그래서 ajax진행된 다음에 ajaxchk의 여부에 따라서 제출이 되도록 하기 위해서이다.
	 	 	    if(ajaxchk=="ok"){
					formObj.submit();
				} //if끝
			}, 500); //setTimeout끝   */
			
			
			
		});
	</script>


	<script>
		var cpwReg = /[A-Za-z0-9]$/;   			//A~Z랑 a~z랑 0~9만 허용, 한글은 허용 안 하기 위해
		var cexpReg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/i;			//특수문자는 허용 안 하기 위해
		var chk2 = $('#chk2');			//chk2는 '새 비밀번호'에 잘못된 값이 들어갔을 때 제대로 값을 입력하라고 문구를 뿌리는 span태그 공간이다.
		var chk3 = $('#chk3');			//chk3는 '다시확인'에 잘못된 값이 들어갔을 때 제대로 값을 입력하라고 문구를 뿌리는 span태그 공간이다.
		
		var cpwval = $('#pw2').val();			//pw2는 새로운 비밀번호 값으로 cpwval에 저장
		var cpwcval = $('#pw3').val();			//pw3는 새로운 비밀번호 확인 값으로 cpwcval에 저장
		
		//★★ '다시확인'입력 칸 체크
		$('#pw3').keyup(function(){				//pw3는 새로운 비밀번호 확인 값, pw2는 새로운 비밀번호 값, 
		    									//keyup은 키보드를 눌렀다가 떼면 작동하는 기능
			//★★ '다시확인'입력 칸 공백 체크
			if(cpwcval.search(/\s/) != -1){			// \s는 공백을 의미한다.
				alert("공백 금지");
				$('#pw3').val(cpwcval.slice(0, -1));			//공백인데 썼으니깐 썼던거 삭제하는 기능
			}
		
			//★★ '다시확인'입력 칸 특수문자 체크
			if(!(cpwReg.test(cpwcval)) && cexpReg.test(cpwcval)){
				alert("특수문자 금지");
				$('#pw3').val(cpwcval.slice(0, -1));			//특수문자 금지인데 썼으니깐 썼던거 삭제하는 기능
			}
		 
		 	cpwcval = $('#pw3').val();				//다음 두 줄은 지우면 안 됨. 특수문자를 쓴 값을 데리고 오면 안 되니깐.
			cpwval = $('#pw2').val(); 				//안 쓰면 특수문자를 쓴 값을 데리고 온다.
		 
		 	
			//★★ '다시확인'입력 칸 글자 수 체크
			if(!(cpwcval.length > 5 && cpwcval.length <= 20)){			//글자 수 제한 6이상 20이하
        		document.getElementById("chk3").innerHTML = "비밀번호가 유효하지 않습니다.(6~20자)";
        		chk3.attr("style", "color:red");		
			}else{
			  //★★ '다시확인'글자수 맞으면 새 비밀번호와 일치여부 가리기
			    if(cpwval == cpwcval){
					document.getElementById("chk3").innerHTML = "새 비밀번호와 일치합니다.<br>  확인 버튼을 눌러주세요.";
					$("#chk3").css("color","blue");
				}else{
					document.getElementById("chk3").innerHTML = "새 비밀번호와 일치하지 않습니다.";
					chk3.attr("style", "color:red");
				}
			}
		})
	
		//★★ '새로운 비밀번호'입력 칸 체크
		$('#pw2').keyup(function(){
		    
		 	//★★ '새로운 비밀번호'입력 칸 공백 체크
		    if(cpwval.search(/\s/) != -1){
				alert("공백 금지");
				$('#pw2').val(cpwval.slice(0, -1));
			}
		 	
		  	//★★ '새로운 비밀번호'입력 칸 특수문자 체크
			if(!(cpwReg.test(cpwval)) && cexpReg.test(cpwval)){
				alert("특수문자 금지");
				$('#pw2').val(cpwval.slice(0, -1));			//이걸 쓴다고 저장되어 있는 값까지 바꾸진 않는다.
			}
		
		 	cpwcval = $('#pw3').val();			//다음 두 줄은 지우면 안 됨. 지우면 아래 코드에서는 특수문자가 적용된 값을 가지고 논다.
			cpwval = $('#pw2').val();
		 	
			//★★ '새로운 비밀번호'입력 칸 글자 수 체크
			if(!(cpwval.length > 5 && cpwval.length <= 20)){
			    document.getElementById("chk2").innerHTML = "새 비밀번호가 유효하지 않습니다.(6~20자)";
        		chk2.attr("style", "color:red");
			}else{
			    document.getElementById("chk2").innerHTML = "";			//최종완료되면 글자 없애기 위해
				chk2.attr("style", "color:red");
			/* 지훈이가 쓴 코드인데 필요 없는 거 같아서 주석처리함 
			if(cpwval == cpwcval){
				document.getElementById("chk2").innerHTML = "ㅋㅋㅋ";  
				chk2.attr("style", "color:blue");
			}else{
				document.getElementById("chk2").innerHTML = "";
				chk2.attr("style", "color:red");
			} */
			}
		})
	
	</script>

</div>

<%@include file="../include/cfooter.jsp"%>