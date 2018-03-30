<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<div class="col-md-9">
	<div class="table-responsive">			
		<h1 class="ci_name">${PUserVO.pname}</h1><h4>님의 이력서 관리 (이력서 목록)</h4>
		<button type = "button" id = "deleteList-button" class="btn btn-danger col-md-offset-10"><span class="glyphicon glyphicon-trash"></span> 선택 삭제</button>
		<br><br>
		<table class="table table-bordered">
			<tr>
				<th style="width: 65px;">전체&nbsp;<input type="checkbox" id="allcheck"></th>
				<th style="text-align: center;">이력서 제목</th>
				<th style="width: 55px; text-align: center;">설정</th>
				<th style="width: 60px; text-align: center;"><span class="glyphicon glyphicon-pencil"></span> 수정</th>
				<th style="width: 60px; text-align: center;"><span class="glyphicon glyphicon-trash"></span> 삭제</th>
			</tr>
			
			<c:forEach items="${ResumeVOList}" var="ResumeVO" varStatus="status">		
			<tr>
				<td style="text-align: center;"><input id="${ResumeVO.bno}" type="checkbox"></td>
				
				<td style="text-align: center;"><a href="/personal/detail?bno=${ResumeVO.bno}">${ResumeVO.bno} : ${ResumeVO.title}</a></td>
				<td style="text-align: center;"><a><span class="glyphicon publicornot ${ResumeVO.publicornot}" name="publicornot" id="${status.count }"></span></a></td>
				<td><button type = "button" id = "modify-button" class="btn btn-success"  onclick="location.href='/personal/Rmodify?bno=${ResumeVO.bno}'"> <span class="glyphicon glyphicon-pencil"></span> 수정</button></td>
				<td><button type = "button" id = "deleteOne-button" class="btn btn-danger" onclick="deleteOneResume(${ResumeVO.bno})"><span class="glyphicon glyphicon-trash"></span> 삭제</button></td>			
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script>
function deleteOneResume(bno){
	
	console.log("#delete-button");
	console.log(bno);
	
	if(confirm(bno+"번째 이력서를 정말 삭제하시겠습니까?")){
		location.href='/personal/deleteOneResume?bno='+bno;
	}
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
		console.log("선택삭제 버튼 누름");
	});
	
	//onchange//클래스가 공개면 
	publicornot();
	
	function publicornot(){
		$(".비공개").each(function(index){
			$(this).addClass("glyphicon-lock");
		}); 
		
		$(".공개").each(function(index){
			$(this).addClass("glyphicon-eye");
		}); 
	}
	
	$(".publicornot").click(function(){
		console.log("클릭함");
		//resume publicornot column 바꾸는 ajax
		publicornot();
	});
	/* $( ".publicornot" ).each(function(index) {
	    $(this).on("click", function(){
	    });
	}); */
});




/* $.ajax({
type : 'delete',
url : '/personal/deleteResume' + ${ResumeVO.bno},
headers:{
	"Content-Type" : "application/json",
	"X-HTTP-Method-Override" : "DELETE"
},
data:JSON.stringify({
	
}),
dataType : 'text',
success:function(result){
	console.log("result : " + result);
	if(result == 'SUCCESS'){
		alert("삭제되었습니다.");
	}
} 
});//formObj.submit();*/
</script>
<%@include file="../include/cfooter.jsp"%>
