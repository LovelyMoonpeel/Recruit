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
					<div class="navbar-header">
						<a class="navbar-brand" href="#" style="color: white;">채용정보</a>
					</div>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a id="jobgroupMenu"
							class="dropdown-toggle" data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;직무별&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="jobgroup">
								<li role=separator class=divider></li>
							</ul></li>
						<li class="dropdown"><a id="regionMenu"
							class="dropdown-toggle" data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;지역별&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="region">
								<li role=separator class=divider></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;근무형태별&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="emp">
								<li role=separator class=divider></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;학력별&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="edu">
								<li role=separator class=divider></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;경력별&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu" id="exp">
								<li role=separator class=divider></li>
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
	// Menu 갯수
	var mnum = 9;

	// DropDown Menu
	// dropdown 근무형태, 학력, 경력
	// 전역변수
	var str;
	var drop1ListItems;

	// dropdown 1번째 code 생성하기
	function drop1CodHandler(data) {
		str = "";
		console.log(data.length);
		$(data).each(drop1ListItems);
		var tid = data[0].tid;
		if (tid === 1)
			$("#exp").append(str); // experience(1)
		else if (tid === 2)
			$("#edu").append(str); // education(2)
		else
			$("#emp").append(str); // employment status(4)
	}

	// dropdown 1번째 코드(근무형태, 학력, 경력) list items 생성하기
	function drop1CodListItems(index, that) {
		str += '<li value="' + that.id +'"><a href="javascript:;">'
				+ that.career + '</a></li>';
	}

	drop1ListItems = drop1CodListItems; // list items 생성함수 연결
	$.getJSON("/sresult/code/1", drop1CodHandler); // experience(1)
	$.getJSON("/sresult/code/2", drop1CodHandler); // education(2)
	$.getJSON("/sresult/code/4", drop1CodHandler); // employment status(4)
	// $.getJSON("/sresult/region", drop1RegHandler);

	$("#exp").on("click", "li", function() {
		console.log($(this).attr("value"));
	});

	$("#edu").on("click", "li", function() {
		console.log($(this).attr("value"));
	});

	$("#emp").on("click", "li", function() {
		console.log($(this).attr("value"));
	});

	// dropdown 직무
	// 전역변수
	var j1page = 0;
	var jstate = 0;
	// 0: 초기상태
	// 1: 작동상태

	// dropdown 1번째 코드(직무) list items 생성하기
	function drop1JobListItems(index, that) {
		str += '<li class="cls1" value="' + that.id +'"><a href="javascript:;">'
				+ that.jobgroup + '</a></li>';
	}

	// dropdown 1번째 jobgroup 생성하기
	function drop1JobHandler(data) {
		$("#jobgroup .cls1,#jobgroup .cls2").remove();
		str = "";
		var tPage = parseInt((data.length - 1) / mnum);
		var dataSlice = data.slice(mnum * j1page, mnum * (j1page + 1));

		// for (var i = 0; i <= tPage; i++) {
		// 	console.log(data.slice(mnum * i, mnum * (i + 1))); // i: n 페이지 -> page 0~(n-1)
		// }

		if (tPage !== 0 && j1page !== 0) {
			str += '<li id="jup" class="cls1" style="text-align: center;" value="' + j1page + '"><a href="javascript:;">'
					+ '<i class="glyphicon glyphicon-chevron-up"></i>'
					+ '</a></li>';
		}
		$(dataSlice).each(drop1JobListItems);
		if (tPage !== 0 && j1page !== tPage) {
			str += '<li id="jdown" class="cls1" style="text-align: center;" value="' + j1page + '"><a href="javascript:;">'
					+ '<i class="glyphicon glyphicon-chevron-down"></i>'
					+ '</a></li>';
		}
		$("#jobgroup").append(str);
		if (jstate !== 0)
			$("#jobgroupMenu").trigger('click');
	}

	// 직무별 Menu 클릭
	$("#jobgroupMenu").on("click", function() {
		if ($(this).closest("li").hasClass("open")) {
			j1page = 0;
			jstate = 0;
		}

		if (jstate === 0)
			$.getJSON("/sresult/jobg", drop1JobHandler);
	});

	$("#jobgroup").on(
			"click",
			".cls1",
			function() {
				if ($(this).attr("id") === 'jup') {
					console.log("jup");
					console.log($(this).attr("value"));
					j1page--;
					jstate = 1;
					console.log("jstate: " + jstate);
					$.getJSON("/sresult/jobg", drop1JobHandler);
				} else if ($(this).attr("id") === 'jdown') {
					console.log("jdown");
					console.log($(this).attr("value"));
					j1page++;
					jstate = 1;
					console.log("jstate: " + jstate);
					$.getJSON("/sresult/jobg", drop1JobHandler);
				} else {
					$.getJSON("/sresult/jobg/" + $(this).attr("value"),
							drop2JobHandler);
				}
			});

	/*
	// dropdown 2번째 jobgroup 생성하기
	function drop2JobHandler(data) {
		jobcls = 2;
		$("#jobgroup .cls1").remove();
		str = "";
		console.log(data.length);
		// data.length = 10;
		$(data).each(drop2JobListItems);
		$("#jobgroup").append(str);
		$("#jobgroupMenu").trigger('click');
	}

	// dropdown 2번째 코드(직무) list items 생성하기
	function drop2JobListItems(index, that) {
		str += '<li class="cls2" value="' + that.id +'"><a href="javascript:;">'
				+ that.jobgroup + '</a></li>';
	}

	$("#jobgroup").on("click", ".cls1", function() {
		$.getJSON("/sresult/jobg/" + $(this).attr("value"), drop2JobHandler);
	});

	$("#jobgroup").on("click", ".cls2", function() {
		jobcls = 0
		$.getJSON("/sresult/jobg", drop1JobHandler);
		console.log($(this).attr("value"));
	});
	 */

	// dropdown 지역
	// 전역변수
	var regcls = 0;
	// dropdown 1번째 region 생성하기
	function drop1RegHandler(data) {
		regcls = 1;
		$("#region .cls1,#region .cls2").remove();
		str = "";
		console.log(data.length);
		$(data).each(drop1RegListItems);
		$("#region").append(str);
	}

	// dropdown 1번째 코드(지역) list items 생성하기
	function drop1RegListItems(index, that) {
		str += '<li class="cls1" value="' + that.rgbid +'"><a href="javascript:;">'
				+ that.rgbname + '</a></li>';
	}

	// dropdown 2번째 region 생성하기
	function drop2RegHandler(data) {
		regcls = 2;
		$("#region .cls1").remove();
		str = "";
		console.log(data.length);
		// data.length = 10;
		$(data).each(drop2RegListItems);
		$("#region").append(str);
		$("#regionMenu").trigger('click');
	}

	// dropdown 2번째 코드(지역) list items 생성하기
	function drop2RegListItems(index, that) {
		str += '<li class="cls2" value="' + that.rgsid +'"><a href="javascript:;">'
				+ that.rgsname + '</a></li>';
	}

	$("#region").on("click", ".cls1", function() {
		$.getJSON("/sresult/region/" + $(this).attr("value"), drop2RegHandler);
	});

	$("#region").on("click", ".cls2", function() {
		regcls = 0
		$.getJSON("/sresult/region", drop1RegHandler);
		console.log($(this).attr("value"));
	});

	// 지역별 Menu 클릭
	$("#regionMenu").on("click", function() {
		if (regcls !== 2)
			$.getJSON("/sresult/region", drop1RegHandler);
	});
	// End of DropDown Menu

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
	var inum;
	var item;
	var template_pnl;

	// 채용공고 판넬 연결
	function recruitPnl(index, that) {
		item = {
			num : ++inum,
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