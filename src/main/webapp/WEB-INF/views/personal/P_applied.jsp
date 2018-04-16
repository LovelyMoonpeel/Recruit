<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/pheader.jsp"%>
<style>
.badge-success:hover {
  background-color: #356635;
}
</style>
<!-- Main content --><!-- 지원현황 페이지 -->
<form role="form">
	<input type='hidden' name='id' id='apply_pid' value="${PUserVO.id}">
</form>

<div class="container col-md-9">
	<h1 class="ci_name">${PUserVO.pname}</h1>
	<h4>님의 지원 현황</h4>
	

	<div style='width: 100%; border: 1px solid #c0c6d3; padding: 30px;'>
		<ul>
			<li>[${PUserVO.pname}]님이 지원한 채용공고/이력서 목록입니다.</li>
			<li>공고 등록 순서에 따라 정렬됩니다.<br></li>
			<li>이력서를 등록하신 회원님께 <b>이력서 기반 추천 공고 서비스를 무료</b>로 제공합니다.
			</li>
		</ul>
		<br>※ 퍼펙트 매칭 채용정보 등록 규정상 부적합한 이력서로 판별된 경우, 별도 통보 없이 이력서가 비공개/삭제
		처리될 수 있습니다.<br>
	</div>
	
	<br> <input type="hidden" id="controller_value" value="${controller_value}">
		<input type="hidden" id="order_value" name="order_value" value="${order_value}">

	<div class="container col-md-4">
		<small style="cursor: pointer" id="applicant_order"
			onclick="applicant_order()">지원자수<span
			id="applicant_order_icon"
			class="order glyphicon glyphicon-chevron-down"> </span></small> | <small
			style="cursor: pointer" id="closingdate_order"
			onclick="closingdate_order()">마감일순<span
			id="closingdate_order_icon"
			class="order glyphicon glyphicon-chevron-down"> </span></small>
	</div>
	
	<div>
		<button id="all_btn" class="btn col-md-offset-9" onclick="all_recruits()">전체</button>
		<button id="ongoing_btn" class="btn" onclick="ongoing_recruits()">진행중</button>
		<button id="closed_btn" class="btn" onclick="closed_recruits()">마감</button>
	</div>
		<br>
		
	<div class="table-responsive">
		<!-- 본 바디 틀 -->
		<table class="table table-bordered">
			<!-- 공고 메인 공고 테이블 순서 번호는 java문 counter로 처리-->
			<tr class="active">
				<th style="text-align: center;">상태</th>
				<th style="text-align: center;">회사명</th>
				<th style="text-align: center;">공고 제목</th>
				<th id="closingdate_th" style="text-align: center; width: 90px;">모집기간</th>
				<th id="applicant_th" style="width: 79px;">지원자 수</th>
				<th style="text-align: center;">내이력서</th>
				<th style="text-align: center;">열람여부</th>
			</tr>
			<!-- 소연 crecruitMapper.selectAPList -->
			<c:forEach items="${CRecruitVOList}" var="CRecruitVO"
				varStatus="status">
				<tr>
					<td style="text-align: center; vertical-align: middle"><span
						class="jobdesc badge badge-pill">${CRecruitVO.jobdesc}</span></td>
					<td style="text-align: center; vertical-align: middle">${CRecruitVO.recruitform}</td>
					<td style="text-align: center; vertical-align: middle"><a
						href='/company/C_recruitMent?recruitNum=${CRecruitVO.bno}'
						onClick="window.open(this.href, 'C${CRecruitVO.bno}', 'width=1240, height=960'); return false;">${CRecruitVO.bno}
							: ${CRecruitVO.title}</a></td>
					<td style="text-align: center;">${CRecruitVO.regdate}<br>~<br>${CRecruitVO.period}</td>
					<td style="text-align: center; vertical-align: middle"><span
						class="badge badge-pill">${CRecruitVO.adddesc}</span></td>
					<td style="text-align: center; vertical-align: middle"><a
						href='/personal/detail_nonavi?bno=${CRecruitVO.viewcnt}'
						onClick="window.open(this.href, 'R${CRecruitVO.viewcnt}', 'width=1000, height=960'); return false;"><span
							class="badge badge-pill badge-success">내이력서</span></a></td>
					<td style="text-align: center; vertical-align: middle"><span
						class="creadornot badge badge-pill">${CRecruitVO.creadornot}</span>
						<input type="hidden" id="apply_bno${status.index }"
						value="${CRecruitVO.bno}"> <br>
					<span style="cursor: pointer"
						class="badge badge-pill badge-warning apply_cancel">지원 취소</span></td>
					<!--  ${CRecruitVO.acceptmethod} : 지원한 이력서 이름 -->
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<br><br>
<script>

