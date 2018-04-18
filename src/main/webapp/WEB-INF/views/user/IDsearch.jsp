<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/uheader.jsp"%>
<!-- <div class="col-md-9"> -->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

<h2>아이디 찾기</h2>
<form action="IDsearch" method="POST">
<table class="table table-bordered">
	<tr>
		<td style="width:100px;" colspan="2"><input type="radio" name="index" id="pname" checked="checked"><label for="pname">개인회원</label> &nbsp;&nbsp;
		<input type="radio" name="index" id="cname"><label for="cname">기업회원</label></td>
	</tr>
	<tr>
		<td>이름</td><td><input type="text" id="name" class="form-control" value="" placeholder="이름이나 기업명을 입력해주세요." autofocus></td>
	</tr>
	<tr>
		<td>이메일</td><td><input type="text" id="email" class="form-control" name="email" value="${LoginDTO.email }" placeholder = "이메일을 입력해주세요."></td>
	</tr>
</table>
</form>
<input type="button" class="btn btn-success" id="submit" value="ID 찾기">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<script>
//라디오로 체크된 값을 구분해서 pname과 cname을 구분지어 넣어 줌
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
			if(result == 'success'){
				alert("이메일로 아이디가 전송되었습니다.");
				self.location="/";
			}else{
				alert("아이디나 이메일을 다시 확인해주세요.");
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
			if(result == 'success'){
				alert("이메일로 아이디가 전송되었습니다.");
				self.location="/";
			}else{
				alert("아이디나 이메일을 다시 확인해주세요.");
			}
		}
	})
	}
});
</script>

<script>
$('#email').keypress(function(event){
			if(event.which == 13){
				$('#submit').click();
			}
		});
</script>
<%@include file="../include/cfooter.jsp"%>