<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.net.URLDecoder" %>
<%
	String pidc = "";  //Personal ID remember
	String pchkc = ""; //Personal Remember check
	String cidc = "";  //Company ID remember
	String cchkc = ""; //Company Remember check
	String pactive = "active in"; //Personal active(개인회원 선택)
	String cactive = "";		  //Company active(기업회원 선택)
	String pexpand = "true";	  //Personal active(개인회원 선택)
	String cexpand = "false";	  //Company active(기업회원 선택)
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("PloginCookie")){
				pidc = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				pchkc = "checked='checked'";
				pactive = "active in";
				pexpand = "true";
				cexpand = "false";
			}else if(cookies[i].getName().equals("CloginCookie")){
				cidc = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				cchkc = "checked='checked'";
				cactive = "active in";
				pactive = "";
				cexpand = "true";
				pexpand = "false";
			}
		}
	}
%>
    
<!--__________________________1.로그인 모달 시작_______________________________________  -->

	<!--★ 원래 modal fade인데 fade없애도 상관없는 거 같음, modal은 지우면 안됨  -->
	<!--★ 원래id옆에 role="dialog"있었는데 지워도 문제 없음  -->
	<div class="modal" id="modal_login">

		<!--★ 뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->
		<div class="modal-dialog">

			<!--★ 아래 두개의 클래스를 추가 했음, col-xs-8을 아래 붙이면 css적용이 안 됨 , col-xs-8을 써서 모달 가로 폭을 조정 -->
			<div class="modal-content col-xs-12 col-md-8">

				<div class="modal-body">

					<!--x표시 누르면 창 사라지게 하는 코드 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<!--모달 안의 상단 네비게이션  -->
					<ul class="nav nav-tabs">
						<!--★ href부분 값은 밑에 id랑 연결된다  -->
						<li class=<%= pactive%>><a data-toggle="tab" href="#login_person" id="person" aria-expanded=<%= pexpand%>>개인회원</a></li>
						<li class=<%= cactive %>><a data-toggle="tab" href="#login_company" id="company" aria-expanded=<%= cexpand%>>기업회원</a></li>
					</ul>
					
					<br>
					
					<!--모달 안의 내용/개인회원&기업회원  -->
					<div class="tab-content">
						<!--_____________________1-1.로그인 개인 회원 시작_____________________ -->
						<div id="login_person" class="tab-pane fade <%= pactive%>">
							
							<!-- action의 속성값으로 인해 UserController의 '/user/loginPost'부분으로 넘어간다  -->
							<form action="/user/loginPost" method="post">
								<input type="hidden" name="index" value="per">
								<input type="hidden" name="location" class="location">
								<!--id입력  -->
								<!--★ 는 빈칸을 두지않게 하는 장치  -->
								<div class="form-group has-feedback">
									<input type="text" id="loginpid" name="id" class="form-control"
										placeholder="ID 개인 회원 로그인" value="<%=pidc %>" /> <span
										class="glyphicon  form-control-feedback"></span>
								</div>
								
								<!--password입력 -->
								<div class="form-group has-feedback">
									<input type="password" id="loginppw" name="pw" class="form-control"
										placeholder="Password" /> <span
										class="glyphicon form-control-feedback"></span>
								</div>
								
								<!--★ row로 인해서 여러 개를 한 줄에 나열 -->
								<div class="row">
								
									<!--기억하기 체크버튼  -->
									<div class="col-xs-8">
										<div class="checkbox icheck">
											<label> <input type="checkbox" name="useCookie" <%=pchkc %>>
												기억하기
											</label>
										</div>
									</div>
									
									<!--로그인 버튼 -->
									<div class="col-xs-4">
										<button type="submit"
											class="btn btn-primary btn-block btn-flat">로그인</button>
									</div>
									
								</div>
								<!--//row -->
								
								<!--아이디, 패스워드 까먹었을 경우를 대비  -->
								<a href="/user/IDsearch">아이디를 잊어버렸어요</a> 
								<br> 
								<a href="/user/PWsearch">패스워드를 잊어버렸어요</a>
								
							</form>
							
						</div>
						<!--_____________________//1-1.로그인 개인 회원 끝_____________________ -->

						<!--_____________________1-2.로그인 기업 회원 시작_____________________ -->
						<div id="login_company" class="tab-pane fade <%= cactive%>">
							
							<form action="/user/loginPost" method="post">
								<input type="hidden" name="index" value="com">
								<input type="hidden" name="location" class="location">
								<!--id입력 -->
								<div class="form-group has-feedback">
									<input type="text" id="logincid" name="id" class="form-control"
										placeholder="ID 기업회원 로그인" value="<%=cidc %>" /> <span
										class="glyphicon  form-control-feedback"></span>
								</div>
								
								<!--password입력 -->
								<div class="form-group has-feedback">
									<input type="password" id="logincpw" name="pw" class="form-control"
										placeholder="Password" /> <span
										class="glyphicon form-control-feedback"></span>
								</div>
								
								<!--row -->
								<div class="row">
									<!--기억하기 체크버튼  -->
									<div class="col-xs-8">
										<div class="checkbox icheck">
											<label> <input type="checkbox" name="useCookie" <%=cchkc %>>
												기억하기
											</label>
										</div>
									</div>
									
									<!--로그인 버튼 -->
									<div class="col-xs-4">
										<button type="submit"
											class="btn btn-primary btn-block btn-flat">로그인</button>
									</div>
									
								</div>
								<!--//row -->
								
								<!--아이디, 패스워드 까먹었을 경우를 대비  -->
								<a href="/user/IDsearch">아이디를 잊어버렸어요</a> 
								<br> 
								<a href="/user/PWsearch">패스워드를 잊어버렸어요</a>
							</form>
							
						</div>
						<!--_____________________//1.2로그인 기업 회원 끝_____________________ -->
						
					</div>
					<!--//tab-content 모달 안의 내용/개인회원&기업회원 -->
				
				</div>
				<!--//class="modal-body"  -->

			</div>
			<!--//class="modal-content col-xs-8"-->
		
		</div>
		<!--//modal-dialog -->
	
	</div>
	<!--_____________________//1.로그인 모달 끝_____________________-->
	
	
	<!--_____________________2.회원가입 모달 시작_____________________-->

	<!--여기 써 있는 id값이 맨 밑에 자바 스크립트 부분에서 사용됨/ 회원가입 모달 시작 -->
	<!--원래 modal fade인데 fade없애도 상관없는 거 같음, modal은 지우면 안됨  -->
	<!--원래id옆에 role="dialog"있었는데 지워도 문제 없음  -->
	<div class="modal" id="modal_join">

		<!--뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->
		<div class="modal-dialog">


			<!--아래 두개의 클래스를 추가 했음, col-xs-8을 아래 붙이면 css적용이 안 됨  -->
			<div class="modal-content join col-xs-12 col-md-8">

				<div class="modal-body">

					<!--x표시 누르면 창 사라지게 하는 코드 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<!--모달 안에서 맨 위에 있는 네비게이션  -->
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#join_person">개인회원</a></li>
						<li><a data-toggle="tab" href="#join_company">기업회원</a></li>
					</ul>

					<br>

					<!--모달 안에 들어가는 내용  -->
					<div class="tab-content">

						<!--_____________________2-1.회원가입 개인 회원 시작_____________________ -->
						<div id="join_person" class="tab-pane fade in active">

							<form role="form" class="form-inline" action="/user/joinPost" method="post">
							
								<!--뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐  -->
								<div class="box-body">
								<table>
								<tr>

									<!--아이디 -->
										<th>아이디</th>
										<td>
										<div class="form-group">
										<span id="PIDDiv" style="margin-bottom:0px;">
										<input type="text" id='pid' name='id' class="form-control"
											placeholder="4~15자리를 입력하세요." data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top" maxlength="15">
										<span class="glyphicon glyphicon-remove form-control-feedback" id="PIDXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 						<span class="glyphicon glyphicon-ok form-control-feedback" id="PIDOKIcon" aria-hidden="true" style="visibility:hidden"></span></span>
  				 						</div>
  				 						</td>
										<td>
										<input class="btn btn-success" type="button" id="pid_overlap" value="중복체크">
  										</td>
									
								</tr>

								<tr>
									<!--비밀번호 -->
									<!-- <div class="form-group"> -->
									<th>비밀번호</th>
									<td colspan="2"><span id="PPWDiv" style="margin-bottom:0px;">
									<input type="password" id='ppw' name='pw' class="form-control" placeholder="비밀번호를 입력하세요." maxlength="20" 
										data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top">
										<span class="glyphicon glyphicon-remove form-control-feedback" id="PPWXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 						<span class="glyphicon glyphicon-ok form-control-feedback" id="PPWOKIcon" aria-hidden="true" style="visibility:hidden"></span></span></td>
  				 				</tr>
  				 				<tr>
									<td colspan="3"><span><small>6~20자로 입력해주세요.(대문자와 소문자, 숫자 조합)</small></span><br></td>
									<!-- </div> -->
								</tr>
								<tr>
									<!-- <div class="form-group"> -->
									<th>비밀번호 확인</th>
									<td colspan="2">
									<span id="PPWCDiv" style="margin-bottom:0px;">
									<input type="password" id="ppwc" class="form-control" placeholder="비밀번호를 다시 입력하세요." maxlength="20" 
										data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top">
										<span class="glyphicon glyphicon-remove form-control-feedback" id="PPWCXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 						<span class="glyphicon glyphicon-ok form-control-feedback" id="PPWCOKIcon" aria-hidden="true" style="visibility:hidden"></span></span>
  				 					</td>
									<!-- </div> -->
								</tr>

								<tr>
									<!--이름 -->
									<th>이름</th>
									<!-- <div class="form-group"> -->
										<td colspan="2"><input type="text" name='pname' class="form-control"
											placeholder="이름을 입력하세요." maxlength="15"></td>
									<!-- </div> -->
								</tr>


								<tr>
									<!--생년월일/날짜 폼을 썼음 -->
									<!-- <div class="form-group"> -->
										<th>생년월일</th>
										<td colspan="2">
										<span class="input-group date" data-provide="datepicker">
											<input type="text" name='birth' class="form-control"
												placeholder="생년월일을 입력하세요." >
												<span class="input-group-addon">
												<i class="glyphicon glyphicon-calendar"></i>
											</span>
										</span>
										</td>
									<!-- </div> -->
								</tr>


								<tr>
									<!--이메일 -->
									<!-- <div class="form-group has-feedback"> -->
									<th>이메일</th>
									<td>
									<span id="PEmailDiv" style="margin-bottom:0px;">
										<input type="text" id="pemail" name="email" class="form-control"
											placeholder="이메일을 입력하세요." data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top"/>
										<span class="glyphicon glyphicon-remove form-control-feedback" id="PEmailXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 						<span class="glyphicon glyphicon-ok form-control-feedback" id="PEmailOKIcon" aria-hidden="true" style="visibility:hidden"></span>
  									</span>
  									</td>
									<!-- <span class="glyphicon  form-control-feedback"></span> -->
									<td><input class="btn btn-success" type="button" id="pemail_overlap" value="중복체크"></td>
									<!-- </div> -->
								</tr>


								<tr>
									<!--이메일 인증  -->
									<!-- <div> -->
									<td colspan="3">
									<br>
									<span class="text-center">회원가입 후 이메일 인증이 발송됩니다.</span>
									</td>
									<!-- </div> -->
								</tr>

								<tr>
									<!--가입하기 버튼인데 우측에 붙이고 싶어서 이렇게 설정했음  -->
									<!-- <div class="row"> -->
									<td colspan="3">
										<span class="col-xs-11"></span>
										<span class="col-xs-1">
											<button type="submit" id="pjoin" class="btn btn-primary">가입하기</button>
										</span>
									</td>
									<!-- </div> -->
								</tr>
									</table>
								</div>
								<!--//class="box-body" 뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐   -->
							</form>
						</div>
						<!--_____________________//2-1.회원가입 개인회원 끝_____________________  -->

						<!--_____________________2-2.회원가입 기업회원 시작_____________________  -->
						<div id="join_company" class="tab-pane fade">
							<form role="form" action="/user/joinPost" method="post">

								<!--뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐  -->
								<div class="box-body">

									<!--아이디 -->
									<div class="form-group"> 회사 아이디
									<div id="CIDDiv" style="margin-bottom:0px;">
										<input type="text" id="cid" name='id' class="form-control"
											placeholder="4~15자리를 입력하세요." data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top" required/>
										<span class="glyphicon glyphicon-remove form-control-feedback" id="CIDXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 						<span class="glyphicon glyphicon-ok form-control-feedback" id="CIDOKIcon" aria-hidden="true" style="visibility:hidden"></span>
  									</div>
									<input class="btn btn-success" type="button" id="cid_overlap" value="중복체크">
									</div>


									<!--비밀번호 -->
									<div class="form-group">비밀번호
									<div id="CPWDiv" style="margin-bottom:0px;">
									<input type="password" id='cpw' name='pw' class="form-control" placeholder="6자리를 입력하세요." maxlength="20" 
										data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top" required>
										<span class="glyphicon glyphicon-remove form-control-feedback" id="CPWXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 						<span class="glyphicon glyphicon-ok form-control-feedback" id="CPWOKIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 					</div>
  				 					<span>6~20자로 입력해주세요.(대문자와 소문자, 숫자 조합)</span>
									</div>
									
									<div class="form-group">비밀번호 확인
									<div id="CPWCDiv" style="margin-bottom:0px;">
									<input type="password" id='cpwc' class="form-control" placeholder="6자리를 입력하세요." maxlength="20"
										data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top" required>
										<span class="glyphicon glyphicon-remove form-control-feedback" id="CPWCXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 						<span class="glyphicon glyphicon-ok form-control-feedback" id="CPWCOKIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 					</div>
										<span id="cpwchk"></span>
									</div>



									<!--회사명 -->
									<div class="form-group">
										회사명<input type="text" name='cname' class="form-control"
											placeholder="회사명을 입력하세요." required>
									</div>


									<!--담당자 이름 -->
									<div class="form-group">
										담당자 이름<input type="text" name='pname' class="form-control"
											placeholder="담당자 이름을 입력하세요." required>
									</div>


									<!--담당자 이메일 -->
									<div class="form-group has-feedback">담당자 이메일
									<div id="CEmailDiv" style="margin-bottom:0px;">
										<input type="text" id="cemail" name="email" class="form-control"
											placeholder="담당자의 회사 이메일을 입력하세요." data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top" required/>
										<span class="glyphicon glyphicon-remove form-control-feedback" id="CEmailXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 						<span class="glyphicon glyphicon-ok form-control-feedback" id="CEmailOKIcon" aria-hidden="true" style="visibility:hidden"></span>
  									</div>
									<span class="glyphicon  form-control-feedback"></span>
									<input class="btn btn-success" type="button" id="cemail_overlap" value="중복체크">
									</div>


									<!--이메일 인증  -->
									<span class="text-center">회원가입 후 이메일 인증이 발송됩니다.</span>

									<!--사업자 등록번호 -->
									<div class="form-group">
										사업자 등록번호<input type="text" name='registnum'
											class="form-control" placeholder="띄워쓰기 없이 숫자만 연속으로 입력하세요." maxlength="10" required>
									</div>

									<!--가입하기 버튼인데 우측에 붙이고 싶어서 이렇게 설정했음  -->
									<div class="row">
										<div class="col-xs-8"></div>
										<div class="col-xs-4">
											<button type="submit" id="cjoin" class="btn btn-primary">가입하기</button>
										</div>
									</div>


								</div>
								<!--//class="box-body" 뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐   -->

							</form>


						</div>
						<!--_____________________//2-2.회원가입 기업회원 끝_____________________  -->



					</div>
					<!--//class="tab-content" 모달 안에 들어가는 내용 -->

				</div>
				<!--//class="modal-body"  -->

			</div>
			<!--//class="modal-content col-xs-8"-->

		</div>
		<!--//class="modal-dialog" 뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->

	</div>
	<!--_____________________//2.회원가입 모달 끝_____________________-->



	<!--___로그인 모달  -->
	<script>
		$(document).ready(function() {
			$("#myBtn_login").click(function() {
				$("#modal_login").modal();
				if($("#loginpid").val()!=""){
					$("#loginppw").focus();
				}else{
					if($("#logincid").val()!=""){
						$("#logincpw").focus();
					}else{
						$("#logincid").focus();
					}
					$("#loginpid").focus();
				}
			});
		});
	</script>
	

	<!--회원가입 모달  -->
	<script>
		$(document).ready(function() {
			$("#myBtn_join").click(function() {
				$("#modal_join").modal();
			});
		});
	</script>


	<!--날짜입력 모달 관련내용  -->
	<script type='text/javascript'>
		$(function() {
			$('.input-group.date').datepicker({
				calendarWeeks : false,
				todayHighlight : true,
				autoclose : true,
				format : "yyyy-mm-dd",
				language : "kr"
			});
		});
	</script>


	<link rel="stylesheet" type="text/css"
		href="/resources/rpjt/datepicker/datepicker3.css" />
	<script type="text/javascript"
		src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
	<!--//날짜입력 모달 관련내용  -->

