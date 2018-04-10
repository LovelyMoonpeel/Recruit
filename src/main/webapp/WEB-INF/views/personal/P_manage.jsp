<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<div class="col-md-9">
	<div class="table-responsive">			
		<h1 class="ci_name">${PUserVO.pname}</h1><h4>님의 이력서 관리 (이력서 목록)</h4>
		
		<br>
		<div
			style='width: 100%; height: 190px; border: 1px solid #c0c6d3; padding: 30px;'>
			<ul>
				<li>이력서는 기본적으로 비공개로 저장되며, 이력서 관리 페이지에서 하나의 이력서만 공개로 설정이 가능합니다.</li>
				<li>이력서를 <b>공개</b>하신 회원님께 해당이력서를 기반으로  <b>추천 공고 서비스</b>를 무료로 제공합니다.
				<li>공개된 이력서에서 <b>[희망 구직정보 - 희망 근무지, 희망직종], 최종학력, 최종경력</b>을 입력하시면<br>더 정확한 추천 공고 서비스를 이용하실 수 있습니다.<br></li>
			</ul>
			<br>※ 퍼펙트 매칭 채용정보 등록 규정상 부적합한 이력서로 판별된 경우, 별도 통보 없이 이력서가 비공개/삭제
			처리될 수 있습니다.<br><br>
		</div>
		<br>
		<button type = "button" id = "btn_deleteSeleted" onclick="deleteResumeList();" class="btn btn-danger col-md-offset-10"><span class="glyphicon glyphicon-trash"></span> 선택 삭제</button>
		<br><br>
		<input type='hidden' id='userid' value='${PUserVO.id}'></input>
		<table id="tbl_resume" class="table table-bordered">
			<tr>
				<th style="width: 65px;">전체&nbsp;<input type="checkbox" id="allcheck"></th>
				<th style="width: 60px; text-align: center;">순번</th>
				<th style="text-align: center;">이력서 제목</th>
				<th style="width: 95px; text-align: center;">공개/비공개</th>
				<th style="width: 60px; text-align: center;"><span class="glyphicon glyphicon-pencil"></span> 수정</th>
				<th style="width: 60px; text-align: center;"><span class="glyphicon glyphicon-trash"></span> 삭제</th>
			</tr>
			
			<c:forEach items="${ResumeVOList}" var="ResumeVO" varStatus="status">		
			<tr>
				<td style="text-align: center;"><input id="${ResumeVO.bno}" type="checkbox"><input type="hidden" id="bno${status.index}" class="k${ResumeVO.publicornot}" value="${ResumeVO.bno}"></input></td>
				<td style="text-align: center;">
				<input type="hidden" value="${ResumeVO.bno }" class="item">
				${status.count }
				</td>
				<td style="text-align: center;"><a href="/personal/detail?bno=${ResumeVO.bno}">${ResumeVO.bno} : ${ResumeVO.title}</a></td>
				<td style="text-align: center;"><a><span style="cursor:pointer" class="glyphicon publicornot ${ResumeVO.publicornot}"><input type="hidden" id="publicornot${status.index}" value="${ResumeVO.publicornot}"></input></span></a></td>
				<td><button type = "button" id = "modify-button" class="btn btn-success"  onclick="location.href='/personal/Rmodify?bno=${ResumeVO.bno}'"> <span class="glyphicon glyphicon-pencil"></span> 수정</button></td>
				<td><button type = "button" id = "deleteOne-button" class="btn btn-danger" onclick="deleteOneResume(${ResumeVO.bno})"><span class="glyphicon glyphicon-trash"></span> 삭제</button></td>			
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script>
function deleteOneResume(bno){
	var array=[];
	array.push(parseInt(bno));
	if(confirm(bno+"번째 이력서를 정말 삭제하시겠습니까?")){
		location.href='/personal/deleteOneResume?bno='+array;
	}
}
function deleteResumeList(){
	var array=[];
	$("#tbl_resume tr").each(function(index, item){
		var chk = $($(item).children()[0]).children();
		var bno = $($(item).children()[1]).children();
		
		if(chk.is(':checked')) {
			alert(bno.val());
			array.push(parseInt(bno.val()));
		}
	});
	
	if(confirm(array+"번 이력서를 정말 삭제하시겠습니까?")){
		location.href='/personal/deleteResumeList?bno='+array;
	}
}
function publicornot(){
	$(".비공개").each(function(index){
		$(this).removeClass("glyphicon-eye-open ");
		$(this).addClass("glyphicon-lock");
	}); 
	
	$(".공개").each(function(index){
		$(this).removeClass("glyphicon-lock");
		$(this).addClass("glyphicon-eye-open");
	}); 
}
$(document).ready(function(){
	$("#allcheck").click(function(){
		if($("#allcheck").prop("checked")) {// 전체 선택 체크박스가 체크된상태일경우  해당화면에 전체 checkbox들을 체크
		 $("input[type=checkbox]").prop("checked",true); 
		}else { //전체선택 체크박스가 해제된 경우  해당화면에 모든 checkbox들의 체크를해제
		 $("input[type=checkbox]").prop("checked",false); 
		}
	});
	
	$("#deleteList-button").click(function(){
		if("input[type=checkbox]".prop("checked", true)){
			$( "input[name='checkRow']:checked" ).each (function (){
				  checkRow = checkRow + $(this).val()+"," ;
			});
			checkRow = checkRow.substring(0,checkRow.lastIndexOf( ","));
		}
		
		if(checkRow == ''){
		  alert("삭제할 대상을 선택하세요.");
		  return false;
		}
	});
	
	publicornot();
	
	$(".publicornot").each(function(index) {
		
	    $(this).on("click", function(){
			
	    	console.log(index);
	    	
	    	var publicornot=$("#publicornot"+index).val();
	    	var bno= $("#bno"+index).val();
	    	var userid = $("#userid").val();
	
	    	 if(publicornot=="비공개"){
	    		$.ajax({//resume publicornot column 바꾸는 ajax
					 url:'publicornot_change',
					 type : 'POST',
					 headers:{
						 "Content-Type" : "application/json",
						 "X-HTTP-Method-Override" : "POST"
					 },
					 dataType : 'text',
					 data: JSON.stringify({
						userid : userid,
					 	bno : bno,					 
						publicornot : "공개"
					 }),
					 success : function(result){
						if(result=="AS_PUBLIC"){
							alert("해당 이력서를 공개하였습니다.");
							 console.log("비공개를 공개로 바꾸려고 함");
							 location.href = "";
						 }else{
							 console.log("if문 못들어감 뭔가 잘못됨");
						 }
					  }//success : function(result) end
		 		  });//ajax end 
	    	}else if(publicornot=="공개"){
	    		$.ajax({//resume publicornot column 바꾸는 ajax
					 url:'publicornot_change',
					 type : 'POST',
					 headers:{
						 "Content-Type" : "application/json",
						 "X-HTTP-Method-Override" : "POST"
					 },
					 dataType : 'text',
					 data: JSON.stringify({
						userid : userid,
					 	bno : bno,					 
						publicornot : "비공개"
					 }),
					 success : function(result){
						if(result=="AS_PRIVATE"){
							alert("해당 이력서를 비공개하였습니다.");
							 console.log("공개를 비공개로 바꾸려고 함");
							 location.href = "";
						 }else{
							 console.log("if문 못들어감 뭔가 잘못됨");
						 }
					  }//success : function(result) end
		 		  });//ajax end  
	    	}
	    });//each click function
	});
});

</script>
<%@include file="../include/cfooter.jsp"%>
