<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<form role="form">
	<input type='hidden' id='userid' name='id' value="${PUserVO.id}">
</form>

<!--  스크랩한채용공고 페이지 -->
<div class="col-md-9">
	<h1 class="ci_name">${PUserVO.pname}</h1>
	<h4>님의 관심 채용공고 페이지</h4>
	<br>
	<div style='width: 100%; height: 190px; border: 1px solid #c0c6d3; padding: 30px;'>
		<ul>
			<li>관심 공고로 등록한 채용공고는 최초 관심 등록일로부터 30일간 보관됩니다.</li>
			<li>진행중 공고는 <b> 최대 5개까지 동시 게재</b>가능하며, 5개 초과 등록 시, 대기중 상태가 됩니다.<br></li>
			<li>이력서를 등록하신 회원님께<b>이력서 기반 추천 공고 서비스를 무료</b>로 제공합니다.
			</li>
		</ul>
		<br>※ RecruIT 채용정보 등록 규정상 부적합한 이력서로 판별된 경우, 별도 통보 없이 이력서가 비공개/삭제
		처리될 수 있습니다.<br>
	</div>
	<br>
	<input type="hidden" id="controller_value" value="${controller_value}">
	<input type="hidden" id="order_value" name="order_value" value="${order_value}">
	
	<!-- <hr style="border: solid 1px #c0c6d3;"> -->
	<div class="container col-md-4">
		<small style="cursor:pointer" id="viewcnt_order" onclick="viewcnt_order()">조회수순<span id="viewcnt_order_icon" class="order glyphicon glyphicon-chevron-down"> </span></small>
		| <small style="cursor:pointer" id="applicant_order" onclick="applicant_order()">지원자수<span id="applicant_order_icon" class="order glyphicon glyphicon-chevron-down"> </span></small>
		| <small style="cursor:pointer" id="closingdate_order" onclick="closingdate_order()">마감일순<span id="closingdate_order_icon" class="order glyphicon glyphicon-chevron-down"> </span></small>
	</div>
	<div class="container col-md-offset-9">
		<button id="all_btn" class="btn " onclick="all_recruits()">전체</button>
		<button id="ongoing_btn" class="btn" onclick="ongoing_recruits()">진행중</button>
		<button id="closed_btn" class="btn" onclick="closed_recruits()">마감</button>
	</div>
	<br>
	<div class="favor_table_container">
		<table id="favor_table" class="table table-bordered">
			<tr class="active">
				<th style="text-align: center;">상태</th>
				<th style="text-align: center;">회사명</th>
				<th style="text-align: center;">공고 제목</th>
				<th id="closingdate_th" style="text-align: center; width: 90px;">모집기간</th>
				<th id="applicant_th" style="text-align: center; width: 79px;">지원자 수</th>
				<th id="viewcnt_th" style="width: 65px;">조회수</th>
				<th style="text-align: center;">관리</th>
			</tr>
			<c:forEach items="${CRecruitVOList}" var="CRecruitVO" varStatus="status">
				<tr>
					<td style="text-align: center; vertical-align:middle">
					<input type="hidden" value="${CRecruitVO.acceptmethod}">
					<span class="acceptmethod badge badge-pill">${CRecruitVO.acceptmethod}</span></td><!-- acceptmethod가 모집중 모집완료 -->
					<td style="text-align: center; vertical-align:middle">${CRecruitVO.recruitform}</td>
					<td style="text-align: center; vertical-align:middle">
						<a href='/company/C_recruitMent?recruitNum=${CRecruitVO.bno}' onClick="window.open(this.href, '', 'width=1240, height=960'); return false;">${CRecruitVO.bno} : ${CRecruitVO.title}</a>
					</td>
					<td style="text-align: center;">${CRecruitVO.regdate}<br>~<br>${CRecruitVO.jobdesc}</td><!-- jobdesc가 period -->
					<td style="text-align: center; vertical-align:middle"><span class="badge badge-pill adddesc">${CRecruitVO.adddesc}</span></td>
					<td style="text-align: center; vertical-align:middle"><span class="badge badge-pill">${CRecruitVO.viewcnt}</span></td>
					<td style="text-align: center; vertical-align:middle">
					<input type="hidden" id="rcno${status.index}" value="${CRecruitVO.bno}" />
						<img src=/resources/rpjt/img/on.png id="non" name="clipping_cancel" onclick="clipping_cancel_function(rcno${status.index}.value)">
						</td>
				</tr>
				<%-- </c:if> --%>
			</c:forEach>
		</table>
	</div>
	<br> <br>
</div>
<script type="text/javascript">

function ongoing_recruits(){//모집중
	 self.location="/personal/favor_ongoing?order_value="+$("#order_value").val();
}
function closed_recruits(){//모집완료
	self.location="/personal/favor_closed?order_value="+$("#order_value").val();
}
function all_recruits(){//전체
	self.location="/personal/favor_all?order_value="+$("#order_value").val();	
}
function viewcnt_order(){
	$("#order_value").val("viewcnt_order");
	self.location="/personal/favor_"+$("#controller_value").val()+"?order_value="+$("#order_value").val();
}
function applicant_order(){
	$("#order_value").val("applicant_order");
	self.location="/personal/favor_"+$("#controller_value").val()+"?order_value="+$("#order_value").val();
}
function closingdate_order(){
	$("#order_value").val("closingdate_order");
	self.location="/personal/favor_"+$("#controller_value").val()+"?order_value="+$("#order_value").val();
}

function badge_color(){
	$(".acceptmethod").each(function(index){
 		if($(this).text()=='모집완료'){
 			$(this).addClass('');
		}else if($(this).text()=='모집중'){
			$(this).addClass('badge-info');
		}else{
			$(this).addClass('badge-warning');
		} 
	}); 
}
$(document).ready(function(){
	if($("#controller_value").val()=="all"){
		$("#all_btn").addClass("btn-info");
	}else if($("#controller_value").val()=="ongoing"){
		$("#ongoing_btn").addClass("btn-info");
	}else if($("#controller_value").val()=="closed"){
		$("#closed_btn").addClass("btn-info");
	}
	
	badge_color();
	
	if($("#order_value").val()=="viewcnt_order"){
		$("#viewcnt_order_icon").removeClass();
		$("#viewcnt_order_icon").addClass("glyphicon glyphicon-chevron-up");
		$("#viewcnt_order").css("font-weight","bold");
		
		$("#viewcnt_th").css("background-color","#bbdefb");
		
	}else if($("#order_value").val()=="applicant_order"){
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
	
	$(".adddesc").each(function(index){
		if($(this).text()==''){
			$(this).text(0);
		}
	});
});

function clipping_cancel_function(rcno){
		//var rcno = rcno.value;
		var userid = $("#userid").val();
		
		console.log(rcno);
		console.log(userid);
		  $.ajax({
			type:'post',
			url:'/companyAjax/clippingcancel',
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType:'text',
			data:JSON.stringify({
				rcbno : rcno,
				userid : userid 
			}),
			success:function(result){
				console.log("result가 뭐냐?"+result);
				if(result=='TRUE'){
					alert("이미 스크랩 해제된 공고 입니다.");
				}else if(result=='FALSE'){
					alert("관심채용공고에서 삭제되었습니다.");
					self.location="/personal/favor";
					//self.location = "/company/C_recruitRemove?bno="+bno+"";
				}else{
					alert("어느 if문에도 들어가지 못함.");
					console.log("어느 if문에도 들어가지 못함.");
				}
			}//success end
		 })//ajax end 
	}
	
</script>
<%@include file="../include/cfooter.jsp"%>
