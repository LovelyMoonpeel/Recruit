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
	
	<%-- 	<%
		
		Calendar date = Calendar.getInstance();
		date.set(2015,0,31);
		
		out.println(date.get(Calendar.YEAR));
		
		out.println(date.get(Calendar.MONTH)+1);
		
		out.println(date.get(Calendar.DATE));
		
		date.add(Calendar.DATE,1);
		
		out.println(date);
		
		out.println(date.get(Calendar.YEAR));
		
		out.println(date.get(Calendar.MONTH)+1);
		
		out.println(date.get(Calendar.DATE));
				
		%> --%>
		
	
	<button class="btn btn-default" id="btns">전체</button><button class="btn btn-default" id="btns" >진행중</button><button class="btn btn-default" id="btns">마감</button><br>
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
		<tbody id="recruitList">
		
		</tbody>	
		</div>		
		
	</table>
	
	<form>	
	<div><select><option value="1">공고제목</option><option value="2">담당자명</option></select><input type="text"><input type="button"></div>
	</form>
	
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
	

	RecruitList();
	
	
	$(document).on("click",'#btns',function(){
		
		if($(this).text()=="전체"){
			$("tbody > * ").remove()
			RecruitList();
				
		}else if($(this).text()=="진행중"){
			$("tbody > * ").remove()
			RecruitIngList();
		
		}else{
			$("tbody > * ").remove()
			RecruitEndList();
			
		}
		
	})
	
	
	$(document).on("click",'#deletego',function(){
		
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
		
		
		function RecruitList(){
			
			$.getJSON("/companyAjax/recruitList/", function(data){
			
			var str = "";	
				
			$(data).each(function(){
				
				
				
				str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
					+ "<th><a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
							+"<li>근무형태 : "+this.employstatusid+"</li>"
							+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
							+"<li>경력 : "+this.exp+"</li>"
							+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
							+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
							+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
							+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
			
				});
				
			
				$("#recruitList").html(str);			
			})
			
			
		}
		
		function RecruitIngList(){
			
			$.getJSON("/companyAjax/ingRecruitList/", function(data){
				
				var str = "";	
				var text = "";
				
				$(data).each(function(){
					
					
					
					str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
					+ "<th><a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
							+"<li>근무형태 : "+this.employstatusid+"</li>"
							+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
							+"<li>경력 : "+this.exp+"</li>"
							+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
							+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
							+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
							+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
			
				});
				
				text += ""
					
				
					$("#recruitList").html(str);			
				})
				
		}
		
		function RecruitEndList(){
			
			$.getJSON("/companyAjax/endRecruitList/", function(data){
				
				var str = "";	
					
				$(data).each(function(){
					
					
					
					str += "<tr><th rowspan=2><span class=badge badge-inverse>"+this.recruitstate+"</span></th>"
					+ "<th><a href=C_recruitInfo?recruitNum="+this.bno+" target=_blank>"+this.title+"</a>"
							+"<li>근무형태 : "+this.employstatusid+"</li>"
							+"<li>직종 : "+this.jobgroupid+"->"+this.jobgroupid2+"</li>"
							+"<li>경력 : "+this.exp+"</li>"
							+"<li>접수기간 : "+this.period+"("+this.week+")</li></th>"
							+"<th><button type=button id=modify value="+this.bno+" class=btn-primary>"+this.btnstate+"</button><br><button type=button id=delete value="+this.bno+" class=btn-danger>삭제하기</button>"
							+"<th><li>지원자수 : "+this.applynum+"</li></th><th>"+this.viewcnt+"</th></tr>"
							+"<tr><th></th><th><li>최근수정 : "+this.regdate+" (담당자:)</li></th><th></th><th></th></tr>"
			
				});
					
				
					$("#recruitList").html(str);			
				})
				
		}
	
	
	</script>

<%@include file="../include/cfooter.jsp"%>