<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/cheader.jsp"%>
<%@ page import ="java.util.Calendar" %>


<!-- Main content -->
<!-- 기업 채용공고 목록 -->
<div class="col-md-9">
	<h1>채용 공고 목록</h1>
<!--소스  -->

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" id="btns">전체</a>
    </div>



    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a id="btns">진행중</a></li>
        <li><a id="btns">마감</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">미완성 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="input-group">
     
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">공고제목 <span class="caret"></span></button>
        <ul class="dropdown-menu dropdown-menu-right" role="menu">
          <li><a href="#">담당자 이름</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="divider"></li>
          <li><a href="#">Separated link</a></li>
        </ul>
      </div><!-- /btn-group -->
       <input type="text" class="form-control" aria-label="...">
     
         </div><!-- /input-group -->
         <input type="submit" class="form-control aria-label="...">
      </form>
      <ul class="nav navbar-nav navbar-right">
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">10개씩보기 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- 소스 -->
	<div id = "topBar">
	
 <button class="btn btn-default" id="btns">전체</button>
<button class="btn btn-default" id="btns" >진행중</button>
<button class="btn btn-default" id="btns">마감</button><br>
	 
	</div>
	<table class="table table-bordered">
	<thead>
		<tr>
			<th>공고 상태</th>
			<th>모집 내용</th>
			<th style="text-align: center">공고 관리</th>
			<th>지원자 관리</th>
			<th style="text-align: center">조회수</th>
			
		</tr>
		</thead>
		<div>
		
			<div class="row" id="recruitList">
  
</div>
		
		
			
		</div>		
		
	</table>
	 <div >
 	 <ul class="pagination" id="listPage">
 	 
 	 
 	 </ul>
	
    </div>
	 

	<div>
	<select><option id="searchOpt" value="1">공고제목</option></select><input id = "searchText" type="text" /><input id="searchBar" type ="button" value="검색">
	</div>

	
	<div style="width: 740px; padding: 0 0 15px 0; margin: 0;">
		<div style="border: 1px solid #c1d1f2; background-color: #f4f9ff; padding: 13px 0 8px 12px;">
			<ul>
				<li>진행중 공고의 게재 기간은  <b>게재일(노출일)로부터 최대 90일</b>까지입니다. (상시, 채용시도 동일) <br> 
				<li><b>최초 개인정보 수집한 목적이 달성되면</b> <r>지체 없이 파기</r>하여야 합니다.</li> <br>
				<li>채용이 아닌 <r>영업이나 마케팅 등으로 이용하실 경우,</r></li><br>
				<li><r>정보통신망법 제71조 3에 의거 5년 이하 징역 또는 5,000만원 이하의 벌금에 처해질 수 있습니다.</r></li>
			</ul>
		</div>
	</div>
			
			<button id="deletego">ajaxRemove</button>
	
</div>
<!-- //기업 채용공고 목록 끝 -->

<script>

