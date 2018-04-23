<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/sheader2.jsp"%>
<%
	// carousel 연결주소 및 이미지
	String carouselUrl = "/company/C_info_nonavi?recruitNum=";
	String carouselImg = "/resources/rpjt/img/";
	String[][] carouselItems = { // 회사 아이디, carousel 이미지
			{"rcode0", "frontimg5.jpg"}, //
			{"assagini", "frontimg6.jpg"}, //
			{"octest", "frontimg7.jpg"}};

	for (int i = 0; i < carouselItems.length; i++) {
		request.setAttribute("carouselUrl" + i, carouselUrl + carouselItems[i][0]);
		request.setAttribute("carouselImg" + i, carouselImg + carouselItems[i][1]);
	}
%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js">
	
</script>

<!-- container -->
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
					<a href="${carouselUrl0}"
						onclick='window.open(this.href, "cinforcode0", "width=1050, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'>
						<img src="${carouselImg0}" alt="Los Angeles" style="width: 100%;">
					</a>
					<div class="carousel-caption"></div>
				</div>

				<div class="item">
					<a href="${carouselUrl1}"
						onclick='window.open(this.href, "cinfoassagini", "width=1050, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'>
						<img src="${carouselImg1}" alt="Chicago" style="width: 100%;">
					</a>
				</div>

				<div class="item">
					<a href="${carouselUrl2}"
						onclick='window.open(this.href, "cinfooctest", "width=1050, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'>
						<img src="${carouselImg2}" alt="New york" style="width: 100%;">
					</a>
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
		<!-- end of col-md-8 -->
	</div>
	<!-- end of 검색 텍스트 -->
</div>
<!-- end of container -->
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

<!-- carousel, 판넬 스타일 -->
<style>
.carousel-div {
	width: 220px;
	height: 120px;
	overflow: hidden;
}

.carousel-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.recruit-div {
	width: 220px;
	height: 120px;
	overflow: hidden;
}

