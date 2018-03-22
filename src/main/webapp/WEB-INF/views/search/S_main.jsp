<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/sheader2.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js">
	
</script>

<!-- Page Content -->
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<br />
			<h3 align="center">
				<%
					String stypeM = (String) request.getAttribute("stypeModel");
					String stitle;
					if ("2".equals(stypeM)) {
						stitle = "인재 검색";
					} else {
						stypeM = "1";
						stitle = "채용공고 검색";
					}
				%>
				<%=stitle%>
			</h3>
			<br />
			<!-- BS Inputs 2 -->
			<!-- <p>${srchVO.sdesc}</p> -->
			<!-- <form action="/srch/main" method="get"> -->
			<form onsubmit="return false;">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="${sdesc}"
						name="skeyword" id="sinput" onKeyDown="onEnter();">
					<div class="input-group-btn">
						<!-- <button class="btn btn-default" type="submit"> -->
						<!-- form button default type : submit -->
						<button class="btn btn-default" id="search_btn" type="button">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
				<input id="stype" type='hidden' name='stype' value="<%=stypeM%>">
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
					<button type="button" class="btn btn-default" id="opt_search_btn">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
			<br />
			<h3 align="center" id="sdesc">프로그래밍 명언</h3>
			<br />
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- row -->
	<div class="row" id="spanel">
		<!-- <h3 align="center"> -->
		<!-- <a style="color: black;" href="http://blog.fupfin.com/?p=11">프로그래밍 명언</a> -->
		<!-- </h3> -->
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

<script id="tmpl_sfilter" type="text/x-handlebars-template">
<button class="btn btn-default sfilter_btn" type="button"
	value={{sflt_val}} onclick="$(this).remove();">
	{{sflt_title}} <i class="glyphicon glyphicon-remove"></i>
</button>
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
		$("#spanel").children().remove();
	}

	// text 검색 버튼 click 이벤트 핸들러
	$("#search_btn").on("click", function() {
		var sinp = $("#sinput").val();
		$("#sinput").val("");

		console.log(sinp);
		if (sinp === "all") {
			console.log($("#stype").attr("value"));
			console.log($("#stype").attr("value") === "1");
			if ($("#stype").attr("value") === "1") {
				getAllList("recruits");
			} else {
				getAllList("resumes");
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

	// 이력서 판넬 연결
	function resumePnl(index, that) {
		item = {
			num : ++i,
			bno : that.bno,
			userid : that.userid,
			title : that.title,
			jobstateid : that.jobstateid,
			jobgroupid : that.jobgroupid,
			jobgroupid2 : that.jobgroupid2,
			rgbid : that.rgbid,
			rgsid : that.rgsid,
			img : that.img,
			pname : that.pname
		};
		$("#spanel").append(template_pnl(item));
	}

	// 모든 이력서(resumes) 또는 채용공고(recruits)를 보여주다.
	function getAllList(users) {
		if (users === "recruits") { // "/sresult/recruits"
			$.getJSON("/sresult/" + users, function(data) {
				var source_pnl = $("#tmpnl_recruit").html();
				template_pnl = Handlebars.compile(source_pnl);
				console.log(data.length);
				i = 0;
				deletelist();
				$("#sdesc").html("검색결과");
				$(data).each(recruitPnl);
			});
		} else { // "/sresult/resumes"
			$.getJSON("/sresult/" + users, function(data) {
				var source_pnl = $("#tmpnl_resume").html();
				template_pnl = Handlebars.compile(source_pnl);
				console.log(data.length);
				i = 0;
				deletelist();
				$("#sdesc").html("검색결과");
				$(data).each(resumePnl);
			});
		}
	}

	// text 검색으로 관련 정보를 를 보여주다.
	// 검색어(skey), 검색분류(users: recruits or resumes)
	function getList(users, skey) {
		$.getJSON("/sresult/" + users + "/" + skey, function(data) {
			var source_pnl = $("#template_pnl").html();
			var template_pnl = Handlebars.compile(source_pnl);
			console.log(data.length);
			var i = 0;
			var item;
			deletelist()
			$(data).each(function() {
				item = {
					num : ++i,
					id : this.bno,
					pw : this.rgbid,
					pname : this.title,
					email : this.employstatusid,
					birth : this.regdate
				};
				$("#spanel").append(template_pnl(item));
			});
			var str;
			if (data.length > 0) {
				str = data.length + "개의 검색결과가 있습니다.";
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
		template_pnl = Handlebars.compile(source_pnl);
		console.log(data.length);
		i = 0;
		deletelist();
		$(data).each(recruitPnl);
		var str;
		if (data.length > 0) {
			str = data.length + "개의 검색결과가 있습니다.";
		} else {
			str = "검색결과가 없습니다."
		}
		$("#sdesc").html(str);
	}

	// url: /sresult/sel_search/resumes
	function selResumeHandler(data) {
		var source_pnl = $("#tmpnl_resume").html();
		template_pnl = Handlebars.compile(source_pnl);
		console.log(data.length);
		i = 0;
		deletelist();
		$(data).each(resumePnl);

		var str;
		if (data.length > 0) {
			str = data.length + "개의 검색결과가 있습니다.";
		} else {
			str = "검색결과가 없습니다."
		}
		$("#sdesc").html(str);
	}

	// select 검색으로 관련 정보를 를 보여주다.(2)
	// 검색분류(users: recruits or resumes)
	function getList_sel(users) {
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