<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/sheader.jsp"%>
<div class="col-md-9">

<h2>아이디 찾기</h2>
<form action="IDsearch" method="POST">
<table>
	<tr>
		<td style="width:100px;"><input type="radio" name="index" id="pname" checked="checked">개인회원</td>
		<td><input type="radio" name="index" id="cname">기업회원</td>
	</tr>
	<tr>
		<td>이름</td><td><input type="text" id="name" value="" placeholder="이름이나 기업명을 입력해주세요."></td>
	</tr>
	<tr>
		<td>이메일</td><td><input type="text" id="email" name="email" value="${LoginDTO.email }" placeholder = "이메일을 입력해주세요."></td>
	</tr>
</table>
</form>
<input type="button" id="submit" value="ID 찾기">
</div>
<script>
//라디오로 체크된 값을 구분해서 pname과 cname을 구분지어 넣어 줌
//name="name" value="${LoginDTO.name }"
$("#pname").on("click", function(){
	$("#pname").attr("checked","checked");
	$("#cname").removeAttr("checked");
});

$("#cname").on("click", function(){
	$("#cname").attr("checked","checked");
	$("#pname").removeAttr("checked");
});


$("#submit").on("click", function(){
	if($("#pname").attr("checked")!=null){
		$("#name").attr("name","pname");
		$("#name").attr("value", "${LoginDTO.pname}");
		
		var pnameObj = $("#name");
		var emailObj = $("#email");
		var pname = pnameObj.val();
		var email = emailObj.val();
		
		$.ajax({
		type:"post",
		url:"/user/IDsearch",
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "post"},
		dataType:'text',
		data: JSON.stringify({pname:pname, email:email}),
		success:function(result){
			if(result == 'fail'){
				alert("이름이나 이메일을 다시 확인해주세요.");
			}else{
				alert("당신의 아이디는 "+result+" 입니다.");
				self.location="/cs/S_faq";
			}
		}
	})
	}else{
		$("#name").attr("name","cname");
		$("#name").attr("value", "${LoginDTO.cname}");

		var cnameObj = $("#name");
		var emailObj = $("#email");
		var cname = cnameObj.val();
		var email = emailObj.val();
		
		$.ajax({
		type:"post",
		url:"/user/IDsearch",
		headers:{
			"Content-Type": "application/json; charset=UTF-8",
			"X-HTTP-Method-Override": "post"},
		dataType:'text',
		data: JSON.stringify({cname:cname, email:email}),
		success:function(result){
			if(result == 'fail'){
				alert("이름이나 이메일을 다시 확인해주세요.");
			}else{
				alert("당신의 아이디는 "+result+" 입니다.");
				self.location="/cs/S_faq";
			}
		}
	})
	}
});

</script>

<%@include file="../include/cfooter.jsp"%>