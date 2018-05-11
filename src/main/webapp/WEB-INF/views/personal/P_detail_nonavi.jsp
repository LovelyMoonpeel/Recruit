<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header_nonavi_resume.jsp"%>

<div class="col-md-9">
	<h1>${ResumeVO.preadornot}님의이력서상세</h1>
	<br> <br>


	<div id="noC">
		<button id=r1 value="${ResumeVO.bno}">
			<img src=/resources/rpjt/img/non.png name="r1"value="${ResumeVO.bno}"> <b id=r3 name="r2">
			</b>
		</button>
	</div>

	<!-- 이력서 페이지 두번째(기본 정보) -->
	<!-- ★아래 두 줄의 class 설정으로 인해 테이블이 반응형으로 적용됨 -->
	<div class="table-responsive">
		<!-- ★클래스를 여러 개 쓰고 싶으면 한 칸 띄우고 쓰기/table-striped는 홀수번째마다 색칠하기 -->
		<table class="table table-bordered">
			<tbody>
				<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
				<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
				<tr>
					<th class="table-active" scope="row" style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)"><label
						for="title">제목</label>
					<td colspan="5" style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">${ResumeVO.title}</td>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="pname">이름</label></th>
					<td class="col-sm-4" id="pname" name="pname"
						style="text-align: center;">${ResumeVO.preadornot}</td>
					<th rowspan="3" class="table-active" scope="row"
						style="text-align: center;"><label for="img">사진</label></th>
					<td colspan="3" rowspan="3" class="col-sm-4">
						<div id='uploadedList' style='width: 127px; height: 152px;'>
							<img id='imgsrc' height="150px;" alt="${ResumeVO.img}" />
						</div> <!--  사진 보이는 div  --> <input id='imgsrccheck' type='hidden'
						value="${ResumeVO.img}" /> <!-- db에 있는 file img 이름 받아오는 hidden input -->
						<input type='hidden' id='uploadfilename' name='img'> <!-- db에 올라갈 file img 이름 받아오는 hidden input -->
						<br>
					</td>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label>생년월일</label></th>
					<td style="text-align: center;">${ResumeVO.extracolumn}</td>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="email">이메일</label></th>
					<td style="text-align: center;">${ResumeVO.publicornot}</td>
				</tr>

				<tr>
					<th class="table-active" colspan="5" scope="row"
						style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">연락처 목록</th>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label>순서</label></th>
					<th colspan="2" class="table-active" scope="row"
						style="text-align: center;"><label for="teltitle">전화번호(종류)</label></th>
					<th colspan="2" class="table-active" scope="row"
						style="text-align: center;"><label for="tel">전화번호</label></th>
				</tr>
				<c:forEach items="${PTellist}" var="PTelVO" varStatus="status">
					<tr>
						<td style="text-align: center;">${status.count}</td>
						<td colspan="2" style="text-align: center;">${PTelVO.teltitle}</td>
						<td colspan="2" style="text-align: center;">${PTelVO.tel}</td>
					</tr>
				</c:forEach>

				<tr>
					<th class="table-active" colspan="2" scope="row"
						style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">학력사항</th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="test">최종학력</label></th>
					<td style="text-align: center;" colspan="2">${resumeRead.levelofeducation}</td>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="test">학교명</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="test">학과</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="score">졸업상태</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="lanpubleoffice">입학일</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="lanacquidate">졸업일</label></th>
				</tr>
				<c:forEach items="${eduVOlist}" var="eduVO">
					<tr>
						<td style="text-align: center;">${eduVO.schoolname}</td>
						<td style="text-align: center;">${eduVO.major}</td>
						<td style="text-align: center;">${eduVO.bno}</td>
						<td style="text-align: center;">${eduVO.enterdate}</td>
						<td style="text-align: center;">${eduVO.gradudate}</td>
					</tr>
				</c:forEach>

				<tr>
					<th class="table-active" colspan="2" scope="row"
						style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">경력사항</th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="test">경력</label></th>
					<td style="text-align: center;" colspan="2">${resumeRead.lastcareer}</td>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="test">회사명</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="test">담당업무</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="score">연봉</label></th>
					<th class="table-active" scope="row"><label
						for="lanpubleoffice">입사일</label></th>
					<th class="table-active" scope="row"><label for="lanacquidate">퇴사일</label></th>
				</tr>
				<c:forEach items="${careerVOList}" var="careerVO">
					<tr>
						<td style="text-align: center;">${careerVO.cname}</td>
						<td style="text-align: center;">${careerVO.jobdescription}</td>
						<td style="text-align: center;">${careerVO.bno}</td>
						<td style="text-align: center;">${careerVO.startjob}</td>
						<td style="text-align: center;">${careerVO.finishjob}</td>
					</tr>
				</c:forEach>

				<tr>
					<th class="table-active" colspan="5" scope="row"
						style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">희망 구직 정보</th>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;">구직상태</th>
					<td style="text-align: center;">${resumeRead.jobstateid}</td>
					<th class="table-active" scope="row" style="text-align: center;">희망근무형태</th>
					<td colspan="2" style="text-align: center;">${resumeRead.employstatusid}</td>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;">희망직종(대분류)</th>
					<td style="text-align: center;">${resumeRead.jobgroupid}</td>
					<th class="table-active" scope="row" style="text-align: center;">희망직종(소분류)</th>
					<td colspan="2" style="text-align: center;">${resumeRead.jobgroupid2}</td>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;">희망근무지(시/도)</th>
					<td style="text-align: center;">${resumeRead.rgbid}</td>
					<th class="table-active" scope="row" style="text-align: center;">희망근무지</th>
					<td colspan="2" style="text-align: center;">${resumeRead.rgsid}</td>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;">희망연봉</th>
					<td style="text-align: center;">${resumeRead.salaryid}</td>
					<td style="text-align: center;" colspan="3"></td>
				</tr>

				<tr>
					<th class="table-active" colspan="5" scope="row"
						style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">웹사이트 목록</th>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label>순서</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="webtitle">웹사이트(종류)</label></th>
					<th class="table-active" scope="row" colspan="3"
						style="text-align: center;"><label for="webadd">웹사이트</label></th>
				</tr>
				<c:forEach items="${PWebSitelist}" var="PWebSiteVO"
					varStatus="status">
					<tr>
						<td style="text-align: center;">${status.count}</td>
						<td style="text-align: center;">${PWebSiteVO.webtitle}</td>
						<td colspan="3" style="text-align: center;">${PWebSiteVO.webadd}</td>
					</tr>
				</c:forEach>

				<tr>
					<th class="table-active" colspan="5" scope="row"
						style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">보유자격증 목록</th>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label>순서</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="licensename">자격증명</label></th>
					<th colspan="2" class="table-active" scope="row"
						style="text-align: center;"><label for="publeoffice">발행기관</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="acquidate">취득일자</label></th>
				</tr>
				<c:forEach items="${RLicenselist}" var="RLicenseVO"
					varStatus="status">
					<tr>
						<td style="text-align: center;">${status.count}</td>
						<td style="text-align: center;">${RLicenseVO.licensename}</td>
						<td colspan="2" style="text-align: center;">${RLicenseVO.publeoffice}</td>
						<td style="text-align: center;">${RLicenseVO.acquidate}</td>
					</tr>
				</c:forEach>

				<tr>
					<th class="table-active" colspan="5" scope="row"
						style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">어학능력 자격증 목록</th>
				</tr>
				<tr>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="test">언어</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="test">공인인증시험명</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="score">점수</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="lanpubleoffice">발행기관</label></th>
					<th class="table-active" scope="row" style="text-align: center;"><label
						for="lanacquidate">취득일자</label></th>
				</tr>
				<c:forEach items="${RLanguagelist}" var="ResumeLanguageVO">
					<tr>
						<td style="text-align: center;">${ResumeLanguageVO.resumelangid}</td>
						<td style="text-align: center;">${ResumeLanguageVO.test}</td>
						<td style="text-align: center;">${ResumeLanguageVO.score}</td>
						<td style="text-align: center;">${ResumeLanguageVO.publeoffice}</td>
						<td style="text-align: center;">${ResumeLanguageVO.acquidate}</td>
					</tr>
				</c:forEach>

				<tr>
					<th class="table-active" colspan="5" scope="row"
						style="text-align: center; vertical-align:middle; line-height:200%; background-color:rgba(192,198,211,0.5)">자기소개서</th>
				</tr>
				<tr>
					<td colspan="5" rowspan="3">${coverletter}</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" id="id" value="${PUserVO.id}">


		<c:forEach items="${FavorCompareList}" var="FavorCompareListVO">
			<input type="text" name="CompareList"
				value="${FavorCompareListVO.presume}">
		</c:forEach>
		<!-- 관심인재에 등록된 사람인지 비교하기 위한 forEach문 (park) -->
		<input type="hidden" id="bonobono" value="${ResumeVO.bno}">
		<!-- 현재 이력서 번호(park) -->
		<!-- //table class -->
	</div>
	<!-- //table-responsive -->

	<br> <br>
	<!-- 수정, 목록 버튼 -->
	<%-- <div class="form-group">
		<button id="write-success" class="btn btn-success col-md-offset-10"
			type='button'
			onClick="javascript:self.location='/personal/Rmodify?bno=${ResumeVO.bno}';">수정</button>
		<button id="write-cancel" class="btn btn-danger"
			onClick="javascript:self.location='/personal/manage?id=${PUserVO.id}';">목록</button>
	</div> --%>
	<!-- //수정, 목록 버튼 -->
	<br> <br>
