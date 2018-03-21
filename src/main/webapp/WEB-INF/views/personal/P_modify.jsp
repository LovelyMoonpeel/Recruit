<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>
	
<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- Main content -->
<!-- 개인 수정 페이지 -->

<div class="col-md-9">
	<form role = "form" method = "post">
		<!-- 개인 페이지 첫번째(이미지, 이름) -->
		<div class="top_cont">
			<br>
			<h1 class="ci_name">${PUserVO.pname}</h1>
			<br>
		</div>
		<table class="table table-bordered">
				<tbody>
				<tr>
					<!-- ★scope="row"는 태그가 있는 행의 나머지 셀에 적용 -->
					<!-- ★class="table-active"는 셀 바탕색,active말고도 success, warning, danger, info -->
					<th class="table-active" scope="row"><label>아이디</label></th>
					<td>
						<div class="form-group">
			 				<input type="text" name="id" class="form-control" id="id" value="${PUserVO.id}" readonly="readonly">
						</div>
					</td>
                       <th class="table-active" scope="row"><label>비밀번호</label></th>
					<td>
						<div class="form-group">
							<input type="password" name="pw" class="form-control" id="pw" value="${PUserVO.pw}">
						</div>
					</td>
					
                   </tr>
				<tr>
					<th class="table-active" scope="row"><label>이름</label></th>
					<td>
						<div >
							<input  type="text" name="pname" class="form-control form-group col-sm-6" id="panme" value="${PUserVO.pname}">
						</div>
					</td>
					
					 <th class="table-active" scope="row"><label>비밀번호 확인</label></th>
					<td>
						<div class="form-group">
							 <input type="password" name="pwc" class="form-control" id="pwc">
						<span id="pwchk"></span>	
						</div>
					</td>
				</tr>
				<tr>
					<th class="table-active" scope="row"><label>email</label></th>
					<td>
						<div class="form-group">
							<input type="text" name = "email" class="form-control" id="email" value ="${PUserVO.email}">
						</div>
					</td>
					<td colspan="2">
					</td>
				</tr>
				<tr>
					<th class="table-active" scope="row"><label>생일</label></th>
					<td colspan="3">
						<div class="form-group">
							<div class="input-group date" data-provide="datepicker">
								<input type="text" name ="birth" class="form-control" id = "birth" value ="${PUserVO.birth}">
								<span class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>
						</div>
					</td>
				</tr>
				</tbody>
			</table>
	</form>
	<button id ="modify-finish" class="btn btn-success col-md-offset-10" type='submit'>완료</button>
	<button id ="modify-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/index?id={PUserVO.id}';" type="button">취소</button>
</div>

<script type='text/javascript'>
$(document).ready(function(){
	
	var formObj = $("form[role = 'form']");
	
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			language : "kr"
		});
	});
	//수정버튼 누르면 제출되고 post방식으로 modify controller로  Mapping된다.
	$('#modify-finish').on("click", function(){
		//self.location = "/person/modify";
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();
		
		if(pw==pwc){
			if(confirm("수정하시겠습니까?")){
				<!-- //birth null값인지 확인  -->
				//	birth가 ''면 null
				if($('#birth').val()==''){
					$('#birth').val("0000-00-00");
				}
				// null이면 0000-00-00으로 반환
				formObj.attr("action", "/personal/modify");
				formObj.attr("method", "post");
				formObj.submit();
			}
		}else{
			alert("비밀번호를 확인해주세요.");
		}
		console.log("#modify-finish");
		//controller안바뀌고 form method = "post"대로 제출됨
	});
	//취소버튼 누르면 이력서 관리 페이지로 넘어간다. index controller로 Mapping된다.
	$('#modify-cancel').on("click", function(){
		//formObj.attr("action", "/personal/modify");
		console.log("#modify-cancel");
		self.location = "/personal/index";
	});
	
	/*<!-- 비밀번호 일치 여부  -->*/
	/* keyup을 통해 비밀번호가 맞는지 확인하는 작업 */
	var pwchk = $('#pwchk');
	
	$('#pwc').keyup(function(){
		if($('#pwc').val()!=""&&$('#pw').val() == $('#pwc').val()){
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치합니다.";
			pwchk.attr("style", "color:blue")
		}else{
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
			pwchk.attr("style", "color:red")
		}
	});
	
 	$('#pw').keyup(function(){
		if($('#pw').val()!=""&&$('#pw').val() == $('#pwc').val()){
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치합니다.";
			pwchk.attr("style", "color:blue")
		}else{
			document.getElementById("pwchk").innerHTML = "비밀번호가 일치하지 않습니다.";
			pwchk.attr("style", "color:red")
		}
	}); 
	<!-- //비밀번호 일치 여부  -->
	
});
	
</script>
<%@include file="../include/cfooter.jsp"%>
