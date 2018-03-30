<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9">
	<p class="lead"><strong>관심인재</strong></p>


	<div class="gobox1">
		<div class="gobox2">
			<ul>
				<li>관심 인재로 등록한 이력서는 최초 관심 등록일로부터 30일간 보관됩니다.</li>
				<li>진행중 공고는 <b> 최대 5개까지 동시 게재</b>가능하며, 5개 초과 등록 시, 대기중 상태가 됩니다.</li> <br> 
				<li>공고를 등록하신 회원님께<b>공고 기반 추천 인재 서비스를 무료</b>로 제공합니다. </li>
				<li>서류접수가 완료되면 합격/불합격 여부를 떠나 지원자에게 서류발표 여부를 알려주세요. (서류 결과 발표 버튼 클릭)</li><br>
				<br>※ 사람인 채용정보 등록 규정상 부적합한 공고로 판별된 경우, 별도 통보 없이 공고가 마감/삭제 처리될 수 있습니다.

			</ul>
		</div>
	</div>

	<table class="table table-bordered">
		<tr class="active">
			<th style="width: 5%;"></th>
			<th style="width: 20%;" class="text-center">이름</th>
			<th class="text-center">이력서 요약</th>
			<th style="width: 15%;" class="text-center">업데이트일</th>
		</tr>
	
		<tbody id="favList">
		
		</tbody>
	</table>

	<!-- //기업 페이지 -->
</div>

<script>

$(document).ready(function(){
	
	favList();
	
})
	 
	$(document).on("click", '#non', function() { //즐겨찾기
		
		var bno = $(this).attr('value');
			if(confirm("삭제하시겠습니까?")){
			favDel(bno);
			}else{
				return false;
			}
		})
	
	
	
	function favDel(bno){ 	// 관심인재 삭제
		
		$.getJSON("/companyAjax/favorDeleteRestart/"+bno+"", function(data){
		var str = "";
			
			$(data).each(
					function() {
					});
			
		})
		
		alert("삭제됐습니다.");
		favList();
	}
	
	function favList(){
		$.getJSON("/companyAjax/favorList/", function(data){
		var str = "";
		
		$(data).each(function(){
			
			str += "<tr><td class=text-right style=vertical-align:middle><img src=/resources/rpjt/img/on.png id=non value="+this.bno+"></td>"
				+ "<td class=text-center style=vertical-align:middle><strong>"+this.name+"</strong><br><span>1991년, 28세</span></td>"
				+ "<td><span class=careerLine>경력 3년 5개월</span><a target=_blank href=>"+this.title+"</a>"
				+ "<div><div></div><div>"+this.schoolname+""+this.marjor+"</div></div>"
				+ "<p>"+this.rgbid+""+this.salary+"</p>"
				+ "<div><a>핵심역량 마케팅전략 기획</a></div></td><td class=text-center style=vertical-align:middle>1분전</td></tr>"
			
			
		});
		
		$("#favList").html(str);
		
		
		
		})
		
		
	}
</script>

<style>

.gobox1{
	width: 740px; 
	padding: 0 0 15px 0; margin: 0;
}
.gobox2{
	border: 1px solid #c1d1f2; 
	background-color: #f4f9ff; 
	padding: 13px 0 8px 12px;
}
</style>

<%@include file="../include/cfooter.jsp"%>