.recruit-img {
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.fixed-panelr {
	min-height: 360px;
}

.title_ellipsis{
	white-space: nowrap;
	width : 100%;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>

<div class="container">
	<div class="row" id="spanel"></div>
</div>

<!-- 채용공고 판넬 -->
<script id="tmpnl_recruit" type="text/x-handlebars-template">
<div class="col-lg-3 col-sm-6 result">
	<div class="panel panel-default fixed-panelr">
		<div align="center" class="panel-body">
			<br />
			<div class="recruit-div">
				<img class="recruit-img thumbnail" src="{{img}}">
			</div>
			<h4>
				<b>{{cname}}</b>
			</h4>
			<p class="col-md-12">
				<a href="{{url}}"
					onclick='window.open(this.href, "recruit{{bno}}", "width=1050, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'><b>{{title}}</b></a>
			</p>
			<p class='title_ellipsis col-md-12'>
				{{jobgroupid}}, {{jobgroupid2}}<br /> {{edu}}, {{exp}}
			</p>
			~ {{period}}<br />
			{{jobstateid}}
		</div>
	</div>
</div>
</script>

<script>
	var cImgSrc = "/company/displayFile?fileName="; // 사진 url 변수
	var recruitUrl = "/company/C_recruitMent?recruitNum="; // 링크 url 변수
	var menuNum = 8; // 드롭다운 Menu 갯수

	// DropDown Menu
	// dropdown 근무형태, 학력, 경력
	// 전역변수
	var str; // 드롭다운 메뉴 리스트
	var drop1ListItems; // 드롭다운 메뉴 리스트 생성함수

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
		var tPage = parseInt((data.length - 1) / menuNum);
		var dataSlice = data.slice(menuNum * j1page, menuNum * (j1page + 1));

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
				+ that.rgbid + '99">' + that.rgbname + '</a></li>';
	}

	// dropdown 1번째 region 생성하기
	function drop1RegHandler(data) {
		$("#region .cls1,#region .cls2").remove();
		str = "";
		var tPage = parseInt((data.length - 1) / menuNum);
		var dataSlice = data.slice(menuNum * r1page, menuNum * (r1page + 1));
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
	function deletespanel() {
		$(".result").remove();
		$("#spanel").children().remove();
	}

	// text 검색 버튼 click 이벤트 핸들러
	$("#search_btn").on("click", function() {
		var sinp = $("#sinput").val();
		var sout = "";
		console.log(sinp);
		var len = sinp.length;
		for (var j = 0; j < len; j++) {
			// console.log("TEST: " + j + " " + sinp.charCodeAt(j).toString(16));
			var sinpcode = sinp.charCodeAt(j);
			console.log(sinpcode);
			if (sinpcode < 128)
				sout += '%' + sinpcode.toString(16);
			else
				sout += sinp[j];
		}
		console.log(sout);
		location.href = "/srch/main?skeyword=" + sout;
	});

	// 채용공고 판넬 전역변수
	var item;
	var template_pnl;

	// 채용공고 판넬 연결
	function recruitPnl(index, that) {
		item = {
			bno : that.bno,
			userid : that.userid,
			title : that.title,
			jobgroupid : that.jobgroupid,
			jobgroupid2 : that.jobgroupid2,
			rgbid : that.rgbid,
			rgsid : that.rgsid,
			employstatusid : that.employstatusid,
			edu : that.edu,
			exp : that.exp,
			img : cImgSrc + that.img,
			cname : that.cname,
			period : that.period,
			jobstateid : that.jobstateid,
			url : recruitUrl + that.bno
		};
		$("#spanel").append(template_pnl(item));
	}

	var argum = null;
	var tmp = null;
	var moreView = false;

	function RecruitInfHandler(data) {
		if (argum !== false)
			deletespanel();
		$("#infSrch").remove();
		// cinfo & recruit 분류
		var dataR = new Array();
		for (var i = 0; i < data.length; i++) {
			if (data[i].period !== 'etern' && data[i].title !== 'lastRecruit')
				dataR.push(data[i]);
			if (data[i].title === 'lastRecruit')
				lastpage = true;
		}
		var source_pnl = $("#tmpnl_recruit").html();
		template_pnl = Handlebars.compile(source_pnl);
		$(dataR).each(recruitPnl);
		if (moreView === false) {
			tmp = '<div id="moreView" onclick="$(this).remove(); moreView = true;"><h5 align="center"><span style="color: white;">'
					+ '_</span><br /><a href="javascript:;">채용공고 더보기</a></h5></div>';
			$("#spanel").append(tmp);
		}
		infScrDone = true;
	}

	// 모든 채용공고(recruits)를 보여주다.
	function getRecruitAllList(pnum, panpg) {
		argum = arguments[2];
		$.getJSON("/sresult/recruits/getkey/all/" + pnum + "/" + panpg,
				RecruitInfHandler);
	}

	function waitForSearching(str, num) {
		deletespanel();
		str = '<h3 align="center">' + str + '</h3>';
		for (var i = 0; i < num; i++) {
			str = '<br/>' + str + '<br/>';
		}
		$("#spanel").append(str);
	}

	var snum = 8; // 로딩 판넬 갯수
	var page = 0; // 무한스크롤 페이지
	var lastpage = false;
	var infScrDone = false; // false 무한 스크롤 작업중, true 무한스크롤 작업대기

	var smsg = '<img src="/resources/rpjt/img/loading.gif" height="100">';
	waitForSearching(smsg, 8);
	getRecruitAllList(snum * 3, page++);
	page += 2;

	$("#sinput").focus();

	function infiniteScroll() {
		if ($(window).scrollTop() >= $(document).height() - $(window).height() - 1) {
			if (infScrDone && !lastpage && moreView) {
				console.log(page);
				getRecruitAllList(snum, page++, false);

				tmp = '<div id="infSrch"><br /><h3 align="center"><span style="color: white;">'
						+ '_</span><br /><br /><img src="/resources/rpjt/img/loading.gif" height="60">'
						+ '</h3><br /></div>';

				$("#spanel").append(tmp);
				infScrDone = false;
				if (page % 4 === 3)
					moreView = false;
			}
		}
	}

	$(window).scroll(infiniteScroll);
</script>

<script type="text/javascript">
	var result = '${msg}';

	if (result == 'login') {
		alert("로그인이 필요합니다.");
	} else if (result == 'logout') {
		alert("로그아웃 되었습니다.");
	} else if (result == 'join') {
		alert("회원가입이 완료 되었습니다. 이메일 인증을 진행 해주세요.");
	} else if (result == 'fail') {
		alert("접근권한이 없습니다.");
	}
</script>

<%@include file="../include/cfooter.jsp"%>