<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/sheader2.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js">
	
</script>

<!-- Page Content -->
<div class="container">
	<!-- carousel -->
	<div class="row">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/resources/rpjt/img/la.jpg" alt="Los Angeles"
						style="width: 100%;">
					<div class="carousel-caption">
						<h3>LOS ANGELES</h3>
						<p>Los Angeles, officially the City of Los Angeles and often
							known by its initials L.A., is the cultural, financial, and
							commercial center of Southern California.</p>
					</div>
				</div>

				<div class="item">
					<img src="/resources/rpjt/img/chicago.jpg" alt="Chicago"
						style="width: 100%;">
					<div class="carousel-caption">
						<h3>CHICAGO</h3>
						<p>Chicago, officially the City of Chicago, is the third most
							populous city in the United States.</p>
					</div>
				</div>

				<div class="item">
					<img src="/resources/rpjt/img/ny.jpg" alt="New york"
						style="width: 100%;">
					<div class="carousel-caption">
						<h3>NEW YORK</h3>
						<p>The City of New York, often called New York City or simply
							New York, is the most populous city in the United States.</p>
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<!-- end of carousel -->
	<br />
	<!-- 검색 택스트 -->
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<form onsubmit="return false;">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="${sdesc}"
						name="skeyword" id="sinput" onKeyDown="onEnter();">
					<div class="input-group-btn">
						<button class="btn btn-default" id="search_btn" type="button">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- end of 검색 텍스트 -->
</div>
<br />

<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="row">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;직무&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="jobgroup">
								<li><a href="#">Page 1-1</a></li>
								<li><a href="#">Page 1-2</a></li>
								<li role=separator class=divider></li>
								<li><a href="#">Page 1-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;지역&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="region">
								<li><a href="#">Page 2-1</a></li>
								<li><a href="#">Page 2-2</a></li>
								<li role=separator class=divider></li>
								<li><a href="#">Page 2-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;근무형태&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="emp">
								<li><a href="#">Page 3-1</a></li>
								<li><a href="#">Page 3-2</a></li>
								<li><a href="#">Page 3-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;학력&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="edu">
								<li><a href="#">Page 4-1</a></li>
								<li><a href="#">Page 4-2</a></li>
								<li><a href="#">Page 4-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;경력&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="exp">
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>

<div class="container">
	<div class="row" id="spanel"></div>
</div>
<!-- /Page Content -->

<script id="tmpnl_recruit" type="text/x-handlebars-template">
<div class="col-md-3 result">
	<div class="panel panel-default">
		<div class="panel-body">
			{{cname}} (~{{period}})<br />
			{{title}}<br />
			({{jobgroupid}}, {{jobgroupid2}})<br />
			{{edu}}, {{exp}}<br />
			({{rgbid}}, {{rgsid}})<br />
		</div>
	</div>
</div>
</script>

<script id="tmpnl_resume" type="text/x-handlebars-template">
<div class="col-md-3 result">
	<div class="panel panel-default">
		<div class="panel-body">
			{{pname}} ({{jobstateid}})<br />
			{{jobgroupid}}, {{jobgroupid2}}<br />
			{{title}}<br />
			({{rgbid}}, {{rgsid}})
		</div>
	</div>
</div>
</script>

<script>
	// dropdown 전역변수
	var drop1ListItems;

	// dropdown 1번째 생성하기
	function drop1Handler(data) {
		str = "";
		console.log(data.length);
		var i = 0;
		$(data).each(drop1ListItems);
	}

	// dropdown 1번째 코드(근무형태, 학력, 경력) list items 생성하기
	function drop1CodListItems(index, that) {
		str += '<li value="'+ that.id +'"><a href="#">' + that.career
				+ '</a></li>';
	}

	drop1ListItems = drop1CodListItems; // list items 생성함수 연결
	$.getJSON("/sresult/code/1", drop1Handler); // experience(1)
	$("#exp").append(str);

	drop1ListItems = drop1CodListItems; // list items 생성함수 연결
	$.getJSON("/sresult/code/2", drop1Handler); // education(2)
	$("#edu").append(str);

	drop1ListItems = drop1CodListItems; // list items 생성함수 연결
	$.getJSON("/sresult/code/4", drop1Handler); // employment status(4)
	$("#emp").append(str);

	// text 검색 엔터키 처리
	function onEnter() {
		if (event.keyCode == 13) {
			$("#search_btn").trigger('click');
			return false;
		}
	}

	// 검색 결과 판넬 list 제거
	function deletelist() {
		$(".result").remove();
	}

	// text 검색 버튼 click 이벤트 핸들러
	$("#search_btn").on("click", function() {
		var sinp = $("#sinput").val();
		$("#sinput").val("");
		console.log(sinp);
	});

	// 채용공고 판넬 전역변수
	var i;
	var item;
	var template_pnl;

	// 채용공고 판넬 연결
	function recruitPnl(index, that) {
		item = {
			num : ++i,
			bno : that.bno,
			cid : that.cid,
			title : that.title,
			jobgroupid : that.jobgroupid,
			jobgroupid2 : that.jobgroupid2,
			rgbid : that.rgbid,
			rgsid : that.rgsid,
			cname : that.cname,
			edu : that.edu,
			exp : that.exp,
			period : that.period
		};
		$("#spanel").append(template_pnl(item));
	}

	// 모든 채용공고(recruits)를 보여주다.
	function getRecruitAllList() {
		deletelist();
		$.getJSON("/sresult/recruits", function(data) {
			var source_pnl = $("#tmpnl_recruit").html();
			template_pnl = Handlebars.compile(source_pnl);
			console.log(data.length);
			data.length = 16;
			$(data).each(recruitPnl);
		});
	}

	getRecruitAllList();
</script>

<%@include file="../include/sfooter.jsp"%>