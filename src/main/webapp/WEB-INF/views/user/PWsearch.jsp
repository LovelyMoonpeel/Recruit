<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/sheader.jsp"%>
<div class="col-md-9">

<h2>비밀번호 찾기</h2>
<form action="PWsearch" method="POST">
<table>
	<tr>
		<td style="width:100px;"><input type="radio" name="index" id="pname" checked="checked">개인회원</td>
		<td><input type="radio" name="index" id="cname">기업회원</td>
	</tr>
	<tr>
		<td>아이디</td><td><input type="text" id="id" name="id" value="${LoginDTO.id}" placeholder="아이디를 입력해주세요."></td>
	</tr>
	<tr>
		<td>이름</td><td><input type="text" id="name" value="" placeholder="이름이나 기업명을 입력해주세요."></td>
	</tr>
	<tr>
		<td>이메일</td><td><input type="text" id="email" name="email" value="${LoginDTO.email }" placeholder = "이메일을 입력해주세요."></td>
	</tr>
</table>
</form>
<input type="button" id="submit" value="비밀번호 찾기">
</div>

<script>
$("#pname").on("click", function(){
	$("#pname").attr("checked","checked");
	$("#cname").removeAttr("checked");
});

$("#cname").on("click", function(){
	$("#cname").attr("checked","checked");
	$("#pname").removeAttr("checked");
});


$("#submit").on("click", function(){
	var idObj = $("#id");
	var id = idObj.val();
	var emailObj = $("#email");
	var email = emailObj.val();
	
	if($("#pname").attr("checked")!=null){
		$("#name").attr("name","pname");
		$("#name").attr("value", "${LoginDTO.pname}");
		
		var pnameObj = $("#name");
		var pname = pnameObj.val();
		
		$.ajax({
		type:"post",
		url:"/user/PWsearch",
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "post"},
		dataType:'text',
		data: JSON.stringify({id:id, pname:pname, email:email}),
		success:function(result){
			if(result == 'success'){
				alert("이메일에서 임시 비밀번호를 확인해주세요.");
				self.location = "/search/S_index";
			}
		}
	})
	}else{
		$("#name").attr("name","cname");
		$("#name").attr("value", "${LoginDTO.cname}");

		var cnameObj = $("#name");
		var cname = cnameObj.val();
		
		$.ajax({
		type:"post",
		url:"/user/PWsearch",
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "post"},
		dataType:'text',
		data: JSON.stringify({id:id, cname:cname, email:email}),
		success:function(result){
			if(result == 'success'){
				alert("이메일에서 임시 비밀번호를 확인해주세요.");
				self.location = "/search/S_index";
			}
		}
	}) 
	}
});

</script>

<%@include file="../include/cfooter.jsp"%>