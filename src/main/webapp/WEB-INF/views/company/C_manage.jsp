<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!-- JSTL 사용하기 위한 Script -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!-- JSTL 사용하기 위한 Script -->
<%@include file="../include/cheader.jsp"%> 
<!-- Header Include -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 
<!-- Handlebars 사용하기 위한 ScriFpt -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css"> 
<!-- SELECT 검색 기능 추가 플러그인 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script> 
<!-- SELECT 검색 기능 추가 플러그인 -->
	
<script> /* 공통 변수용 스크립트문 */

on = "/resources/rpjt/img/on.png";
/* 인재 스크랩 on 이미지 경로 */

none = "/resources/rpjt/img/non.png"; 
/* 인재 스크랩 none 이미지 경로 */

</script>

<div class="col-md-9">

	<p class="lead">
		<h2>채용공고관리</h2>
	</p>

	<nav class="navbar navbar-default" style="margin-bottom: 0px; border: 1px solid #dce1eb; border-bottom: 2px solid #c0c6d3;">
		<div class="navbar-header">
			<ul class="nav navbar-nav">
				<li id="btnsState" name="SearchReset" class="active text-center"><a id="btns" style="cursor:pointer; width:80px">전체</a></li>
			</ul>
		</div>
			
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li id="btnsState"><a id="btns" style="cursor:pointer;">진행중</a></li>
				<li id="btnsState"><a id="btns" style="cursor:pointer;">마감</a></li>
			</ul>
				
			<div class="input-group" >
				<div class="input-group-btn" style="vertical-align:middle;"  >
					<select class="selectpicker" name="searchType" data-width="100px">
						<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>공고제목</option>
					</select>
				</div>
				
				<input type="text" class="form-control" name='keyword' id="keywordInput" placeholder="검색어를 입력해주세요." value='${cri.keyword }'> 
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" id="searchBtn"><span class="glyphicon glyphicon-search"></span></button>
					</span>
					
				<select class="selectpicker" id="perPageNum" data-width="60px">
					<option value="5" selected>5개씩보기</option>
					<option value="10">10개씩보기</option>
					<option value="20">20개씩보기</option>
				</select>
			</div>
		</div>
	</nav>
	
	<nav class="nav navbar-nav navbar-right" style="margin-bottom: 15px; padding-right: 30px; !important; ">
		<div class="container-fluid" style="padding-bottom: 1px; padding-top: 1px;">
			<small id="viewOrder" style="cursor:pointer">조회수순</small><span name="orders" id="viewIcon" class=""></span> | <small id="appOrder" style="cursor:pointer">지원자수</small><span name="orders" id="appIcon" class=""></span> | <small id="endOrder" style="cursor:pointer">마감일순</small><span name="orders" id="endIcon" class=""></span>
		</div>
	</nav>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th class="text-center active" style="padding:0px 0px 0px 0px; vertical-align:middle;">상태</th>
				<th class="text-center active" style="padding:0px 0px 0px 0px; vertical-align:middle;">모집 내용</th>
				<th class="text-center active" style="padding:0px 0px 0px 0px; vertical-align:middle;">공고 관리</th>
				<th class="text-center active" style="padding:0px 0px 0px 0px; vertical-align:middle;">지원자 관리</th>
				<th class="text-center active" style="padding:0px 0px 0px 0px; vertical-align:middle;">조회수</th>
				<th class="text-center active" style="padding:0px 0px 0px 0px; vertical-align:middle;">숨기기</th>
			</tr>
		</thead>
		
		<tbody id="recruitLists">
		
		</tbody>
	</table>
	
	<div class="text-center" id="noStrs">
		<ul class="pagination" id="listPage">
		</ul>
	</div>

	<table class="table table-bordered">
		<tr class="active gobox2">
			<td style="line-height: 200%">
				<ul style="list-style-type: circle">
					<li><small>숨김상태 공고는 구직자에게 공개가 되지 않으며 <b style="color:#7F0000">예정 종료일에 자동으로 모집완료 상태로 변경</b>됩니다.</small></li>
					<li><small>공고를 등록하신 회원님께<b style="color:#7F0000">공고 기반 추천 인재 서비스를 무료</b>로 제공합니다.</small></li>
					<li><small>서류접수가 완료되면 합격/불합격 여부를 떠나 지원자에게 서류발표 여부를 알려주세요.</small></li>
					<li><small><b style="color:#7F0000">최초 개인정보 수집한 목적이 달성되면</b> <r>지체 없이 파기</r>하여야 합니다.</small></li>
					<li><small>채용이 아닌 영업이나 마케팅 등으로 이용하실 경우, 정보통신망법 제71조 3에 의거 <b style="color:#7F0000">5년 이하 징역 또는 5,000만원 이하의 벌금</b>에 처해질 수 있습니다.</small></li>				
					<font style="font-size:15px">※ RecruIT 규정상 부적합한 공고로 판별된 경우, <b style="font-size:15px; color:#7F0000">별도 통보 없이 공고가 마감/삭제</b></font> 처리될 수 있습니다.</font>
				</ul>
			</td>
		</tr>
	</table>
	
	<c:forEach items="${FavorCompareList}" var="FavorCompareListVO">
		<input type="hidden" name="CompareList" value="${FavorCompareListVO.presume}">
	</c:forEach>

	
		<div id="myModal" class="modal fade" role="dialog">
 	 <div class="modal-dialog modal-lg" >
	   <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" name="offLoad" id="off" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">지원자 리스트</h4>
        </div>
        <div class="modal-body">
    
      <div class="collapse navbar-collapse">
				<div class="input-group">
					<div class="input-group-btn" style="vertical-align:middle;">
						<select class="selectpicker" name="pSearchType">
							<option value="n"
							<c:out value="${cri.pSearchType eq 'n'?'selected':''}"/>>
							지원자이름</option>
							<option value="j"
							<c:out value="${cri.pSearchType eq 'j'?'selected':''}"/>>
							전화번호</option>
							<option value="e"
							<c:out value="${cri.pSearchType eq 'e'?'selected':''}"/>>
							이메일</option>
						</select>
					</div>
					<input type="text" class="form-control" name='pKeyword' id="pKeywordInput" placeholder="Search for..." value='${cri.pKeyword}'/><span class="input-group-btn">
						<button class="btn btn-default" type="button" id="pSearchBtn">검색하기</button>
					</span>
				</div>			
				<!-- /.navbar-collapse -->
			</div>
					
          <table class="table table-striped" >
         	 <thead class=active>
		<tr class=active>
			<th class="text-center" style="width:5%"><input type="hidden" id="s_rcnoval" value=""></th>
        	<th class="text-center" style="width:15%">이름</th>
      		<th class="text-center" style="width:65%">이력서 요약</th>
		</tr>
          </thead>	
          <tbody id="appList">
          </tbody>
          </table>
          
          <div id="noApplyList">
          </div>
        </div>
        
          <div class="text-center">
			<ul class="pagination" id="applyListPage">
			</ul>
		</div>
        <div class="modal-footer">
          
          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        </div>
      	</div> 
       </div>
    </div>
