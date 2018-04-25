<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.recruit.domain.SrchVO"%>
<%@ include file="../include/sheader2.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js">
	
</script>

<!-- container -->
<div class="container">
	<%
		SrchVO srchVO = (SrchVO) request.getAttribute("srchVO");
		String stitle;

		if ("2".equals(srchVO.getStype())) {
			stitle = "인재 검색";
		} else {
			srchVO.setStype("1");
			stitle = "채용공고 검색";
		}
		request.setAttribute("stitle", stitle);
	%>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<br />
			<h3 align="center">${stitle}</h3>
			<br />
			<!-- 검색키워드 입력 폼 -->
			<form onsubmit="return false;">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="키워드를 입력후 돋보기 아이콘을 누르세요." name="skeyword" id="sinput"
						value="${srchVO.skeyword}" onKeyDown="onEnter();">
					<div class="input-group-btn">
						<button class="btn btn-default" id="key_search_btn" type="button">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
			<!-- stype : 검색 타입 (1:채용공고검색, 2:인재검색) -->
			<input id="stype" type='hidden' name='stype' value="${srchVO.stype}">
			<br /> <br />

			<!-- 선택 검색  탭 -->
			<ul class="nav nav-tabs">
				<li id="c1" class="active stab"><a href="#">직무</a></li>
				<li id="c2" class="stab"><a href="#">지역</a></li>
				<li id="c3" class="stab"><a href="#">근무형태</a></li>
				<li id="c4" class="stab"><a href="#">학력</a></li>
				<li id="c5" class="stab"><a href="#">경력</a></li>
			</ul>
			<!-- tabtype : 탭 타입 (c1:직무, c2:지역, c3:근형, c4:학력, c5:경력) -->
			<input id="tabtype" type='hidden' name='tabtype' value="c1">
			<br />
			<!-- 드롭다운 태그 -->
			<div class="row">
				<div class="col-md-4  col-md-offset-1">
					<select id="sel1" class="form-control" style="visibility: hidden;">
						<option value="0">선택</option>
					</select>
				</div>
				<div class="col-md-4">
					<select id="sel2" class="form-control" style="visibility: hidden;">
						<option value="0">선택 2차</option>
					</select>
				</div>
			</div>
			<br />
			<!-- 필터박스 및 검색 버튼-->
			<div class="row">
				<div class="well col-md-11" id="well"
					style="background-color: Gainsboro;"></div>
				<div class="col-md-1">
					<button type="button" class="btn btn-default" id="sel_search_btn">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</div>
		<!-- col-md-8 -->
	</div>
	<!-- end of row -->
	<div id="spanel"></div>
</div>
<!-- end of container -->

<!-- 판넬 스타일 -->
<style>
.company-div {
	width: 220px;
	height: 165px;
	overflow: hidden;
}

.recruit-div {
	width: 220px;
	height: 120px;
	overflow: hidden;
}

