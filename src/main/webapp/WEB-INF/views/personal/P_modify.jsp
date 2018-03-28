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
					
                    <!--j.code 03/23 : '기존 비밀번호'추가  -->
                    <th class="table-active" scope="row"><label>기존 비밀번호</label></th>
					<td>
						<div class="form-group">
							<input type="password" name="pwc" class="form-control" id="pwc">
							<span id="pwchk"></span>
						</div>
					</td>
					<!--j.code 03/23 : '기존 비밀번호'추가  끝-->
					<!--j.code 03/27 : '이름, 생일, 이메일' readonly로 변경 -->
                </tr>
				<tr>
					<th class="table-active" scope="row"><label>이름</label></th>
					<td>
						<div >
							<input  type="text" name="pname" class="form-control form-group col-sm-6" id="panme" value="${PUserVO.pname}" readonly="readonly">
						</div>
					</td>
					
					<!--j.code 03/23 :'새 비밀번호' 추가  -->
					<th class="table-active" scope="row"><label>새 비밀번호</label></th>
					<td>
						<div class="form-group">
							 <input type="password" name="npw" class="form-control" id="npw">
						</div>
					</td>
					<!--j.code 03/23 :'새 비밀번호' 추가  끝-->
				</tr>
				<tr>
					<th class="table-active" scope="row"><label>email</label></th>
					<td>
						<div class="form-group">
							<input type="text" name = "email" class="form-control" id="email" value ="${PUserVO.email}" readonly="readonly">
						</div>
					</td>
					
					<!--j.code 03/23 : '새 비밀번호 확인'추가  -->
					 <th class="table-active" scope="row"><label>새 비밀번호 확인</label></th>
					<td>
						<div class="form-group">
							 <input type="password" name="npwc" class="form-control" id="npwc" >
						<span id="npwchk"></span>
						</div>
					</td>
					<!--j.code 03/23 : '새 비밀번호 확인'추가 끝 -->
				</tr>
				<tr>
					<th class="table-active" scope="row"><label>생일</label></th>
					<td >
						<div class="form-group">
								<input type="text" name ="birth" class="form-control" id = "birth" value ="${PUserVO.birth}" readonly="readonly">
						</div>
					</td>
				</tr>
				</tbody>
			</table>
	</form>
</div>
<button id ="modify-finish" class="btn btn-success col-md-offset-10" type='submit'>완료</button>
<button id ="modify-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/index';" type="button">취소</button>
<br> <br>

<script type='text/javascript'>
$(document).ready(function(){
	
	var formObj = $("form[role = 'form']");
	
	/* j.code 03/27 : 비밀번호 처리 */
	//수정버튼 누르면 제출되고 post방식으로 modify controller로  Mapping된다.
	$('#modify-finish').on("click", function(){
		//id값이 pwc인 element값 가져오기.
		var pwc = $("#pwc").val();	
		var npw = $('#npw').val();
		var npwc = $('#npwc').val();
		
			if(npw==npwc){
				if(confirm("수정하시겠습니까?")){
					<!-- //birth null값인지 확인  -->
					//	birth가 ''면 null
					if($('#birth').val()==''){
						$('#birth').val("0000-00-00");
					}
					// null이면 0000-00-00으로 반환
					
					console.log( $("#pwc").val());
					$.ajax({
						type : 'POST',
						url : '/personal/pwmodify',
						headers : {
							"Content-Type" : "application/json; charset=UTF-8",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							//pw라는 이름으로 POST방식으로 컨트롤러로 보냄
							pw : pwc,   
							npw : npw	
						}),
						//result값을 데리고 온다.
						success : function(result) {        
							console.log("result: " + result);
							if (result == 'success') {
								alert("success");
								location.href="/personal/index";
							} else {
								alert("failed");
								document.getElementById("pwchk").innerHTML = "기존 비밀번호가 일치하지 않습니다.";
							}
						}
					});
				}
			}
	});
	/* j.code 03/27 : 비밀번호 처리 끝 */
	
	//취소버튼 누르면 이력서 관리 페이지로 넘어간다. index controller로 Mapping된다.
	$('#modify-cancel').on("click", function(){
		console.log("#modify-cancel");
		self.location = "/personal/index";
	});
	
//	<!-- //비밀번호 일치 여부  -->	
	/* j.code 03/23 : npw, npwc 새 비밀번호 일치 여부 추가*/
	$('#npwc').keyup(function(){
		if($('#npwc').val()!=""&&$('#npw').val() == $('#npwc').val()){
			document.getElementById("npwchk").innerHTML = "새 비밀번호가 일치합니다.";
			$("#npwchk").attr('style', "color:blue");
		}else{
			document.getElementById("npwchk").innerHTML = "새 비밀번호가 일치하지 않습니다.";
			$("#npwchk").attr('style', "color:red");
		}
	});
	
 	$('#npw').keyup(function(){
		if($('#npw').val()!=""&&$('#npw').val() == $('#npwc').val()){
			document.getElementById("npwchk").innerHTML = "새 비밀번호가 일치합니다.";
			$("#npwchk").attr('style', "color:blue");
		}else{
			document.getElementById("npwchk").innerHTML = "새 비밀번호가 일치하지 않습니다.";
			$("#npwchk").attr('style', "color:red");
		}
	}); 
 	/* j.code 03/23 : npw, npwc 새 비밀번호 일치 여부 추가 끝*/
});

</script>
<%@include file="../include/cfooter.jsp"%>
