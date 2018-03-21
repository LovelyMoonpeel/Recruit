<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 채용공고 목록 -->
<div class="col-md-9">
	<h1>채용 공고 목록</h1>
	
	<button class="btn btn-default" >전체</button><button class="btn btn-default" >진행중</button><button class="btn btn-default" >마감</button>
	<br>
	<table class="table table-bordered">
		<tr>
			<th>순번</th>
			<th>공고 제목</th>
			<th style="text-align: center">기간</th>
			<th>조회수</th>
			<th style="text-align: center">지원자수</th>
			<th>진행/완료</th>
			<th style="text-align: center">공고관리</th>
		</tr>
		
		
	
					<% int manage = 0; %>
						<c:forEach items="${recruitList}" var="RecruitVO" varStatus="status">
					<%manage++; %>
					<tr>
					<th><span class="badge badge-inverse" ><%=manage%></span></th>
					<th><a href="C_recruitInfo?recruitNum=${RecruitVO.bno}" target="_blank">${RecruitVO.title}</a></th>
					<th>~
					<fmt:parseDate value="${RecruitVO.period}" var="printper" pattern="yyyymmdd"/>
					<fmt:formatDate value="${printper}" var="printper2" pattern="yyyy/mm/dd"/>
					<c:out value="${printper2}"/>
					</th>
					<th>${RecruitVO.viewcnt}</th>
					<th></th>
					<th>
					<!-- 날짜 비교를 통해 모집중/완료 구분 -->
					<!-- 오늘 날짜를 받아옴 -->
					<jsp:useBean id="now" class="java.util.Date" />
					<!-- 날짜의 형태를 변환 -->
					<fmt:formatDate value="${now}" var="now2" pattern="yyyyMMdd"/>
					<!-- 날짜를 숫자로 변환(비교를 위해) -->
					<fmt:parseNumber value="${now2}" var="now3"/>
					<!-- DB의 날짜를 숫자로 변환(비교를 위해) -->
					<fmt:parseNumber value="${RecruitVO.period}" var="period2"/>
					<!-- if/else (JSTL은 choose로 if/else 사용) 구문으로 비교 -->
					<c:choose>
						<c:when test="${now3 - period2 < 1}">모집중</c:when>
						<c:otherwise>모집완료</c:otherwise>
					</c:choose>
					<!-- // 날짜 비교를 통해 모집중/완료 구분 -->
					</th>
					<th>
				
				<button type="button" id="delete"  value="${RecruitVO.bno}" class="btn btn-danger">삭제하기</button>
					</th>
					
					</tr>
	
	
						</c:forEach>
		
	</table>
	
	<div style="width: 740px; padding: 0 0 15px 0; margin: 0;">
		<div
			style="border: 1px solid #c1d1f2; background-color: #f4f9ff; padding: 13px 0 8px 12px;">
			<ul>
				<li>관심 인재로 등록한 이력서는 최초 관심 등록일로부터 30일간 보관됩니다.</li>
				<li>관심 등록한 이력서는 <b>채용을 목적으로 하는 경우</b>에만 이용할 수 있으며, <br> <b>최초
						개인정보 수집한 목적이 달성되면</b> <r>지체 없이 파기</r>하여야 합니다. <br>채용이 아닌 <r>영업이나
					마케팅 등으로 이용하실 경우,</r> <br> <r>정보통신망법 제71조 3에 의거 5년 이하 징역 또는
					5,000만원 이하의 벌금에 처해질 수 있습니다.</r>
				</li>

			</ul>
		</div>
	</div>
			
	
</div>
<!-- //기업 채용공고 목록 끝 -->


<script>


var formObj = $("form[role='form']");

		
		$(document).on("click", '#delete',function(){
			var bno = $(this).attr('value');
			/* formObj.attr("action", "/company/C_recruitRemove");  */
			self.location = "/company/C_recruitRemove?bno="+bno+"";
			/* formObj.attr("method", "get");		
			formObj.submit(); */
		});
		
		
		var result = '${msg}';
		if (result == 'MODISUCCESS') {
			alert("수정이 완료됐습니다.");
		}else if(result == 'DELESUCCESS'){
			alert("삭제가 완료됐습니다.");
		}
		
		
	
	
	</script>

<%@include file="../include/cfooter.jsp"%>