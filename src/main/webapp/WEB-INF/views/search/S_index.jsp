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
				</div>

				<div class="item">
					<img src="/resources/rpjt/img/chicago.jpg" alt="Chicago"
						style="width: 100%;">
				</div>

				<div class="item">
					<img src="/resources/rpjt/img/ny.jpg" alt="New york"
						style="width: 100%;">
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
							<ul class="dropdown-menu">
								<li><a href="#">Page 1-1</a></li>
								<li><a href="#">Page 1-2</a></li>
								<li role=separator class=divider></li>
								<li><a href="#">Page 1-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;지역&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 2-1</a></li>
								<li><a href="#">Page 2-2</a></li>
								<li role=separator class=divider></li>
								<li><a href="#">Page 2-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;근무형태&nbsp;&nbsp;</a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 3-1</a></li>
								<li><a href="#">Page 3-2</a></li>
								<li><a href="#">Page 3-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;학력&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 4-1</a></li>
								<li><a href="#">Page 4-2</a></li>
								<li><a href="#">Page 4-3</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;&nbsp;&nbsp;경력&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu">
								<li><a href="#">Page 5-1</a></li>
								<li><a href="#">Page 5-2</a></li>
								<li><a href="#">Page 5-3</a></li>
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


<script id="tmpl_sfilter" type="text/x-handlebars-template">
<button class="btn btn-default sfilter_btn" type="button"
	value={{sflt_val}} onclick="$(this).remove();">
	{{sflt_title}} <i class="glyphicon glyphicon-remove"></i>
</button>
</script>

<script id="template_tbl" type="text/x-handlebars-template">
<tr class="result">
	<td align="center">{{num}}</td>
	<td align="center">{{id}}</td>
	<td style="text-align: center">{{pw}}</td>
	<td align="center">{{pname}}</td>
	<td style="text-align: center">{{birth}}</td>
	<td align="center">{{email}}</td>