<!-- 회원가입 시 아이디 및 비밀번호 변경여부 확인 -->
<!-- 유효성 검사 추가 -->
<script>
var pidchk = "";
var pemailchk = "";
var ppwc = "";

var cidchk = "";
var cemailchk = "";
var cpwc = "";

$('#pjoin').on("click", function(event){
	if(pidchk == $("#pid").val() && $('#pid').val() != ""){
		if(pemailchk == $("#pemail").val() && $("#pemail").val() != ""){
			if(ppwc == "ok"){
				$('#pjoin').submit();
			}else{
				alert("비밀번호를 확인해주세요.");
				event.preventDefault();
			}
		}else{
			$("#PEmailDiv").addClass("form-group has-error has-feedback"); 
			$("#PEmailXIcon").css("visibility","visible");
			$("#pemail").attr("data-content", "이메일 중복체크를 해주세요.");
			$("#pemail").focus();
			event.preventDefault();
		}
	}else{
		$("#PIDDiv").addClass("form-group has-error has-feedback"); 
		$("#PIDXIcon").css("visibility","visible");
		$("#pid").attr("data-content", "아이디 중복체크를 해주세요.");
		$("#pid").focus();
		event.preventDefault();
	}

})

$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
});

$('#cjoin').on("click", function(event){
	if(cidchk == $("#cid").val()){
		if(cemailchk == $("#cemail").val()){
			if(cpwc == "ok"){
				$('#cjoin').submit();			
			}else{
				alert("비밀번호를 확인해주세요.^^");
			}
		}else{
			alert("이메일 중복체크를 진행해주세요.");
			event.preventDefault();
		}
	}else{
		alert("아이디 중복체크를 진행해주세요.");
		event.preventDefault();
	}
})
</script>

