<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/aheader.jsp"%>

<!-- Chart 페이지 -->
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="container col-md-9">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">통계</h1>
		</div>
	</div>
	<!--/.row-->
<!-- 화면전환 -->
<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#user_chart" id="user_cha">회원수</a></li>
	<li><a data-toggle="tab" href="#resume_chart" id="resume_cha">이력서</a></li>
	<li><a data-toggle="tab" href="#recruit_chart" id="recruit_cha">채용공고</a></li>
</ul>
	<div class="tab-content">
		<div class="tab-pane fade active in" id="user_chart">
			<div class="col-md-6 result" id="personCheck">
				<div class="panel panel-default fixed-panelr">
					<div align="center" class="panel-body" id="personCheckPanel" style="cursor:pointer">
						<br>
						<div class="recruit-div">
							개인회원 수 <br>${P_member}
						</div>
						<br>
					</div>
				</div>
			</div>
			<div class="col-md-6 result" id="companyCheck">
				<div class="panel panel-default fixed-panelr">
					<div align="center" class="panel-body" id="companyCheckPanel" style="cursor:pointer">
						<br>
						<div class="recruit-div">
							기업회원 수 <br>${C_member}
						</div>
						<br>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<p id="memberTitle">일주일간 가입한 개인회원 수 : ${weekPcount}</p>
						<div class="panel-body">
							<div class="canvas-wrapper">
								<div id="member2" style="width: 100%;"></div>
								<canvas class="main-chart" id="member" height="200" width="600"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //tab-pane -->
		<div class="tab-pane fade" id="resume_chart">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<p>일주일간 등록된 이력서 : ${weekResumeCount}</p>
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="main-chart" id="resume" height="200"
									width="600"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- piechart-대분류 -->
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							많이 올라온 직종(최근 일주일)
						</div>
						<div class="panel-body" style="height: 450px;">
								<%-- <canvas class="chart" id="rJobgroup-chart"></canvas> --%>
								<div id="rJobgroup-chart"></div>
						</div>
					</div>
				</div>
				<!-- piechart-지역 -->
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							많이 올라온 지역(최근 일주일)
						</div>
						<div class="panel-body" style="height: 450px;">
							<div id="rRgb-chart"></div>
							<%-- <div class="canvas-wrapper">
								<canvas class="chart" id="rRgb-chart"></canvas>
							</div> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="recruit_chart">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<p>최근 일주일간 등록된 채용공고 : ${weekRecruitCount}</p>
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="main-chart" id="recruit" height="200" width="600"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- piechart-대분류 -->
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							많이 올라온 직종(최근 일주일)
						</div>
						<div class="panel-body" style="height: 450px;">
							<div id="jobgroup-chart"></div>
						</div>
					</div>
				</div>
				<!-- piechart-지역 -->
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							많이 올라온 지역(최근 일주일)
						</div>
						<div class="panel-body" style="height: 450px;">
							<div id="rgb-chart"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- tab-content -->
</div>
<!-- main -->
<!-- //chart 페이지 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.0/Chart.bundle.min.js"></script> -->
<script src="/resources/rpjt/js/chart.min.js"></script>
<script src="/resources/rpjt/js/chart.min2.js"></script>
<!-- <script src="/resources/rpjt/js/easypiechart.js"></script> -->

