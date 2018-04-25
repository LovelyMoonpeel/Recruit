<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>
   
<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- Main content -->
<!-- 개인 수정 페이지 -->


<div class="col-md-5 col-md-offset-2" >
	<form role = "form" method = "post">
		<div class="top_cont">
		<br>
		<h1 class="ci_name" >${PUserVO.pname}</h1>
		<br>
		</div>
		<table class="table table-bordered">
		<tbody>
          <tr>
			<th class="table-active" scope="row" style="text-align: center; vertical-align: middle;"><label>기존 비밀번호</label></th>
             <td>
                <div class="form-group">
                   <input type="password" name="pwc" class="form-control" id="pwc">
                   <span id="pwchk"></span>
                </div>
             </td>
          </tr> 
          <tr>
            <th class="table-active" scope="row" style="text-align: center; vertical-align: middle;"><label>새 비밀번호</label></th>
             <td>
                <div class="form-group">
                    <input type="password" name="npw" class="form-control" id="npw" placeholder="6자리를 입력하세요.">
                    <span>(대문자와 소문자, 숫자 조합)</span>
                </div>
             </td>
          </tr> 
          <tr>  
            <th class="table-active" scope="row" style="text-align: center; vertical-align: middle;"><label>새 비밀번호 확인</label></th>
             <td>
                <div class="form-group">
                    <input type="password" name="npwc" class="form-control" id="npwc" placeholder="6자리를 입력하세요.">
                <span id="npwchk"></span>
                </div>
             </td>
          </tr>
		</tbody>
		</table>
	</form>
<button id ="modify-finish" class="btn btn-success col-md-offset-9" type='submit'>완료</button>
<button id ="modify-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/index';" type="button">취소</button>
</div>


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
               //   birth가 ''면 null
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
                        alert("다시 로그인 해주세요.");
                        location.href="/user/logout";
                     } else {
                        alert("failed");
                        alert("비밀번호가 일치하지 않습니다.");
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
   
   $('#delete-id').on("click", function(){
	   console.log("#delete-id");
	   
   });
   
});

</script>


<!--jcode 04/04 : 비밀번호 비교 수정  -->
<script>

$('#npw').keyup(function(){
	   
   var npw = $('#npw').val();
   var npwc = $('#npwc').val();
   var schar = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/i;
   var nchar = /[0-9]/;   
   var pchar = /[a-zA-Z]/;
   var npwchk = $('#npwchk');

   if(npw.search(/\s/) != -1){
      alert("공백 금지");
      $('#npw').val(npw.slice(0, -1));
   }
   
   if((schar.test(npw))==true){
      alert("특수문자 금지");
      $('#npw').val(npw.slice(0, -1));
   }

   npw = $('#npw').val();
   npwc = $('#npwc').val();
   
   if(npw.length < 6 || npw.length > 21){
       document.getElementById("npwchk").innerHTML = "비밀번호가 유효하지 않습니다.(6~20자)";
       npwchk.attr("style", "color:red");
       npwc = "no";
       return false;
   }else{
      if(npwc == npw){
         document.getElementById("npwchk").innerHTML = "새 비밀번호가 일치합니다.";
         $("#npwchk").attr('style', "color:blue");
      }else{
         document.getElementById("npwchk").innerHTML = "새 비밀번호가 일치하지 않습니다.";
         $("#npwchk").attr('style', "color:red");
      }
   }
});
   

$('#npwc').keyup(function(){
   
   var npwc = $('#npwc').val();
   var npw = $('#npw').val();
   var schar = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/i;
   var nchar = /[0-9]/;   
   var pchar = /[a-zA-Z]/;
   var npwchk = $('#npwchk');

   if(npwc.search(/\s/) != -1){
      alert("공백 금지");
      $('#npwc').val(npwc.slice(0, -1));
   }
   
   if((schar.test(npwc))==true){
      alert("특수문자 금지");
      $('#npwc').val(npwc.slice(0, -1));
   }

   npwc = $('#npwc').val();
   npw = $('#npw').val();
   
   if(npw.length < 6 || npw.length > 21){
       document.getElementById("npwchk").innerHTML = "비밀번호가 유효하지 않습니다.(6~20자)";
       npwchk.attr("style", "color:red");
       npwc = "no";
       return false;
   }else{
      if(npw == npwc){
         document.getElementById("npwchk").innerHTML = "새 비밀번호가 일치합니다.";
         $("#npwchk").attr('style', "color:blue");
      }else{
         document.getElementById("npwchk").innerHTML = "새 비밀번호가 일치하지 않습니다.";
         $("#npwchk").attr('style', "color:red");
      }
   }
});
   

</script>
<!--jcode_20180404_비밀번호 비교 수정 끝 -->
<%@include file="../include/cfooter.jsp"%>