</div>
<script>
	$(document).ready(function() {
		console.log('${PWebSitelist}');
		var imgsrccheck = ('#imgsrccheck');
		if ($('#imgsrccheck').val() != "") {
			console.log(" val값 뭐임? " + $('#imgsrccheck').val());
			console.log(" val이 널값아님");
			$('#imgsrc').attr("src", 'displayFile?fileName=${ResumeVO.img}');
		} else {
			console.log(" val이 널값이다");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		}
	});
</script>

<%
	String state = login.getCname();
%>
<script>
	if (<%=state%> == null) {
		$("#noC").css("display", "none");
	}
</script>

</body>

<script>
	$(document).ready(function() {
		var compare = document.getElementsByName('CompareList');

		var bno = $("#bonobono").val()

		for (var i = 0; i < compare.length; i++) {

			if (compare[i].value == bno) {

				$("#r1").removeClass();
				$("img[name='r1']").attr("src", "/resources/rpjt/img/on.png")
				$("b[name='r2']").text("관심인재 취소하기")
				$("#r1").addClass("btn btn-danger");
			}else{
			}
		}
		
		if($("#r1").prop("class")!="btn btn-danger"){
			$("#r1").removeClass();
			$("img[name='r1']").attr("src", "/resources/rpjt/img/non.png")
			$("b[name='r2']").text("관심인재 등록하기")
			$("#r1").addClass("btn btn-success");
		}
	})
