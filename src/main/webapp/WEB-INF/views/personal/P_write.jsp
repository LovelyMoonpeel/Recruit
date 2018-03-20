<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 작성</h1>
	<form role="form" method="post">
	 <input type='hidden' name='id' value="${PUserVO.id}"> 
		<div class="form-group">
			<label for="title">제목</label> 
			<input class="form-control" id="title" name="title" value="${ResumeVO.title}" required>
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
				   	
                   	<input type='hidden' id='imgsrccheck' value = "${ResumeVO.img}"/>
                   	 <!-- db에 있는 file img 이름 받아오는 hidden input -->
                   	<input type = 'hidden' id='uploadfilename' name = 'img' value='0'>
					<!-- db에 올라갈 file img 이름 받아오는 hidden input -->
					
					<br>
					<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
					<!--파일 업로드 하는 버튼-->
					
				   	<input type = 'hidden' id = 'xornot' value = '0'>
               	 </td>
               </tr>
             </tbody>
         </table>
      </div>
   </div>
   <br>
   	</form>
		<button id="write-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/manage?id=${PUserVO.id}';" type="button">취소</button>
</div>

<script type='text/javascript'>
$(document).ready(function(){
   
	var formObj = $("form[role = 'form']");
   
   $("#write-success").on("click", function(){
      formObj.attr("action", "/personal/write");
      formObj.attr("method", "post");
      formObj.submit();
   });
   
   var upload = document.getElementById('fileupload');
   var uploadedList = document.getElementById('uploadedList');
   
	if (typeof window.FileReader === 'undefined') {
	 console.log("state.className = 'fail'");
	} else {
	 console.log("state.className = 'success'");
	}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
	
	upload.onchange = function (e) {
	
		 var file = upload.files[0];
		 var reader = new FileReader();
		 //p542다시 보기
	
		 //reader.onload start
		 reader.onload = function (event) {
			 var image = new Image();
			 image.src = event.target.result;
			  
			 uploadedList.innerHTML = '';
			 image.height = 150;
			 uploadedList.appendChild(image);
		 };//reader.onload end
		 
	 //img uploadedList에 추가 하는거 end //////////////////////////////////////////////////////////
	 //img 서버에 저장되도록 ajax start //////////////////////////////////////////////////////////  
			 event.preventDefault();
			 
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
				  	//alert(data);
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
		$("#uploadedList").empty();
		console.log("img File appended deleted");
		var fileName=$(this).attr("data-src");
		console.log(fileName);
		var uploadfilename = document.getElementById('uploadfilename');
		
		$.ajax({
			url:"deleteFile",
			type:"post",
			data : {fileName:$(this).attr("data-src")},
			dataType:"text",
			success:function(result){
				if(result=='deleted'){
					console.log("img File on server deleted");
					that.parent("div").remove();
					$('#uploadfilename').val('');
				}
			}
		});
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
	
});
</script>
<%@include file="../include/cfooter.jsp"%>