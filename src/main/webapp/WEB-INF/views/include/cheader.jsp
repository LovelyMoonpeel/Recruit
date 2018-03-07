<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>퍼팩트 매칭</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/rpjt/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<!-- <link href="css/shop-item.css" rel="stylesheet"> -->
<link href="/resources/rpjt/css/lovelyB_022711.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>
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
					<!--a href="#" 삭제하면 안됨  -->
					<!--c태그 이용해서 로그인 되면 MyPage,로그아웃이 나오게 함  -->
					<c:if test="${empty sessionScope.login}">
						<li id="myBtn_join"><a href="#"> <span
								class="glyphicon glyphicon-user"></span> 회원가입
						</a></li>

						<li id="myBtn_login"><a href="#"> <span
								class="glyphicon glyphicon-log-in"></span> 로그인
						</a></li>
					</c:if>
					<!--//회원가입, 로그인 부분  -->


					<!--MyPage, 로그아웃 부분  -->
					<c:if test="${not empty sessionScope.login}">
						<li><a href="#">MyPage</a></li>
						<li><a href="/rpjt/logout">로그아웃</a></li>
					</c:if>
					<!--//MyPage, 로그아웃 부분  -->
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!--__________________________로그인 모달 시작_______________________________________  -->

	<!--
	해야 할 것
	1. 기억하기 체크박스 처리
	2. 로그인 틀린 사람 처리하기
	3. 아이디, 패스워드 잊어먹었을 경우 처리
	4. 모달찰 정가운데 배치-->

	<!--여기 써 있는 id값이 맨 밑에 자바 스크립트 부분에서 사용됨/ 회원가입 모달 시작 -->
	<!--원래 modal fade인데 fade없애도 상관없는 거 같음, modal은 지우면 안됨  -->
	<!--원래id옆에 role="dialog"있었는데 지워도 문제 없음  -->
	<div class="modal" id="modal_login">

		<!--뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->
		<div class="modal-dialog">

			<!--col-xs-8을 써서 모달 가로 폭을 조정했음  -->
			<!--위에 있는 클래스랑 아래 있는 클래스랑 합치려고 modal-dialog를 아래 써 봤는데 이상해짐  -->
			<div class="login-box-body col-xs-8">

				<!--x표시 누르면 창 사라지게 하는 코드 -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>

				<!--모달 안에서 맨 위에 있는 네비게이션  -->
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#login_person">개인회원</a></li>
					<li><a data-toggle="tab" href="#login_company">기업회원</a></li>
				</ul>
				<br>
				<!--모달 안에 들어가는 내용/개인회원+기업회원  -->
				<div class="tab-content">
					<!--_____________________로그인 개인 회원 시작_____________________ -->
					<div id="login_person" class="tab-pane fade in active">
						<!--640쪽 action의 속성값은 '/rpjt/loginPost'를 호출한다.  -->
						<form action="/rpjt/loginPost" method="post">
							<!--id입력  -->
							<div class="form-group has-feedback">
								<input type="text" name="id" class="form-control"
									placeholder="ID 개인 회원 로그인" /> <span
									class="glyphicon  form-control-feedback"></span>
							</div>
							<!--password입력 -->
							<div class="form-group has-feedback">
								<input type="password" name="pw" class="form-control"
									placeholder="Password" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
							<!--기억하기, 로그인 /그 줄에 로그인 버튼까지 있어서 row -->
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
							<!--//기억하기, 로그인 -->
							<!--아이디, 패스워드 까먹었을 경우를 대비  -->
							<a href="#">아이디를 잊어버렸어요</a> <br> <a href="#">패스워드를
								잊어버렸어요</a>
						</form>
					</div>
					<!--//_____________________로그인 개인 회원 끝_____________________ -->

					<!--_____________________로그인 기업 회원 시작_____________________ -->
					<div id="login_company" class="tab-pane fade">
						<!--640쪽 action의 속성값은 '/rpjt/loginPost'를 호출한다.  -->
						<form action="/rpjt/loginPost" method="post">
							<!--id입력 -->
							<div class="form-group has-feedback">
								<input type="text" name="id" class="form-control"
									placeholder="ID 기업회원 로그인" /> <span
									class="glyphicon  form-control-feedback"></span>
							</div>
							<!--password입력 -->
							<div class="form-group has-feedback">
								<input type="password" name="pw" class="form-control"
									placeholder="Password" /> <span
									class="glyphicon form-control-feedback"></span>
							</div>
							<!--기억하기, 로그인 /그 줄에 로그인 버튼까지 있어서 row -->
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
							<!--//기억하기,로그인 -->
							<!--아이디, 패스워드 까먹었을 경우를 대비  -->
							<a href="#">아이디를 잊어버렸어요</a> <br> <a href="#">패스워드를
								잊어버렸어요</a>
						</form>
					</div>
					<!--//_____________________로그인 기업 회원 끝_____________________ -->
				</div>
				<!--//tab-content 모달 안에 들어가는 내용 끝(기업회원+개인회원) -->
			</div>
			<!--//login-box-body 가로 폭 조정-->
		</div>
		<!--//modal-dialog 없애면 왼쪽에 붙음 -->
	</div>
	<!--//_____________________로그인 모달 끝_____________________-->
	<!--_____________________회원가입 모달 시작_____________________-->
	<!--
	전체 관련 해야 할 것들
	1. 모달찰 정가운데 배치
	-->
	<!--
	개인회원 해야 할 것들
	1. 아이디 4자리 미만 경고
	2. 아이디 10자리 넘어서 입력 못하게
	3. 비밀번호 6자리 미만 경고
	4. 비밀번호 6자리 넘어서 입력 못하게
	5. 이메일 인증
	6. 가입 후 어디로 이동하게 할 것인지
	7. 비밀번호 확인 탭 추가
	-->


	<!--
	기업회원 해야 할 것들
	1. 아이디 4자리 미만 경고
	2. 아이디 10자리 넘어서 입력 못하게
	3. 비밀번호 6자리 미만 경고
	4. 비밀번호 6자리 넘어서 입력 못하게
	5. 이메일 인증
	6. 사업자 등록 번호 숫자만 입력하게
	7. 사업자 등록 번호 인증
	8. 가입 후 어디로 이동하게 할 것인지
	9. 비밀번호 확인 탭 추가
	-->



	<!--여기 써 있는 id값이 맨 밑에 자바 스크립트 부분에서 사용됨/ 회원가입 모달 시작 -->
	<!--원래 modal fade인데 fade없애도 상관없는 거 같음, modal은 지우면 안됨  -->
	<!--원래id옆에 role="dialog"있었는데 지워도 문제 없음  -->
	<div class="modal" id="modal_join">

		<!--뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->
		<div class="modal-dialog">

			<!--col-xs-8을 써서 모달 가로 폭을 조정했음  -->
			<!--위에 있는 클래스랑 아래 있는 클래스랑 합치려고 modal-dialog를 아래 써 봤는데 이상해짐  -->
			<div class="login-box-body col-xs-8">

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

					<!--_____________________회원가입 개인 회원 시작_____________________ -->
					<div id="join_person" class="tab-pane fade in active">

						<!--action속성값이 rController랑 연결되는 거 같음  -->
						<form role="form" action="joinperson" method="post">

							<!--뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐  -->
							<div class="box-body">

								<!--아이디 -->
								<div class="form-group">
									아이디<input type="text" name='id' class="form-control"
										placeholder="4~10자리를 입력하세요.">
								</div>


								<!--비밀번호 -->
								<div class="form-group">
									비밀번호<input type="password" name='pw' class="form-control"
										placeholder="6자리를 입력하세요.">
								</div>


								<!--이름 -->
								<div class="form-group">
									이름<input type="text" name='pname' class="form-control"
										placeholder="이름을 입력하세요.">
								</div>


								<!--생년월일/날짜 폼을 썼음 -->
								<div class="form-group">
									생년월일
									<div class="input-group date" data-provide="datepicker">
										<input type="text" name='birth' class="form-control"
											placeholder="생년월일을 입력하세요."> <span
											class="input-group-addon"> <i
											class="glyphicon glyphicon-calendar"></i>
										</span>
									</div>
								</div>


								<!--이메일 -->
								<div class="form-group has-feedback">
									이메일<input type="text" name="email" class="form-control"
										placeholder="이메일을 입력하세요. 예) iampeel@naver.com" /> <span
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
								</div>
							</div>
							<!--//class="box-body" 뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐   -->
						</form>
					</div>
					<!--//_____________________회원가입 개인회원 끝_____________________  -->

					<!--_____________________회원가입 기업회원 시작_____________________  -->
					<div id="join_company" class="tab-pane fade">
						<form role="form" action="joinperson" method="post">

							<!--뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐  -->
							<div class="box-body">

								<!--아이디 -->
								<div class="form-group">
									회사 아이디<input type="text" name='id' class="form-control"
										placeholder="4~10자리를 입력하세요.">
								</div>


								<!--비밀번호 -->
								<div class="form-group">
									비밀번호<input type="password" name='pw' class="form-control"
										placeholder="6자리를 입력하세요.">
								</div>


								<!--회사명 -->
								<div class="form-group">
									회사명<input type="text" name='cname' class="form-control"
										placeholder="회사명을 입력하세요.">
								</div>


								<!--담당자 이름 -->
								<div class="form-group">
									담당자 이름<input type="text" name='pname' class="form-control"
										placeholder="담당자 이름을 입력하세요.">
								</div>


								<!--담당자 이메일 -->
								<div class="form-group has-feedback">
									담당자 이메일<input type="text" name="email" class="form-control"
										placeholder="담당자 이메일을 입력하세요. 예) iampeel@naver.com" /> <span
										class="glyphicon  form-control-feedback"></span>
								</div>


								<!--이메일 인증  -->
								<a href="" class="text-center">이메일 인증하기</a> <br> <br>

								<!--사업자 등록번호 -->
								<div class="form-group">
									사업자 등록번호<input type="text" name='registnum'
										class="form-control" placeholder="띄워쓰기 없이 숫자만 연속으로 입력하세요.">
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


							</div>
							<!--//class="box-body" 뭔지 모르겠지만 box-body를 빼면 전체 틀이 약간 구려짐   -->

						</form>


					</div>
					<!--//_____________________회원가입 기업회원 끝_____________________  -->



				</div>
				<!--//class="tab-content" 모달 안에 들어가는 내용 -->

			</div>
			<!--//class="login-box-body col-xs-8" col-xs-8을 써서 모달 가로 폭을 조정했음-->

		</div>
		<!--//class="modal-dialog" 뭔지 모르겠지만 없애면 왼쪽에 붙고, 가로폭도 조절이 안됨  -->

	</div>
	<!--//_____________________회원가입 모달 끝_____________________-->



	<!--___로그인 모달  -->
	<script>
		$(document).ready(function() {
			$("#myBtn_login").click(function() {
				$("#modal_login").modal();
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
		type="text/javascript"></script> -->

	<!-- <script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script> -->





	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<p class="lead">기업정보관리</p>
				<div class="list-group">
					<a href="/rpjt/C_index?id=${CInfoVO.id}" class="list-group-item">기업정보관리</a>
					<a href="/rpjt/C_write?id=${CInfoVO.id}" class="list-group-item">채용공고작성</a>
					<a href="/rpjt/C_manage?id=${CInfoVO.id}" class="list-group-item">채용공고관리</a>
					<a href="/rpjt/C_recom?id=${CInfoVO.id}" class="list-group-item">추천인재</a>
					<a href="/rpjt/C_favor?id=${CInfoVO.id}" class="list-group-item">관심인재</a>
				</div>
			</div>