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
			<h1 align="center">
				<%
					String stype2 = (String) request.getAttribute("stype_");
					String stitle;
					if ("2".equals(stype2)) {
						stitle = "인재검색";
					} else {
						stype2 = "1";
						stitle = "기업검색";
					}
				%>
				<%=stitle%>
			</h1>
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
					<input id="stype" type='hidden' name='stype' value="<%=stype2%>">
					<input id="ttype" type='hidden' name='ttype' value="c1">
				</div>
			</form>
			<br />
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
				<div class="well col-md-10" id="well"
					style="background-color: #c8c8c8;"></div>
				<div class="col-md-2">
					<button type="button" class="btn btn-default" id="opt_search_btn">&nbsp;검색&nbsp;</button>
				</div>
			</div>
			<br />
			<h3 align="center" id="sdesc"></h3>
			<br />
			<!-- Search List -->
			<!-- <h1 class="sres" align="center" style="visibility: hidden;">검색결과</h1> -->
			<!-- <table class="table table-bordered sres" style="visibility: hidden;"> -->
			<!-- style="visibility: hidden/visible; -->
			<!-- <tbody id="stable"> -->
			<!-- <tr> -->
			<!-- <th style="text-align: center">순번</th> -->
			<!-- <th style="text-align: center">항목1</th> -->
			<!-- <th style="text-align: center">항목2</th> -->
			<!-- <th style="text-align: center">항목3</th> -->
			<!-- <th style="text-align: center">항목4</th> -->
			<!-- <th style="text-align: center">항목5</th> -->
			<!-- </tr> -->
			<!-- </tbody> -->
			<!-- </table> -->
			<!-- /Search List -->
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- row -->
	<div class="row" id="spanel"></div>
</div>
<!-- /Page Content -->

<div class="col-md-12"></div>

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

<script id="template_pnl" type="text/x-handlebars-template">
<div class="col-md-3 result">
	<div class="panel panel-default">
		<div class="panel-heading">{{num}} {{id}}</div>
		<div class="panel-body">{{pname}}<br/>{{birth}}</div>
		<div class="panel-footer">{{email}}</div>
	</div>
</div>
</script>

<script>
	stabsel("c1"); // c1: job group tab

	function onEnter() {
		if (event.keyCode == 13) {
			$("#search_btn").trigger('click');
			return false;
		}
	}

	function deletelist() {
		$(".result").remove();
		$(".sres").attr('style', 'visibility: hidden;');
	}

	// search_button click event handler
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

	// select_tab click event handler
	$(".stab").on("click", function() {
		if ($(this).hasClass("active") !== true) {
			$(".nav-tabs li").removeClass("active");
			$(this).addClass("active");
			stabsel($(this).attr("id"));
			$("#ttype").val($(this).attr("id")); // change ttype(hidden input) value
		}
	});

	// show all items of users
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

	// show selected items of users with key word
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

	// show selected items of recruits or resumes
	function getList_sel(users) {
		deletelist();
		if($("#stype").attr("value") === "1"){
			console.log('$("#stype").attr("value") === "1"')
		} else if ($("#stype").attr("value") === "2") {
			console.log('$("#stype").attr("value") === "2"')
		}
		$.getJSON("/sresult/sel_search/" + users, function(data) {
			var source_pnl = $("#template_pnl").html();
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

	// click event handler of select_search button
	$("#opt_search_btn").on("click", function() {
		var array = [];
		var i = 0;
		$("#well > .sfilter_btn").each(function() {
			array[i] = $(this).val();
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
				if (result = 'SUCCESS') {
					alert('SUCCESS');
					getList_sel('recruits');
				}
			}
		}); // ajax
	});

	// add a search_filter item through search selection 
	function add_tmpl_sfilter(that) {
		var alreadyhave = false;
		$("#well > .sfilter_btn").each(function() { // deduplication
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

	// the first selection tag change event handler
	$("#sel1")
			.change(
					function() {
						$("#sel2").attr('style', 'visibility: hidden;');
						$(".opt2").remove();
						if ($(this).val() !== '0') {
							if ($("#ttype").val() === 'c1') { // #sel1 c1(job group) change
								$
										.getJSON(
												"/sresult/jobg/"
														+ $(this).val(),
												function(data) {
													var str = "";
													console.log(data.length);
													var i = 0;
													$(data)
															.each(
																	function() { // option val : J + job code
																		str += '<option class="opt2" value="J'+ this.id +'">'
																				+ this.jobgroup
																				+ '</option>'
																	});
													$("#sel2").append(str);
													$("#sel2")
															.attr('style',
																	'visibility: visible;');
												});
							} // end of #sel1 c1 change
							else if ($("#ttype").val() === 'c2') { // #sel1 c2 change
								var that_val = $(this).val();

								$
										.getJSON(
												"/sresult/region/"
														+ $(this).val(),
												function(data) {
													var str = "";
													console.log(data.length);
													var i = 0;
													$(data)
															.each(
																	function() { // option val : R + region code
																		str += '<option class="opt2" value="R' + that_val+ this.rgsid +'">'
																				+ this.rgsname
																				+ '</option>'
																	});
													$("#sel2").append(str);
													$("#sel2")
															.attr('style',
																	'visibility: visible;');
												});
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

	// the second selection tag change event handler
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
	// 	$("#well").on("click", ".sfilter_btn", function() {
	// 		alert($(this).val());
	// 		$(this).remove();
	// 	});

	// selection_tab change event handler
	function stabsel(idc) {
		$("#sel2").attr('style', 'visibility: hidden;');
		$("#sel1").attr('style', 'visibility: hidden;');
		$(".opt1").remove();
		if (idc === "c1") { // job group
			$
					.getJSON(
							"/sresult/jobg",
							function(data) {
								var str = "";
								console.log(data.length);
								var i = 0;
								$(data)
										.each(
												function() {
													str += '<option class="opt1" value="'+ this.id +'">'
															+ this.jobgroup
															+ '</option>'
												});
								$("#sel1").append(str);
								$("#sel1")
										.attr('style', 'visibility: visible;');
							});
		} else if (idc === "c2") { // region
			$
					.getJSON(
							"/sresult/region",
							function(data) {
								var str = "";
								console.log(data.length);
								var i = 0;
								$(data)
										.each(
												function() {
													str += '<option class="opt1" value="'+ this.rgbid +'">'
															+ this.rgbname
															+ '</option>'
												});
								$("#sel1").append(str);
								$("#sel1")
										.attr('style', 'visibility: visible;');
							});
		} else { // employment status(4), education(2), experience(1)
			var tid;

			if (idc === "c3")
				tid = 4;
			else if (idc === "c4")
				tid = 2;
			else
				tid = 1;
			$
					.getJSON(
							"/sresult/code/" + tid,
							function(data) {
								var str = "";
								console.log(data.length);
								var i = 0;
								$(data)
										.each(
												function() {
													str += '<option class="opt1" value="'+ this.id +'">'
															+ this.career
															+ '</option>'
												});
								$("#sel1").append(str);
								$("#sel1")
										.attr('style', 'visibility: visible;');
							});
		}
	}
</script>

<%@include file="../include/sfooter.jsp"%>