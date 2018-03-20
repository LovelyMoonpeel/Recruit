<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>
<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 수정</h1>
	<form role="form" method="post">
	 	<input type="text" class="form-control" id="bno" name="bno" value="${ResumeVO.bno}" readonly>
	 	<input type="text" class="form-control" value="${ResumeLanguageVO.rid}" readonly>
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
				   	<input type = 'hidden' id = 'preexistenceimg' value = '0'>
               	 </td>
               </tr>
             </tbody>
         </table>
       </div>
  </div>             
   <br>
   	</form>
		<button id="write-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';" type="button">취소</button>
	</div>

<script type='text/javascript'>
$(document).ready(function() {
		
	
		var formObj = $("form[role = 'form']");
		var xornot = document.getElementById('xornot');
		var preexistenceimg = document.getElementById('preexistenceimg');
		
		
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
			  $("#preexistenceimg").val("1");
		}else{
			console.log(" val이 널값이다");
			$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
			$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
			$("#preexistenceimg").val("0");
		}  

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
				 image.height = 150;
				 uploadedList.appendChild(image);
			 };//reader.onload end
		 
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
			
			//console.log("this"+$(this).src);
			
			if($("#xornot").val()==0){
				
				fileName = $(this).attr("data-src"); //전역변수로 설정
				var front = fileName.substring(0, 12);
				var end = fileName.substring(12);
				var thumcheck = fileName.substring(12,14);
				
				if(thumcheck!="s_"){
					console.log(thumcheck + "썸네일 아닐 때 fileName" + fileName);
					fileName = front + "s_" + end;
					console.log("썸네일 아니라서 바뀐 fileName" + fileName);
				}else{
					console.log(thumcheck + "썸네일인 fileName" + fileName);
				}
			
				$("#fileupload").val("");
				$("#uploadedList").empty();
				console.log("img File appended deleted");
				console.log("fileName"+fileName);
				$('#uploadfilename').val('');
				
				$("#xornot").val("1");
				console.log($("#xornot").val());
			}else if($("#xornot").val()==1){
				console.log("img File on server deleted");
				$(this).parent("div").empty();
				$("#fileupload").val("");
				$('#uploadfilename').val('');
				$("#uploadedList").empty();
				console.log("2번 이상 삭제 누름 img File appended deleted");
				console.log("2번 이상 삭제 누름 fileName"+fileName);
				
				$("#xornot").val("1");
				console.log($("#xornot").val());
			}
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

			}else if($("#xornot").val()==1&&$("#preexistenceimg").val()==1){
				//삭제 시키기 ajax 실행 후에 Rmodify로 넘어가기
				console.log("사진 삭제 후 filename" + fileName);
				console.log("사진 삭제함");		
				$.ajax({
					url:"deleteFile",
					type:"post",
					//data : {fileName:$(this).attr("data-src")},
					data: {fileName:fileName},
					dataType:"text",
					success:function(result){
						if(result=='deleted'){
							console.log("img File on server deleted");
							$(this).parent("div").remove();
						}
					}
				}); 
				
			}else if($("#xornot").val()==1&&$("#preexistenceimg").val()==0){
				console.log("preexistenceimg가 없었고 삭제 버튼을 누른 상태 : img File on server deleted");
				//$(this).parent("div").remove();
			}else{
				console.log("Exception : 어느 if문에도 들어가지 못함");
				console.log(("#preexistenceimg").val());
			}
			console.log("submit직전");
			formObj.attr("action", "/personal/Rmodify");
			formObj.attr("method", "post");
			formObj.submit();
		});
    
});
</script>
<%@include file="../include/cfooter.jsp"%>