</div>
<!-- //기업 채용공고 목록 끝 -->
<script>
$("#perPageNum").change(function(){	// 몇개 씩 보기 눌렀을 때 작동하는 스크립트
		
	var orderType = $("small[name=states]").attr('value'); /* 조회수 순  */
	var perPageNum = $("#perPageNum option:selected").val();  /* 몇개씩 보기  */
	var pN = 1;	/*  */
	var state = $("#btnsState[class^=active]").text();	/*  */
	var searchType = $("select option:selected").val();	/*  */
	var keyword = $('#keywordInput').val();	/*  */

	RecruitList(pN, state, perPageNum, searchType, keyword, orderType);

})

$(document).on("click","#btnsState", function(){
	
	$("li").removeClass();
	$(this).addClass("active");
	
})
</script>

<script>

$("#viewOrder").on("click", function(){
	$("#appIcon").removeClass();
	$("#endIcon").removeClass();
	$("small[name=states]").attr("value","");
	$("small[name=states]").css("font-weight","");
	$("small[name=states]").attr("name","");
	
	if($("#viewIcon").attr('class')=="glyphicon glyphicon-triangle-bottom"){
		$("#viewIcon").removeClass();
		$("#viewOrder").attr("name","states");
		$("#viewOrder").css("font-weight","bold");
		$("#viewIcon").addClass("glyphicon glyphicon-triangle-top");
		$("#viewOrder").attr("value","viewTop");
		
		var orderType = $("#viewOrder").attr("value");
		check(orderType); 
		
	}else{
		$("#viewIcon").removeClass();
		$("#viewIcon").addClass("glyphicon glyphicon-triangle-bottom");
		$("#viewOrder").css("font-weight","bold");
		$("#viewOrder").attr("value","viewBottom");
		$("#viewOrder").attr("name","states");
			
		var orderType = $("#viewOrder").attr("value");
		
		check(orderType); 
	}
})
$("#appOrder").on("click", function(){
	
	$("#viewIcon").removeClass();
	$("#endIcon").removeClass();
	$("small[name=states]").attr("value","");
	$("small[name=states]").css("font-weight","");
	$("small[name=states]").attr("name","");
	
	if($("#appIcon").attr('class')=="glyphicon glyphicon-triangle-bottom"){
		$("#appIcon").removeClass();
		$("#appOrder").css("font-weight","bold");
		$("#appOrder").attr("name","states");
		$("#appIcon").addClass("glyphicon glyphicon-triangle-top");
		$("#appOrder").attr("value","appTop");
		
		var orderType = $("#appOrder").attr("value");	
		check(orderType); 
		
	}else{
		$("#appIcon").removeClass();
		$("#appIcon").addClass("glyphicon glyphicon-triangle-bottom");
		$("#appOrder").css("font-weight","bold");
		$("#appOrder").attr("value","appBottom");
		$("#appOrder").attr("name","states");
			
		var orderType = $("#appOrder").attr("value");
	
		check(orderType); 
	}
})
$("#endOrder").on("click", function(){
	$("#viewIcon").removeClass();
	$("#appIcon").removeClass();
	$("small[name=states]").attr("value","");
	$("small[name=states]").css("font-weight","");
	$("small[name=states]").attr("name","");
if($("#endIcon").attr('class')=="glyphicon glyphicon-triangle-bottom"){
	
	$("#endIcon").removeClass();
	$("#endOrder").css("font-weight","bold");
	$("#endOrder").attr("name","states");
	$("#endIcon").addClass("glyphicon glyphicon-triangle-top");
	$("#endOrder").attr("value","endTop");
	
	var orderType = $("#endOrder").attr("value");
	
	check(orderType); 
}else{
	$("#endIcon").removeClass();
	$("#appOrder").css("font-weight","")
	$("#endOrder").css("font-weight","bold")
	$("#endIcon").addClass("glyphicon glyphicon-triangle-bottom");
	$("#endOrder").attr("value","endBottom");
	$("#endOrder").attr("name","states");
	
	var orderType = $("#endOrder").attr("value");
	
	check(orderType); 
}
})
</script>

