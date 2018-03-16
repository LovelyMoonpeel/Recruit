<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/pheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css"
	href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<!-- Main content -->

<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 수정</h1>
	<form role="form" method="post">
		<br>
			<input type="text" class="form-control" id="bno" name="bno" value="ResumeVO의 bno값 : ${ResumeVO.bno}" readonly> 
			<input type="text" class="form-control" id="userid" name="userid" value="ResumeVO의 userid값  : ${ResumeVO.userid}" readonly> 
			<input type="text" class="form-control" id="id" name="id" value="PUserVO의 id값  : ${PUserVO.id}" readonly>
		<br>	
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title" name="title" value="${ResumeVO.title}">
		</div>
		<div class="form-group">
			<label for="pname">이름</label> <input type="text" class="form-control" id="pname" name="pname" value="${PUserVO.pname}">
		</div>
		<div class="form-group">
			<label for="img">사진</label>
			<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
     		<input type = 'hidden' id='uploadfilename' name = 'img' >
		</div>
		<div class="form-group">
			<!-- ☆google search : datepicker -->
			<!--   <div class="form-group col-lg-6"> -->
			<label>생년월일</label>
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="form-control" id="" name="birth" value="${PUserVO.birth}"> 
				<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
			<!--  </div>  -->
		</div>
		<div class="form-group">
			<label for="email">이메일</label> 
			<input type="text" class="form-control" id="email" name="email" value="${PUserVO.email}">
		</div>
		<div class="form-group">
			<label for="teltitle">전화번호(종류)</label> 
			<input type="text" class="form-control" id="teltitle" name="teltitle" value="${PTelVO.teltitle}">
		</div>
		<div class="form-group">
			<label for="tel">전화번호</label> 
			<input type="text" class="form-control" id="tel" name="tel" value="${PTelVO.tel}">
		</div>
		<div class="form-group">
			<label for="webtitle">웹사이트(종류)</label> 
			<input type="text" class="form-control" id="webtitle" name="webtitle" value="${PWebSiteVO.title}">
		</div>
		<div class="form-group">
			<label for="webadd">웹사이트</label> 
			<input type="text" class="form-control" id="webadd" name="webadd" value="${PWebSiteVO.webadd}">
		</div>
		<div class="form-group">
			<label for="address">주소</label> 
			<input class="form-control" id="address" name="address" value="${ResumeVO.address}"></input>
		</div>
		<div class="form-group">
			<label for="postcode">우편번호</label> 
			<input class="form-control"	id="postcode" name="postcode" value="${ResumeVO.postcode}"></input>
		</div>		
		
		<div class="form-group">
			<label for="schoolname">학교명</label> 
			<input class="form-control"	id="schoolname" name="schoolname" value="${ResumeEduVO.schoolname}"></input>
		</div>
		<div class="form-group">
			<label for="major">학과</label> 
			<input class="form-control" id="major" name="major" value="${ResumeEduVO.major}"></input>
		</div>
		<div class="form-group">
			<label for="enterdate">입학일</label> 
			<input class="form-control" id="enterdate" name="enterdate" value="${ResumeEduVO.enterdate}"></input>
		</div>
		<div class="form-group">
			<label for="gradudate">졸업일</label> 
			<input class="form-control" id="gradudate" name="gradudate" value="${ResumeEduVO.gradudate}"></input>
		</div>
		<div class="form-group">
			<label for="edustatus">졸업상태</label> 
			<input class="form-control" id="edustatus" name="edustatus" value="${ResumeEduVO.edustatus}"></input>
		</div>		
		
		<div class="form-group">
			<label for="cname">회사명</label> 
			<input class="form-control" id="cname" name="cname" value="${ResumeCareerVO.cname}"></input>
		</div>
		<div class="form-group">
			<label for="jobdescription">담당업무</label> 
			<input class="form-control" id="jobdescription" name="jobdescription" value="${ResumeCareerVO.jobdescription}"></input>
		</div>
		<div class="form-group">
			<label for="startjob">입사일</label> 
			<input class="form-control" id="startjob" name="startjob" value="${ResumeCareerVO.startjob}"></input>
		</div>
		<div class="form-group">
			<label for="finishjob">퇴사일</label> 
			<input class="form-control" id="finishjob" name="finishjob" value="${ResumeCareerVO.finishjob}"></input>
		</div>
		<div class="form-group">
			<label for="salary">연봉</label> 
			<input class="form-control" id="salary" name="salary" value="${ResumeCareerVO.salary}"></input>
		</div>
				
		<div class="form-group">
			<label for="test">자격증명</label> 
			<input class="form-control" id="test" name="test" value="${RLicenseVO.test}"></input>
		</div>
		<div class="form-group">
			<label for="publeoffice">발행기관</label> 
			<input class="form-control" id="publeoffice" name="publeoffice" value="${RLicenseVO.publeoffice}"></input>
		</div>
		<div class="form-group">
			<label for="acquidate">취득일자</label> 
			<input class="form-control" id="acquidate" name="acquidate" value="${RLicenseVO.acquidate}"></input>
		</div>
		<div class="form-group">
			<label for="testname">공인인증시험명</label> 
			<input class="form-control" id="testname" name="testname" value="${ResumeLanguageVO.test}"></input>
		</div>
		<div class="form-group">
			<label for="score">점수</label> 
			<input class="form-control" id="score" name="score" value="${ResumeLanguageVO.score}"></input>
		</div>
		<div class="form-group">
			<label for="lanpubleoffice">발행기관</label> 
			<input class="form-control" id="lanpubleoffice" name="lanpubleoffice" value="${ResumeLanguageVO.publeoffice}"></input>
		</div>
		<div class="form-group">
			<label for="lanacquidate">취득일자</label> 
			<input class="form-control" id="lanacquidate" name="lanacquidate" value="${ResumeLanguageVO.acquidate}"></input>
		</div>	
						
		<!-- 셀렉션박스만들기!  -->			
		<div class="form-group">
			<label for="jobstateid">구직상태</label> 
			<select class="form-control" name="jobstateid" id="jobstateid"> 
				<c:forEach items="${CodeVOlist }" var="CodeVO">
					<c:if test="${CodeVO.tid == 6 }">
						<option value="${CodeVO.id }" <c:if test="${CodeVO.id == ResumeVO.jobstateid }">selected</c:if> > ${CodeVO.career } </option>
					</c:if>
				</c:forEach>
			</select>
		</div>
      
		<div class="form-group">
		<label for="jobgroupid">희망직종(대분류)</label> 
			<select id="jobGroup" class="form-control" name="jobgroupid">
				<option value="">모집직종</option>
				<c:forEach items="${JobGroupVOlist}" var="JobGroupVO">
					<option value="${JobGroupVO.id}">${JobGroupVO.jobgroup}</option>
				</c:forEach>
			</select> 			
			<label for="jobgroupid">희망직종(소분류)</label> 
			<select id="subjobGroup" class="form-control" name="jobgroupid2">
				<option value="">희망직종(소분류)</option>
			</select>
		</div>    	
      
		<div class="form-group">
		<label for="CodeList4">희망근무형태</label>
			<select class="form-control" name="employstatusid" id="employstatusid"> 
				<c:forEach items="${CodeVOlist }" var="CodeVO">
					<c:if test="${CodeVO.tid == 4 }">
						<option value="${CodeVO.id }" <c:if test="${CodeVO.id == ResumeVO.employstatusid }">selected</c:if> > ${CodeVO.career } </option>
					</c:if>
				</c:forEach>
			</select> 
		</div>

		<div class="form-group">	
		<label for="jobgroupid">희망근무지(시/도)(구현X)</label> 
			<select id="region" class="form-control" name='rgbid'>
				<option value="">희망근무지(시/도)(구현X)</option>
				<c:forEach items="${RegionVOlist}" var="RegionVO">
					<option value="${RegionVO.rgbid}">${RegionVO.rgbname}</option>
				</c:forEach>
			</select>
			<label for="jobgroupid">희망근무지(구현X)</label> 
			<select id="subRegion" class="form-control" name='rgsid'>
				<option value="">희망 근무지</option>
			</select>
		</div>
       
		<div class="form-group">
		<label for="CodeList7">희망연봉</label>
			<select class="form-control" name="salaryid" id="CodeList7">
				<c:forEach items="${CodeVOlist }" var="CodeVO">
					<c:if test="${CodeVO.tid == 7 }">
						<option value="${CodeVO.id }" <c:if test="${CodeVO.id == ResumeVO.salaryid }">selected</c:if> > ${CodeVO.career } </option>
					</c:if>
				</c:forEach>
			</select>
		</div>
      
      <!-- 셀렉션박스만들기 끝!!  -->

		<div class="form-group">
			<label for="coverletter">자기소개서</label>
			<textarea class="form-control" rows="10" id="coverletter" name="coverletter">${ResumeVO.coverletter}</textarea>
		</div>
			
		<button id="btn-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';" type="button">취소</button>
	</form>
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
         
         console.log($(this));
         
         fileName = $(this).attr("data-src"); //전역변수로 설정하기
         var front = fileName.substring(0, 12);
         var end = fileName.substring(12);
         
         fileName = front + "s_" + end;
         
         $("#fileupload").val("");
         $("#uploadedList").empty();
         //$("#fileupload").remove();
         console.log("img File appended deleted");
         
         $("#xornot").val("1");
         
       /*    $.ajax({
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
           */
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
      
      $("#btn-success").on("click", function() {
         if($("#xornot").val()==0){
            console.log("xornot.val()==0");
            console.log("사진 삭제 안함");
            
            formObj.attr("action", "/personal/Rmodify");
            formObj.attr("method", "post");
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
                     
                     /* console.log("ajax뒤로");
                     formObj.attr("action", "/personal/Rmodify");
                     formObj.attr("method", "post");
                     formObj.submit(); */
                  }
               }
            });
            formObj.attr("action", "/personal/Rmodify");
            formObj.attr("method", "post");
            formObj.submit();

         }
      });
   });
   
   $("#region").change(function() {
		var largeNum = $(this).val();
		SubRegion(largeNum)
	})
	$("#jobGroup").change(function() {
		var largeNum = $(this).val();
		SubJobGroup(largeNum);
	})
	function SubJobGroup(largeNum) {
		$.getJSON("/companyAjax/jobGroup/" + largeNum, function(data) {
			var str = "";
			$(data).each(
					function() {
						str += "<option name='jobgruopid' value="+this.id+">"
								+ this.jobgroup + "</option>";
					});
			$("#subjobGroup").html(str);
		})
	}
	function SubRegion(largeNum) {
		$.getJSON("/companyAjax/region/" + largeNum, function(data) {
			var str = "";
			$(data).each(
					function() {
						str += "<option name='rgsid' value="+this.rgsid+">" + this.rgsname
								+ "</option>";
					});
			$("#subRegion").html(str);
		})
	}
</script>
<%@include file="../include/cfooter.jsp"%>
