<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9">
	<p class="lead"><strong>관심인재</strong></p>
			
<!-- 문> 반응형 안 먹어서 일단 주석처리  -->
<!-- 	<div class="gobox1">
		<div class="gobox2">
			<ul>
				<li>관심 인재로 등록한 이력서는 최초 관심 등록일로부터 30일간 보관됩니다.</li>
				<li>진행중 공고는 <b> 최대 5개까지 동시 게재</b>가능하며, 5개 초과 등록 시, 대기중 상태가 됩니다.</li> <br> 
				<li>공고를 등록하신 회원님께<b>공고 기반 추천 인재 서비스를 무료</b>로 제공합니다. </li>
				<li>서류접수가 완료되면 합격/불합격 여부를 떠나 지원자에게 서류발표 여부를 알려주세요. (서류 결과 발표 버튼 클릭)</li><br>
				<br>※ 사람인 채용정보 등록 규정상 부적합한 공고로 판별된 경우, 별도 통보 없이 공고가 마감/삭제 처리될 수 있습니다.
			</ul>
		</div>
	</div> -->

	<table class="table table-bordered">
		<tr class="active">
			<th style="width: 5%;" class="text-center"></th>
			<th style="width: 20%;" class="text-center">이름</th>
			<th class="text-center">이력서 요약</th>
			<th style="width: 15%;" class="text-center">업데이트일</th>
		</tr>
	
		<tbody id="favList">
		
		</tbody>
	</table>
	
	<div class="text-center">
		<ul class="pagination" id="listPage">
		
		</ul>
	</div>
	

	<!-- //기업 페이지 -->
	<table class="table table-bordered">
		<tr class="active gobox2">
		<td style="line-height: 200%">

			<ul style="list-style-type : circle">
				<li><small>관심인재 서비스는 <b style="color:#7F0000">해당 인재의 스크랩한 이력서</b>를 보여주는 것입니다.</small></li>  
				<li><small>공고를 등록하신 회원님께 <b style="color:#7F0000">공고 기반 추천 인재 서비스를 무료</b>로 제공합니다. </small></li>
				<li><small><b style="color:#7F0000">최초 개인정보 수집한 목적이 달성되면</b> <r>지체 없이 파기</r>하여야 합니다.</small></li>
				<li><small>채용이 아닌 영업이나 마케팅 등으로 이용하실 경우, 정보통신망법 제71조 3에 의거 <b style="color:#7F0000">5년 이하징역 또는 5,000만원 이하의 벌금</b>에 처해질 수 있습니다.</small></li>
				<br>
				<font style="font-size:15px">※ RecruIT 규정상 부적합한 공고로 판별된 경우, <b style="font-size:15px; color:#7F0000">별도 통보 없이 공고가 마감/삭제 처리될 수 있습니다.</b></font>
			</ul>
		</td>
		</tr>
</table>

</div>


<script>
$(document).ready(function(){
	
	var pN = 1;
	
	favList(pN);

	
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
	
	function favList(pN){
		
		
		$.getJSON("/companyAjax/favorList/", function(data){
		
			var str = "";
		
			var chr = "";
		
			var length = data.length;
			
			var i = 0;
			
			var pN = pN
			
		$(data).each(function(){
			
			i++;
			
			if(i < length){
				
			str += "<tr><td class=text-right style=vertical-align:middle><img src=/resources/rpjt/img/on.png id=non value="+this.bno+"></td>"
				+ "<td class=text-center style=vertical-align:middle><strong>"+this.name+"</strong><br></td>"
				+ "<td>"
				if(this.career == "신입"){
					str += "<span class=careerLine>"+this.career+"</span>"
				}else if(this.career == "선택"){
					str += "</span>"
				}
				else{
					str += "<span class=careerLine> 경력 "+this.career+"</span>"
				}
				
				str += "<a id=btt class=C_readAPR href=/personal/detail_nonavi?bno="+this.bno+">"
				+ ""+this.title+"</a>"
				+ "<br><p>"+"학력: "+this.edu+" </p>"
				+ "<p>"+"희망 근무지 : "+this.rgbid+"("+this.rgsid+")</p>"
				+ "<p>"+"희망연봉: "+this.salary+"</p>"
				+ "<p>희망직종: "+this.jobgroup1+"("+this.jobgroup2+")</p></td><td class=text-center style=vertical-align:middle>"
				
				if(this.days==0){
					if(this.todays.substr(0,1)==0 && this.todays.substr(1,1)!=0){
						
						str	+=	""+this.todays.substr(1,1)+"시간"+this.todays.substr(2,2)+"분</td></tr>"
					
					}if(this.todays.substr(0,2)>=10){
						
						str	+=	""+this.todays.substr(0,2)+"시간"+this.todays.substr(2,2)+"분</td></tr>"
					
					}
					else if(this.todays.substr(0,2)==00 && this.todays.substr(2,2)!=00){
						
						str	+=	""+this.todays.substr(2,2)+"분</td></tr>"
					
					}
					else{
					
						str +="방금전</td></tr>"
					
					}
					
				}else{
				
					str +=""+this.days+"일</td></tr>"
					
				}
			}else{
				
					if(this.prev){
					chr += "<li><a id=favorListBack name=all value="+this.startPage+">&laquo;</a></li>";
				}
				
				for(var z = this.startPage; z<=this.endPage; z++){
					chr += "<li id=favorListLi name="+z+"><a id=favorList name=all>"+z+"</a></li>"
					
				} 
			 	if(this.next&&this.endPage>0){
					chr += "<li><a id=faovrListExtend value="+this.endPage+" name=all>&raquo;</a></li>";
				} 
			}
			
			
		});
		
		$("#favList").html(str);

		$("#listPage").html(chr);
		
		$("#favorListLi").prop("name",pN).addClass("active");
		
		})
		
		
	}
	
	
	$(document).on("click","#btt",function(){
		window.open(this.href, '', 'width=800, height=960'); 
		
		return false;
	})
	
</script>

<!-- 문> 여기 있던 style은 include의 cheader에 따로 넣어 놨음  -->

<%@include file="../include/cfooter.jsp"%>