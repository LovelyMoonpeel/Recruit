<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.recruit.domain.SrchVO"%>
<%@ include file="../include/sheader2.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js">
	
</script>

<!-- Page Content -->
<div class="container">
	<%
		//String stypeM = (String) request.getAttribute("stypeModel");
		SrchVO srchVO = (SrchVO) request.getAttribute("srchVO");
		String stitle;

		String cinfoUrl;
		String recruitUrl;
		String resumeUrl;

		if ("2".equals(srchVO.getStype())) {
			stitle = "인재 검색";
		} else {
			srchVO.setStype("1");
			stitle = "채용공고 검색";
		}

		// out.println("print_test<br/>");
		if (login != null) { // login
			if (cname != null || id.equals("admin")) { // company
				cinfoUrl = "/company/C_info_nonavi?recruitNum=";
				recruitUrl = "/company/C_recruitMent?recruitNum=";
				resumeUrl = "/personal/detail_nonavi?bno=";
			} else { // personal
				cinfoUrl = "/company/C_info_nonavi?recruitNum=";
				recruitUrl = "/company/C_recruitMent?recruitNum=";
				resumeUrl = "/personal/detail_nonavi?bno=";
			}
		} else { // logout
			cinfoUrl = "/company/C_info_nonavi?recruitNum=";
			recruitUrl = "/company/C_recruitMent?recruitNum=";
			resumeUrl = "/personal/detail_nonavi?bno=";
		}
		request.setAttribute("cinfoUrl", cinfoUrl);
		request.setAttribute("recruitUrl", recruitUrl);
		request.setAttribute("resumeUrl", resumeUrl);
	%>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<!-- r.code 1 -->
			<h4 style="display: none;">r.code</h4>
			<input readonly class="form-control" type="text"
				value="login: <%=login%>" style="display: none;"> <input
				readonly class="form-control" type="text" value="id: <%=id%>"
				style="display: none;"> <input readonly class="form-control"
				type="text" value="cname: <%=cname%>" style="display: none;">
			<!-- r.code 2 -->
			<input readonly class="form-control" type="text"
				value="stype: ${srchVO.stype}" style="display: none;"> <input
				readonly class="form-control" type="text"
				value="skeyword: ${srchVO.skeyword}" style="display: none;">
			<input readonly class="form-control" type="text"
				value="sfilter: ${srchVO.sfilter}" style="display: none;">
			<!-- end of r.code -->
			<br />
			<h3 align="center">
				<%=stitle%>
			</h3>
			<br />
			<!-- BS Inputs 2 -->
			<!-- <p>${srchVO.sdesc}</p> -->
			<!-- <form action="/srch/main" method="get"> -->
			<form onsubmit="return false;">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="${sdesc}"
						name="skeyword" id="sinput" value="${srchVO.skeyword}"
						onKeyDown="onEnter();">
					<div class="input-group-btn">
						<!-- <button class="btn btn-default" type="submit"> -->
						<!-- form button default type : submit -->
						<button class="btn btn-default" id="search_btn" type="button">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
				<input id="stype" type='hidden' name='stype' value="${srchVO.stype}">
				<input id="ttype" type='hidden' name='ttype' value="c1">
			</form>

			<br /> <br />
			<ul class="nav nav-tabs">
				<li id="c1" class="active stab"><a href="#">직무</a></li>
				<li id="c2" class="stab"><a href="#">지역</a></li>
				<li id="c3" class="stab"><a href="#">근무형태</a></li>
				<li id="c4" class="stab"><a href="#">학력</a></li>
				<li id="c5" class="stab"><a href="#">경력</a></li>
			</ul>
			<br />
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
			<div class="row">
				<div class="well col-md-11" id="well"
					style="background-color: Gainsboro;"></div>
				<div class="col-md-1">
					<button type="button" class="btn btn-default" id="sel_search_btn">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
			<!-- <br /><h3 align="center" id="sdesc"></h3><br /> -->
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- row -->
	<div class="row" id="tpanel"></div>
	<div id="spanel"></div>
</div>
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
</style>

<!-- /Page Content -->

<script id="tmpl_sfilter" type="text/x-handlebars-template">
<button class="btn btn-default sfilter_btn" type="button"
	value={{sflt_val}} onclick="$(this).remove();">
	{{sflt_title}} <i class="glyphicon glyphicon-remove"></i>
</button>
</script>

<script id="tmpnl_cinfo" type="text/x-handlebars-template">
<div class="col-lg-6 result">
	<div class="panel panel-default fixed-panelc">
		<div class="panel-body">
			<div class="col-md-6">
				<div class="company-div">
					<a href="{{url}}"
						onclick='window.open(this.href, "cinfo{{userid}}", "width=1050, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'>
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