<!-- 개인 회원 가입 비밀번호 일치 여부  -->
<script>
	/* keyup을 통해 비밀번호가 맞는지 확인하는 작업 */
	var ppwchk = $('#ppwchk');
	var ppwc = "no";
	var ppwReg = /^[A-Za-z0-9]{1,20}$/;
	var pexpReg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{1,20}/i;

	function PWCXcheck(){
		$("#PPWCDiv").removeClass();
		$("#PPWCOKIcon").css("visibility","hidden");
		$("#PPWCDiv").addClass("form-group has-error has-feedback"); 
		$("#PPWCXIcon").css("visibility","visible");
		$("#ppwc").attr("data-content", "사용 불가능한 비밀번호 입니다.");
		$("#ppwc").focusout();
		$("#ppwc").focus();
		ppwc = "no";
	}
	
	function PWXcheck(){
		$("#PPWDiv").removeClass();
		$("#PPWOKIcon").css("visibility","hidden");
		$("#PPWDiv").addClass("form-group has-error has-feedback"); 
		$("#PPWXIcon").css("visibility","visible");
		$("#ppw").attr("data-content", "사용 불가능한 비밀번호 입니다.");
		$("#ppw").focusout();
		$("#ppw").focus();
		ppwc = "no";
	}
	
	function PWCOcheck(){
		$("#PPWCDiv").removeClass();
		$("#PPWCXIcon").css("visibility","hidden");
		$("#PPWCDiv").addClass("form-group has-success has-feedback"); 
		$("#PPWCOKIcon").css("visibility","visible");
		$("#ppwc").attr("data-content", "사용 가능한 비밀번호 입니다.");
		$("#ppwc").focusout();
		$("#ppwc").focus();
		ppwc = "ok";
	}
	
	function PWOcheck(){
		$("#PPWDiv").removeClass();
		$("#PPWXIcon").css("visibility","hidden");
		$("#PPWDiv").addClass("form-group has-success has-feedback"); 
		$("#PPWOKIcon").css("visibility","visible");
		$("#ppw").attr("data-content", "사용 가능한 비밀번호 입니다.");
		$("#ppw").focusout();
		$("#ppw").focus();
		ppwc = "ok";
	}
	
	$('#ppwc').keyup(function(){	
		var ppwcval = $('#ppwc').val();
		var ppwval = $('#ppw').val();
		
		//1. 대소문자, 숫자가 들어왔는가
		if(ppwReg.test(ppwcval)){
			//2. 공백이나 특수문자가 들어왔는가
			if(ppwcval.search(/\s/) == -1 || !pexpReg.test(ppwcval)){
				//3. 길이가 일치하는가
				if(ppwcval.length > 5 && ppwcval.length <= 20){
					//4. 두개의 값이 같은가
					if(ppwval == ppwcval){
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
	
	
	$('#ppw').keyup(function(){
		var ppwval = $('#ppw').val();
		var ppwcval = $('#ppwc').val();
		
		//1. 대소문자, 숫자가 들어왔는가
		if(ppwReg.test(ppwval)){
			//2. 공백이나 특수문자가 들어왔는가
			if(ppwcval.search(/\s/) == -1 || !pexpReg.test(ppwval)){
				//3. 길이가 일치하는가
				if(ppwval.length > 5 && ppwval.length <= 20){					
					//4. 두개의 값이 같은가
					if(ppwcval.length != 0){
						if(ppwval == ppwcval){
							PWCOcheck();
							PWOcheck();
						}else{
							if(ppwcval.length>0){
								PWCXcheck();							
							}
							PWXcheck();
						}						
					}else{
						PWOcheck();						
					}
				}else{
					if($("#PPWCDiv").hasClass("has-success")){
						PWCXcheck();
					}
					PWXcheck();
				}
			}else{
				if($("#PPWCDiv").hasClass("has-success")){
					PWCXcheck();
				}
				PWXcheck();
			}
		}else{
			if($("#PPWCDiv").hasClass("has-success")){
				PWCXcheck();
			}
			PWXcheck();
		}
		
	})
</script>
<!-- //개인 회원 가입 비밀번호 일치 여부  -->

<!-- 기업 회원 가입 비밀번호 일치 여부  -->
<script>
	/* keyup을 통해 비밀번호가 맞는지 확인하는 작업 */
	var cpwchk = $('#cpwchk');
	var cpwc = "no";
	var cpwReg = /^[A-Za-z0-9]{1,20}$/;
	var cexpReg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/i;
	
	function CPWCXcheck(){
		$("#CPWCDiv").removeClass();
		$("#CPWCOKIcon").css("visibility","hidden");
		$("#CPWCDiv").addClass("form-group has-error has-feedback"); 
		$("#CPWCXIcon").css("visibility","visible");
		$("#cpwc").attr("data-content", "사용 불가능한 비밀번호 입니다.");
		$("#cpwc").focusout();
		$("#cpwc").focus();
		cpwc = "no";
	}
	
	function CPWXcheck(){
		$("#CPWDiv").removeClass();
		$("#CPWOKIcon").css("visibility","hidden");
		$("#CPWDiv").addClass("form-group has-error has-feedback"); 
		$("#CPWXIcon").css("visibility","visible");
		$("#cpw").attr("data-content", "사용 불가능한 비밀번호 입니다.");
		$("#cpw").focusout();
		$("#cpw").focus();
		cpwc = "no";
	}
	
	function CPWCOcheck(){
		$("#CPWCDiv").removeClass();
		$("#CPWCXIcon").css("visibility","hidden");
		$("#CPWCDiv").addClass("form-group has-success has-feedback"); 
		$("#CPWCOKIcon").css("visibility","visible");
		$("#cpwc").attr("data-content", "사용 가능한 비밀번호 입니다.");
		$("#cpwc").focusout();
		$("#cpwc").focus();
		cpwc = "ok";
	}
	
	function CPWOcheck(){
		$("#CPWDiv").removeClass();
		$("#CPWXIcon").css("visibility","hidden");
		$("#CPWDiv").addClass("form-group has-success has-feedback"); 
		$("#CPWOKIcon").css("visibility","visible");
		$("#cpw").attr("data-content", "사용 가능한 비밀번호 입니다.");
		$("#cpw").focusout();
		$("#cpw").focus();
		cpwc = "ok";
	}

	$('#cpwc').keyup(function(){
		var cpwcval = $('#cpwc').val();
		var cpwval = $('#cpw').val();
		
		//1. 대소문자, 숫자가 들어왔는가
		if(cpwReg.test(cpwcval)){
			//2. 공백이나 특수문자가 들어왔는가
			if(cpwcval.search(/\s/) == -1 || !cexpReg.test(cpwcval)){
				//3. 길이가 일치하는가
				if(cpwcval.length > 5 && cpwcval.length <= 20){
					//4. 두개의 값이 같은가
					if(cpwval == cpwcval){
						CPWOcheck();
						CPWCOcheck();
					}else{
						CPWCXcheck();
					}
				}else{
					CPWCXcheck();
				}
			}else{
				CPWCXcheck();
			}
		}else{
			CPWCXcheck();
		}
	})
	
	$('#cpw').keyup(function(){
		var cpwval = $('#cpw').val();
		var cpwcval = $('#cpwc').val();
		
		//1. 대소문자, 숫자가 들어왔는가
		if(cpwReg.test(cpwval)){
			//2. 공백이나 특수문자가 들어왔는가
			if(cpwval.search(/\s/) == -1 || !cexpReg.test(cpwval)){
				//3. 길이가 일치하는가
				if(cpwval.length > 5 && cpwval.length <= 20){
					//4. 두개의 값이 같은가
					if(cpwcval.length != 0){
						if(cpwval == cpwcval){
							CPWCOcheck();
							CPWOcheck();
						}else{
							if(cpwcval.length>0){
								CPWCXcheck();							
							}
							CPWXcheck();
						}						
					}else{
						CPWOcheck();						
					}
				}else{
					if($("#CPWCDiv").hasClass("has-success")){
						CPWCXcheck();
					}
					CPWXcheck();
				}
			}else{
				if($("#CPWCDiv").hasClass("has-success")){
					CPWCXcheck();
				}
				CPWXcheck();
			}
		}else{
			if($("#CPWCDiv").hasClass("has-success")){
				CPWXCcheck();
			}
			CPWXcheck();
		}
	})
</script>
<!-- //기업 회원 가입 비밀번호 일치 여부  -->

<!-- 개인회원 아이디 중복 체크 -->
<script>
$("#pid_overlap").on("click", function(event){
	var PidObj = $("#pid");
	var Pid = PidObj.val();

	/* 유효성 검사 */
	var idReg = /^[A-Za-z0-9]{4,15}$/g;
	var pjoinidchk = document.getElementById("pid").value;
	if(!idReg.test(pjoinidchk)){
		$("#PIDDiv").addClass("form-group has-error has-feedback"); 
		$("#PIDXIcon").css("visibility","visible");
		$("#pid").attr("data-content", "유효하지 않은 아이디 입니다.");
		$("#pid").focus();
		event.preventDefault();
	}else{
	
	$.ajax({
		type:'POST',
		url:'/user/idoverlap',
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "POST"},
		dataType:'text',
		data: JSON.stringify({id:Pid}),
		success:function(result){
			console.log("result: " + result);
			if(result == 'success'){
				$("#PIDDiv").removeClass(); 
				$("#PIDXIcon").css("visibility","hidden");
				$("#PIDDiv").addClass("form-group has-success has-feedback");
				$("#PIDXIcon").css("visibility","hidden");
				$("#PIDOKIcon").css("visibility","visible");
				$("#pid").attr("data-content", "사용 가능한 아이디 입니다.");
				$("#pid").focus();
				pidchk = Pid;
			}else{
				$("#PIDDiv").addClass("form-group has-error has-feedback");
				$("#PIDOKIcon").css("visibility","hidden");
				$("#PIDXIcon").css("visibility","visible");
				$("#pid").attr("data-content", "아이디가 중복되었습니다.");
				$("#pid").focus();
			}
		}});
	}
});
</script>

<!-- 기업회원 아이디 중복 체크 -->
<script>
$("#cid_overlap").on("click", function(){
	var CidObj = $("#cid");
	var Cid = CidObj.val();

	/* 유효성 검사 */
	var idReg = /^[A-Za-z0-9]{4,15}$/g;
	var cjoinidchk = document.getElementById("cid").value;
	if(!idReg.test(cjoinidchk)){
		$("#CIDDiv").addClass("form-group has-error has-feedback"); 
		$("#CIDXIcon").css("visibility","visible");
		$("#cid").attr("data-content", "유효하지 않은 아이디 입니다.");
		$("#cid").focus();
		event.preventDefault();
	}else{
	
	$.ajax({
		type:'POST',
		url:'/user/idoverlap',
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "POST"},
		dataType:'text',
		data: JSON.stringify({id:Cid}),
		success:function(result){
			console.log("result: " + result);
			if(result == 'success'){
				$("#CIDDiv").removeClass(); 
				$("#CIDDiv").addClass("form-group has-success has-feedback");
				$("#CIDXIcon").css("visibility","hidden");
				$("#CIDOKIcon").css("visibility","visible");
				$("#cid").attr("data-content", "사용 가능한 아이디 입니다.");
				$("#cid").focus();
				cidchk = Cid;
			}else{
				$("#CIDDiv").addClass("form-group has-error has-feedback");
				$("#CIDOKIcon").css("visibility","hidden");
				$("#CIDXIcon").css("visibility","visible");
				$("#cid").attr("data-content", "아이디가 중복되었습니다.");
				$("#cid").focus();
			}
		}});
	}
});
</script>

<!-- 개인회원 이메일 중복 체크 -->
<script>
$("#pemail_overlap").on("click", function(){
	var PemailObj = $("#pemail");
	var Pemail = PemailObj.val();

    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    
    if(!regEmail.test(Pemail)){
    	$("#PEmailDiv").removeClass();
		$("#PEmailDiv").addClass("form-group has-error has-feedback"); 
		$("#PEmailXIcon").css("visibility","visible");
		$("#pemail").attr("data-content", "유효하지 않은 이메일입니다.");
		$("#pemail").focus();
    }else{
	$.ajax({
		type:'POST',
		url:'/user/emailoverlap',
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "POST"},
		dataType:'text',
		data: JSON.stringify({email:Pemail}),
		success:function(result){
			console.log("result: " + result);
			if(result == 'success'){
				$("#PEmailDiv").removeClass();
				$("#PEmailDiv").addClass("form-group has-success has-feedback");
				$("#PEmailXIcon").css("visibility","hidden");
				$("#PEmailOKIcon").css("visibility","visible");
				$("#pemail").attr("data-content", "사용 가능한 이메일입니다.");
				$("#pemail").focus();
				pemailchk = Pemail;
			}else{
				$("#PEmailDiv").removeClass();
				$("#PEmailDiv").addClass("form-group has-error has-feedback");
				$("#PEmailOKIcon").css("visibility","hidden");
				$("#PEmailXIcon").css("visibility","visible");
				$("#pemail").attr("data-content", "중복된 이메일입니다.");
				$("#pemail").focus();
			}
		}});    	
    }
});
</script>

<!-- 기업회원 이메일 중복 체크 -->
<script>
$("#cemail_overlap").on("click", function(){
	var CemailObj = $("#cemail");
	var Cemail = CemailObj.val();

    var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    
    if(!regEmail.test(Cemail)){
    	$("#CEmailDiv").removeClass();
		$("#CEmailDiv").addClass("form-group has-error has-feedback"); 
		$("#CEmailXIcon").css("visibility","visible");
		$("#cemail").attr("data-content", "유효하지 않은 이메일입니다.");
		$("#cemail").focus();
    }else{
	$.ajax({
		type:'POST',
		url:'/user/emailoverlap',
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "POST"},
		dataType:'text',
		data: JSON.stringify({email:Cemail}),
		success:function(result){
			console.log("result: " + result);
			if(result == 'success'){
				//alert("사용 가능한 이메일 입니다.");
				$("#CEmailDiv").removeClass();
				$("#CEmailDiv").addClass("form-group has-success has-feedback");
				$("#CEmailXIcon").css("visibility","hidden");
				$("#CEmailOKIcon").css("visibility","visible");
				$("#cemail").attr("data-content", "사용 가능한 이메일입니다.");
				$("#cemail").focus();
				cemailchk = Cemail;
			}else{
				//alert("사용 불가능");
				$("#CEmailDiv").removeClass();
				$("#CEmailDiv").addClass("form-group has-error has-feedback");
				$("#CEmailOKIcon").css("visibility","hidden");
				$("#CEmailXIcon").css("visibility","visible");
				$("#cemail").attr("data-content", "중복된 이메일입니다.");
				$("#cemail").focus();
			}
		}});
    }
});
</script>

<!-- 로그인한 페이지값 넘김 -->
<script>
$(".btn-block").on("click", function(){
	var locationObj = $(".location")
	locationObj.val(window.location.pathname);
});
</script>

<!-- 로그인 모달 개인회원 기업회원 클릭 -->
<script>
$("#person").on("click", function(){
	setTimeout(function(){
		if($("#loginpid").val()!=""){
			$("#loginppw").focus();
		}else{
			$("#loginpid").focus();
		}		
	}, 500)
})

$("#company").on("click", function(){
	setTimeout(function(){
		if($("#logincid").val()!=""){
			$("#logincpw").focus();
		}else{
			$("#logincid").focus();
		}
	}, 500)
})
</script>