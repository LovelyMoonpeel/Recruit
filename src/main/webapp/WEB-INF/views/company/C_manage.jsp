<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/cheader.jsp"%>
<%@ page import="java.util.Calendar"%>

<!-- 문> 반응형 카드를 위한 아래 두 줄  -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- 문> //반응형 카드를 위한 아래 두 줄 -->

<!-- Main content -->
<!-- 기업 채용공고 목록 -->
<div class="col-md-9">
	<p class="lead">
		<strong>채용공고관리</strong>
	</p>
	

	<!--소스  -->
	<nav class="navbar navbar-default" style="margin-bottom: 0px; border: 1px solid #dce1eb; border-bottom: 2px solid #c0c6d3;">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<ul class="nav navbar-nav">
					<li id="btnsState" name="SearchReset" class="active"><a id="btns">전체</a></li>
				</ul>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li id="btnsState"><a id="btns">진행중</a></li>
					<li id="btnsState"><a id="btns">마감</a></li>
				</ul>
				<div class="input-group" style="padding-top: 10px">
					<div class="input-group-btn" style="">
						<select class="form-control selectpciker" name="searchType" style="width: 120px">
							
							<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>공고제목</option>
							<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>담당자</option>
						</select>
					</div>
					<!-- /btn-group -->
					<input type="text" class="form-control" name='keyword' id="keywordInput" placeholder="Search for..." value='${cri.keyword }'> <span class="input-group-btn">
						<button class="btn btn-default" type="button" id="searchBtn">검색하기</button>
					</span>
					<ul class="nav navbar-nav navbar-right">
						<select class="form-control" id="perPageNum" style="width: 120px">
							<option value="5" selected>5개씩보기</option>
							<option value="10">10개씩보기</option>
							<option value="20">20개씩보기</option>
						</select>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
		
			<!-- /.container-fluid -->
	</nav>
	<nav class="navbar-default" style="margin-bottom: 15px;">
		<div class="container-fluid" style="padding-bottom: 1px; padding-top: 1px;">
			<!-- Brand and toggle get grouped for better mobile display -->
			<small id="viewOrder">조회수순</small><span name="orders" id="viewIcon" class=""></span> | <small id="appOrder">지원자수</small><span name="orders" id="appIcon" class=""></span> | <small id="endOrder">마감일순</small><span name="orders" id="endIcon" class=""></span>
			<!-- Collect the nav links, forms, and other content for toggling -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- 소스 -->
	

<!-- 		<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-4">
            <div class="card">
                <a class="img-card" href="http://www.fostrap.com/">
                    <img src="--------- YOUR IMAGE URL ----------" />
                </a>
                <br />
                <div class="card-content">
                    <h4 class="card-title">
                        <a href="http://www.fostrap.com/">
                            Your title card
                        </a>
                    </h4>
                    <div class="">
                       bkjhkjjh   </div>
                </div>
                <div class="card-read-more">
                    <a class="btn btn-link btn-block" href="http://www.fostrap.com/">
                        Read More
                    </a>
                </div>
            </div>
        </div>
    </div>