</script>

<script>
	$(document)
			.ready(
					function() {

						$(document)
								.on(
										"click",
										'#r1',
										function() {

											var id = $('#id').attr('value');
											var bno = $(this).attr('value');

											if ($("img[value=" + bno + "]")
													.attr("src") == "/resources/rpjt/img/on.png") {
												favDel(bno, id);
												$("#r1").removeClass();
												$("b[name='r2']").text("관심인재 등록하기");
												$("#r1").addClass("btn btn-success");
											} else if ($(
													"img[value=" + bno + "]")
													.attr("src") != "/resources/rpjt/img/on.png") {
												favAdd(bno, id);
												$("#r1").removeClass();
												$("b[name='r2']").text("관심인재 취소하기");
												$("#r1").addClass("btn btn-danger");
											}

										})

					})
	function favAdd(bno, id) { // 관심인재 등록

		$.getJSON("/companyAjax/favorAdd/" + bno + "/" + id, function(data) {
			var str = "";

			$(data).each(function() {
			});

		})
		$("img[value=" + bno + "]").attr("src", "/resources/rpjt/img/on.png")
		alert("관심인재에 등록 됐습니다.")

	}
	function favDel(bno, id) { // 관심인재 삭제

		$.getJSON("/companyAjax/favorDelete/" + bno + "/" + id, function(data) {
			var str = "";

			$(data).each(function() {
			});

		})
		$("img[value=" + bno + "]").attr("src", "/resources/rpjt/img/non.png")
		alert("관심인재에서 삭제 됐습니다.")

	}
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "C_recom"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});

			});
</script>
<%@include file="../include/cfooter.jsp"%>