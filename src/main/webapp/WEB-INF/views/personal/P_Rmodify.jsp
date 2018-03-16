<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 수정</h1>
	<form role="form" method="post">
		<%-- <input type="text" class="form-control" id="rid" name="rid" value="${PTelVO.rid }"> --%>
		
		<input type="text" class="form-control" id="bno" name="bno" value="${ResumeVO.bno}" readonly> 
		<input type="text" class="form-control" id="userid" name="userid" value="${ResumeVO.userid}" readonly> 
		<input type="text" class="form-control" id="id" name="id" value="${PUserVO.id}" readonly>
		<br>	
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title"
				name="title" value="${ResumeVO.title}">
		</div>
	  <div class="company_info_content">
      <div class="table-responsive">
         <table class="table table-bordered">
            <tbody>
               <tr>
                <th class="table-active" scope="row"><label for="pname">이름</label> </th>
	          	<td class="col-sm-4">
	           		<input type="text" class="form-control" id="pname" name="pname" value="${PUserVO.pname}">
	           	</td>
                <th class="table-active" scope="row"><label for="img">사진</label></th>
                <td class="col-sm-4">
                    <div id= 'uploadedList' style = 'width : 127px; height : 152px; border : 1px dotted blue;'>
				    <img id = 'imgsrc' height = "150px;" alt="${ResumeVO.img}" /> 
				   </div>
				   	<!--  사진 보이는 div  -->
				   	
                   	<input id='imgsrccheck' type='hidden' value = "${ResumeVO.img}"/>
                   	 <!-- db에 있는 file img 이름 받아오는 hidden input -->
                   	 <input type = 'hidden' id='uploadfilename' name = 'img' >
					<!-- db에 올라갈 file img 이름 받아오는 hidden input -->
					
					<br>
					<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
					<!--파일 업로드 하는 버튼-->
					
				   	<input type = 'hidden' id = 'xornot' value = '0'>
               	 </td>
               </tr>
               <tr>
                  <th class="table-active" scope="row"><label>생년월일</label></th>
                  <td>
                  	<div class="form-group">
						<div class="input-group date" data-provide="datepicker">
							<input type="text" class="form-control" id="" name="birth" value="${PUserVO.birth}">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
				  </td>
                  <th class="table-active" scope="row"><label for="email">이메일</label></th>
            	  <td>
				  	<div class="form-group">
					 <input type="text" class="form-control" id="email" name="email" value="${PUserVO.email}">
					</div>
				</td>
               </tr>
               
               <tr>
               	  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">연락처 목록</th>            
               </tr>
               
               <c:forEach items="${PTelVO}" var="PTelVO" varStatus="status">
	               <tr>
	                  <th class="table-active" scope="row"><label for="teltitle">전화번호(종류) 	${status.count}</label>
	                  	<input type="text" value="${PTelVO.telid }">
	                  </th>
	                  <td>
	                  <input class="telclass" type='hidden' name="ptelvolist[].rid" value="${ResumeVO.bno}">
						<div class="form-group">
							<input type="text" class="form-control telclass" name="ptelvolist[].teltitle" value="${PTelVO.teltitle}">
						</div>
					  </td>
	                  <th class="table-active" scope="row"><label for="tel">전화번호</label></th>
	                  <td>
	                	<div class="form-group">
							<input type="text" class="form-control telclass" name="ptelvolist[].tel" value="${PTelVO.tel}">
						</div>
	                  </td>
	               </tr>
               </c:forEach> 
               
				<tr>
                  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">웹사이트 목록</th>
               </tr> 
               
		      <%--  <c:forEach items="${PWebSitelist}" var="PWebSiteVO">
		        <tr>
		           <th class="table-active" scope="row"><label for="webtitle">웹사이트(종류)</label></th>
		           <td>
		         	  <input class="webclass" type='hidden' name="PWebSitelist[].rid" value="${ResumeVO.bno}">
		           	<div class="form-group">
						 <input type="text" class="form-control webclass" name="PWebSitelist[].webtitle" value="${PWebSiteVO.title}">
						</div>
		           </td>
		           <th class="table-active" scope="row"><label for="webadd">웹사이트</label></th>
		           <td>
		           	<div class="form-group">
						 <input type="text" class="form-control webclass" name="PWebSitelist[].webadd" value="${PWebSiteVO.webadd}">
						</div>
		           </td>
		         </tr>  
		   		</c:forEach> --%>
	           
               <tr>
               	  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">보유자격증 목록</th>            
               </tr>
               <tr>
                <th class="table-active" scope="row"><label for="test">자격증명</label></th>
                <th class="table-active" scope="row">상세</th>
                <th class="table-active" scope="row"><label for="publeoffice">발행기관</label></th>
                <th class="table-active" scope="row"><label for="acquidate">취득일자</label></th>
          	  </tr>
          	   <c:forEach items="${RLicenselist}" var="RLicenseVO">
	               <tr>
	                  <td>
						<div class="form-group">
							<input class="form-control" name="test" value="${RLicenseVO.test}"></input>
						</div>
					  </td>
	                  <td>
	            	    <div class="form-group">
							 <input class="form-control" value=""></input>
					    </div>
					  </td>
					  <td>
					 	<div class="form-group">
							<input class="form-control" name="publeoffice" value="${RLicenseVO.publeoffice}"></input>
						</div>
					  </td>
					  <td>
					  	<div class="form-group">
							<input class="form-control" name="acquidate" value="${RLicenseVO.acquidate}"></input>
						</div>
					  </td>
	               </tr>
                </c:forEach>
               
               <tr>
               	  <th class="table-active" colspan="4" scope="row" style = "text-align: center;">어학능력 자격증 목록</th>            
               </tr>
               <tr>
               	<th class="table-active" scope="row"><label for="testname">공인인증시험명</label></th>
                <th class="table-active" scope="row"><label for="score">점수</label> </th>
                <th class="table-active" scope="row"><label for="lanpubleoffice">발행기관</label></th>
                <th class="table-active" scope="row"><label for="lanacquidate">취득일자</label></th>
               </tr> 
                <c:forEach items="${RLanguagelist}" var="ResumeLanguageVO">
	               <tr>
	                  <td>
	                  	<div class="form-group">
						 <input class="form-control" name="testname" value="${ResumeLanguageVO.test}"></input>
						</div>
					  </td>
	                  <td>
	                  	<div class="form-group">
							<input class="form-control" name="score" value="${ResumeLanguageVO.score}"></input>
						</div>
	                  </td>
	                  <td>
						<div class="form-group">
						 <input class="form-control" name="lanpubleoffice" value="${ResumeLanguageVO.publeoffice}"></input>
						</div>
					 </td>
	                  <td>
	                  	<div class="form-group">
						 <input class="form-control" name="lanacquidate" value="${ResumeLanguageVO.acquidate}"></input>
						</div>
	                  </td>
	               </tr>  
                </c:forEach>
                       
               <tr>
                  <th class="table-active" colspan="4" scope="row" style="text-align: center;">자기소개서</th>
               </tr> 
               <tr>
                <td colspan="4" rowspan="2">
                  	<div class="form-group">
						<textarea class="form-control" rows="13" id="coverletter" name="coverletter" style = "resize:none;">${ResumeVO.coverletter}</textarea>
					</div>
              	 </td>   
               </tr>
            </tbody>
         </table>
         <!-- //table class -->
      </div>
      <!-- //table-responsive -->
   </div>
   <br>
   <!--  -------------------------------------------------------------------------- -->
	</form>
		<button id="write-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';" type="button">취소</button>
