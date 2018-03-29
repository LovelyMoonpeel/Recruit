<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@include file="../include/sheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<%
	String mod = "hidden";
	try{
		String idc = "";
		idc = (String)session.getAttribute("idc");
		System.out.println("id : "+id+" idc : "+idc);
		if(id.equalsIgnoreCase(idc)){
			mod = "submit";
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<% session.removeAttribute("idc"); %>

<!-- 개인정보수정 페이지 -->
<div class="col-md-9">



	<h1>Q&A</h1>	
	<form role="form" method="POST">
		<input class="form-control" type="hidden" name="bno" value="${CsqnaVO.bno}" readonly>
	</form>
	<table class="table table-bordered">
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td><input class="form-control" type="text" name="title"
				value="${CsqnaVO.title}" readonly></td>
		</tr>
		<tr>
			<th>아이디</th>
		</tr>
		<tr>
			<td><input class="form-control" type="text" name="user"
				value="${CsqnaVO.user}" readonly></td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td><textarea class="form-control" name="content" 
			readonly>${CsqnaVO.content}</textarea></td>
		</tr>
	</table>
	
	<ul class="timeline">
	 <li class="time-label" id="repliesDiv"><button type="button" class="btn btn-info">댓글<small id='replycntSmall'> [ ${CsqnaVO.reply} ] </small></button></li>
	</ul>
	<ul id="replies"></ul>
	
	<input type="<%=mod %>" class="btn btn-warning" value="수정">
	<!-- <input type="submit" class="btn btn-danger" value="삭제"> -->
	<input type="submit" class="btn btn-primary" value="목록">
	
</div>
<!-- //관리자정보수정 페이지 -->

<!-- QnA 댓글 -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item">
  <span class="time">
   <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <div class="timeline-body"><textarea class="form-control" readonly>{{content}}</textarea> </div>
  </div>
 </div>
</li>
{{/each}}
</script>
<!-- // QnA 댓글 -->

<script>
Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year+"/"+month+"/"+date;
});

var printData = function(replyArr, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

</script>

<script>
var bno=${CsqnaVO.bno};

function getPage(pageInfo){
	$.getJSON(pageInfo, function(data){
		printData(data, $("#repliesDiv"), $("#template"));
		
		$("#modifyModal").modal('hide');
	});
}

$("#repliesDiv").on("click", function() {

	getPage("/replies/all/" + bno);

});
</script>

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

var formObj = $("form[role='form']");

console.log(formObj);

$(".btn-warning").on("click", function(){
	if(confirm("수정할랭?")){
		formObj.attr("action", "/cs/qnamod");
		formObj.attr("method", "GET");
		formObj.submit();
	}
});

$(".btn-danger").on("click", function(){
	if(confirm("삭제하시겠습니까?")){
		formObj.attr("action", "/cs/qremove");
		formObj.submit();
	}
});

$(".btn-primary").on("click", function(){
	self.location = "/cs/qna";
});

</script>
<!-- //버튼에 대한 스크립트  -->

<%@include file="../include/cfooter.jsp"%>