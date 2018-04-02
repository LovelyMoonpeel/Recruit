<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/pheader.jsp"%>

<!-- Main content -->
<div class="col-md-9">
	<div class="table-responsive">			
		<h1 class="ci_name">${PUserVO.pname}</h1><h4>님의 이력서 관리 (이력서 목록)</h4>
		<button type = "button" id = "btn_deleteSeleted" onclick="deleteResumeList();" class="btn btn-danger col-md-offset-11">선택 삭제</button>
		<br><br>
		<table id="tbl_resume" class="table table-bordered">
			<tr>
				<th style="width: 65px;">전체    <input type="checkbox" id="allcheck"></th>
				<th style="width: 55px; text-align: center;">순번</th>
				<th>이력서 제목</th>
				<th style="width: 60px; text-align: center;">수정</th>
				<th style="width: 60px; text-align: center;">삭제</th>
			</tr>
			
			<c:forEach items="${ResumeVOList}" var="ResumeVO">		
			<tr>
				<td style="text-align: center;"><input id="${ResumeVO.bno}" type="checkbox"></td>
				<td style="text-align: center;">${ResumeVO.bno}</td>
				<td><a href="/personal/detail?bno=${ResumeVO.bno}">${ResumeVO.title}</a></td>
				<td><button type = "button" id = "modify-button" class="btn btn-success"  onclick="location.href='/personal/Rmodify?bno=${ResumeVO.bno}'">수정</button></td>
				<td><button type = "button" id = "deleteOne-button" class="btn btn-danger" onclick="deleteOneResume(${ResumeVO.bno})">삭제</button></td>			
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
		var bno = $($(item).children()[1]);
		if(chk.is(':checked')) {
			array.push(parseInt(bno.html()));
		}
	});
	
	if(confirm(array+"번 이력서를 정말 삭제하시겠습니까?")){
		location.href='/personal/deleteResumeList?bno='+array;
	}
}

/* function deleteResumeList(){
	var checkRow = "";
	$( "input[name='checkRow']:checked" ).each (function (){
	  checkRow = checkRow + $(this).val()+"," ;
	});
	checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
	
	if(checkRow == ''){
	  alert("삭제할 대상을 선택하세요.");
	  return false;
	}
	console.log("### checkRow => {}"+checkRow);
	
	if(confirm("정보를 삭제 하시겠습니까?")){
	    
	    //삭제처리 후 다시 불러올 리스트 url      
	    var url = document.location.href;
	    var page = $("#page").val();
	    var saleType = $("#saleType").val();
	    var schtype = $("#schtype").val();
	    var schval = $("#schval").val();
	    location.href="${rc.contextPath}/test_proc.do?idx="+checkRow+"&goUrl="+url+"&page="+page+"&saleType="+saleType+"schtype="+schtype+"schval="+schval;      
	}
} */

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
