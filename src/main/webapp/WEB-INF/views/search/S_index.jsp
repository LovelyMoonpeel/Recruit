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
					<input type="text" class="form-control"
						placeholder="채용공고 검색, 키워드를 입력후 돋보기 아이콘을 누르세요." name="skeyword"
						id="sinput" onKeyDown="onEnter();">
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
	<div class="row" id="spanel">
		<h3 style="text-align: center;">
			<a style="color: black;" href="http://blog.fupfin.com/?p=11">프로그래밍
				명언</a>
		</h3>
		<br />
		<div class="col-md-6">
			<blockquote>1. "소프트웨어 설계를 구성하는 데에는 두 가지 방법이 있다. 한가지 방법은
				아주 단순하게 만들어서 명백히 결함이 없게 된다. 그리고 다른 방법은 너무 복잡하게 만들어서 명백한 결함이 없게 된다."</blockquote>
			<blockquote>2. "결국 당신 코드를 유지보수하게 될 친구가 당신이 어디에 사는지 아는
				광폭한 싸이코패스가 될 것이라고 여기고 코드를 작성하라."</blockquote>
			<blockquote>3. "좋은 프로그래머 대부분은 돈이나 대중에게 받을 찬사를 기대하고
				프로그래밍을 하지 않고 프로그래밍이 재미 있어서 한다."</blockquote>
			<blockquote>4. "[의회 의원에게] 두 번 이런 질문을 받았다. '배비지 선생님, 그
				기계에 잘못된 수를 집어 넣어도 올바른 답이 나오는지 말씀해 주시겠습니까?' 나는 어떤 유형의 개념적 혼란이 이런 질문을
				유발하는지 바로 이해할 수 없다."</blockquote>
			<blockquote>5. "인간적인 반복, 성스러운 재귀"</blockquote>
		</div>
		<div class="col-md-6">
			<blockquote>6. "프로그래머가 격는 어려움은 프로그래머가 무엇을 하는지 너무 늦기 전에
				말할 수 없다는 점이다."</blockquote>
			<BLOCKQUOTE>7. "오늘날 소프트웨어 대부분은 이집트 피라미드와 매우 비슷한데, 수많은
				블럭을 차곡차곡 쌓은 이것은, 구조적 무결성은 없고, 그저 마구잡이로 노예 수천을 동원해 완성됐다."</BLOCKQUOTE>
			<BLOCKQUOTE>8. "당신 대부분은 프로그래머의 미덕과 친숙하다. 미덕은 세 가지인데,
				당연히, 게으름, 성급함, 오만이다."</BLOCKQUOTE>
			<BLOCKQUOTE>9. "먼저 컴퓨터 과학과 모든 이론을 배워라. 다음엔 프로그래밍 방식을
				개발하라. 그러고 나선 모두 잊고 그냥 파헤쳐라."</BLOCKQUOTE>
			<BLOCKQUOTE>10. "사람들은 컴퓨터 과학이 천재들의 기예이라고 생각하지만 사실 현실은
				반대로, 단지 많은 사람이, 작은 돌로 된 담처럼, 다른 사람의 작업 위에 쌓아 올릴 뿐이다."</BLOCKQUOTE>
		</div>
	</div>
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

<script>
	// Menu 갯수
	var mnum = 8;

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
		str += '<li value="' + that.id +'"><a href="/srch/main?sfilter='
				+ that.id + '">' + that.career + '</a></li>';
	}

	drop1ListItems = drop1CodListItems; // list items 생성함수 연결
	$.getJSON("/sresult/code/1", drop1CodHandler); // experience(1)
	$.getJSON("/sresult/code/2", drop1CodHandler); // education(2)
	$.getJSON("/sresult/code/4", drop1CodHandler); // employment status(4)

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
	function drop1JobListItems(index, that) { // J + job code
		str += '<li class="cls1" value="' + that.id +'"><a href="/srch/main?sfilter=J'
				+ that.id + '">' + that.jobgroup + '</a></li>';
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

	$("#jobgroup").on("click", ".cls1", function() {
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
			console.log($(this).attr("value"));
		}
	});

	// dropdown 지역
	// 전역변수
	var r1page = 0;
	var rstate = 0;
	// 0: 초기상태
	// 1: 작동상태

	// dropdown 1번째 코드(지역) list items 생성하기
	function drop1RegListItems(index, that) { // R + region code
		str += '<li class="cls1" value="' + that.rgbid +'"><a href="/srch/main?sfilter=R'
				+ that.rgbid + '">' + that.rgbname + '</a></li>';
	}

	// dropdown 1번째 region 생성하기
	function drop1RegHandler(data) {
		$("#region .cls1,#region .cls2").remove();
		str = "";
		var tPage = parseInt((data.length - 1) / mnum);
		var dataSlice = data.slice(mnum * r1page, mnum * (r1page + 1));
		if (tPage !== 0 && r1page !== 0) {
			str += '<li id="rup" class="cls1" style="text-align: center;" value="' + r1page + '"><a href="javascript:;">'
					+ '<i class="glyphicon glyphicon-chevron-up"></i>'
					+ '</a></li>';
		}
		$(dataSlice).each(drop1RegListItems);
		if (tPage !== 0 && r1page !== tPage) {
			str += '<li id="rdown" class="cls1" style="text-align: center;" value="' + r1page + '"><a href="javascript:;">'
					+ '<i class="glyphicon glyphicon-chevron-down"></i>'
					+ '</a></li>';
		}
		$("#region").append(str);
		if (rstate !== 0)
			$("#regionMenu").trigger('click');
	}

	// 지역별 Menu 클릭
	$("#regionMenu").on("click", function() {
		if ($(this).closest("li").hasClass("open")) {
			r1page = 0;
			rstate = 0;
		}

		if (rstate === 0)
			$.getJSON("/sresult/region", drop1RegHandler);
	});

	$("#region").on("click", ".cls1", function() {
		if ($(this).attr("id") === 'rup') {
			r1page--;
			rstate = 1;
			$.getJSON("/sresult/region", drop1RegHandler);
		} else if ($(this).attr("id") === 'rdown') {
			r1page++;
			rstate = 1;
			$.getJSON("/sresult/region", drop1RegHandler);
		} else {
			console.log($(this).attr("value"));
		}
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
	function deletequote() {
		$(".result").remove();
		$("#spanel").children().remove();
	}

	// text 검색 버튼 click 이벤트 핸들러
	$("#search_btn").on("click", function() {
		var sinp = $("#sinput").val();
		$("#sinput").val("");
		console.log(sinp);
		location.href = "/srch/main?skeyword=" + sinp;
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
		$.getJSON("/sresult/recruits", function(data) {
			var source_pnl = $("#tmpnl_recruit").html();
			template_pnl = Handlebars.compile(source_pnl);
			console.log(data.length);
			data.length = 20;
			deletequote();
			$(data).each(recruitPnl);
		});
	}

	getRecruitAllList();
</script>

<%@include file="../include/sfooter.jsp"%>