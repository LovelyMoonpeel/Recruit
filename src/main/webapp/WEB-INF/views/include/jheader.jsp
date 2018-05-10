<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.recruit.domain.UserVO"%>

<%
	String id = "";
	UserVO login = null;
	String cname = "";
	String location = ""; //mypage 경로 설정 변수
	String c_chk = null; //company_check
	String myPage = "MyPage"; //myPage 이름 변경

	try {
		login = (UserVO) session.getAttribute("login");
		if (login != null) {
			id = login.getId();
			cname = login.getCname();
			c_chk = login.getCname();
		}
		if (cname == null) {
			if (id.equals("admin")) {
				location = "/admin/main";
				myPage = "관리자 페이지";
			} else {
				location = "/personal/index";
			}
		} else {
			location = "/company/C_index";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<style>
.badge-danger {
	background-color: #bd2130;
}
#drop_a:hover .badge-danger{
  	background-color: #dc3545;
}
</style>

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
<!-- 		<img src="/resources/rpjt/img/recruit/Large_R.png" width="30px">
		<img src="/resources/rpjt/img/recruit/small_e.png" width="30px">
		<img src="/resources/rpjt/img/recruit/small_c.png" width="30px">
		<img src="/resources/rpjt/img/recruit/small_r.png" width="30px">
		<img src="/resources/rpjt/img/recruit/small_u.png" width="30px">
		<img src="/resources/rpjt/img/recruit/Large_I.png" width="30px">
		<img src="/resources/rpjt/img/recruit/Large_T.png" width="30px"> -->
		<!-- <img style="cursor:pointer;" src="/resources/rpjt/img/recruit/recruit.png" width="200px" onclick="self.location='/'"> -->
		<a class="navbar-brand" href="/" style="font-size: 25px;">RecruIT</a>
	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse"
		id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/cs/notice" class="header">공지사항</a></li>
			<li><a href="/srch/main?stype=1" class="header">기업찾기</a></li>
			<li><a id="p_search" style="cursor: pointer;" class="header">인재찾기</a></li>

			<!--회원가입, 로그인 부분 -->
			<!--★ a href="#" 삭제하면 안됨  -->
			<!--c태그를 이용해서 로그인 되면 MyPage,로그아웃이 나오게 함  -->
			<c:if test="${empty sessionScope.login}">
				<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_join모달이 뜬다-->
				<li id="myBtn_join"><a style="cursor: pointer;" class="header"> <span
						class="glyphicon glyphicon-user"></span> 회원가입
				</a></li>

				<!--버튼을 누르면 아래 스크립트문에 의해서 id=modal_login모달이 뜬다-->
				<li id="myBtn_login"><a style="cursor: pointer;" class="header"> <span
						class="glyphicon glyphicon-log-in"></span> 로그인
				</a></li>
			</c:if>
			<!--//회원가입, 로그인 부분  -->

			<!--MyPage, 로그아웃 부분  -->
			<c:if test="${not empty sessionScope.login}">

				<li><a href="<%=location%>" class="header"><%=myPage %></a></li>


				<!--버튼을 누르면 UserController에  /user/logout을 찾아간다 -->
				<li><a href="/user/logout" class="header"> <span
						class="glyphicon glyphicon-log-out"></span>로그아웃
				</a></li>
				<li><a style="color: white;">${sessionScope.login.pname}님
						환영합니다.</a></li>
				<li class="dropdown" class="header">
				    <a id="drop_a" class="dropdown-toggle header" data-toggle="dropdown" style="cursor:pointer;">
				    	<span id="message_check" style="font-size:20px;" class="glyphicon glyphicon-bell header"></span>
				   		<span id="message_count" class="badge badge-danger"></span>	
				    </a>
				   		
				    <ul id="drop_ul" class="dropdown-menu container" 
				    	style="width:250px; border:solid 0.5px black; 
				    	word-wrap:break-word; white-space:no-wrap; word-break: normal; text-overflow:ellipsis; overflow:hidden;">
				      
				      <li><a class="message1" style="cursor:pointer;"></a></li>
				      <li><a class="message2" style="cursor:pointer;"></a></li>
				      <li><a class="message3" style="cursor:pointer;"></a></li>
				      <li><a class="message4" style="cursor:pointer;"></a></li>
				      <li><a class="message5" style="cursor:pointer;"></a></li>
				      <li><a class="message6" style="cursor:pointer;" href="/message">
				       	알림 전체보기 <span class="glyphicon glyphicon-chevron-right"></span></a></li>
				    </ul>
				</li>
			</c:if>
			<!--//MyPage, 로그아웃 부분  -->
		</ul>
	</div> <!-- /.navbar-collapse -->
	</div> <!-- /.container -->
</nav>

<script>
$(document).ready(function(){
	var id = '<%=id%>';
	
	$.ajax({
		type:'POST',
		url:'/message_count',
		headers:{
			"Content-Type":"application/json; charset=UTF-8",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType:'text',
		success:function(result){
			if(result!=''){
				$("#message_count").text(result);		
				console.log(result);
				console.log("알림창 o");
			}else{
				console.log("알림창 x");
			}
		}//success end
	});//ajax end
	
	$("#drop_a").on("click", function(){
		var id = '<%=id%>';
		
		$.ajax({
			type:'POST',
			url:'/message_read',
			headers:{
				"Content-Type":"application/json; charset=UTF-8",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType:'json',
			success:function(data){
				if(data!=''){
					for(var j=0;j<data.length;j++){
					var array = data[j]
					var keys = Object.keys(data[j]);
					var rcno;
					var color;
					for(var k in keys){
						if(keys[k]=="rcno"){
							rcno = array[keys[k]];
						}
						if(keys[k]=="color"){
							color = array[keys[k]];
						}
					}
					
					/* for(var i=0;i<data.length;i++){ */
						
						var order = j+1;
						var cname = '<%=cname%>';
						var id = '<%=id%>';
						
						if(cname=='null'){//개인회원일 경우
							if(id=='admin'){
								$(".message"+order).text("Q&A가 등록되었습니다.");
								$(".message"+order).attr("href", "/admin/qna");
							}else{
								if(rcno != 0){
									if(color == 4){
										$(".message"+order).text("Q&A에 답변이 달렸습니다.");
										$(".message"+order).attr("href", "/cs/qnaread?bno="+rcno);
									}else if(color == 3){
										$(".message"+order).text("이력서가 변경되었습니다.");
										$(".message"+order).attr("href", "/personal/Rmodify?bno="+rcno);
									}else{
										$(".message"+order).text("이력서가 열람되었습니다.");
										$(".message"+order).attr("href", "/personal/applied_all");									
									}
								}else{
									$(".message"+order).text("개인정보가 변경되었습니다.");
									$(".message"+order).attr("href", "/personal/index");
								}
							}
						}else if(cname=null){
							$(".message"+order).text(data[i].rcno + data[i].message);
						}else{//기업회원일 경우
							if(rcno == 0){
								$(".message"+order).text("회사정보가 변경되었습니다.");
								$(".message"+order).attr("href", "/company/C_index");									
							}else{
								if(color == 4){
									$(".message"+order).text("Q&A에 답변이 달렸습니다.");
									$(".message"+order).attr("href", "/cs/qnaread?bno="+rcno);
								}else if(color == 3){
									$(".message"+order).text("채용공고가 변경되었습니다.");
									$(".message"+order).attr("href", "/company/C_recruitModify?bno="+rcno);
								}else{
									$(".message"+order).text("지원자의 이력서를 확인해주세요.");
									$(".message"+order).attr("href", "/company/C_manage");									
								}
							}
						}
						
					/* } */ 
					}
				}else{
					console.log(data);
					console.log("실패함");
				}
			}//success end
		});//ajax end
	});//drop onclick
	
	$("#p_search").on("click",function(){
		var c_chk = "<%=c_chk%>";
		
		if(c_chk=="null"){
			if("<%=location%>" != "/admin/main") {
					alert("기업회원으로 로그인 해주세요.");
				} else {
					self.location = "/srch/main?stype=2";
				}
			} else {
				self.location = "/srch/main?stype=2";
			}
		});
	
});//document ready
</script>

	<%@ include file="../include/login.jsp"%>