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
	<li class="active"><a data-toggle="tab" href="#test_chart" id="test_cha">테스트</a></li>
	<li><a data-toggle="tab" href="#user_chart" id="user_cha">회원수</a></li>
	<li><a data-toggle="tab" href="#recruit_chart" id="recruit_cha">채용공고</a></li>
</ul>
	<div class="tab-content">
		<div class="tab-pane fade active in" id="test_chart">
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
		<!-- //tab-pane -->

		<div class="tab-pane fade" id="user_chart">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						회원수
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="main-chart" id="member" height="200" width="600"></canvas>
							</div>
						</div>
					</div>
					개인회원 기업회원    오늘 가입자수
				</div>
			</div>
		</div>
		<!-- //tab-pane -->
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
					<div class="panel panel-default">
						<div class="panel-heading">
							Pie Chart
						</div>
						<div class="panel-body">
							<div class="canvas-wrapper">
								<canvas class="chart" id="pie-chart"></canvas>
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
var day = [];
var weekRecruit = [];
var pieData = [];
var color = ["#30a5ff", "#ffb53e", "#1ebfae", "#f9243f"];
var highlight = ["#62b9fb", "#fac878", "#3cdfce", "#f6495f"];
window.onload = function(){
	
	<% int cnt = 0; %>
	<c:forEach items="${weekRecruit}" var="StatisticVO">
		day[<%= cnt%>] = "${StatisticVO.day}";
		weekRecruit[<%= cnt%>] = "${StatisticVO.weekRecruit}";
		<% cnt++; %>
	</c:forEach>

}



/* 그래프 표현 */
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

$("#user_cha").on("click", function(){
	setTimeout(function(){
		var chart2 = document.getElementById("member").getContext("2d");
		window.myLine2 = new Chart(chart2).Line(memberChart, {
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
		window.myLine3 = new Chart(chart3).Line(recruitChart, {
			responsive : true,
			scaleLineColor : "rgba(0,0,0,.2)",
			scaleGridLineColor : "rgba(0,0,0,.05)",
			scaleFontColor : "#c5c7cc"
		});
		
		for(var i=0;i<4;i++){
			pieData[i] = {value:parseInt(weekRecruit[i+3]), color:color[i], highlight:highlight[i], label:day[i+3]};
		}
		
		var chart4 = document.getElementById("pie-chart").getContext("2d");
		window.myPie = new Chart(chart4).Pie(pieData, {
		responsive: true,
		segmentShowStroke: false
		});
	}
	, 200);
});


/* 그래프 데이터 */
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

var memberChart = {
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
	
/* for(var i=0;i<4;i++){
	pieData[i] = {value:weekRecruit[i], color:color[i], highlight:highlight[i], label:day[i]};
} */

/* var pieData = [
	{
		value: 300,
		color:"#30a5ff",
		highlight: "#62b9fb",
		label: "Blue"
	},
	{
		value: 50,
		color: "#ffb53e",
		highlight: "#fac878",
		label: "Orange"
	},
	{
		value: 100,
		color: "#1ebfae",
		highlight: "#3cdfce",
		label: "Teal"
	},
	{
		value: 120,
		color: "#f9243f",
		highlight: "#f6495f",
		label: "Red"
	}
]; */
</script>

<script>
$(document).ready(function(){
	$("#test_cha").trigger("click");
})
</script>
<%@include file="../include/cfooter.jsp"%>
