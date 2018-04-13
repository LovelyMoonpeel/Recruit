<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/aheader.jsp"%>

<!-- Chart 페이지 -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">통계</h1>
		</div>
	</div>
	<!--/.row-->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Line Chart
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="line-chart" height="200"
								width="600"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- //row -->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">회원수
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="Member" height="200"
								width="600"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- //row -->
<ul class="nav nav-tabs">
	<!--★ href부분 값은 밑에 id랑 연결된다  -->
	<li class><a data-toggle="tab" href="#login_person">개인회원</a></li>
	<li class><a data-toggle="tab" href="#login_company">기업회원</a></li>
</ul>

<br>

<!--모달 안의 내용/개인회원&기업회원  -->
<div class="tab-content">
	<!--_____________________1-1.로그인 개인 회원 시작_____________________ -->
	<div name="login_person" class="tab-pane fade">

		<!-- action의 속성값으로 인해 UserController의 '/user/loginPost'부분으로 넘어간다  -->
		<form action="/user/loginPost" method="post">
			<input type="hidden" name="index" value="per"> <input
				type="hidden" name="location" class="location">
			<!--id입력  -->
			<!--★ 는 빈칸을 두지않게 하는 장치  -->
			<div class="form-group has-feedback">
				<input type="text" name="id" class="form-control"
					placeholder="ID 개인 회원 로그인" value="<%=pidc%>" /> <span
					class="glyphicon  form-control-feedback"></span>
			</div>

			<!--password입력 -->
			<div class="form-group has-feedback">
				<input type="password"  name="pw" class="form-control"
					placeholder="Password" /> <span
					class="glyphicon form-control-feedback"></span>
			</div>

			<!--★ row로 인해서 여러 개를 한 줄에 나열 -->
			<div class="row">

				<!--기억하기 체크버튼  -->
				<div class="col-xs-8">
					<div class="checkbox icheck">
						<label> <input type="checkbox" name="useCookie"
							<%=pchkc%>> 기억하기
						</label>
					</div>
				</div>

				<!--로그인 버튼 -->
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
				</div>

			</div>
			<!--//row -->

			<!--아이디, 패스워드 까먹었을 경우를 대비  -->
			<a href="/user/IDsearch">아이디를 잊어버렸어요</a> <br> <a
				href="/user/PWsearch">패스워드를 잊어버렸어요</a>

		</form>

	</div>
	<!--_____________________//1-1.로그인 개인 회원 끝_____________________ -->


	<!--_____________________1-2.로그인 기업 회원 시작_____________________ -->
	<div  class="tab-pane fade <%=cactive%>">

		<form action="/user/loginPost" method="post">
			<input type="hidden" name="index" value="com"> <input
				type="hidden" name="location" class="location">
			<!--id입력 -->
			<div class="form-group has-feedback">
				<input type="text" name="logincid" name="id" class="form-control"
					placeholder="ID 기업회원 로그인" value="<%=cidc%>" /> <span
					class="glyphicon  form-control-feedback"></span>
			</div>

			<!--password입력 -->
			<div class="form-group has-feedback">
				<input type="password" name="logincpw" name="pw" class="form-control"
					placeholder="Password" /> <span
					class="glyphicon form-control-feedback"></span>
			</div>

			<!--row -->
			<div class="row">
				<!--기억하기 체크버튼  -->
				<div class="col-xs-8">
					<div class="checkbox icheck">
						<label> <input type="checkbox" name="useCookie"
							<%=cchkc%>> 기억하기
						</label>
					</div>
				</div>

				<!--로그인 버튼 -->
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
				</div>

			</div>
			<!--//row -->

			<!--아이디, 패스워드 까먹었을 경우를 대비  -->
			<a href="/user/IDsearch">아이디를 잊어버렸어요</a> <br> <a
				href="/user/PWsearch">패스워드를 잊어버렸어요</a>
		</form>

	</div>
	<!--_____________________//1.2로그인 기업 회원 끝_____________________ -->

</div>
<!--//tab-content 모달 안의 내용/개인회원&기업회원 -->
</div>


<!-- //FAQ 페이지 -->
<!-- /.container -->
<script src="/resources/rpjt/js/chart.min.js"></script>
<script src="/resources/rpjt/js/easypiechart.js"></script>
<script src="/resources/rpjt/js/easypiechart-data.js"></script>

<!-- 그래프 표현 -->
<script>
	window.onload = function test() {
		var chart1 = document.getElementById("line-chart").getContext("2d");
		window.myLine = new Chart(chart1).Line(lineChartData, {
			responsive : true,
			scaleLineColor : "rgba(0,0,0,.2)",
			scaleGridLineColor : "rgba(0,0,0,.05)",
			scaleFontColor : "#c5c7cc"
		});

		var chart2 = document.getElementById("Member").getContext("2d");
		window.myLine2 = new Chart(chart2).Line(Memberchart, {
			responsive : true,
			scaleLineColor : "rgba(0,0,0,.2)",
			scaleGridLineColor : "rgba(0,0,0,.05)",
			scaleFontColor : "#c5c7cc"
		});
	};
</script>

<!-- 그래프 데이터 -->
<script>
var randomScalingFactor = function(){
	return Math.round(Math.random()*1000)
	};
 
var lineChartData ={
	labels : ["January","February","March","April","May","June","July"],
	datasets : [
		{
			label: "My First dataset",
			fillColor : "rgba(48, 164, 255, 0.2)",
			strokeColor : "rgba(48, 164, 255, 1)",
			pointColor : "rgba(48, 164, 255, 1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		}
	]
}

var Memberchart = {
	labels : ["개인회원","기업회원"],
	datasets : [
		{
			label: "회원데이터",
			fillColor : "rgba(48, 164, 255, 0.2)",
			strokeColor : "rgba(48, 164, 255, 1)",
			pointColor : "rgba(48, 164, 255, 1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data : ["${P_member}","${C_member}"]
		}
	]
}
</script>

<%@include file="../include/cfooter.jsp"%>