<script>
 $("#keywordInput").keypress(function (e) { /* input text에서 enter 누르면 trigger 발동 */
        if (e.which == 13){
        	
        	$('#searchBtn').trigger('click');
        }
    });
 
 $("#pKeywordInput").keypress(function (e) { /* input text에서 enter 누르면 trigger 발동 */
        if (e.which == 13){
        	
        	$('#pSearchBtn').trigger('click');
        }
    });
</script>
<script>
 function check(orderType){
		var pN = 1;
		var state = $("#btnsState[class^=active]").text();
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();
			
		RecruitList(pN, state, perPageNum, searchType, keyword, orderType);
}
</script>

<script>

$(document).on("click","span[role='state']",function(){
	
	var state = $(this).attr("id");
	var bno = $(this).attr("value");
	var hide =  $(this).attr("id");
	$.ajax({
		type:'GET',
		url: '/companyAjax/changeState/'+bno+'/'+state,
		dataType: 'Int',
		
			success : function() {
			}	
	}) 
	
	$("small").css("font-weight","");	
	$("span[name='orders']").removeClass();
	
	 var state = $("#btnsState[class^=active]").text();
	
	var pN = 1;
	var searchType = $("select option:selected").val();
	var keyword = $('#keywordInput').val();
	var perPageNum = $("#perPageNum option:selected").val();
	var orderType = $("#appIcon").attr("value");
	
	if(hide==1){
		alert("공고가 비공개 됐습니다.")
	}else{
		alert("공고가 공개 됐습니다.")
	}
	RecruitList(pN, state, perPageNum, searchType, keyword, orderType);
})
</script>
<script>
$(document).on("click",'#recruitList',function(){ /* 전체 페이징 이동 */
	
		var orderType = $("small[name=states]").attr('value');
		var state = $("#btnsState[class^=active]").text();
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();  
		var pN = $(this).html();
		
		RecruitList(pN, state, perPageNum, searchType, keyword, orderType);		
		
	})
