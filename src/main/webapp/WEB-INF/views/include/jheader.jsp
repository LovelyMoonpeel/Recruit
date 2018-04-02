<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import = "com.recruit.domain.BoardVO" %>


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
		if(cname == null){
			if(id.equals("admin")){
				location = "/admin/main";
			}else{
				location = "/personal/index";
			}
		}else{
			location = "/company/C_index";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<div class="wrap">
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
				<a class="navbar-brand" href="/">퍼팩트 매칭</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/srch/main?stype=1">기업찾기</a></li>
					<li><a href="/srch/main?stype=2">인재찾기</a></li>

					<!--회원가입, 로그인 부분 -->
					<!--★ a href="#" 삭제하면 안됨  -->
					<!--c태그를 이용해서 로그인 되면 MyPage,로그아웃이 나오게 함  -->
					<c:if test="${empty sessionScope.login}">
						<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_join모달이 뜬다-->
						<li id="myBtn_join"><a> <span
								class="glyphicon glyphicon-user"></span> 회원가입
						</a></li>

						<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_login모달이 뜬다-->
						<li id="myBtn_login"><a> <span
								class="glyphicon glyphicon-log-in"></span> 로그인
						</a></li>
					</c:if>
					<!--//회원가입, 로그인 부분  -->

					<!--MyPage, 로그아웃 부분  -->
					<c:if test="${not empty sessionScope.login}">

						<li><a href="<%= location%>">MyPage</a></li>
						
						
						<!--버튼을 누르면 UserController에  /user/logout을 찾아간다 -->
						<li><a href="/user/logout">
						<span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
						<li><a style="color: white;">${sessionScope.login.pname}님 환영합니다.</a></li>
					</c:if>
					<!--//MyPage, 로그아웃 부분  -->
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>


<%@ include file="../include/login.jsp"%>


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