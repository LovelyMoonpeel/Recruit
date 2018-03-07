<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/sheader.jsp"%>

<!-- Page Content -->
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h1 align="center">${srchVO.stype}</h1>
			<!-- BS Inputs 2 -->
			<%-- <p>${srchVO.sdesc}</p> --%>
			<form action="/srch/main" method="get">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="${sdesc}"
						name="skeyword">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
					<input type='hidden' name='stype' value="${stype}">
				</div>
			</form>
			<h3 align="center">${srchVO.sdesc}</h3>
			<br /> <br />
			<!-- Search List -->
			<button type="button" class="btn btn-default" id="t_btn">Default</button>
			<h1 align="center">검색 결과</h1>
			<table id="stable" class="table table-bordered"
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
				<%-- <% int cnt = 0;	%>
				<c:forEach items="${list}" var="puserVO">
					<tr>
						<td align="center"><%=++cnt%></td>
						<td align="center">${puserVO.id}</td>
						<td style="text-align: center">${puserVO.pw}</td>
						<td align="center">${puserVO.pname}</td>
						<td style="text-align: center">${puserVO.email}</td>
						<td align="center">${puserVO.birth}</td>
					</tr>
				</c:forEach> --%>
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
	function getAllList() {
		$.getJSON("/sresult", function(data) {
			var str = "";
			console.log(data.length);
			var i = 0;
			$(data).each(
					function() {
						// console.log(data[i++]);
						str += '<tr><td align="center">' + (++i) + '</td>'
								+ '<td align="center">' + this.id + '</td>'
								+ '<td style="text-align: center">' + this.pw
								+ '</td>' + '<td align="center">' + this.pname
								+ '</td>' + '<td style="text-align: center">'
								+ this.email + '</td>' + '<td align="center">'
								+ this.birth + '</td></tr>'
					});
			$("#stable").append(str);
			$("#stable").attr('style', 'visibility: visible;');
		});
	}

	$("#t_btn").on("click", function() {
		getAllList();
	});
</script>

<%@include file="../include/sfooter.jsp"%>