$(document).on("click",'#recruitListExtend',function(){ /* 다음 리스트로 넘어가는 페이징 */
	
		var one = "1";
		
		var orderType = $("small[name=states]").attr('value');
		var state = $("#btnsState[class^=active]").text();
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();  
		
	
		var cn = $(this).attr('value');	
		var pN = Number(cn) + Number(one);
		
		RecruitList(pN, state, perPageNum, searchType, keyword, orderType);
})
$(document).on("click",'#recruitListBack',function(){
	
		var one = "1";
		
		var orderType = $("small[name=states]").attr('value');
		var state = $("#btnsState[class^=active]").text();
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();  
	
		var cn = $(this).attr('value');	
		var pN = Number(cn) - Number(one);
		
		RecruitList(pN, state, perPageNum, searchType, keyword, orderType);
})
$(document).ready(function(){
		var perPageNum = $("#perPageNum option:selected").val();  
	  var pN = 1;
	  var state = "전체";
	RecruitList(pN, state, perPageNum);
	
	$(document).on("click",'#btns',function(){ /* 전체, 진행중, 마감용 상단 버튼 */
		
		$("span[name='orders']").removeClass();   /* 조회순 지원자순 마감일순 초기화 */
		$("small[name=states]").attr("value","");
		$("small[name=states]").css("font-weight","");
		$("small[name=states]").attr("name","");
		
		
		if($(this).text()=="전체"){
			var pN = 1;
			var searchType = $("select option:selected").val();
			var keyword = $('#keywordInput').val();
			var perPageNum = $("#perPageNum option:selected").val();
			var state = "전체";
			
			RecruitList(pN, state, perPageNum, searchType, keyword);
				
		}else if($(this).text()=="진행중"){
			var pN = 1;
			var searchType = $("select option:selected").val();
			var keyword = $('#keywordInput').val();
			var perPageNum = $("#perPageNum option:selected").val();
			var state = "진행중";
		      
			RecruitList(pN, state, perPageNum, searchType, keyword);
		
		}else{
			var pN = 1;
			var searchType = $("select option:selected").val();
			var keyword = $('#keywordInput').val();
			var perPageNum = $("#perPageNum option:selected").val();
			var state = "마감";
		      
			RecruitList(pN, state, perPageNum, searchType, keyword);
		}
	})
})
var formObj = $("form[role='form']");
		
	$(document).on("click", '#delete',function(){
		var bno = $(this).attr('value');
		if(confirm("정말 삭제하시겠습니까?")){
		self.location = "/company/C_recruitRemove?bno="+bno+"";
		}else{
			return false;
		}
		/* formObj.attr("method", "get");		
		formObj.submit(); */
	});
	$(document).on("click", '#modify',function(){
		
		  var bno = $(this).attr('value');
		  
		  var text = $(this).html();
		  
		 
		  if(text == "수정"){
			  self.location = "/company/C_recruitModify?bno="+bno+"";
		  }else{
			  var day = prompt("연장일을 숫자로만 입력해주세요.");
			  if (day != null){
					 
					$.ajax({
						type:'POST',
						url:'/companyAjax/reRegister/'+bno+'/'+day,
						headers: { 
						      "Content-Type": "application/json; ",
						      "X-HTTP-Method-Override": "POST" },
						data:JSON.stringify(), 
						success : function(result) {
							
							var orderType = $("small[name=states]").attr('value');
							
							var perPageNum = $("#perPageNum option:selected").val();  
							var pN = $("#recruitListLi[class^=active]").attr("name");
							var state = $("#btnsState[class^=active]").text();
							var searchType = $("select option:selected").val();
							var keyword = $('#keywordInput').val();

							RecruitList(pN, state, perPageNum, searchType, keyword, orderType);
						}	
				 }); 
			  }
		  }
	});
	
	var result = '${msg}';
	if (result == 'MODISUCCESS') {
		alert("수정이 완료됐습니다.");
	}else if(result == 'DELESUCCESS'){
		alert("삭제가 완료됐습니다.");
	}
	
		$('#searchBtn').on("click",function(event) {
		$("small").css("font-weight","");	
		$("span[name='orders']").removeClass();
		 $("#btnsState[class^=active]").removeClass();
		 $("#btnsState[name='SearchReset']").addClass("active");
		 var state = $("#btnsState[class^=active]").text();
		var pN = 1;
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();
		var orderType = $("#appIcon").attr("value");
		RecruitList(pN, state, perPageNum, searchType, keyword, orderType)
		
		});

		function RecruitList(pN, state, perPageNum, searchType,keyword, orderType){
		
		$("#recruitLists > *").remove();
		
		var array = [];
		
		for(var p = 0; p<arguments.length; p++){
		array[p] = arguments[p];
		}	
		
		  $.ajax({
				type:'POST',
				url:'/companyAjax/recruitList/',
				headers: { 
				      "Content-Type": "application/json; ",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'json', 
				data:JSON.stringify(array), 
				success : function(data) {
					
					
					var str = "";	
					var chr = "";
					var noStr = "";
					var length = data.length;
					var i = 0;
					var item;
					
					$(data).each(function(){
						i++;
					
						if(i < length){
							
							var item = {
									recruitstate : this.recruitstate,
									bno : this.bno, 
									title : this.title,
									state : this.state,
									btnstate : this.btnstate,
									applynum : this.applynum,
									viewcnt : this.viewcnt,
									qcnt : this.qcnt,	
									period : this.period,
									periodstart : this.periodstart
							};
							
							createTemplate(item);
							
									
								
							}else{
								
			 					if(this.prev){
									chr += "<li><a id=recruitListBack name=all value="+this.startPage+">&laquo;</a></li>";
								}
								
								for(var z = this.startPage; z<=this.endPage; z++){
									chr += "<li id=recruitListLi name="+z+"><a id=recruitList name=all>"+z+"</a></li>"
									
								} 
							 	if(this.next&&this.endPage>0){
									chr += "<li><a id=recruitListExtend value="+this.endPage+" name=all>&raquo;</a></li>";
								} 
			 				}
						if(length == 1){
							
							noStr += "<br><br><br><br><h2>공고가 없습니다</h2><br><br><br><br>"
						
						}
					});			
					
					
					 $("#noStrs").html(noStr); 
					 
			 
					 $("#noStrs").addClass("text-center");
				
					 $("#listPage").html(chr); 
						
					 $("li[name="+pN+"]").addClass("active");
					 
				     var spanLen = $("span[name='stateName']").length;
					 
				    var onloadLen = $("button[name='onLoad']").length;
				     
				     
					for(var i= 0; i<spanLen; i++){
						 
						$("span[name='stateName']").eq(i).addClass("center-block clearfix");
						$("span[name='stateName']").eq(i).addClass("badge");
						$("span[name='hide1']").eq(i).addClass("glyphicon glyphicon-eye-open");
						
						$("span[name='hide0']").eq(i).addClass("glyphicon glyphicon-lock");
						
						$("button[name='endRecruit']").eq(i).addClass("btn btn-warning");
						
						$("span[name='endSpan']").eq(i).addClass("glyphicon glyphicon-ban-circle");
						
						$("span[name='qIcons']").eq(i).addClass("glyphicon glyphicon-comment");
						
						 if($("span[name='stateName']").eq(i).html() == "모집중"){
							
							$("span[name='stateName']").eq(i).css("background-color","#3AA0D9");
						
						 }else if($("span[name='stateName']").eq(i).html() == "숨김상태"){
							 
							$("span[name='stateName']").eq(i).css("background-color","#400000");
							 
						 }
						 
					 }
					
					$(function () {
						  $('[data-toggle="tooltip"]').tooltip('show')
						})

					 
					 
				}	
				      
				      
		 
		 }); 
		  
	}
	
	$(document).on("click","#nw",function(){

		window.open(this.href, '', 'width=1100, height=960'); 
		
		return false;
			
	})
</script>
	
<script>
function createTemplate(item){
    
    	var source_tel = $("#template_recruitList").html();
		var template = Handlebars.compile(source_tel);
		$("#recruitLists").append(template(item));
}
</script>
	
 <script id="template_recruitList" type="text/x-handlebars-template">
	<tr>
		<td rowspan=1 class="text-center" style="vertical-align:middle;">
			{{#State}}
				{{state}}{{recruitstate}}
			{{/State}}
		</td>

		<td class="text-center" style="vertical-align:middle;">
			<a id=nw href=C_recruitMent?recruitNum={{bno}} target=_blank>{{title}}</a>
			{{#qIcon}}
				{{state}}{{bno}}
			{{/qIcon}}	
			<br>
			({{periodstart}}{{period}})
		</td>
	
		<td class="text-center" style="vertical-align:middle;">
			<button style="vertical-align: middle" class="btn btn-success" type=button id=modify value="{{bno}}">{{btnstate}}</button>
			<button style="vertical-align: middle" class="btn btn-danger" type=button id=delete value="{{bno}}"><span class="glyphicon glyphicon-trash"></span>삭제</button>
			{{#btnState}}
				{{btnstate}}
			{{/btnState}}
		</td>

		<td class="text-center" style="vertical-align:middle;">
			<button class="btn btn-default" style="width:100%" name="onLoad"; id="{{bno}}" value="{{bno}}" data-toggle=modal data-target=#myModal>지원자보기 [{{applynum}}명]</button>
		</td>
		
		<td class="text-center" style="vertical-align:middle;">
			{{viewcnt}}
		</td>

		<td class="text-center" style="vertical-align:middle;">
			{{#hide}}
				{{state}}{{bno}}
			{{/hide}}
		</td>
	</tr>
</script> 

<script type="text/javascript">
        Handlebars.registerHelper("State", function(option) {
        	if(this.state == 1){
				return "<span style=vertical-align:middle name=stateName>"+this.recruitstate+"</span>";
			}else if(this.state == 0){
				return "<span style=vertical-align: middle name=stateName>숨김상태</span>";
			}
        });
        
        Handlebars.registerHelper("btnState", function(option) {
        	if(this.btnstate=="수정"){
        		return "<button id=endRecruit name=endRecruit value="+this.bno+"><span name=endSpan></span>모집완료</button>"
        	}
        });
        
        Handlebars.registerHelper("hide", function(option) {
        	if(this.state == 1){
					return "<span role=state name=hide1 style=cursor:pointer id="+this.state+" value="+this.bno+"></span>";
			}else if(this.state == 0){
					return "<span role=state name=hide0 style=cursor:pointer id="+this.state+" value="+this.bno+"></span>";
			}
        });
        
 		Handlebars.registerHelper("qIcon", function(option) {
        	if(this.qcnt != null){
					return "<span name=qIcons value="+this.bno+" style=font-size:20px;cursor:pointer  data-toggle=tooltip data-placement=top title=질문사항이있습니다></span>";
			}else{
			}
        });
</script>
	
<script> 
$(document).on("click","#endRecruit", function(){
	
	var bno = $(this).val();
	endFunction(bno);
})

$(document).on("click","span[name='qIcons']",function(){
	
	var bno = $(this).attr("value");
	
	window.open('C_recruitMent?recruitNum='+bno+'#questionCall', '', 'width=1100, height=960')
	
})


function endFunction(bno){ /* 공고 마감 버튼 */
	
	if(confirm("공고를 마감하시겠습니까?")){
		$.ajax({
			type:'POST',
			url:'/companyAjax/endRecruit/'+bno,
			headers: { 
			      "Content-Type": "application/json; ",
			      "X-HTTP-Method-Override": "POST" },
			data:JSON.stringify(), 
			success : function(result) {
				
				var orderType = $("small[name=states]").attr('value');
				
				var perPageNum = $("#perPageNum option:selected").val();  
				var pN = $("#recruitListLi[class^=active]").attr("name");
				var state = $("#btnsState[class^=active]").text();
				var searchType = $("select option:selected").val();
				var keyword = $('#keywordInput').val();

				RecruitList(pN, state, perPageNum, searchType, keyword, orderType);
			}	
	 }); 
	}else{
		return false;
	}	
}
</script>
<script> /* 모달용 스크립트 */
$(document).on("click", "button[name=onLoad]", function() {

	 var bno = $(this).val();
	 var pN = 1;
	 
	 $("#pKeywordInput").prop("value","");
	
	 PersonList(bno, pN);
	 //소연
	 $("#s_rcnoval").val(bno);
})

function PersonList(bno, pN, pSearchType, pKeyword){
	
	$("#pSearchBtn").attr("value",bno);
	
	var pArray = [];
	var pN = pN;

	for(var pA = 0; pA<arguments.length; pA++){
		pArray[pA] = arguments[pA];
	}
	
	$.getJSON("/companyAjax/applyList/" + pArray, function(data) {
		
		var str = "";
		var chr = "";
		var noStr = "";
		var i = 0;
		var comparison = [];
		var length = data.length;
	
		$(data).each(function() {
			i++;
			
		 	if(i < length){
				str += "<tr><td class=text-center style=vertical-align:middle><img src=/resources/rpjt/img/non.png id=non name=favBtns value="+this.bno+"></td>"
				+ "<td class=text-center style=vertical-align:middle><strong>"+this.name+"</strong><br></td>"
				+ "<td><span class=careerLine>"+this.career+"</span><a id=btt class="+this.bno+" href=/personal/detail_nonavi?bno="+this.bno+">"
				+ ""+this.title+"</a>"
				+ "<p>"+"학력: "+this.edu+"</p>"
				+ "<p>"+"희망 근무지 : "+this.rgbid+"("+this.rgsid+")</p>"
				+ "<p>"+"희망연봉: "+this.salary+"</p>"
				+ "<p>희망직종: "+this.jobgroup1+"("+this.jobgroup2+")</p></td></tr>"
				
				comparison.push(this.bno)
				
			 	}else{
					if(this.prev){
						chr += "<li><a id=applyFirstPage name=all value="+this.startPage+">&laquo;</a></li>";
					}
					for(var z = this.startPage; z<=this.endPage; z++){
						chr += "<li id=applyPage name="+z+"><a id=applyList name=all>"+z+"</a></li>"
					} 
				 	if(this.next&&this.endPage>0){
						chr += "<li><a id=applyLastPage value="+this.endPage+" name=all>&raquo;</a></li>";
					} 
				}
		});
		
		 if(length == 1){ /* 지원자 리스트가 없을 경우의 수 */
			
			if($("#pKeywordInput").val().length == 0){ /* 그냥 지원자 자체가 없을 때 */ 
				noStr += "<br><br><h3>지원한 인재가 아직 없습니다<h3>"
			}
			if($("#pKeywordInput").val().length > 0){ /* 검색 결과가 없을 때 */
				noStr += "<br><br><h3>검색결과가 없습니다<h3>"
			}
		 }
		
		if(noStr!=null){ /* 지원자 리스트 & 검색결과가 없을 때 문서객체 추가 */
			$("#noApplyList").html(noStr); 
			$("#noApplyList").addClass("text-center"); 
		}
	 	$("#appList").html(str);	   /* 지원자 리스트& 검색결과가 있을 경우 추가 */
	 	$("#applyListPage").html(chr); /* 지원자 리스트 페이지 네이션을 위해 추가 */
	 	$("#applyPage[name="+pN+"]").addClass("active"); /* 선택된 페이지에 색상 추가용 클래스 추가 */
	 	favorComparison(comparison) /* 지원한 지원자가 관심인재에 등록된지 확인하기 위한 함수 */
	})
}

$(document).on("click","#btt",function(){ /* 이력서 새창에 보기위해 지정하는 스크립트 */
	
	//소연	
	var rsno = $(this).attr("class");
	var rcno = $("#s_rcnoval").val();
	var userid = '<%=id%>';
	C_readAPR(rsno, rcno, userid);
	
	window.open(this.href, '', 'width=850, height=960'); 
	return false;
		
});

function C_readAPR(rsno, rcno, userid){
	
	$.ajax({
		type:'post',
		url:'/companyAjax/C_readAPR',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType:'text',
		data:JSON.stringify({
			rsno : rsno,//이거 바꾸고 ajax 생성
			rcno : rcno,
			userid : userid//열람하는 회사 아이디
		}),
		success:function(result){
			if(result=='SUCCESS'){
				console.log(result+"지원자의 이력서를 이미 열람했거나 방금 열람했다.");
			}else{
				console.log("result가 뭔가 이상함");
			}
		}//success end
 });//ajax end 
}
function favorComparison(comparison){ /* 스크랩할려는 인재가 이미 스크랩한 인재인지 검사하기위한 비교문 */
	
	var compare = document.getElementsByName('CompareList');
	var compareList = [];
	for(var i=0; i<compare.length; i++){
		
	compareList.push(compare[i].value);
	}
	
 	for(var i= 0; i<compareList.length; i++){
 		for(var j = 0; j<comparison.length; j++){
 			if(compareList[i] == comparison[j]){
 				$("img[value="+compareList[i]+"]").prop("src",on)
 			}
 		}
 	}
}
</script>

<script>

$(document).ready(function(){ /* 관심 인재 스크립하기 이벤트 */
	$(document).on("click", "img[name='favBtns']", function(){
		
		var id = "<%=id%>"
		var bno = $(this).attr('value');
		
		if($("img[value="+bno+"]").attr("src")==on){
			favDel(bno, id);
		}else if($("img[value="+bno+"]").attr("src")!=on){
			favAdd(bno, id);
		}
	})
})

function favAdd(bno, id){   // 관심 인재 등록
	$.getJSON("/companyAjax/favorAdd/"+bno+"/"+id, function(data) {
		var str = "";
		
		$(data).each(
			function() {
		});
	})
	$("img[value="+bno+"]").attr("src",on)
	alert("관심인재에 등록 됐습니다.")
}
function favDel(bno, id){ 	// 관심 인재 삭제
	
	$.getJSON("/companyAjax/favorDelete/"+bno+"/"+id, function(data){
	var str = "";
	
	$(data).each(
		function() {
		});
	})
	$("img[value="+bno+"]").attr("src",none)
	alert("관심인재에서 삭제 됐습니다.")
}

</script>

<script>
  	$(document).on("click","#pSearchBtn",function(){ /* 지원 인재 보기 - 검색창 */
  		var bno = $("#pSearchBtn").val();
  		var pKeyword = $("#pKeywordInput").val();
  		var pSearchType = $("select[name='pSearchType'] option:selected").val();
  		var pN = 1

  		PersonList(bno, pN, pKeyword,pSearchType);
  		 
  	});
  	$(document).on("click","#applyPage", function(){  /* 지원 인재 페이지 이동 */
  		
  		var bno = $("#pSearchBtn").val();
  		var pN = $(this).attr("name");
  		var pKeyword = $("#pKeywordInput").val();
  		var pSearchType = $("select[name='pSearchType'] option:selected").val();

  		PersonList(bno, pN, pKeyword,pSearchType);
  		
  	});
  	
  	
  	$(document).on("click","#applyFirstPage",function(){ /* 지원 인재 첫 페이지 이동 */
  		
  		var one = "1";
  		var bno = $("#pSearchBtn").val();
  		var cn = $(this).attr("name");
  		var pKeyword = $("#pKeywordInput").val();
  		var pSearchType = $("select[name='pSearchType'] option:selected").val();
  		var pN = Number(cn) - Number(one);

  		RecruitList(pN, state, perPageNum, searchType, keyword, orderType);
  	});
  	
  	
  	$(document).on("click","#applyLastPage",function(){ /* 지원 인재 마지막 페이지 이동  */
  		
  		var one = "1";
  		var bno = $("#pSearchBtn").val();
  		var cn = $(this).attr("name");
  		var pKeyword = $("#pKeywordInput").val();
  		var pSearchType = $("select[name='pSearchType'] option:selected").val();
  		var pN = Number(cn) + Number(one);

  		RecruitList(pN, state, perPageNum, searchType, keyword, orderType);
  	});
  	
	</script>

<%@include file="../include/cfooter.jsp"%>