.company-img, .recruit-img {
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.resume-div {
	width: 120px;
	height: 120px;
	overflow: hidden;
}

.resume-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.fixed-panelr {
	min-height: 360px;
}

.fixed-panelc {
	min-height: 210px;
}
.title_ellipsis{
	white-space: nowrap;
	width : 100%;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>

<!-- 검색필터 -->
<script id="tmpl_sfilter" type="text/x-handlebars-template">
<button class="btn btn-default sfilter_btn" type="button"
	value={{sflt_val}} onclick="$(this).remove();">
	{{sflt_title}} <i class="glyphicon glyphicon-remove"></i>
</button>
</script>

<!-- 기업정보 판넬 -->
<script id="tmpnl_cinfo" type="text/x-handlebars-template">
<div class="col-lg-6">
	<div class="panel panel-default fixed-panelc">
		<div class="panel-body">
			<div class="col-md-6">
				<div class="company-div">
					<a href="{{url}}"
						onclick='window.open(this.href, "cinfo{{userid}}", "width=1000, height=960, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'>
						<img class="company-img" src="{{img}}">
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<h3>
					<b>{{cname}}</b>
				</h3>
				<p>{{title}}</p>
			</div>
		</div>
	</div>
</div>
</script>

<!-- 채용공고 판넬 -->
<script id="tmpnl_recruit" type="text/x-handlebars-template">
<div class="col-lg-3 col-sm-6">
	<div class="panel panel-default fixed-panelr">
		<div align="center" class="panel-body">
			<br />
			<div class="recruit-div">
				<img class="recruit-img thumbnail" src="{{img}}">
			</div>
			<h4>
				<b>{{bno}} {{cname}}</b>
			</h4>
			<p class="col-md-12">
				<a href="{{url}}"
					onclick='window.open(this.href, "recruit{{bno}}", "width=1050, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'>
				<b>{{title}}</b></a>

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

<!-- 이력서 판넬 -->
<script id="tmpnl_resume" type="text/x-handlebars-template">
<div class="col-lg-3 col-sm-6">
	<div class="panel panel-default fixed-panelr">
		<div align="center" class="panel-body">
			<br />
			<div class="resume-div img-circle">
				<img class="resume-img" src="{{img}}">
			</div>
			<h4><b>{{bno}} {{pname}}</b></h4>
			<p> {{jobgroupid}}, {{jobgroupid2}} <br />
			{{exp}}
			</p>
			<p>
				<a href="{{url}}"
					onclick='window.open(this.href, "resume{{bno}}", "width=950, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'>{{title}}</a>
			</p>
			{{rgbid}}, {{rgsid}}<br />
			[{{jobstateid}}]
		</div>
	</div>
</div>
</script>

<script>
	// 사진 url 변수
	var cImgSrc = "/company/displayFile?fileName=";
	var pImgSrc = "/personal/displayFile?fileName=";

	// 링크 url 변수
	var cinfoUrl = "/company/C_info_nonavi?cName=";
	var recruitUrl = "/company/C_recruitMent?recruitNum=";
	var resumeUrl = "/personal/detail_nonavi?bno=";

	// 전역변수
	var blank_ = "<span style='color: white;'>blank</span>"; // 빈칸
	var srchType = 0; // 검색타입 (0:키워드 검색, 1:필터 검색)
	var srchWord = null; // 검색단어

	// 무한 스크롤
	var infPNum = 16; // 로딩 판넬 갯수
	var infPage = 0; // 무한스크롤 페이지
	var infScrDone = false; // false 무한 스크롤 작업중, true 무한스크롤 작업대기
	var firstPage = true; // 첫 페이지
	var lastpage = false; // 마지막 페이지

	// 검색 결과 판넬 list 제거
	function deletespanel() {
		$("#spanel").children().remove();
	}

	// select tag 전역변수
	var str;
	var that_val;
	var sel1Options;
	var sel2Options;

	// select 검색 탭 변경하기
	// select 검색 탭 click 이벤트 핸들러
	// select 검색 탭 option list 받기
	function stabsel(idc) {
		$("#sel2").attr('style', 'visibility: hidden;');
		$("#sel1").attr('style', 'visibility: hidden;');
		$(".opt1").remove();
		if (idc === "c1") { // job group
			sel1Options = sel1JobOptions; // option 생성함수 연결
			$.getJSON("/sresult/jobg", sel1Handler);
		} else if (idc === "c2") { // region
			sel1Options = sel1RegOptions; // option 생성함수 연결
			$.getJSON("/sresult/region", sel1Handler);
		} else { // employment status(4), education(2), experience(1)
			var tid;
			if (idc === "c3")
				tid = 4;
			else if (idc === "c4")
				tid = 2;
			else
				tid = 1;
			sel1Options = sel1CodOptions; // option 생성함수 연결
			$.getJSON("/sresult/code/" + tid, sel1Handler);
		}
	}

	// select 1번째 생성하기
	function sel1Handler(data) {
		str = "";
		console.log(data.length);
		var i = 0;
		$(data).each(sel1Options);
		$("#sel1").append(str);
		$("#sel1").attr('style', 'visibility: visible;');
	}

	// select 1번째 직무 option 생성하기
	function sel1JobOptions(index, that) {
		str += '<option class="opt1" value="'+ that.id +'">' + that.jobgroup
				+ '</option>';
	}

	// select 1번째 지역 option 생성하기
	function sel1RegOptions(index, that) {
		str += '<option class="opt1" value="'+ that.rgbid +'">' + that.rgbname
				+ '</option>';
	}

	// select 1번째 코드(근무형태, 학력, 경력) option 생성하기
	function sel1CodOptions(index, that) {
		str += '<option class="opt1" value="'+ that.id +'">' + that.career
				+ '</option>';
	}

	// select 2번째 생성하기
	function sel2Handler(data) {
		str = "";
		var i = 0;
		$(data).each(sel2Options);
		$("#sel2").append(str);
		$("#sel2").attr('style', 'visibility: visible;');
	}

	// select 2번째 직무 option 생성하기
	function sel2JobOptions(index, that) { // option val : J + job code
		str += '<option class="opt2" value="J'+ that.id +'">' + that.jobgroup
				+ '</option>';
	}

	// select 2번째 지역 option 생성하기
	function sel2RegOptions(index, that) { // option val : R + region code
		str += '<option class="opt2" value="R' + that_val + that.rgsid +'">'
				+ that.rgsname + '</option>'
	}

	// 필터(버튼) 추가하기
	function add_tmpl_sfilter(flt_val) {
		var alreadyhave = false;
		$("#well > .sfilter_btn").each(function() { // 중복검사(deduplication)
			if ($(this).val() === flt_val)
				alreadyhave = true;
		})
		if (alreadyhave) // deduplication
			return;
		var btnclick = arguments[1];
		$.getJSON("/sresult/scode/" + flt_val, function(data) {
			var source_sflt = $("#tmpl_sfilter").html();
			var template_sflt = Handlebars.compile(source_sflt);
			var item = {
				sflt_val : flt_val,
				sflt_title : data
			};
			$("#well").append(template_sflt(item)); // add a search_filter
			if (btnclick === true)
				$("#sel_search_btn").trigger('click');
		});
	}

	// 필터 검색 탭 click 이벤트 핸들러
	$(".stab").on("click", function() {
		if ($(this).hasClass("active") !== true) {
			$(".nav-tabs li").removeClass("active");
			$(this).addClass("active");
			stabsel($(this).attr("id"));
			$("#tabtype").val($(this).attr("id")); // change tabtype(hidden input) value
		}
	});

	// select 1번째 change 이벤트 핸들러 
	$("#sel1").change(function() {
		$("#sel2").attr('style', 'visibility: hidden;');
		$(".opt2").remove();
		if ($(this).val() !== '0') {
			if ($("#tabtype").val() === 'c1') { // #sel1 c1(job group) change
				sel2Options = sel2JobOptions;
				$.getJSON("/sresult/jobg/" + $(this).val(), sel2Handler);
			} // end of #sel1 c1 change
			else if ($("#tabtype").val() === 'c2') { // #sel1 c2 change
				that_val = $(this).val();
				sel2Options = sel2RegOptions;
				$.getJSON("/sresult/region/" + $(this).val(), sel2Handler);
			} // end of #sel1 c2 change
			else if ($("#tabtype").val() === 'c3') { // #sel1 c3 change
				add_tmpl_sfilter($(this).val());
			} else if ($("#tabtype").val() === 'c4') { // #sel1 c4 change
				add_tmpl_sfilter($(this).val());
			} else if ($("#tabtype").val() === 'c5') { // #sel1 c4 change
				add_tmpl_sfilter($(this).val());
			}
		}
	}); // $("#sel1").change

	// select 2번째 change 이벤트 핸들러
	$("#sel2").change(function() {
		if ($(this).val() !== '0') {
			if ($("#tabtype").val() === 'c1') { // #sel1 c1 change
				add_tmpl_sfilter($(this).val());
			} else if ($("#tabtype").val() === 'c2') { // #sel1 c2 change
				add_tmpl_sfilter($(this).val());
			}
		}
	});

	// 판넬구성을 위한 전역변수
	var item;
	var template_pnl;

	// 기업정보 판넬 연결
	function cinfoPnl(index, that) {
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
			url : cinfoUrl + that.cname
		};
		$("#spanelc").append(template_pnl(item));
	}

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
		$("#spanelr").append(template_pnl(item));
	}

	// 이력서 판넬 연결
	function resumePnl(index, that) {
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
			img : pImgSrc + that.img,
			pname : that.pname,
			jobstateid : that.jobstateid,
			url : resumeUrl + that.bno
		};
		$("#spanelr").append(template_pnl(item));
	}

	// Recruit 판넬 List 생성
	function RecruitHandler(data) {
		$("#infSrch").remove();
		console.log("data.len: " + data.length);

		// cinfo & recruit 분류
		var dataC = new Array();
		var dataR = new Array();
		var noPage = false;
		firstPage = false;

		for (var i = 0; i < data.length; i++) {
			if (data.length == 1 && data[0].title === 'lastRecruit') {
				firstPage = true;
				noPage = true;
				lastpage = true;
			} else if (data[i].period === 'etern') {
				dataC.push(data[i]);
				firstPage = true;
			} else if (data[i].title === 'lastRecruit') {
				console.log("lastRecruit");
				lastpage = true;
			} else {
				dataR.push(data[i]);
			}
		}

		if (firstPage && !noPage) {
			deletespanel();

			var rtitle = '<div class="row" id="spanelc"><h4><br/><b>&nbsp; &nbsp; 기업정보'
					+ '</b></h4></div>';
			rtitle += '<div class="row" id="spanelr"><h4><span style="color:white;">_</span><br/>'
					+ '<br/><b>&nbsp; &nbsp; 채용공고</b></h4></div>';

			$("#spanel").append(rtitle);

			var source_pnl = $("#tmpnl_cinfo").html();
			template_pnl = Handlebars.compile(source_pnl);
			$(dataC).each(cinfoPnl); // for cinfo
		}

		var source_pnl = $("#tmpnl_recruit").html();
		template_pnl = Handlebars.compile(source_pnl);
		$(dataR).each(recruitPnl); // for recruit
		infScrDone = true;

		if (firstPage) {
			if (data.length > 1) {
				if (data.length < 6)
					waitForSearching(blank_, 3, false);
				else if (data.length < 10)
					waitForSearching(blank_, 1, false);
			} else {
				if (noPage) {
					deletespanel();
					waitForSearching("검색결과가 없습니다.", 5);
				}
			}
		}
	}

	// Resume 판넬 List 생성
	function ResumeHandler(data) {
		$("#infSrch").remove();

		var noPage = false;
		var dataR = new Array();

		for (var i = 0; i < data.length; i++) {
			if (data.length == 1 && data[0].title === 'lastResume') {
				firstPage = true;
				noPage = true;
				lastpage = true;
			} else if (data[i].title === 'lastResume') {
				console.log("lastResume");
				lastpage = true;
			} else {
				dataR.push(data[i]);
			}
		}

		if (firstPage && !noPage) {
			deletespanel();
			var rtitle = '<div class="row" id="spanelr"><h4><br/><b>&nbsp; &nbsp; 인재정보'
					+ '</b><br/><br/></h4></div>';
			$("#spanel").append(rtitle);
		}

		var source_pnl = $("#tmpnl_resume").html();
		template_pnl = Handlebars.compile(source_pnl);
		$(dataR).each(resumePnl); // for resume
		infScrDone = true;

		if (firstPage) {
			firstPage = false;
			if (data.length > 1) {
				if (data.length < 6)
					waitForSearching(blank_, 3, false);
				else if (data.length < 10)
					waitForSearching(blank_, 1, false);
			} else {
				if (noPage) {
					deletespanel();
					waitForSearching("검색결과가 없습니다.", 5);
				}
			}
		}
	}

	// 키워드 검색: 검색어(skey), 검색분류(users: recruits or resumes)
	function getKeyList(users, skey, pageSize, pageNum) {
		var urltmp = "/sresult/" + users + "/getkey/" + skey + "/" + pageSize
				+ "/" + pageNum;
		if (users == "recruits")
			$.getJSON(urltmp, RecruitHandler); // recruits
		else
			$.getJSON(urltmp, ResumeHandler); // resumes
	}

	// 필터 검색: 검색분류(users: recruits or resumes)
	function getSelList(users, pageSize, pageNum) {
		var urltmp = "/sresult/" + users + "/getsel/sel/" + pageSize + "/"
				+ pageNum;
		if (users == 'recruits')
			$.getJSON(urltmp, RecruitHandler); // recruits
		else
			$.getJSON(urltmp, ResumeHandler); // resumes
	}

	// 검색 초기화 작업
	function searchInit(stype_) {
		// 무한 스크롤 초기화
		infPage = 0;
		lastpage = false;
		firstPage = true;
		srchType = stype_; // 검색 타입 설정
	}

	var smsg = '<img src="/resources/rpjt/img/loading.gif" height="100">';

	// 키워드 검색 버튼 click 이벤트 핸들러
	$("#key_search_btn").on("click", function() {
		searchInit(0);

		var sinp = $("#sinput").val();
		if (sinp === "") {
			waitForSearching("키워드가 입력되지 않았습니다.", 5);
		} else { // 키워드 검색
			waitForSearching(smsg, 5);
			srchWord = "";
			var len = sinp.length;
			for (var j = 0; j < len; j++) {
				var sinpcode = sinp.charCodeAt(j);
				if (sinpcode < 128)
					srchWord += '%' + sinpcode.toString(16);
				else
					srchWord += sinp[j];
			}
			if ($("#stype").attr("value") === "1") {
				getKeyList("recruits", srchWord, infPNum, infPage++);
			} else {
				getKeyList("resumes", srchWord, infPNum, infPage++);
			}
		}
	});

	// select 검색으로 관련 정보를 를 보여주다.(1)
	// select 검색 버튼 click 이벤트 핸들러
	// ajax로 select filters 전송 to controller
	$("#sel_search_btn").on("click", function() {
		searchInit(1);

		var array = [];
		var i = 0;
		waitForSearching(smsg, 5);
		$("#well > .sfilter_btn").each(function() {
			array[i] = $(this).val(); // select filter를 배열에 담기
			i++;
		});
		console.log(array + " : " + array.length);
		$.ajax({
			type : 'post',
			url : '/sresult/getsel/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify(array),
			success : function(result) {
				if (result == 'SUCCESS') {
					console.log('sel: SUCCESS');
					if ($("#stype").attr("value") === "1") { // recruits 검색 
						getSelList('recruits', infPNum, infPage++);
					} else {
						getSelList('resumes', infPNum, infPage++);
					}
				}
			}
		}); // ajax
	});

	// text 검색 엔터키 처리
	function onEnter() {
		if (event.keyCode == 13) {
			$("#key_search_btn").trigger('click');
			return false;
		}
	}

	// 화면 공백 생성
	function waitForSearching(str, num, del) {
		if (del !== false)
			deletespanel();
		str = '<h3 align="center">' + str + '</h3>';
		for (var i = 0; i < num; i++) {
			str = '<br/>' + str + '<br/><br/>';
		}
		$("#spanel").append(str);
	}

	function infiniteScroll() {
		if ($(window).scrollTop() >= $(document).height() - $(window).height() - 1) {
			
	    console.log($(window).scrollTop());
	    console.log(parseInt($(window).scrollTop()));
	    console.log($(document).height() - $(window).height());
	    console.log("*****");

			if (infScrDone && !lastpage) {
				var users = null;
				if ($("#stype").attr("value") === "1")
					users = "recruits"; // 채용공고 검색
				else
					users = "resumes"; // 이력서 검색

				if (srchType === 0)
					getKeyList(users, srchWord, infPNum, infPage++); // 키워드 검색
				else
					getSelList(users, infPNum, infPage++); // 필터 검색

				tmp = '<div id="infSrch"><h3 align="center"><span style="color: white;">'
						+ '_</span><br /><img src="/resources/rpjt/img/loading.gif" height="60">'
						+ '</h3></div>';

				$("#spanel").append(tmp);
				infScrDone = false;
			}
		}
	}

	$(window).scroll(infiniteScroll);

	// 필터 검색 탭 초기화
	stabsel("c1"); // c1: job group tab
	waitForSearching(blank_, 5);
	$("#sinput").focus();
<%if (!(srchVO.getSkeyword() == null || "".equals(srchVO.getSkeyword()))) {%>
	$("#key_search_btn").trigger('click');
<%} else if (!(srchVO.getSfilter() == null)) {%>
	add_tmpl_sfilter("${srchVO.sfilter}", true);
<%}%>
	
</script>

<%@include file="../include/cfooter.jsp"%>