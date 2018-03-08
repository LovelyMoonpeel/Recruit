<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 메인 바디 부분 -->
<div class="col-md-9">
	<!-- 메인 바디 입력 부분 -->
	<h1>
		<b>공고 정보</b>
	</h1>
	<!-- 회사 기본 정보  -->
	<!-- DB에서 기업 기본정보 값을 불러와서 td에 채워 넣어야 함  -->
	<h2>공고 제목</h2>
	<b>IT 금융 및 연구소 경력사원 채용공고</b> <br> <br>
	<h3>기본정보</h3>
				<table class="table table-bordered">
			
			
				<tbody>
					<tr>
						<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
						<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
						<th class="table-active" scope="row">기업명</th>
						<td>${CInfoVO.cname}</td>
						<th class="table-active" scope="row">대표자명</th>
						<td>${CInfoVO.ceo}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">업종</th>
						<td colspan="3">${CInfoVO.ctype}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">기업형태</th>
						<td colspan="3">${CInfoVO.form}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">설립일</th>
						<td colspan="3">${CInfoVO.establish}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">사원수</th>
						<td>${CInfoVO.numemp} 명</td>
						<th class="table-active" scope="row">매출액</th>
						<td>${CInfoVO.sales}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">대표전화</th>
						<td>${CInfoVO.tel}</td>
						<th class="table-active" scope="row">FAX</th>
						<td>${CInfoVO.fax}</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">홈페이지</th>
						<td><a href="${CInfoVO.homepage}" class="link_site"
							target="_blank" rel="nofollow">${CInfoVO.homepage}</a></td>
						<th class="table-active" scope="row">SNS</th>
						<td><a href="${CInfoVO.sns}"
							class="link_site" target="_blank" rel="nofollow">${CInfoVO.sns}</a></td>
					</tr>
					<tr>
						<th class="table-active" scope="row">기업주소</th>
						<td colspan="3">${CInfoVO.location}</td>
					</tr>
					<!-- ★복지는 2차 개발 -->
					<!-- <tr>
                        <th class="table-active" scope="row">복지</th>
                        <td colspan="3">하하하하하하 </td>
                      </tr> -->
				</tbody>
			</table>
			
	<br> <br> <br>
	<!-- // 회사 기본 정보 끝 -->
	

	<!-- 모집 정보 -->
	<!-- DB에서 작성된 공고에 있는 값을 불러와서 td에 채워 넣어야 함  -->
	<h3>모집 정보</h3>
	<table border="1" id="my-tbody" class="table table-bordered">
		<tr>
			<th>모집직종</th>
			<td>${RecruitVO.jobgroupid} -> ${RecruitVO.jobgroupid2}</td>
		</tr>
		<tr>
			<th>근무지역</th>
			<td>${RecruitVO.rgbid} -> ${RecruitVO.rgsid}</td>
		</tr>
		<tr>
			<th>담당업무</th>
			<td>${RecruitVO.jobdesc }</td>
		</tr>
		<tr>
			<th>모집인원</th>
			<td>${RecruitVO.recruitnum }명</td>
		</tr>
		<tr>
			<th>근무형태</th>
			<td>${RecruitVO.employstatusid }</td>
		</tr>
		<tr>
			<th>급여사항</th>
			<td>${RecruitVO.salaryid }</td>
		</tr>
		<tr>
			<th>학력</th>
			<td>${RecruitVO.edu }</td>
		</tr>
		<tr>
			<th>경력</th>
			<td>${RecruitVO.exp }</td>
		</tr>
		<tr>
			<th>상세내용 및 우대사항</th>
			<td>${RecruitVO.adddesc }</td>
		</tr>
		<tr>
			<th>접수기간</th>
			<td>${RecruitVO.period }</td>
		</tr>
		<tr>
			<th>접수방법</th>
			<td>${RecruitVO.acceptmethod }</td>
		</tr>
	</table>
	<br> <br> <br> <br> <br>
	<!-- // 모집 정보 끝 -->

	<h1>
		<b>지원자 리스트</b>
	</h1>
	<table>
		<tr>
			<th>순번</th>
			<th>이력서 요약</th>
			<th style="text-align: center">업데이트일</th>
		</tr>
		<tr>
			<td>4</td>
			<td><a href="">지원자 뭐시기 입니다.</a></td>
			<td>2/22(금)</td>
		</tr>
		<tr>
			<td>3</td>
			<td><a href="">신입사원 거식이입니다.</a></td>
			<td>2/22(금)
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td><a href="">5년차 경력자 그x끼입니다.</a></td>
			<td>2/9(금)</td>
		</tr>
		<tr>
			<td>1</td>
			<td><a href="">나는 누구냐?</a></td>
			<td>2/9(금)</td>
		</tr>
	</table>
	<br> <br> <br>

</div>
<!-- //메인 바디 끝 -->

<%@include file="../include/cfooter.jsp"%>