$(document).ready(function(){
	
	$('#searchBar').on("click",function(){
		
		var opt = $('#searchOpt').val(); // 카테고리 구분 2차때 할 예정
		var srchTxt = $('#searchText').val();
		var pN = 1;
		
		SearchList(pN, srchTxt);
		
	})
	
	var pN = 1;
	RecruitList(pN);
	
	$(document).on("click",'#RecruitList',function(){
		var pN = $(this).html();
		RecruitList(pN);
		
	})
	
	$(document).on("click",'#ingRecruitList',function(){
		var pN = $(this).html();
		RecruitIngList(pN);
		
	})
	
	$(document).on("click",'#endRecruitList',function(){
		var pN = $(this).html();
		RecruitEndList(pN);
		
	})
	

	$(document).on("click",'#btns',function(){
		
		if($(this).text()=="전체"){
			$("tbody > * ").remove()
			RecruitList(1);
				
		}else if($(this).text()=="진행중"){
			alert("hi");
			$("tbody > * ").remove()
			RecruitIngList(1);
		
		}else{
			$("tbody > * ").remove()
			RecruitEndList(1);
			
		}
		
	})
	
		$(document).on("click",'#searchBtns',function(){
		
		if($(this).text()=="전체"){
			var srchTxt = $('#searchText').val();
			$("tbody > * ").remove()
			SearchList(1,srchTxt);
				
		}else if($(this).text()=="진행중"){
			var srchTxt = $('#searchText').val();
			$("tbody > * ").remove()
			IngSearchList(1,srchTxt);
		
		}else{
			var srchTxt = $('#searchText').val();
			$("tbody > * ").remove()
			EndSearchList(1,srchTxt);
			
		}
		
	})
	
	
	$(document).on("click",'#deletego',function(){
		
	$("#topBar > * ").remove()
	
	$("tbody > * ").remove()
	

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
		
		function SearchList(pN, srchTxt){
			
			$.getJSON("/companyAjax/searchList/?page="+pN+"&srchTxt="+srchTxt, function(data){
			
				var str = "";
				var chr = "";
				var src ="";
				var length = data.length;
				var i = 0;
				
				$(data).each(function(){
					i++;
					
					
				
					
					if(i < length){
					str += "<div class=col-sm-6 col-md-4><div class=thumbnail><div class=cation><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span>"
						+ "<a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
								+"<li>근무형태 : "+this.employstatusid+"</li>"
								+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
								+"<li>경력 : "+this.exp+"</li>"
								+"<li>접수기간 : "+this.period+"("+this.week+")</li>"
								+"<button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
								+"<li>지원자수 : "+this.applynum+"</li>"+this.viewcnt+""
								+"<li>최근수정 : "+this.regdate+" (담당자:)</li></div></div></div>"
					}
					else{
					

	 					if(this.prev){
							chr += "<li><a href=RecruitList("+this.startPage+")>&laquo;</a></li>";
						}
						
						
						for(var z = this.startPage; z<this.endPage; z++){
							chr += "<li><a id=searchList>"+z+"</a></li>"
							
						} 
					 	if(this.next&&this.endPage>0){
							chr += "<li><a href=RecruitList("+this.startPage+")>&raquo;</a></li>";
						} 
	 				}
					
					});
				
				$("#topBar > * ").remove()
				src += "<button  id=searchBtns>전체</button><button id=searchBtns>진행중</button><button id=searchBtns>마감</button><br>";
				$("#topBar").html(src);
				
					$("#searchBtns").each(function(){
						$("button").addClass("btn btn-default");
						
					});
				
				$("#recruitList").html(str);	
					
					
					
					 $("#listPage").html(chr); 
					
					
				})
				
				
			}
		
		function IngSearchList(pN, srchTxt){
			
			$.getJSON("/companyAjax/ingSearchList/?page="+pN+"&srchTxt="+srchTxt, function(data){
			
				var str = "";
				var chr = "";
				var src ="";
				var length = data.length;
				var i = 0;
				
				$(data).each(function(){
					i++;
					
					
				
					
					if(i < length){
					str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
						+ "<th><a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
								+"<li>근무형태 : "+this.employstatusid+"</li>"
								+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
								+"<li>경력 : "+this.exp+"</li>"
								+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
								+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
								+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
								+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
					}
					else{
					

	 					if(this.prev){
							chr += "<li><a href=RecruitList("+this.startPage+")>&laquo;</a></li>";
						}
						
						
						for(var z = this.startPage; z<this.endPage; z++){
							chr += "<li><a id=searchList>"+z+"</a></li>"
							
						} 
					 	if(this.next&&this.endPage>0){
							chr += "<li><a href=RecruitList("+this.startPage+")>&raquo;</a></li>";
						} 
	 				}
					
					});
				
				
					$("#searchBtns").each(function(){
						$("button").addClass("btn btn-default");
						
					});
				
				$("#recruitList").html(str);	
					
					
					
					 $("#listPage").html(chr); 
					
					
				})
				
				
			}
		
		function EndSearchList(pN, srchTxt){
			
			$.getJSON("/companyAjax/endSearchList/?page="+pN+"&srchTxt="+srchTxt, function(data){
			
				var str = "";
				var chr = "";
				var src ="";
				var length = data.length;
				var i = 0;
				
				$(data).each(function(){
					i++;
					
					
				
					
					if(i < length){
					str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
						+ "<th><a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
								+"<li>근무형태 : "+this.employstatusid+"</li>"
								+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
								+"<li>경력 : "+this.exp+"</li>"
								+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
								+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
								+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
								+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
					}
					else{
					

	 					if(this.prev){
							chr += "<li><a href=RecruitList("+this.startPage+")>&laquo;</a></li>";
						}
						
						
						for(var z = this.startPage; z<this.endPage; z++){
							chr += "<li><a id=searchList>"+z+"</a></li>"
							
						} 
					 	if(this.next&&this.endPage>0){
							chr += "<li><a href=RecruitList("+this.startPage+")>&raquo;</a></li>";
						} 
	 				}
					
					});
				
				
					$("#searchBtns").each(function(){
						$("button").addClass("btn btn-default");
						
					});
				
				$("#recruitList").html(str);	
					
					
					
					 $("#listPage").html(chr); 
					
					
				})
				
				
			}
		
		
		
	
		
		function RecruitList(pN){
			
			$.getJSON("/companyAjax/recruitList/?page="+pN , function(data){
			
			var str = "";	
			var chr = "";
			var length = data.length;
			var i = 0;
			
			$(data).each(function(){
				i++;
				
				
			
				
				if(i < length){
					str += "<div class=col-sm-6 col-md-4><div class=thumbnail><div class=cation><br><b id=states>"+this.recruitstate+"</b>"
						+ "<a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
								+"<li>근무형태 : "+this.employstatusid+"</li>"
								+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
								+"<li>경력 : "+this.exp+"</li>"
								+"<li>접수기간 : "+this.period+"("+this.week+")</li>"
								+"<button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
								+"<li>지원자수 : "+this.applynum+"</li>"+this.viewcnt+""
								+"<li>최근수정 : "+this.regdate+" (담당자:)</li></div></div></div>"
					}
				else{
				

 					if(this.prev){
						chr += "<li><a href=RecruitList("+this.startPage+")>&laquo;</a></li>";
					}
					
					
					for(var z = this.startPage; z<this.endPage; z++){
						chr += "<li><a id=RecruitList>"+z+"</a></li>"
						
					} 
				 	if(this.next&&this.endPage>0){
						chr += "<li><a href=RecruitList("+this.startPage+")>&raquo;</a></li>";
					} 
 				}
				
				});
			
			$("#recruitList").html(str);	
			 $("#states").addClass("text-center");
			 $("#states").css("background-image","url(/resources/rpjt/img/stateBack.png)");
			 $("#states").css("background-repeat","no-repeat");
			 $("#states").css("top","0");
			 $("#states").css("color","white");
			 $("#states").css("padding","16px 18px");
			 $("#states").css("width","32px");
			 $("#states").css("heigth","36px");
				
				 $("#listPage").html(chr); 
				
				
			})
			
			
		}
		

		
		
		
		function RecruitIngList(pN){
			
			$.getJSON("/companyAjax/ingRecruitList/?page="+pN , function(data){
				
				var str = "";	
				var chr = "";
				var length = data.length;
				var i = 0;
				
				$(data).each(function(){
					
					i++;
					
					if(i < length){
					str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
					+ "<th><a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
							+"<li>근무형태 : "+this.employstatusid+"</li>"
							+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
							+"<li>경력 : "+this.exp+"</li>"
							+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
							+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
							+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
							+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
					}else{
						
						if(this.prev){
							chr += "<li><a href=RecruitList("+this.startPage+")>&laquo;</a></li>";
						}
						
						
						for(var z = this.startPage; z<this.endPage; z++){
							chr += "<li><a id=ingRecruitList>"+z+"</a></li>"
							
						} 
					 	if(this.next&&this.endPage>0){
							chr += "<li><a href=RecruitList("+this.startPage+")>&raquo;</a></li>";
						} 
						
					}
				});
				
			
				
					$("#recruitList").html(str);	
					
					 $("#listPage").html(chr); 
				})
				
		}
		
		function RecruitEndList(pN){
			
			$.getJSON("/companyAjax/endRecruitList/?page="+pN, function(data){
				
				var str = "";	
				var chr = "";
				var length = data.length;
				var i = 0;
				
				$(data).each(function(){
					
					i++;
					if(i<length){
					str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
					+ "<th><a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
							+"<li>근무형태 : "+this.employstatusid+"</li>"
							+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
							+"<li>경력 : "+this.exp+"</li>"
							+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
							+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
							+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
							+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
					}else{
						
						if(this.prev){
							chr += "<li><a href=RecruitList("+this.startPage+")>&laquo;</a></li>";
						}
						
						
						for(var z = this.startPage; z<this.endPage; z++){
							chr += "<li><a id=endRecruitList>"+z+"</a></li>"
							
						} 
					 	if(this.next&&this.endPage>0){
							chr += "<li><a href=RecruitList("+this.startPage+")>&raquo;</a></li>";
						} 
						
						
					}
					
					
					
				});
					
				
					$("#recruitList").html(str);
					
					 $("#listPage").html(chr); 
				})
				
		}
		

		
	
	</script>

<%@include file="../include/cfooter.jsp"%>