</div>

<script type='text/javascript'>
	$(document).ready(function() {
		var formObj = $("form[role = 'form']");
		var xornot = document.getElementById('xornot');
		
		$(function() {
			$('.input-group.date').datepicker({
				calendarWeeks : false,
				todayHighlight : true,
				autoclose : true,
				format : "yyyy-mm-dd",
				language : "kr"
			});
		});
		console.log('${PWebSitelist}');
		var imgsrccheck = ('#imgsrccheck');
		
 		 if($('#imgsrccheck').val()!=""){
			console.log(" val이 널값아님");
			$('#imgsrc').attr("src", 'displayFile?fileName=${ResumeVO.img}');
			var str = "";
			str = 
				  "<a href='displayFile?fileName=${ResumeVO.img}' target='_blank'; return false;'>원본 확인"
				  +"</a>"
				  +"<small data-src=${ResumeVO.img}>X</small>";
			  $("#uploadedList").append(str); 
			  console.log("uploadedlist에 x버튼 추가");
		}else{
			console.log(" val이 널값이다");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		}  
	  ////////////img uploadedList start//////////////////////////////////////////////////////////
 	  // var upload = document.getElementsByTagName('input')[0];
	   var upload = document.getElementById('fileupload');
	   var uploadedList = document.getElementById('uploadedList');
	  
		if (typeof window.FileReader === 'undefined') {
		 console.log("window.FileReader 'fail'");
		} else {
		 console.log("window.FileReader 'success'");
		}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
		  
	 	  upload.onchange = function (e) {
		
			 var file = upload.files[0];
			 var reader = new FileReader();
			 //p542다시 보기
			 $("#uploadedList").empty();
			 //reader.onload start
			 reader.onload = function (event) {
				 var image = new Image();
				 image.src = event.target.result;
				  
				 uploadedList.innerHTML = '';
				  // img.width = 200;
				 image.height = 150;
				 uploadedList.appendChild(image);
			 };//reader.onload end
		 //img uploadedList에 추가 하는거 end //////////////////////////////////////////////////////////
		 
		 //img 서버에 저장되도록 ajax start //////////////////////////////////////////////////////////  
				 event.preventDefault();
				 //var files = event.originalEvent.dataTransfer.files;
				 
				 console.log("file name");
				 console.log(file);
				 
				 var formData = new FormData();
				 
				 formData.append("file", file);
				 
				 $.ajax({
					 url:'uploadAjax',
					 data: formData,
					 dataType : 'text',
					 processData : false,
					 contentType : false,
					 type : 'POST',
					 success : function(data){
						   var str = "";
						  
						 	console.log(data);
						 	
							  str = 
								  "<a href='displayFile?fileName="+getImageLink(data)+"' target='_blank'; return false;'>원본 확인"
								  +"</a>"
								  +"<small data-src="+data+">X</small>";
	
						  $("#uploadedList").append(str); 
						  document.getElementById('uploadfilename').value = getImageLink(data);
					  }//success : function(data){ end
		 		  });//ajax end
			//});//filedrop end
		 console.log(file);
		 reader.readAsDataURL(file);
		};//upload change end   
		
  		$("#uploadedList").on("click", "small", function(event){
			event.preventDefault();
			var that = $(this);
			
			console.log($(this));
			
			fileName = $(this).attr("data-src"); //전역변수로 설정하기
			var front = fileName.substring(0, 12);
			var end = fileName.substring(12);
			
			fileName = front + "s_" + end;
			
			$("#fileupload").val("");
			$("#uploadedList").empty();
			//$("#fileupload").remove();
			console.log("img File appended deleted");
			console.log("fileName"+fileName);
			
			$("#xornot").val("1");
			console.log($("#xornot").val());
		}); 
		
		function getOriginalName(fileName){
	      	var idx = fileName.indexOf("_")+1;
	      	return fileName.substr(idx);
	      }
		function getImageLink(fileName){
	      	var front = fileName.substr(0,12);
	      	var end = fileName.substr(14);
	      	
	      	return front + end;
	      } 
		 
		$("#write-success").on("click", function() {
			
			console.log("write-success clicked");
			
			  if($("#xornot").val()==0){
				console.log("xornot.val()==0");
				console.log("사진 삭제 안함");
				
				formObj.attr("action", "/personal/Rmodify");
				formObj.attr("method", "post");
				numberingList();
				console.log("사진 삭제 안한 상태에서 submit직전");
				formObj.submit();
				
			}else if($("#xornot").val()==1){
				//삭제 시키기 ajax 실행 후에 Rmodify로 넘어가기
				console.log("xornot.val()==1");
				console.log("사진 삭제함");		
				$.ajax({
					url:"deleteFile",
					type:"post",
					//data : {fileName:$(this).attr("data-src")},
					data: {fileName:fileName},
					dataType:"text",
					succss:function(result){
						if(result=='deleted'){
							console.log("img File on server deleted");
							that.parent("div").remove();
						}
					}
				}); 
			} 
				console.log("사진 삭제한 상태에서 submit직전");
				formObj.attr("action", "/personal/Rmodify");
				formObj.attr("method", "post");
				//numberingList();
				//formObj.submit();
			
		});
    
		function numberingList() {
 			$(".telclass").each(function(index){
				var num = 3;
				var name = $(this).attr("name");
				name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
				$(this).attr("name", name);
				console.log($(this).attr("name"));
			});
			
 			/* $(".webclass").each(function(index){
				var num = 3;
				var name = $(this).attr("name");
				name = name.substring(0, 13) + parseInt(index/num) + name.substring(13);
				$(this).attr("name", name);
				console.log($(this).attr("name"));
			});  */
		}
		
	});
</script>
<%@include file="../include/cfooter.jsp"%>