<script>
var day = [];			//등록된 채용공고 날짜별 분류
var weekRecruit = [];	//등록된 채용공고 수
var jobgroup = [];		//대분류용(jobgroup)
var weekJobgroup = [];	//대분류용(jobgroup)
var jobgroupData = [];	//대분류용(jobgroup)
var rgbname = [];		//채용공고 지역별
var weekRgb= [];		//채용공고 지역별
var rgbData = [];		//채용공고 지역별
var rRgbname = [];		//이력서 지역별
var weekRRgb= [];		//이력서 지역별
var rRgbData = [];		//이력서 지역별
var weekPerson = [];	//주간 개인회원 가입자 수
var weekCompany = [];	//주간 기업회원 가입자 수
var weekResume = [];	//주간 이력서 작성 수
var rJobgroup = [];		//이력서 대분류(jobgroup)
var weekRJobgroup = [];	//이력서 대분류 수
var rJobgroupData = [];	//이력서 대분류용(jobgroup)
var color = ["#30a5ff", "#FFA500", "#1ebfae", "#f9243f"];	//파이차트 색상
window.onload = function(){
	
	<% int cnt = 0; %>
	<c:forEach items="${weekRecruit}" var="StatisticVO">
		day[<%= cnt%>] = "${StatisticVO.day}";
		weekRecruit[<%= cnt%>] = ${StatisticVO.weekRecruit};
		<% cnt++; %>
	</c:forEach>
	
	<% cnt = 0; %>
	<c:forEach items="${weekJobgroup}" var = "StatisticVO">
		jobgroup[<%= cnt%>] = "${StatisticVO.jobgroup}";
		weekJobgroup[<%= cnt%>] = ${StatisticVO.weekJobgroup};
		<% cnt++; %>
	</c:forEach>
	
	<% cnt = 0; %>
	<c:forEach items="${weekRgb}" var = "StatisticVO">
		rgbname[<%= cnt%>] = "${StatisticVO.rgbname}";
		weekRgb[<%= cnt%>] = ${StatisticVO.weekRgb};
		<% cnt++; %>
	</c:forEach>
	
	<% cnt = 0; %>
	<c:forEach items="${weekPerson}" var = "StatisticVO">
		weekPerson[<%= cnt%>] = ${StatisticVO.weekPerson};
		<% cnt++; %>
	</c:forEach>
	
	<% cnt = 0; %>
	<c:forEach items="${weekCompany}" var = "StatisticVO">
		weekCompany[<%= cnt%>] = ${StatisticVO.weekCompany};
		<% cnt++; %>
	</c:forEach>
	
	<% cnt = 0; %>
	<c:forEach items="${weekResume}" var = "StatisticVO">
		weekResume[<%= cnt%>] = ${StatisticVO.weekResume};
		<% cnt++; %>
	</c:forEach>
	
	<% cnt = 0; %>
	<c:forEach items="${weekRJobgroup}" var = "StatisticVO">
		rJobgroup[<%= cnt%>] = "${StatisticVO.rJobgroup}";
		weekRJobgroup[<%= cnt%>] = ${StatisticVO.weekRJobgroup};
		<% cnt++; %>
	</c:forEach>
	
	<% cnt = 0; %>
	<c:forEach items="${weekRRgb}" var = "StatisticVO">
		rRgbname[<%= cnt%>] = "${StatisticVO.rRgbname}";
		weekRRgb[<%= cnt%>] = ${StatisticVO.weekRRgb};
		<% cnt++; %>
	</c:forEach>
}

 

/* 그래프 표현 */
$("#user_cha").on("click", function(){
	setTimeout(function(){
		$("#companyCheckPanel").removeClass("statCheck");
		$("#personCheckPanel").addClass("statCheck");
		var chart2 = document.getElementById("member").getContext("2d");
		window.myLine = new Chart(chart2).Line(personMemberChart, {
			responsive: true,
			scaleLineColor: "rgba(0,0,0,.2)",
			scaleGridLineColor: "rgba(0,0,0,.05)",
			scaleFontColor: "#c5c7cc"
		});
	}, 200);
});

$("#resume_cha").on("click",function(){
	setTimeout(function(){
		var chart1 = document.getElementById("resume").getContext("2d");
		window.myLine = new Chart(chart1).Line(resumeChart, {
			responsive : true,
			scaleLineColor : "rgba(0,0,0,.2)",
			scaleGridLineColor : "rgba(0,0,0,.05)",
			scaleFontColor : "#c5c7cc"
		});
		
		for(var i=0;i<4;i++){
			rJobgroupData[i] = {y:weekRJobgroup[i], color:color[i], label:rJobgroup[i]};
		}
		
		for(var i=0;i<4;i++){
			rRgbData[i] = {y:weekRRgb[i], color:color[i], label:rRgbname[i]};
		}
		
		var chart6 = new CanvasJS.Chart("rJobgroup-chart", {
			animationEnabled: true,
			data: [{
				type: "pie",
				startAngle: 270,
				yValueFormatString: "#,##0",
				indexLabel: "{label} {y}",
				dataPoints: rJobgroupData
			}]
		});
		chart6.render();
		
		
		var chart7 = new CanvasJS.Chart("rRgb-chart", {
			animationEnabled: true,
			data: [{
				type: "pie",
				startAngle: 270,
				yValueFormatString: "#,##0",
				indexLabel: "{label} {y}",
				dataPoints: rRgbData
			}]
		});
		chart7.render();
		
	}, 200);
});

