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
<!-- 화면전환 -->
<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#user_chart" id="user_cha">회원수</a></li>
	<li><a data-toggle="tab" href="#test_chart" id="test_cha">테스트</a></li>
	<li><a data-toggle="tab" href="#recruit_chart" id="recruit_cha">채용공고</a></li>
</ul>
	<div class="tab-content">
		<div class="tab-pane fade active in" id="user_chart">
			<div class="col-sm-6 result" id="personCheck">
				<div class="panel panel-default fixed-panelr">
					<div align="center" class="panel-body" id="personCheckPanel" style="cursor:pointer">
						<br />
						<div class="recruit-div">
							개인회원 수 <br> ${P_member}
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 result" id="companyCheck">
				<div class="panel panel-default fixed-panelr">
					<div align="center" class="panel-body" id="companyCheckPanel" style="cursor:pointer">
						<br />
						<div class="recruit-div">
							기업회원 수 <br> ${C_member}
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<p id="memberTitle">일주일간 가입한 개인회원 수</p>
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="main-chart" id="member" height="200" width="600"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //tab-pane -->
		<div class="tab-pane fade" id="test_chart">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Line Chart
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="main-chart" id="line-chart" height="200"
									width="600"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="recruit_chart">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						최근 일주일간 등록된 채용공고
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="main-chart" id="recruit" height="200" width="600"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- piechart-대분류 -->
				<div class="col-xs-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							많이 올라온 대분류(최근 일주일)
						</div>
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="chart" id="jobgroup-chart"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- piechart-소분류 -->
				<div class="col-xs-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							많이 올라온 소분류(최근 일주일)
						</div>
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="chart" id="jobgroup2-chart"></canvas>
							</div>
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
<script src="/resources/rpjt/js/chart.min.js"></script>
<script src="/resources/rpjt/js/easypiechart.js"></script>
<script src="/resources/rpjt/js/easypiechart-data.js"></script>

<script>
var day = [];			//등록된 채용공고 날짜별 분류
var weekRecruit = [];	//등록된 채용공고 수
var jobgroup = [];		//대분류용(jobgroup)
var weekJobgroup = [];	//대분류용(jobgroup)
var jobgroupData = [];	//대분류용(jobgroup)
var jobgroup2 = [];		//소분류용(jobgroup)
var weekJobgroup2 = [];	//소분류용(jobgroup)
var jobgroup2Data = [];	//소분류용(jobgroup)
var weekPerson = [];
var weekCompany = [];
var color = ["#30a5ff", "#ffb53e", "#1ebfae", "#f9243f"];
var highlight = ["#62b9fb", "#fac878", "#3cdfce", "#f6495f"];
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
	<c:forEach items="${weekJobgroup2}" var = "StatisticVO">
		jobgroup2[<%= cnt%>] = "${StatisticVO.jobgroup1}, "+"${StatisticVO.jobgroup2}";
		weekJobgroup2[<%= cnt%>] = ${StatisticVO.weekJobgroup2};
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

$("#test_cha").on("click",function(){
	setTimeout(function(){
		var chart1 = document.getElementById("line-chart").getContext("2d");
		window.myLine = new Chart(chart1).Line(lineChartData, {
			responsive : true,
			scaleLineColor : "rgba(0,0,0,.2)",
			scaleGridLineColor : "rgba(0,0,0,.05)",
			scaleFontColor : "#c5c7cc"
		});
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
			jobgroupData[i] = {value:weekJobgroup[i], color:color[i], highlight:highlight[i], label:jobgroup[i]};
		}
		
		for(var i=0;i<4;i++){
			jobgroup2Data[i] = {value:weekJobgroup2[i], color:color[i], highlight:highlight[i], label:jobgroup2[i]};
		}
		
		var chart4 = document.getElementById("jobgroup-chart").getContext("2d");
		window.myPie = new Chart(chart4).Pie(jobgroupData, {
		responsive: true,
		segmentShowStroke: false
		});
		
		var chart5 = document.getElementById("jobgroup2-chart").getContext("2d");
		window.myPie = new Chart(chart5).Pie(jobgroup2Data, {
		responsive: true,
		segmentShowStroke: false
		});
	}
	, 200);
});

$("#personCheck").on("click", function(){
	setTimeout(function(){
		document.getElementById("memberTitle").innerHTML = "일주일간 가입한 개인회원 수";
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
		document.getElementById("memberTitle").innerHTML = "일주일간 가입한 기업회원 수";
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
			label: "회원데이터",
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
				label: "회원데이터",
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

var recruitChart = {
		labels : day,
		datasets : [
			{
				label: "채용공고데이터",
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
})
</script>
<%@include file="../include/cfooter.jsp"%>
