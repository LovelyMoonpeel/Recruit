<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/cheader.jsp"%> <!-- Header Include -->
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<div class="col-md-9">

	<p class="lead">
		<strong>기업 정보</strong>
	</p>

	<div class="top_cont">	
		<div class="corp_logo">
			<div id='uploadedList'>
				<img alt="${CInfoVO.img}" id="imgsrc" name="img" value="${CInfoVO.img}" style="width: 200px;" /> <br> <br>
			</div>
			
			<h1 class="ci_name">${CInfoVO.cname}</h1>
		</div>
		
		<div class="ci_desc">
			<p class="txt">${content}</p>
		</div>		
	</div>
	
	<div class="company_info_content">
		<div class="table-responsive">
			<table class="table table-bordered">
					<tr>
						<th class="table-activec col-lg-2" scope="row" style="text-align: center;"><h5>기업명</h5></th>
						<td class="table-activec col-lg-4"><h5>${CInfoVO.cname}</h5></td>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;"><h5>대표자명</h5></th>
						<td class="table-activec col-lg-4"><h5>${CInfoVO.ceo}</h5></td>
					</tr>
					
					<tr>
						<th class="table-active" scope="row" style="text-align: center;"><h5>업종</h5></th>
						<td colspan="3"><h5>${CInfoVO.ctype}</h5></td>
					</tr>
					
					<tr>
						<th class="table-active" scope="row" style="text-align: center;"><h5>기업형태</h5></th>
						<td colspan="3"><h5>${CInfoVO.form}</h5></td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;"><h5>기업주소</h5></th>
						<td colspan="3" id="location"><h5>${CInfoVO.location} ${CInfoVO.detaillocation}</h5></td>
					</tr>
					
					<tr>
						<th class="table-active" scope="row" style="text-align: center;"><h5>설립일</h5></th>
						<td colspan="3"><h5>${CInfoVO.establish}</h5></td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;"><h5>사원수</h5></th>
						
						
						<c:set var = "numemp" value="${CInfoVO.numemp}"/> 
						<c:set var = "comma" value=","/> 	
						
						<c:choose>
							<c:when test="${fn:contains(numemp,comma)}">
								<td>${CInfoVO.numemp}</td>
							</c:when>
							
							<c:otherwise>
								<td>${CInfoVO.numemp}</td>
							</c:otherwise>
						</c:choose>
						
						<th class="table-active" scope="row" style="text-align: center;"><h5>매출액</h5></th>
						<td>${CInfoVO.sales}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;"><h5>대표전화</h5></th>
						<td>${CInfoVO.tel}</td>
						<th class="table-active" scope="row" style="text-align: center;"><h5>FAX</h5></th>
						<td>${CInfoVO.fax}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row" style="text-align: center;"><h5>홈페이지</h5></th>
						<td>
							<a href="${CInfoVO.homepage}" class="link_site" target="_blank" rel="nofollow"><h5>${CInfoVO.homepage}</h5></a>
						</td>
						<th class="table-active" scope="row" style="text-align: center;"><h5>SNS</h5></th>
						<td>
							<a href="${CInfoVO.sns}" class="link_site" target="_blank" rel="nofollow"><h5>${CInfoVO.sns}</h5></a>
						</td>
					</tr>
					
			</table>
			<p class="lead">
				<strong>지도 위치</strong>
			</p>
			
		
			
			<div id="map"></div>


			<br> <br>
			<p class="lead">
				<strong>기업 아이디 및 이메일</strong>
			</p>

			<table class="table table-bordered ">
				<tbody>
					<tr>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">기업 아이디</th>
						<td class="table-activec col-lg-4">${CInfoVO.id}</td>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">기업 이메일</th>
						<td class="table-activec col-lg-4">${CInfoVO.email}</td>
					</tr>
<%-- 					<tr>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">담당자</th>
						<td class="table-activec col-lg-4">${boardVO.pname}</td>
						<th class="table-active col-lg-2" scope="row" style="text-align: center;">담당자 전화번호</th>
						<td class="table-activec col-lg-4">${CInfoVO.phone}</td>
					</tr> --%>
				</tbody>
			</table>

			<form role="form" method="post"></form>

			<!-- //table class -->
		</div>
		<!-- //table-responsive -->
	</div>
	<!-- //기업 페이지 두번째(company_info_content) -->
	<br> <br>


	<!-- 수정 버튼 -->
	<div class="box-footer text-center">
		<button type="submit" class="btn btn-warning btn-lg" id="cinfoModify">수정하기</button>
	</div>



	<!-- //수정 버튼 -->
	<br> <br>
</div>
<!-- //기업 페이지 -->



<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#cinfoModify").on("click", function() {
			formObj.attr("action", "/company/C_modify");
			formObj.attr("method", "get");
			formObj.submit();

		});

	});
	
	/* 	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("수정이 완료됐습니다.");
	} */

	$(document).ready(function() {
		console.log('${PWebSitelist}');
		var imgsrccheck = ('#imgsrccheck');
		if ($('#imgsrccheck').val() != "") {
			console.log(" val값 뭐임? " + $('#imgsrccheck').val());
			console.log(" val이 널값아님");
			$('#imgsrc').attr("src", 'displayFile?fileName=${CInfoVO.img}');
		} else {
			console.log(" val이 널값이다");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		}
	});
</script>

<style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>

 <script>

      function initMap() {
    	  var uluru = {lat: <c:out value="${CInfoVO.lat}"/>, lng: <c:out value="${CInfoVO.lng}"/>};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>

	<script async defer
   		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJUtblZh2z-lZFLFNeHDQ95o5a5-Q32s0&callback=initMap">
    </script>

<%@include file="../include/cfooter.jsp"%>