</tr>
</script>

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
	// select 검색 탭 초기화
	stabsel("c1"); // c1: job group tab

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
		$(".sres").attr('style', 'visibility: hidden;');
	}

	// text 검색 버튼 click 이벤트 핸들러
	$("#search_btn").on("click", function() {
		var sinp = $("#sinput").val();
		$("#sinput").val("");

		console.log(sinp);
		if (sinp === "all") {
			$("#sdesc").html("검색결과");
			console.log($("#stype").attr("value"));
			console.log($("#stype").attr("value") === "1");
			if ($("#stype").attr("value") === "1") {
				getAllList("cusers");
			} else {
				getAllList("pusers");
			}
		} else if (sinp === "") {
			deletelist();
			$("#sdesc").html("키워드가 입력되지 않았습니다.");
		} else {
			if ($("#stype").attr("value") === "1") {
				getList("recruits", sinp);
			} else {
				getList("resumes", sinp);
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

	// 모든 user(cusers or pusers)를 보여주다.
	function getAllList(users) {
		deletelist();
		$.getJSON("/sresult/" + users, function(data) {
			// var source_tbl = $("#template_tbl").html();
			var source_pnl = $("#template_pnl").html();
			// var template_tbl = Handlebars.compile(source_tbl);
			var template_pnl = Handlebars.compile(source_pnl);
			console.log(data.length);
			var i = 0;
			var item;
			$(data).each(function() {
				item = {
					num : ++i,
					id : this.id,
					pw : this.pw,
					pname : this.pname,
					email : this.email,
					birth : this.birth
				};
				// $("#stable").append(template_tbl(item));
				$("#spanel").append(template_pnl(item));
			});
			$(".sres").attr('style', 'visibility: visible;');
		});
	}

	// text 검색으로 관련 정보를 를 보여주다.
	// 검색어(skey), 검색분류(users: recruits or resumes)
	function getList(users, skey) {
		deletelist();
		$.getJSON("/sresult/" + users + "/" + skey, function(data) {
			// var source_tbl = $("#template_tbl").html();
			var source_pnl = $("#template_pnl").html();
			// var template_tbl = Handlebars.compile(source_tbl);
			var template_pnl = Handlebars.compile(source_pnl);
			console.log(data.length);
			var i = 0;
			var item;
			$(data).each(function() {
				item = {
					num : ++i,
					id : this.bno,
					pw : this.rgbid,
					pname : this.title,
					email : this.employstatusid,
					birth : this.regdate
				};
				// $("#stable").append(template_tbl(item));
				$("#spanel").append(template_pnl(item));
			});
			var str;
			if (data.length > 0) {
				str = data.length + "개의 검색결과가 있습니다.";
				$(".sres").attr('style', 'visibility: visible;');
			} else {
				str = "검색결과가 없습니다."
			}
			$("#sdesc").html(str);
		});
	}

	// select 검색으로 관련 정보를 를 보여주다.(3)
	// 결과 판넬 List 생성
	// url: /sresult/sel_search/recruits
	function selRecruitHandler(data) {
		var source_pnl = $("#tmpnl_recruit").html();
		var template_pnl = Handlebars.compile(source_pnl);
		console.log(data.length);
		var i = 0;
		var item;
		$(data).each(function() {
			item = {
				num : ++i,
				bno : this.bno,
				cid : this.cid,
				title : this.title,
				jobgroupid : this.jobgroupid,
				jobgroupid2 : this.jobgroupid2,
				rgbid : this.rgbid,
				rgsid : this.rgsid,
				cname : this.cname,
				edu : this.edu,
				exp : this.exp,
				period : this.period
			};
			$("#spanel").append(template_pnl(item));
		});
		var str;
		if (data.length > 0) {
			str = data.length + "개의 검색결과가 있습니다.";
			$(".sres").attr('style', 'visibility: visible;');
		} else {
			str = "검색결과가 없습니다."
		}
		$("#sdesc").html(str);
	}

	// url: /sresult/sel_search/resumes
	function selResumeHandler(data) {
		var source_pnl = $("#tmpnl_resume").html();
		var template_pnl = Handlebars.compile(source_pnl);
		console.log(data.length);
		var i = 0;
		var item;
		$(data).each(function() {
			item = {
				num : ++i,
				bno : this.bno,
				userid : this.userid,
				title : this.title,
				jobstateid : this.jobstateid,
				jobgroupid : this.jobgroupid,
				jobgroupid2 : this.jobgroupid2,
				rgbid : this.rgbid,
				rgsid : this.rgsid,
				img : this.img,
				pname : this.pname
			};
			$("#spanel").append(template_pnl(item));
		});

		var str;
		if (data.length > 0) {
			str = data.length + "개의 검색결과가 있습니다.";
			$(".sres").attr('style', 'visibility: visible;');
		} else {
			str = "검색결과가 없습니다."
		}
		$("#sdesc").html(str);
	}

	// select 검색으로 관련 정보를 를 보여주다.(2)
	// 검색분류(users: recruits or resumes)
	function getList_sel(users) {
		deletelist();
		if (users == 'recruits') // 'recruits'
			$.getJSON("/sresult/sel_search/" + users, selRecruitHandler);
		else
			// 'resumes'
			$.getJSON("/sresult/sel_search/" + users, selResumeHandler);
	}

	// select 검색으로 관련 정보를 를 보여주다.(1)
	// select 검색 버튼 click 이벤트 핸들러
	// ajax로 select filters 전송 to controller
	$("#opt_search_btn").on("click", function() {
		var array = [];
		var i = 0;
		$("#well > .sfilter_btn").each(function() {
			array[i] = $(this).val(); // select filter를 배열에 담기
			i++;
		});
		console.log(array + " : " + array.length);
		$.ajax({
			type : 'post',
			url : '/sresult/sel_search/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify(array),
			success : function(result) {
				if (result == 'SUCCESS') {
					alert('SUCCESS');
					if ($("#stype").attr("value") === "1") { // recruits 검색 
						getList_sel('recruits');
					} else {
						getList_sel('resumes');
					}
				}
			}
		}); // ajax
	});

	// select filter(버튼) 추가하기
	function add_tmpl_sfilter(that) {
		var alreadyhave = false;
		$("#well > .sfilter_btn").each(function() { // 중복검사(deduplication)
			if ($(this).val() === $(that).val())
				alreadyhave = true;
		})
		if (alreadyhave) // deduplication
			return;
		var source_sflt = $("#tmpl_sfilter").html();
		var template_sflt = Handlebars.compile(source_sflt);
		var item = {
			sflt_val : $(that).val(),
			sflt_title : $(that).find(":selected").text()
		};
		$("#well").append(template_sflt(item)); // add a search_filter
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
				add_tmpl_sfilter(this);
			} else if ($("#ttype").val() === 'c4') { // #sel1 c4 change
				add_tmpl_sfilter(this);
			} else if ($("#ttype").val() === 'c5') { // #sel1 c4 change
				add_tmpl_sfilter(this);
			}
		}
	}); // $("#sel1").change

	// select 2번째 change 이벤트 핸들러
	$("#sel2").change(function() {
		if ($(this).val() !== '0') {
			if ($("#ttype").val() === 'c1') { // #sel1 c1 change
				add_tmpl_sfilter(this);
			} else if ($("#ttype").val() === 'c2') { // #sel1 c2 change
				add_tmpl_sfilter(this);
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
</script>

<%@include file="../include/sfooter.jsp"%>