</div> -->
	
	<table class="table table-bordered">
		<thead>
			<tr>
				<th style="text-align: center" class="active">공고</th>
				<th style="text-align: center" class="active">모집 내용</th>
				<th style="text-align: center" class="active">공고 관리</th>
				<th style="text-align: center" class="active">지원자 관리</th>
				<th style="text-align: center" class="active">조회수</th>
			</tr>
		</thead>
		<tbody id="recruitList">
		</tbody>
	</table>
	<div class="text-center">
		<ul class="pagination" id="listPage">
		</ul>
	</div>
	<table class="table table-bordered">
		<tr class="active gobox2">
			<td style="line-height: 200%">
				<ul style="list-style-type: circle">
					<li>진행중 공고의 게재 기간은 <b>게재일(노출일)로부터 최대 90일</b>까지입니다. (상시, 채용시도 동일) <br>
					<li><b>최초 개인정보 수집한 목적이 달성되면</b> <r>지체 없이 파기</r>하여야 합니다.</li>
					<br>
					<li>채용이 아닌 <r>영업이나 마케팅 등으로 이용하실 경우,</r></li>
					<br>
					<li><r>정보통신망법 제71조 3에 의거 5년 이하 징역 또는 5,000만원 이하의 벌금에 처해질 수 있습니다.</r></li>
				</ul>
			</td>
		</tr>
	</table>
	<!-- 문> 반응형이 적용 안 되서 일단 주석처리
	<div style="width: 740px; padding: 0 0 15px 0; margin: 0;">
		<div style="border: 1px solid #c1d1f2; background-color: #f4f9ff; padding: 13px 0 8px 12px;">
			<ul>
				<li>진행중 공고의 게재 기간은  <b>게재일(노출일)로부터 최대 90일</b>까지입니다. (상시, 채용시도 동일) <br> 
				<li><b>최초 개인정보 수집한 목적이 달성되면</b> <r>지체 없이 파기</r>하여야 합니다.</li> <br>
				<li>채용이 아닌 <r>영업이나 마케팅 등으로 이용하실 경우,</r></li><br>
				<li><r>정보통신망법 제71조 3에 의거 5년 이하 징역 또는 5,000만원 이하의 벌금에 처해질 수 있습니다.</r></li>
			</ul>
		</div>
	</div> -->
	
		<div id="myModal" class="modal fade" role="dialog">
 	 <div class="modal-dialog modal-lg" >
	   <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" name="offLoad" id="off" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">지원자 리스트</h4>
        </div>
        <div class="modal-body">
         
         	 <table class="table table-striped" >
          <tr class=active>
          <th>이름</th>
          <th>이력서 요약</th>
          <th>업데이트일</th>
          </tr>
          <tbody id="recomList">
          
          </tbody>
          </table>
          
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
$("#perPageNum").change(function(){				// 몇개씩 보기 눌렀을 때 작동하는 스크립트
		
	var orderType = $("small[name=states]").attr('value');
		
	var perPageNum = $("#perPageNum option:selected").val();  
	var pN = 1;
	var btnsStates = $("#btnsState[class^=active]").text();
	var searchType = $("select option:selected").val();
	var keyword = $('#keywordInput').val();
	
	if(btnsStates == "전체"){
		RecruitList(pN, perPageNum, searchType, keyword, orderType);
	}else if(btnsStates == "진행중"){
		RecruitIngList(pN, perPageNum, searchType, keyword, orderType);
	}else{	
		RecruitEndList(pN, perPageNum, searchType, keyword, orderType);
	}
	
	
	
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
			 $("#keywordInput").keypress(function (e) {
			        if (e.which == 13){
			        	
			        	$('#searchBtn').trigger('click');
			        }
			    });
			</script>
<script>
 function check(orderType){
	
	
	if($("#btnsState[class^=active]").text()=="전체"){
		var pN = 1;
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();
	      
		
		RecruitList(pN, perPageNum, searchType, keyword, orderType);
			
	}else if($("#btnsState[class^=active]").text()=="진행중"){
		
		var pN = 1;
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();
	      
		RecruitIngList(pN, perPageNum, searchType, keyword, orderType);
	
		
	}else{
		
		var pN = 1;
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();
		
		RecruitEndList(pN, perPageNum, searchType, keyword, orderType);		
	}
	
}
</script>
<script>
$(document).on("click",'#recruitList',function(){ /* 전체 페이징 이동 */
	
		var orderType = $("small[name=states]").attr('value');
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();  
	
		if($(this).attr("name")=="all"){
		
			
		var pN = $(this).html();
		
		RecruitList(pN, perPageNum, searchType, keyword, orderType);		
		
		}else if($(this).attr("name")=="ing"){
		
		var pN = $(this).html();
		$(this).addClass("active");
		
		RecruitIngList(pN, perPageNum, searchType, keyword, orderType);		
			
		}else if($(this).attr("name")=="end"){
			
		var pN = $(this).html();
		$(this).addClass("active");
		
		RecruitEndList(pN, perPageNum, searchType, keyword, orderType);		
					
		}
		
	})
$(document).on("click",'#recruitListExtend',function(){ /* 다음 리스트로 넘어가는 페이징 */
	
		var one = "1";
		
		var orderType = $("small[name=states]").attr('value');
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();  
		
		if($(this).attr("name")=="all"){
			
			
		var cn = $(this).attr('value');	
		var pN = Number(cn) + Number(one);
		
		RecruitList(pN, perPageNum, searchType, keyword, orderType);
		
		}else if($(this).attr("name")=="ing"){
		
			var cn = $(this).attr('value');	
			var pN = Number(cn) + Number(one);
			RecruitIngList(pN, perPageNum, searchType, keyword, orderType);		
			
		}else if($(this).attr("name")=="end"){
			
			
			var cn = $(this).attr('value');	
			var pN = Number(cn) + Number(one);
			
			RecruitEndList(pN, perPageNum, searchType, keyword, orderType);		
					
		}
		
})
$(document).on("click",'#recruitListBack',function(){
	
	var one = "1";
		
		var orderType = $("small[name=states]").attr('value');
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();  
		
		if($(this).attr("name")=="all"){
			
		var cn = $(this).attr('value');	
		var pN = Number(cn) - Number(one);
		
		RecruitList(pN, perPageNum, searchType, keyword, orderType);
		
		}else if($(this).attr("name")=="ing"){
			
			var cn = $(this).attr('value');	
			var pN = Number(cn) - Number(one);
				
		RecruitIngList(pN, perPageNum, searchType, keyword, orderType);		
			
		}else{
			
		
			RecruitEndList(pN, perPageNum, searchType, keyword, orderType);		
					
		}
	
})
$(document).ready(function(){
		var perPageNum = $("#perPageNum option:selected").val();  
	  var pN = 1;
	RecruitList(pN, perPageNum);
	
	
	$(document).on("click",'#RecruitIngList',function(){
		
		var pN = $(this).html();
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();  
		
		RecruitIngList(pN, perPageNum, searchType, keyword);
		
	})
	$(document).on("click",'#RecruitEndList',function(){
		
		var pN = $(this).html();
		var searchType = $("select option:selected").val();
		var keyword = $('#keywordInput').val();
		var perPageNum = $("#perPageNum option:selected").val();  
		
		RecruitEndList(pN, perPageNum, searchType, keyword);
		
	})
	
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
			
			
			RecruitList(pN, perPageNum, searchType, keyword);
				
		}else if($(this).text()=="진행중"){
			var pN = 1;
			var searchType = $("select option:selected").val();
			var keyword = $('#keywordInput').val();
			var perPageNum = $("#perPageNum option:selected").val();
		      
			RecruitIngList(pN, perPageNum, searchType, keyword);
		
		
		}else{
			var pN = 1;
			var searchType = $("select option:selected").val();
			var keyword = $('#keywordInput').val();
			var perPageNum = $("#perPageNum option:selected").val();
			
			RecruitEndList(pN, perPageNum, searchType, keyword);
			
			
		}
		
	})
	
})
var formObj = $("form[role='form']");
		
		$(document).on("click", '#delete',function(){
			var bno = $(this).attr('value');
			/* formObj.attr("action", "/company/C_recruitRemove");  */
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
						 
					  alert("해당 공고가 재등록됐습니다.");
					  
					  self.location = "/company/C_recruitReregister?bno="+bno+"&day="+day+"";
				  
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
			var pN = 1;
			var searchType = $("select option:selected").val();
			var keyword = $('#keywordInput').val();
			var perPageNum = $("#perPageNum option:selected").val();
			var orderType = $("#appIcon").attr("value");
			RecruitList(pN, perPageNum, searchType, keyword, orderType)
			
 		});
 		
 
	
		
		function RecruitList(pN, perPageNum, searchType,keyword, orderType){
			
			
			
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
						var length = data.length;
						var i = 0;
						
						
						
						$(data).each(function(){
							i++;
							
							if(i < length){
								str += "<tr><th rowspan=2 ><span class=badge>"+this.recruitstate+"</span></th>"
								+ "<th><a id=nw href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
										+"<li>근무형태 : "+this.employstatusid+"</li>"
										+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
										+"<li>경력 : "+this.exp+"</li>"
										+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
										+"<th><button class=center-block clearfix type=button id=modify value="+this.bno+">"+this.btnstate+"</button><br><span id=spid></span><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
										+"<th><li>지원자수 : "+this.applynum+"</li><button name=onLoad id="+this.bno+" value="+this.bno+" data-toggle=modal data-target=#myModal>지원자보기</button></th><th>"+this.viewcnt+"</th></tr>"
										+"<tr><th>최근수정 : "+this.regdate+" (담당자:++)</th><th></th><th></th></tr>"
								}else{
									
				 					if(this.prev){
										chr += "<li><a id=recruitListBack name=all value="+this.startPage+">&laquo;</a></li>";
									}
									
									
									for(var z = this.startPage; z<=this.endPage; z++){
										chr += "<li name="+z+"><a id=recruitList name=all>"+z+"</a></li>"
										
									} 
								 	if(this.next&&this.endPage>0){
										chr += "<li><a id=recruitListExtend value="+this.endPage+" name=all>&raquo;</a></li>";
									} 
				 				}
			
						});			
						
						$("#recruitList").html(str);	
						$("#spid").addClass("glyphicon glyphicon-trash");
						 $("#listPage").html(chr); 
							
						 $("li[name="+pN+"]").addClass("active");
					}	
					      
					     
			 
			 }); 
			  
		}
		
		$(document).on("click","#nw",function(){

			window.open(this.href, '', 'width=1240, height=960'); 
			
			return false;
				
		})
		
		 function RecruitIngList(pN, perPageNum, searchType,keyword, orderType){
				
			 var array = [];
					
					for(var p = 0; p<arguments.length; p++){
					array[p] = arguments[p];
					}
					
					  $.ajax({
							type:'POST',
							url:'/companyAjax/ingRecruitList/',
							headers: { 
							      "Content-Type": "application/json; ",
							      "X-HTTP-Method-Override": "POST" },
							dataType:'json', 
							data:JSON.stringify(array), 
							success : function(data) {
								
								
								var str = "";	
								var chr = "";
								var length = data.length;
								var i = 0;
								
								
								
								$(data).each(function(){
									i++;
									
									if(i < length){
										str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
										+ "<th><a id=nw href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
												+"<li>근무형태 : "+this.employstatusid+"</li>"
												+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
												+"<li>경력 : "+this.exp+"</li>"
												+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
												+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
												+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
												+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
										}else{
											
											if(this.prev){
												chr += "<li><a id=recruitListBack name=ing value="+this.startPage+">&laquo;</a></li>";
											}
											
											
											for(var z = this.startPage; z<=this.endPage; z++){
												chr += "<li name="+z+"><a id=recruitList name=ing>"+z+"</a></li>"
												
											} 
										 	if(this.next&&this.endPage>0){
												chr += "<li><a id=recruitListExtend value="+this.endPage+" name=ing>&raquo;</a></li>";
											}
						 				}
					
								});			
							
								$("#recruitList").html(str);	
							
								 $("#listPage").html(chr); 
									 
								 $("li[name="+pN+"]").addClass("active");
							}	
							      
							     
					 
					 }); 
				}
		
		 function RecruitEndList(pN, perPageNum, searchType,keyword, orderType){
				
					var array = [];
					
					for(var p = 0; p<arguments.length; p++){
					array[p] = arguments[p];
					}
					
					  $.ajax({
							type:'POST',
							url:'/companyAjax/endRecruitList/',
							headers: { 
							      "Content-Type": "application/json; ",
							      "X-HTTP-Method-Override": "POST" },
							dataType:'json', 
							data:JSON.stringify(array), 
							success : function(data) {
								
								
								var str = "";	
								var chr = "";
								var length = data.length;
								var i = 0;
								
								
								
								$(data).each(function(){
									i++;
									
									if(i < length){
										str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
										+ "<th><a id=nw href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
												+"<li>근무형태 : "+this.employstatusid+"</li>"
												+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
												+"<li>경력 : "+this.exp+"</li>"
												+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
												+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
												+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
												+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
										}else{
											
											if(this.prev){
												chr += "<li><a id=recruitListBack name=end value="+this.startPage+">&laquo;</a></li>";
											}
											
											
											for(var z = this.startPage; z<=this.endPage; z++){
												chr += "<li name="+z+"><a id=recruitList name=end>"+z+"</a></li>"
												
											} 
										 	if(this.next&&this.endPage>0){
												chr += "<li><a id=recruitListExtend value="+this.endPage+" name=end>&raquo;</a></li>";
											}
						 				}
					
								});			
							
								$("#recruitList").html(str);	
							
								 $("#listPage").html(chr); 		 
								 
								 $("li[name="+pN+"]").addClass("active");
							}	
							      
							     
					 
					 }); 
				}
	</script>
	
	
	<script> /* 모달용 스크립트 */
$(document).on("click", "button[name=onLoad]", function() {
	
	
	
	 var bno = $(this).val();
	
	PersonList(bno);
	
	function PersonList(bno){
		
		
		$.getJSON("/companyAjax/personList/" + bno, function(data) {
			var str = "";
			var comparison = [];
			
			$(data).each(
					function() {
						
						str += "<tr><td><img src=/resources/rpjt/img/non.png id=r1 value="+this.bno+"></td><td>"+this.name+" * * </td><td><span class=careerLine>경력 3년 5개월</span>"
						+"<a class=C_readAPR href=/personal/detail_nonavi?bno="+this.bno+""
						+ " onClick=window.open(this.href, '', 'width=1000, height=960'); return false;>"
						+ ""+this.bno+":"+this.title+"</a><br>"+this.schoolname+""+this.major+"<br>"+this.rgbid+""+this.salary+"</td><td></td></tr>";		
						
						comparison.push(this.bno)
						
					});
			
			$("#recomList").html(str);
			
		
			favorComparison(comparison)
			
		})
		
		
		
	}
	
})
</script>
<%@include file="../include/cfooter.jsp"%>