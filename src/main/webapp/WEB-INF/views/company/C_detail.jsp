<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<table>
		<tr>
			<th>기업명</th>
			<td>LG CNS</td>
			<th>대표자명</th>
			<td>김영섭</td>
		</tr>
		<tr>
			<th>소속그룹</th>
			<td colspan="3">LG</td>
		</tr>
		<tr>
			<th>업종</th>
			<td colspan="3">컴퓨터시스템 통합 자문 및 구축 서비스업</td>
		</tr>
		<tr>
			<th>사업내용</th>
			<td colspan="3">시스템통합구축, 소프트웨어 개발, 자료조사처리/물류자동화 컨설팅</td>
		</tr>
		<tr>
			<th>기업형태</th>
			<td colspan="3">대기업, 1000대기업, 외부감사법인, 수출입 기업, 법인사업체</td>
		</tr>
		<tr>
			<th>설립일</th>
			<td>1987년 1월 14일(업력 31년)</td>
			<th>채용현황</th>
			<td>채용 진행중 <a href="">1건</a>
			</td>
		</tr>
		<tr>
			<th>매출액</th>
			<td colspan="3">3조원(2016년 기준)</td>
		</tr>
		<tr>
			<th>자본금</th>
			<td colspan="3">471억 9,841만원(2016년 기준)</td>
		</tr>
		<tr>
			<th>대표전화</th>
			<td>02-2099-0114</td>
			<th>FAX</th>
			<td>02-2099-0099</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td><a href="http://www.lgcns.com" class="link_site"
				target="_blank" rel="nofollow">http://www.lgcns.com</a></td>
			<th>SNS / 블로그</th>
			<td><a href="http://blog.lgcns.com" class="link_site"
				target="_blank" rel="nofollow">http://blog.lgcns.com</a></td>
		</tr>
		<tr>
			<th>기업주소</th>
			<td colspan="3">서울 영등포구 여의대로 24 FKI 타워</td>
		</tr>
	</table>
	<br> <br> <br>
	<!-- // 회사 기본 정보 끝 -->

	<!-- 모집 정보 -->
	<!-- DB에서 작성된 공고에 있는 값을 불러와서 td에 채워 넣어야 함  -->
	<h3>모집 정보</h3>
	<table border="1" id="my-tbody">
		<tr>
			<th>모집직종</th>
			<td>웹프로그래머 -> 자바</td>
		</tr>
		<tr>
			<th>근무지역</th>
			<td>강원도 -> 강릉시</td>
		</tr>
		<tr>
			<th>담당업무</th>
			<td>당신은 이런거 저런거 그런거 합니다.</textarea>
			</td>
		</tr>
		<tr>
			<th>모집인원</th>
			<td>3명</td>
		</tr>
		<tr>
			<th>근무형태</th>
			<td>정규직</td>
		</tr>
		<tr>
			<th>급여사항</th>
			<td>2000~2500</td>
		</tr>
		<tr>
			<th>학력</th>
			<td>대학교졸업(4년)</td>
		</tr>
		<tr>
			<th>경력</th>
			<td>신입</td>
		</tr>
		<tr>
			<th>상세내용 및 우대사항</th>
			<td>이런거 저런거 그런거 우대함</td>
		</tr>
		<tr>
			<th>접수기간</th>
			<td>2018/02/20~2018/03/05</td>
		</tr>
		<tr>
			<th>접수방법</th>
			<td>즉시지원</td>
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
			<td><a href="">신입사원 거식이입니다.</td>
			<td>2/22(금)</a>
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