function ongoing_recruits(){//모집중
	self.location="/personal/applied_ongoing?order_value="+$("#order_value").val();
}
function closed_recruits(){//모집완료
	self.location="/personal/applied_closed?order_value="+$("#order_value").val();
}
function all_recruits(){//전체
	self.location="/personal/applied_all?order_value="+$("#order_value").val();	
}
function applicant_order(){
	$("#order_value").val("applicant_order");
	self.location="/personal/applied_"+$("#controller_value").val()+"?order_value="+$("#order_value").val();
}
function closingdate_order(){
	$("#order_value").val("closingdate_order");
	self.location="/personal/applied_"+$("#controller_value").val()+"?order_value="+$("#order_value").val();
}

$(document).ready(function(){
	
	if($("#controller_value").val()=="all"){
		$("#all_btn").addClass("btn-info");
	}else if($("#controller_value").val()=="ongoing"){
		$("#ongoing_btn").addClass("btn-info");
	}else if($("#controller_value").val()=="closed"){
		$("#closed_btn").addClass("btn-info");
	}
	
	if($("#order_value").val()=="applicant_order"){
		$("#applicant_order_icon").removeClass();
		$("#applicant_order_icon").addClass("glyphicon glyphicon-chevron-up");
		$("#applicant_order").css("font-weight","bold");
		
		$("#applicant_th").css("background-color","#bbdefb");
		
	}else if($("#order_value").val()=="closingdate_order"){
		$("#closingdate_order_icon").removeClass();
		$("#closingdate_order_icon").addClass("glyphicon glyphicon-chevron-up");
		$("#closingdate_order").css("font-weight","bold");
		
		$("#closingdate_th").css("background-color","#bbdefb");
	}
		
 	$(".jobdesc").each(function(index){
 		
 		if($(this).text()=='모집완료'){
 			$(this).addClass('');
		}else if($(this).text()=='모집중'){
			$(this).addClass('badge-info');
		}else{
			$(this).addClass('badge-warning');
		} 
	}); 
	$(".creadornot").each(function(index){
 		
 		if($(this).text()=='0'||$(this).text()=='읽지않음'){
 			$(this).text('읽지않음');
 			$(this).addClass('');
		}else if($(this).text()=='1'||$(this).text()=='읽음'){
			$(this).text('읽음');
			$(this).addClass('');
		}else{
			$(this).text('오류');
			$(this).addClass('badge-warning');
		} 
	});
	
	$( ".apply_cancel" ).each(function(index) {
		var apply_bno = $("#apply_bno"+index).val();
		var apply_pid = $("#apply_pid").val();
		
	    $(this).on("click", function(){
	    	
			$.ajax({
			    type:'post',
			    url:'/personal/apply_cancel',
			    headers:{
			       "Content-Type":"application/json",
			       "X-HTTP-Method-Override" : "POST"
			    },
			    dataType:'text',
			    data:JSON.stringify({
			       rcno : apply_bno,
			       pid : apply_pid 
			    }),
			    success:function(result){
			       if(result=='deleted'){
			          alert("지원취소 되었습니다.");
			      		self.location="/personal/applied_all";
			       }else{
			          alert("뭔가 잘못됨 else문으로 들어옴");
			       }
			    }//success end
			 });//ajax end
	    });//on click end
	});//apply_cancel.each end
});
</script>

<%@include file="../include/cfooter.jsp"%>