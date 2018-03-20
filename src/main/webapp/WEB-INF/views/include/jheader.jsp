<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "com.recruit.domain.BoardVO" %>
<%
	String idc = "";
	String chkc = "";
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("loginCookie")){
				idc = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				chkc = "checked='checked'";
			}
		}
	}
%>

<%
	String id = "";
	BoardVO login = null;
	String cname = "";
	String location = "";
	
	try{
		login = (BoardVO)session.getAttribute("login");
		if(login != null){
		id = login.getId();
		cname = login.getCname();
		}
		if(cname==null){
			location = "/personal/index";
		}else{
			location = "/company/C_index";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">퍼팩트 매칭</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">기업찾기</a></li>
				<li><a href="#">인재찾기</a></li>
				<li><a href="#">검색</a></li>

				<!--회원가입, 로그인 부분 -->
				<!--★ a href="#" 삭제하면 안됨  -->
				<!--c태그를 이용해서 로그인 되면 MyPage,로그아웃이 나오게 함  -->
				<c:if test="${empty sessionScope.login}">
					<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_join모달이 뜬다-->
					<li id="myBtn_join"><a href="#"> <span
							class="glyphicon glyphicon-user"></span> 회원가입
					</a></li>

					<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_login모달이 뜬다-->
					<li id="myBtn_login"><a href="#"> <span
							class="glyphicon glyphicon-log-in"></span> 로그인
					</a></li>
				</c:if>
				<!--//회원가입, 로그인 부분  -->

<<<<<<< HEAD
					<!--MyPage, 로그아웃 부분  -->
					<c:if test="${not empty sessionScope.login}">

						<li><a href="<%= location%>">MyPage</a></li>
						
						
						<!--버튼을 누르면 UserController에  /user/logout을 찾아간다 -->
						<li><a href="/user/logout">로그아웃</a></li>
						<li><a href="#">${sessionScope.login.id}등장</a></li>
					</c:if>
					<!--//MyPage, 로그아웃 부분  -->
					
=======
				<!--MyPage, 로그아웃 부분  -->
				<c:if test="${not empty sessionScope.login}">
					<li><a href="#">MyPage</a></li>

					<!--버튼을 누르면 UserController에  /rpjt/logout을 찾아간다 -->
					<li><a href="/rpjt/logout">로그아웃</a></li>
					<li><a href="#">${sessionScope.login.id}등장</a></li>
				</c:if>
				<!--//MyPage, 로그아웃 부분  -->

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>



<!--___로그인 모달 시작__________________________________________________________________  -->

<!--★ 여기 써 있는 id값이 맨 밑에 자바 스크립트 부분에서 사용됨/ 로그인 모달 시작 -->
<!--★ 원래 modal fade인데 fade없애도 상관없는 거 같음, modal은 지우면 안됨  -->
<!--★ 원래id옆에 role="dialog"있었는데 지워도 문제 없음  -->
<div class="modal" id="modal_login">

	<!--★ 뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->
	<div class="modal-dialog">

		<!--★ 아래 두개의 클래스를 추가 했음, col-xs-8을 아래 붙이면 css적용이 안 됨 , col-xs-8을 써서 모달 가로 폭을 조정 -->
		<div class="modal-content col-xs-8">

			<div class="modal-body">

				<!--★ x표시 누르면 창 사라지게 하는 코드 -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>

				<!--★ 모달 안의 상단 네비게이션  -->
				<ul class="nav nav-tabs">

					<!--★ href부분 값은 모달 안의 내용에서 id랑 연결된다  -->
					<li class="active"><a data-toggle="tab" href="#login_person">개인회원</a></li>
					<li><a data-toggle="tab" href="#login_company">기업회원</a></li>

>>>>>>> branch 'cbranch3' of https://github.com/LovelyMoonpeel/Recruit.git
				</ul>

				<br>

				<!--★ 모달 안의 내용/개인회원&기업회원  -->
				<div class="tab-content">

<!--___로그인 개인 회원 시작__________________________________________________________________ -->
					<div id="login_person" class="tab-pane fade in active">

<!--action의 속성값으로 인해 UserController의 '/rpjt/loginPost'부분으로 넘어간다  -->
						<form action="/rpjt/loginPost" method="post">

							<!--★ id입력  -->
							<!--★ required는 빈칸을 두지않게 하는 장치  -->
							<div class="form-group has-feedback">
								<input type="text" name="id" class="form-control"
									placeholder="ID 개인 회원 로그인" required /> <span
									class="glyphicon  form-control-feedback"></span>
							</div>

							<!--★ password입력 -->
							<div class="form-group has-feedback">
								<input type="password" name="pw" class="form-control"
									placeholder="Password" required /> <span
									class="glyphicon form-control-feedback"></span>
							</div>

							<!--★ row로 인해서 여러 개를 한 줄에 나열 -->
							<div class="row">

<<<<<<< HEAD
					<!--모달 안의 상단 네비게이션  -->
					<ul class="nav nav-tabs">
						<!--★ href부분 값은 밑에 id랑 연결된다  -->
						<li class="active"><a data-toggle="tab" href="#login_person">개인회원</a></li>
						<li><a data-toggle="tab" href="#login_company">기업회원</a></li>
					</ul>
					
					<br>
					
					<!--모달 안의 내용/개인회원&기업회원  -->
					<div class="tab-content">
						<!--_____________________1-1.로그인 개인 회원 시작_____________________ -->
						<div id="login_person" class="tab-pane fade in active">
							
							<!-- action의 속성값으로 인해 UserController의 '/user/loginPost'부분으로 넘어간다  -->
							<form action="/user/loginPost" method="post">
								
								<!--id입력  -->
								<!--★ required는 빈칸을 두지않게 하는 장치  -->
								<div class="form-group has-feedback">
									<input type="text" name="id" class="form-control"
										placeholder="ID 개인 회원 로그인" value="<%=idc %>" required/> <span
										class="glyphicon  form-control-feedback"></span>
								</div>
								
								<!--password입력 -->
								<div class="form-group has-feedback">
									<input type="password" name="pw" class="form-control"
										placeholder="Password" required/> <span
										class="glyphicon form-control-feedback"></span>
								</div>
								
								<!--★ row로 인해서 여러 개를 한 줄에 나열 -->
								<div class="row">
								
									<!--기억하기 체크버튼  -->
									<div class="col-xs-8">
										<div class="checkbox icheck">
											<label> <input type="checkbox" name="useCookie" <%=chkc %>>
												기억하기
											</label>
										</div>
=======
<!--로그인 개인 회원 기억하기 체크버튼 -->
								<div class="col-xs-8">
									<div class="checkbox icheck">
										<label> <input type="checkbox" name="useCookie">
											기억하기
										</label>
>>>>>>> branch 'cbranch3' of https://github.com/LovelyMoonpeel/Recruit.git
									</div>
								</div>

								<!--★ 로그인 버튼 -->
								<div class="col-xs-4">
									<button type="submit"
										class="btn btn-primary btn-block btn-flat">로그인</button>
								</div>

<<<<<<< HEAD
						<!--_____________________1-2.로그인 기업 회원 시작_____________________ -->
						<div id="login_company" class="tab-pane fade">
							
							<form action="/user/loginPost" method="post">
								
								<!--id입력 -->
								<div class="form-group has-feedback">
									<input type="text" name="id" class="form-control"
										placeholder="ID 기업회원 로그인" required/> <span
										class="glyphicon  form-control-feedback"></span>
								</div>
								
								<!--password입력 -->
								<div class="form-group has-feedback">
									<input type="password" name="pw" class="form-control"
										placeholder="Password" required/> <span
										class="glyphicon form-control-feedback"></span>
								</div>
								
								<!--row -->
								<div class="row">
									<!--기억하기 체크버튼  -->
									<div class="col-xs-8">
										<div class="checkbox icheck">
											<label> <input type="checkbox" name="useCookie">
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
								<a href="#">아이디를 잊어버렸어요</a> 
								<br> 
								<a href="#">패스워드를 잊어버렸어요</a>
							</form>
							
						</div>
						<!--_____________________//1.2로그인 기업 회원 끝_____________________ -->
						
=======
							</div>
							<!--//row -->

							<!--★ 아이디, 패스워드 까먹었을 경우를 대비  -->
							<a href="#">아이디를 잊어버렸어요</a> <br> <a href="#">패스워드를
								잊어버렸어요</a>

						</form>

>>>>>>> branch 'cbranch3' of https://github.com/LovelyMoonpeel/Recruit.git
					</div>
<!--___//로그인 개인 회원 끝__________________________________________________________________ -->


<!--___로그인 기업 회원 시작__________________________________________________________________ -->
					<div id="login_company" class="tab-pane fade">

<!--action의 속성값으로 인해 UserController의 '/rpjt/loginPost'부분으로 넘어간다  -->
						<form action="/rpjt/loginPost" method="post">

							<!--★ id입력 -->
							<div class="form-group has-feedback">
								<input type="text" name="id" class="form-control"
									placeholder="ID 기업회원 로그인" required /> <span
									class="glyphicon  form-control-feedback"></span>
							</div>

							<!--★ password입력 -->
							<div class="form-group has-feedback">
								<input type="password" name="pw" class="form-control"
									placeholder="Password" required /> <span
									class="glyphicon form-control-feedback"></span>
							</div>

							<!--★ row -->
							<div class="row">

<!--로그인 기업 회원 기억하기 체크버튼 -->
								<div class="col-xs-8">
									<div class="checkbox icheck">
										<label> <input type="checkbox" name="useCookie">
											기억하기
										</label>
									</div>
								</div>

								<!--★ 로그인 버튼 -->
								<div class="col-xs-4">
									<button type="submit"
										class="btn btn-primary btn-block btn-flat">로그인</button>
								</div>

							</div>
							<!--//row -->

							<!--★ 아이디, 패스워드 까먹었을 경우를 대비  -->
							<a href="#">아이디를 잊어버렸어요</a> <br> <a href="#">패스워드를
								잊어버렸어요</a>
						</form>

					</div>
<!--___//로그인 기업 회원 끝__________________________________________________________________ -->

				</div>
				<!--//tab-content 모달 안의 내용/개인회원&기업회원 -->

			</div>
			<!--//class="modal-body"  -->

		</div>
		<!--//class="modal-content col-xs-8"-->

	</div>
	<!--//modal-dialog -->

</div>
<!--___//로그인 모달 끝__________________________________________________________________ -->


<!--___회원가입 모달 시작__________________________________________________________________ -->

<!--★ 여기 써 있는 id값이 맨 밑에 자바 스크립트 부분에서 사용됨/ 회원가입 모달 시작 -->
<!--★ 원래 modal fade인데 fade없애도 상관없는 거 같음, modal은 지우면 안됨  -->
<!--★ 원래id옆에 role="dialog"있었는데 지워도 문제 없음  -->
<div class="modal" id="modal_join">

	<!--★ 뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->
	<div class="modal-dialog">

		<!--★ 아래 두개의 클래스를 추가 했음, col-xs-8을 아래 붙이면 css적용이 안 됨  -->
		<div class="modal-content col-xs-8">

			<div class="modal-body">

				<!--★ x표시 누르면 창 사라지게 하는 코드 -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>

				<!--★ 모달 안에서 맨 위에 있는 네비게이션  -->
				<!--★ href부분 값은 모달 안의 내용에서 id랑 연결된다  -->
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#join_person">개인회원</a></li>
					<li><a data-toggle="tab" href="#join_company">기업회원</a></li>
				</ul>

<<<<<<< HEAD
							<!--action속성값이 rController랑 연결되는 거 같음  -->
							<form role="form" action="/user/joinperson" method="post">
=======
				<br>
>>>>>>> branch 'cbranch3' of https://github.com/LovelyMoonpeel/Recruit.git

				<!--★ 모달 안에 들어가는 내용  -->
				<div class="tab-content">

<!--___회원가입 개인 회원 시작__________________________________________________________________ -->
					<div id="join_person" class="tab-pane fade in active">

<!--action의 속성값으로 인해 UserController의 '/rpjt/joinPost'부분으로 넘어간다  -->
						<form role="form" action="/rpjt/joinPost" method="post">

							<!--★ 뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐  -->
							<div class="box-body">

								<!--★ 아이디 -->
								<div class="form-group">
									아이디<input type="text" name='id' class="form-control"
										placeholder="4~10자리를 입력하세요." required>
								</div>


								<!--★ 비밀번호 -->
								<div class="form-group">
									비밀번호<input type="password" name='pw' class="form-control"
										placeholder="6자리를 입력하세요." required>
								</div>


								<!--★ 이름 -->
								<div class="form-group">
									이름<input type="text" name='pname' class="form-control"
										placeholder="이름을 입력하세요." required>
								</div>


<<<<<<< HEAD
									<!--생년월일/날짜 폼을 썼음 -->
									<div class="form-group">
										생년월일
										<div class="input-group date" data-provide="datepicker">
											<input type="text" name='birth' class="form-control"
												placeholder="생년월일을 입력하세요." required> <span
												class="input-group-addon"> <i
												class="glyphicon glyphicon-calendar"></i>
											</span>
										</div>
									</div>


									<!--이메일 -->
									<div class="form-group has-feedback">
										이메일<input type="text" name="email" class="form-control"
											placeholder="이메일을 입력하세요. 예) iampeel@naver.com" required/> <span
											class="glyphicon  form-control-feedback"></span>
									</div>


									<!--이메일 인증  -->
									<a href="register.html" class="text-center">이메일 인증하기</a>


									<!--가입하기 버튼인데 우측에 붙이고 싶어서 이렇게 설정했음  -->
									<div class="row">
										<div class="col-xs-8"></div>
										<div class="col-xs-4">
											<button type="submit" class="btn btn-primary">가입하기</button>
										</div>
=======
								<!--★ 생년월일/날짜 폼을 썼음 -->
								<div class="form-group">
									생년월일
									<div class="input-group date" data-provide="datepicker">
										<input type="text" name='birth' class="form-control"
											placeholder="생년월일을 입력하세요." required> <span
											class="input-group-addon"> <i
											class="glyphicon glyphicon-calendar"></i>
										</span>
>>>>>>> branch 'cbranch3' of https://github.com/LovelyMoonpeel/Recruit.git
									</div>
								</div>


<<<<<<< HEAD
									<!--비밀번호 -->
									<div class="form-group">
										비밀번호<input type="password" name='pw' class="form-control"
											placeholder="6자리를 입력하세요." required>
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
									<div class="form-group has-feedback">
										담당자 이메일<input type="text" name="email" class="form-control"
											placeholder="담당자 이메일을 입력하세요. 예) iampeel@naver.com" required/> <span
											class="glyphicon  form-control-feedback"></span>
									</div>


									<!--이메일 인증  -->
									<a href="" class="text-center">이메일 인증하기</a> <br> <br>

									<!--사업자 등록번호 -->
									<div class="form-group">
										사업자 등록번호<input type="text" name='registnum'
											class="form-control" placeholder="띄워쓰기 없이 숫자만 연속으로 입력하세요." required>
									</div>


									<!--사업자 등록번호 인증  -->
									<a href="" class="text-center">사업자 등록번호 인증하기</a>


									<!--가입하기 버튼인데 우측에 붙이고 싶어서 이렇게 설정했음  -->
									<div class="row">
										<div class="col-xs-8"></div>
										<div class="col-xs-4">
											<button type="submit" class="btn btn-primary">가입하기</button>
										</div>
									</div>


=======
								<!--★ 이메일 -->
								<div class="form-group has-feedback">
									이메일<input type="text" name="email" class="form-control"
										placeholder="이메일을 입력하세요. 예) iampeel@naver.com" /> <span
										class="glyphicon  form-control-feedback" required></span>
>>>>>>> branch 'cbranch3' of https://github.com/LovelyMoonpeel/Recruit.git
								</div>


								<!--★ 이메일 인증  -->
								<a href="register.html" class="text-center">이메일 인증하기</a>


								<!--★ 가입하기 버튼인데 우측에 붙이고 싶어서 이렇게 설정했음  -->
								<div class="row">
									<div class="col-xs-8"></div>
									<div class="col-xs-4">
										<button type="submit" class="btn btn-primary">가입하기</button>
									</div>
								</div>
							</div>
							<!--//class="box-body" 뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐   -->
						</form>
					</div>
<!--___//회원가입 개인회원 끝__________________________________________________________________  -->

<!--___회원가입 기업회원 시작__________________________________________________________________  -->
					<div id="join_company" class="tab-pane fade">

<!--action의 속성값으로 인해 UserController의 '/rpjt/joinPost'부분으로 넘어간다  -->
						<form role="form" action="joinPost" method="post">

							<!--★ 뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐  -->
							<div class="box-body">

								<!--★ 아이디 -->
								<div class="form-group">
									회사 아이디<input type="text" name='id' class="form-control"
										placeholder="4~10자리를 입력하세요." required>
								</div>


								<!--★ 비밀번호 -->
								<div class="form-group">
									비밀번호<input type="password" name='pw' class="form-control"
										placeholder="6자리를 입력하세요." required>
								</div>


								<!--★ 회사명 -->
								<div class="form-group">
									회사명<input type="text" name='cname' class="form-control"
										placeholder="회사명을 입력하세요." required>
								</div>


								<!--★ 담당자 이름 -->
								<div class="form-group">
									담당자 이름<input type="text" name='pname' class="form-control"
										placeholder="담당자 이름을 입력하세요." required>
								</div>


								<!--★ 담당자 이메일 -->
								<div class="form-group has-feedback">
									담당자 이메일<input type="text" name="email" class="form-control"
										placeholder="담당자 이메일을 입력하세요. 예) iampeel@naver.com" /> <span
										class="glyphicon  form-control-feedback" required></span>
								</div>


								<!--★ 이메일 인증  -->
								<a href="" class="text-center">이메일 인증하기</a> <br> <br>

								<!--★ 사업자 등록번호 -->
								<div class="form-group">
									사업자 등록번호<input type="text" name='registnum'
										class="form-control" placeholder="띄워쓰기 없이 숫자만 연속으로 입력하세요."
										required>
								</div>


								<!--★ 사업자 등록번호 인증  -->
								<a href="" class="text-center">사업자 등록번호 인증하기</a>


								<!--★ 가입하기 버튼인데 우측에 붙이고 싶어서 이렇게 설정했음  -->
								<div class="row">
									<div class="col-xs-8"></div>
									<div class="col-xs-4">
										<button type="submit" class="btn btn-primary">가입하기</button>
									</div>
								</div>


							</div>
							<!--//class="box-body" 뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐   -->

						</form>


					</div>
<!--___//회원가입 기업회원 끝__________________________________________________________________  -->



				</div>
				<!--//class="tab-content" 모달 안에 들어가는 내용 -->

			</div>
			<!--//class="modal-body"  -->

		</div>
		<!--//class="modal-content col-xs-8"-->

	</div>
	<!--//class="modal-dialog" 뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->

</div>
<!--___//회원가입 모달 끝__________________________________________________________________ -->



<!--★ 로그인 모달  -->
<script>
		$(document).ready(function() {
			$("#myBtn_login").click(function() {
				$("#modal_login").modal();
			});
		});
	</script>



<!--★ 회원가입 모달  -->
<script>
		$(document).ready(function() {
			$("#myBtn_join").click(function() {
				$("#modal_join").modal();
			});
		});
	</script>


<!--★ 날짜입력 모달 관련내용  -->
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


<link rel="stylesheet" type="text/css"
	href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<!--//날짜입력 모달 관련내용  -->





<!--iCheck -->
<!--로그인 기억하기 부분인데 iCheck가 있어서 넣었음  -->
<!--근데 이거 넣으면 체크박스가 없어져서 일단 주석처리  -->
<!-- iCheck -->
<!-- jQuery 2.1.4 -->
<!-- <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script> -->

<!-- Bootstrap 3.3.2 JS -->
<!-- <script src="/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script> 

	<script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
<<<<<<< HEAD
    </script> -->
    
<!-- 로그인 부분 수정해볼 예정 -->
<!-- <script>
/* 로그인 버튼 */
$("#replyAddBtn").on("click", function(){
	var contentObj = $("#newReplyText");
	var bnoObj = $("#bno");
	var content = contentObj.val();
	var bno = bnoObj.val();
	
	$.ajax({
		type:'post',
		url:'/user/loginpost',
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
});
</script> -->
=======
    </script>  -->





>>>>>>> branch 'cbranch3' of https://github.com/LovelyMoonpeel/Recruit.git