$("#recruit_cha").on("click", function(){
	setTimeout(function(){
		var chart3 = document.getElementById("recruit").getContext("2d");
		window.myLine = new Chart(chart3).Line(recruitChart, {
			responsive : true,
			scaleLineColor : "rgba(0,0,0,.2)",
			scaleGridLineColor : "rgba(0,0,0,.05)",
			scaleFontColor : "#c5c7cc"
		});
		
		for(var i=0;i<4;i++){
			jobgroupData[i] = {y:weekJobgroup[i], color:color[i], label:jobgroup[i]};
		}
		
		for(var i=0;i<4;i++){
			rgbData[i] = {y:weekRgb[i], color:color[i], label:rgbname[i]};
		}
		
		var chart4 = new CanvasJS.Chart("jobgroup-chart", {
			animationEnabled: true,
			data: [{
				type: "pie",
				startAngle: 270,
				yValueFormatString: "#,##0",
				indexLabel: "{label} {y}",
				dataPoints: jobgroupData
			}]
		});
		chart4.render();
			
		var chart5 = new CanvasJS.Chart("rgb-chart", {
			animationEnabled: true,
			data: [{
				type: "pie",
				startAngle: 270,
				yValueFormatString: "#,##0",
				indexLabel: "{label} {y}",
				dataPoints: rgbData
			}]
		});
		chart5.render();
		
	}
	, 200);
});

$("#personCheck").on("click", function(){
	setTimeout(function(){
		document.getElementById("memberTitle").innerHTML = "일주일간 가입한 개인회원 수"+" : ${weekPcount}";
		$("#companyCheckPanel").removeClass("statCheck");
		$("#personCheckPanel").addClass("statCheck");
		var chart2 = document.getElementById("member").getContext("2d");
		window.myLine = new Chart(chart2).Line(personMemberChart, {
			responsive: true,
			scaleLineColor: "rgba(0,0,0,.2)",
			scaleGridLineColor: "rgba(0,0,0,.05)",
			scaleFontColor: "#c5c7cc"
		});
	}, 200);
});

$("#companyCheck").on("click", function(){
	setTimeout(function(){
		document.getElementById("memberTitle").innerHTML = "일주일간 가입한 기업회원 수"+" : ${weekCcount}";
		$("#personCheckPanel").removeClass("statCheck");
		$("#companyCheckPanel").addClass("statCheck");
		var chart2 = document.getElementById("member").getContext("2d");
		window.myLine = new Chart(chart2).Line(companyMemberChart, {
			responsive: true,
			scaleLineColor: "rgba(0,0,0,.2)",
			scaleGridLineColor: "rgba(0,0,0,.05)",
			scaleFontColor: "#c5c7cc"
		});
	}, 200);
});

/* 그래프 데이터 */
var personMemberChart = {
	labels : day,
	datasets : [
		{
			label: "개인회원 데이터",
			fillColor : "rgba(48, 164, 255, 0.2)",
			strokeColor : "rgba(48, 164, 255, 1)",
			pointColor : "rgba(48, 164, 255, 1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data : weekPerson
		}
	]
}

var companyMemberChart = {
		labels : day,
		datasets : [
			{
				label: "기업회원 데이터",
				fillColor : "rgba(48, 164, 255, 0.2)",
				strokeColor : "rgba(48, 164, 255, 1)",
				pointColor : "rgba(48, 164, 255, 1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : weekCompany
			}
		]
	}

var resumeChart ={
	labels : day,
	datasets : [
		{
			label: "이력서 데이터",
			fillColor : "rgba(48, 164, 255, 0.2)",
			strokeColor : "rgba(48, 164, 255, 1)",
			pointColor : "rgba(48, 164, 255, 1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(220,220,220,1)",
			data : weekResume
		}
	]
}

var recruitChart = {
		labels : day,
		datasets : [
			{
				label: "채용공고 데이터",
				fillColor : "rgba(48, 164, 255, 0.2)",
				strokeColor : "rgba(48, 164, 255, 1)",
				pointColor : "rgba(48, 164, 255, 1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : weekRecruit
			}
		]
	}

</script>

<script>
$(document).ready(function(){
	$("#user_cha").trigger("click");
});

$('.canvasjs-chart-canvas').contents()
.filter(function(){
    return this.nodeType === 3 && $.trim(this.nodeValue) !== '';
}).remove();
</script>
<%@include file="../include/cfooter.jsp"%>