<script id="tmpnl_recruit" type="text/x-handlebars-template">
<div class="col-lg-3 col-sm-6 result">
	<div class="panel panel-default fixed-panelr">
		<div align="center" class="panel-body">
			<br />
			<div class="recruit-div">
				<img class="recruit-img thumbnail" src="{{img}}">
			</div>
			<h4>
				<b>{{bno}} {{cname}}</b>
			</h4>
			<p>
				<a href="{{url}}"
					onclick='window.open(this.href, "recruit{{bno}}", "width=1050, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" ); return false;'><b>{{title}}</b></a>
			</p>
			<p>
				{{jobgroupid}}, {{jobgroupid2}}<br /> {{edu}}, {{exp}}
			</p>
			~ {{period}}<br />
			{{jobstateid}}
		</div>
	</div>
</div>
</script>

<script id="tmpnl_resume" type="text/x-handlebars-template">
<div class="col-lg-3 col-sm-6 result">
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
	// select 검색 탭 초기화
	var blank_ = "<span style='color: white;'>blank</span>";
	stabsel("c1"); // c1: job group tab

	// text 검색 엔터키 처리
	function onEnter() {
		if (event.keyCode == 13) {
			$("#search_btn").trigger('click');
			return false;
		}
	}

	// 사진 url 변수
	var cImgSrc = "/company/displayFile?fileName=";
	var pImgSrc = "/personal/displayFile?fileName=";

	// 링크 url 변수
	var cinfoUrl = "${cinfoUrl}";
	var recruitUrl = "${recruitUrl}";
	var resumeUrl = "${resumeUrl}";

	// 검색 결과 판넬 list 제거
	function deletespanel() {
		$("#sdesc").html("");
		$(".result").remove();
		$("#spanel").children().remove();
	}

	var cSrchState = 0;
	// 0: getkey
	// 1: getsel

	var sout = null;

	// text 검색 버튼 click 이벤트 핸들러
	$("#search_btn").on("click", function() {
		page = 0;
		cSrchState = 0;
		lastpage = false;
		var sinp = $("#sinput").val();
		if (sinp === "") {
			waitForSearching("키워드가 입력되지 않았습니다.", 5);
			// $("#sdesc").html("키워드가 입력되지 않았습니다.");
		} else { // 키워드 검색
			waitForSearching(smsg, 5);
			sout = "";
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
			if ($("#stype").attr("value") === "1") {
				getKeyList("recruits", sout, snum, page++);
			} else {
				getKeyList("resumes", sout, 0, 0);
			}
		}
	});

	// select 검색 탭 click 이벤트 핸들러
	$(".stab").on("click", function() {
		if ($(this).hasClass("active") !== true) {
			$(".nav-tabs li").removeClass("active");
			$(this).addClass("active");
			stabsel($(this).attr("id"));
			$("#ttype").val($(this).attr("id")); // change ttype(hidden input) value
		}
	});

	var inum;
	var item;
	var template_pnl;

	// 기업정보 판넬 연결
	function cinfoPnl(index, that) {
		item = {
			num : ++inum,
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
			url : cinfoUrl + that.userid
		};
		$("#spanelc").append(template_pnl(item));
	}

	// 채용공고 판넬 연결
	function recruitPnl(index, that) {
		item = {
			num : ++inum,
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
			num : ++inum,
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
		console.log("RecruitHandler.data.length: " + data.length);
		inum = 0;
		$("#infSrch").remove();

		// cinfo & recruit 분류
		var dataC = new Array();
		var dataR = new Array();
		var firstPage = false;
		var noPage = false;
		// for (var i = data.length - 1; i >= 0; i--) {
		for (var i = 0; i < data.length; i++) {
			if (data.length == 1 && data[0].period === 'lastRecruit') {
				firstPage = true;
				noPage = true;
				lastpage = true;
			} else if (data[i].period === 'etern') {
				dataC.push(data[i]);
				firstPage = true;
			} else if (data[i].period === 'lastRecruit') {
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
		console.log(data.length);
		inum = 0;
		deletespanel();

		var rtitle = '<div class="row" id="spanelr"><h4><br/><b>&nbsp; &nbsp; 인재정보('
				+ data.length + ')</b><br/><br/></h4></div>';
		$("#spanel").append(rtitle);

		var source_pnl = $("#tmpnl_resume").html();
		template_pnl = Handlebars.compile(source_pnl);
		$(data).each(resumePnl);
		if (data.length > 0) {
			// $("#sdesc").html(data.length + "개의 검색결과가 있습니다.");
			if (data.length < 5)
				waitForSearching(blank_, 3, false);
			else if (data.length < 9)
				waitForSearching(blank_, 1, false);
		} else {
			waitForSearching("검색결과가 없습니다.", 5);
		}
	}

	var snum = 24; // 로딩 판넬 갯수
	var page = 0; // 무한스크롤 페이지

	// text 검색으로 관련 정보를 를 보여주다.
	// 검색어(skey), 검색분류(users: recruits or resumes)
	function getKeyList(users, skey, pageSize, pageNum) {
		if (users == "recruits") {
			var urltmp = "/sresult/recruits/getkey/" + skey + "/" + pageSize
					+ "/" + pageNum;
			$.getJSON(urltmp, RecruitHandler);
		} else { // resumes
			var urltmp = "/sresult/resumes/getkey/" + skey + "/" + pageSize
					+ "/" + pageNum;
			$.getJSON(urltmp, ResumeHandler);
		}
	}

	// select 검색으로 관련 정보를 를 보여주다.(2)
	// 검색분류(users: recruits or resumes)
	function getSelList(users, pageSize, pageNum) {
		if (users == 'recruits') {
			var urltmp = "/sresult/recruits/getsel/sel/" + pageSize + "/"
					+ pageNum;
			$.getJSON(urltmp, RecruitHandler);
		} else { // 'resumes'
			var urltmp = "/sresult/resumes/getsel/sel/" + pageSize + "/"
					+ pageNum;
			$.getJSON(urltmp, ResumeHandler);
		}
	}

	// select 검색으로 관련 정보를 를 보여주다.(1)
	// select 검색 버튼 click 이벤트 핸들러
	// ajax로 select filters 전송 to controller
	$("#sel_search_btn").on("click", function() {
		page = 0;
		cSrchState = 1;
		lastpage = false;
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
						getSelList('recruits', snum, page++);
					} else {
						getSelList('resumes', 0, 0);
					}
				}
			}
		}); // ajax
	});

	// select filter(버튼) 추가하기
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

	var str;
	var that_val;
	var sel2Options;

	// select 2번째 생성하기
	function sel2Handler(data) {
		str = "";
		console.log(data.length);
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

	// select 1번째 change 이벤트 핸들러 
	$("#sel1").change(function() {
		$("#sel2").attr('style', 'visibility: hidden;');
		$(".opt2").remove();
		if ($(this).val() !== '0') {
			if ($("#ttype").val() === 'c1') { // #sel1 c1(job group) change
				sel2Options = sel2JobOptions;
				$.getJSON("/sresult/jobg/" + $(this).val(), sel2Handler);
			} // end of #sel1 c1 change
			else if ($("#ttype").val() === 'c2') { // #sel1 c2 change
				that_val = $(this).val();
				sel2Options = sel2RegOptions;
				$.getJSON("/sresult/region/" + $(this).val(), sel2Handler);
			} // end of #sel1 c2 change
			else if ($("#ttype").val() === 'c3') { // #sel1 c3 change
				// add_tmpl_sfilter($(this).val(), $(this).find(":selected").text());
				add_tmpl_sfilter($(this).val());
			} else if ($("#ttype").val() === 'c4') { // #sel1 c4 change
				add_tmpl_sfilter($(this).val());
			} else if ($("#ttype").val() === 'c5') { // #sel1 c4 change
				add_tmpl_sfilter($(this).val());
			}
		}
	}); // $("#sel1").change

	// select 2번째 change 이벤트 핸들러
	$("#sel2").change(function() {
		if ($(this).val() !== '0') {
			if ($("#ttype").val() === 'c1') { // #sel1 c1 change
				add_tmpl_sfilter($(this).val());
			} else if ($("#ttype").val() === 'c2') { // #sel1 c2 change
				add_tmpl_sfilter($(this).val());
			}
		}
	});

	// sfilter click > delete
	// $("#well").on("click", ".sfilter_btn", function() {
	//	alert($(this).val());
	//	$(this).remove();
	// });

	var sel1Options;

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

	var smsg = '<img src="/resources/rpjt/img/loading.gif" height="100">';
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

	waitForSearching(blank_, 5);
	$("#sinput").focus();

	var lastpage = false;
	var infScrDone = false; // false 무한 스크롤 작업중, true 무한스크롤 작업대기

	function infiniteScroll() {
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			if (infScrDone && !lastpage) {
				console.log(page);
				if ($("#stype").attr("value") === "1") {
					if (cSrchState === 0)
						getKeyList("recruits", sout, snum, page++);
					else
						getSelList("recruits", snum, page++);

					tmp = '<div id="infSrch"><h3 align="center"><span style="color: white;">'
							+ '_</span><br /><img src="/resources/rpjt/img/loading.gif" height="60">'
							+ '</h3></div>';

					$("#spanel").append(tmp);
					infScrDone = false;
				}
			}
		}
	}

	$(window).scroll(infiniteScroll);
<%if (!(srchVO.getSkeyword() == null || "".equals(srchVO.getSkeyword()))) {%>
	$("#search_btn").trigger('click');
<%} else if (!(srchVO.getSfilter() == null)) {%>
	add_tmpl_sfilter("${srchVO.sfilter}", true);
<%}%>
	
</script>

<%@include file="../include/cfooter.jsp"%>