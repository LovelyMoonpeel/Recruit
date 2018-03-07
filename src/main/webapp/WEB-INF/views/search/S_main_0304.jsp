<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/sheader.jsp"%>

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
				</div>
			</form>
			<br />
			<h3 align="center" id="sdesc"></h3>
			<br />
			<!-- Search List -->
			<!-- <h1 class="sres" align="center" style="visibility: hidden;">검색결과</h1> -->
			<table id="stable" class="table table-bordered sres"
				style="visibility: hidden;">
				<!-- style="visibility: hidden/visible; -->
				<tr>
					<th style="text-align: center">순번</th>
					<th style="text-align: center">항목1</th>
					<th style="text-align: center">항목2</th>
					<th style="text-align: center">항목3</th>
					<th style="text-align: center">항목4</th>
					<th style="text-align: center">항목5</th>
				</tr>
			</table>
			<!-- /Search List -->
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- row -->
</div>
<!-- /Page Content -->

<div class="col-md-12"></div>

<script>
	function onEnter() {
		if (event.keyCode == 13) {
			$("#search_btn").trigger('click');
			return false;
		}
	}

	function getAllList(users) {
		$.getJSON("/sresult/" + users, function(data) {
			var str = "";
			console.log(data.length);
			var i = 0;
			$(data).each(
					function() {
						// console.log(data[i++]);
						str += '<tr class="result"><td align="center">' + (++i)
								+ '</td>' + '<td align="center">' + this.id
								+ '</td>' + '<td style="text-align: center">'
								+ this.pw + '</td>' + '<td align="center">'
								+ this.pname + '</td>'
								+ '<td style="text-align: center">'
								+ this.email + '</td>' + '<td align="center">'
								+ this.birth + '</td></tr>'
					});
			$("#stable").append(str);
			$(".sres").attr('style', 'visibility: visible;');
		});
	}

	function getList(users, skey) {
		$.getJSON("/sresult/" + users + "/" + skey, function(data) {
			var str = "";
			console.log(data.length);
			var i = 0;
			$(data).each(
					function() {
						// console.log(data[i++]);
						str += '<tr class="result"><td align="center">' + (++i)
								+ '</td>' + '<td align="center">' + this.id
								+ '</td>' + '<td style="text-align: center">'
								+ this.pw + '</td>' + '<td align="center">'
								+ this.pname + '</td>'
								+ '<td style="text-align: center">'
								+ this.email + '</td>' + '<td align="center">'
								+ this.birth + '</td></tr>'
					});
			$("#stable").append(str);
			if (data.length > 0) {
				$("#sdesc").html("입력하신 키워드는 " + skey + "입니다.");
				$(".sres").attr('style', 'visibility: visible;');
			} else {
				$("#sdesc")
						.html(
								"입력하신 키워드는 " + skey + "입니다."
										+ "<br/><br/> 검색결과가 없습니다.");
			}
		});
	}

	function deletelist() {
		$(".result").remove();
		$(".sres").attr('style', 'visibility: hidden;');
	}

	$("#search_btn").on("click", function() {
		var sinp = $("#sinput").val();
		$("#sinput").val("");

		console.log(sinp);
		deletelist();
		if (sinp === "all") {
			$("#sdesc").html("검색결과");
			console.log($("#stype").attr("value"));
			console.log($("#stype").attr("value") === "1");
			if ($("#stype").attr("value") === "1") {
				getAllList("cusers");
			} else {
				getAllList("pusers");
			}
		} else if (sinp === "del") {
			deletelist();
		} else if (sinp === "") {
			$("#sdesc").html("키워드가 입력되지 않았습니다.");
		} else {
			if ($("#stype").attr("value") === "1") {
				getList("cusers", sinp)
			} else {
				getList("pusers", sinp)
			}
		}
	});
</script>

<%@include file="../include/sfooter.jsp"%>