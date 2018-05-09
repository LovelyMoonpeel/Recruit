<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
df
<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 작성</h1>
	<form role="form" method="post">
	<%-- <input type='hidden' name='id' value="${PUserVO.id}"> 
 	 <input type='hidden' name='pw' value="${PUserVO.pw}">
	 <input type='hidden' name='pname' value="${PUserVO.pname}">
	 <input type='hidden' name='email' value="${PUserVO.email}">
	 <input type='hidden' name='birth' value="${PUserVO.birth}"> --%>
	 
		<br>	
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
               
             </tbody>
         </table>
               
    <!-- ------------------------------------------------------handlebar로 수정1 -->
   <hr style="border: solid 4px #ccc;">
	<h4>
		<b>연락처 목록</b>
	</h4>
	<div id="tel_div"></div>
	<hr style="border: solid 4px #ccc;">
	
	<!-- a.code 03/19 : 연락처 목록을  handlebars(template_tel)로 적용 -->
    <!-- ------------------------------------------------------handlebar로 수정1 종료 -->
    <!-- ------------------------------------------------------handlebar로 수정2 -->
    <hr style="border: solid 4px #ccc;">
	<h4>
		<b>사이트 목록</b>
	</h4>
	<div id="web_div"></div>
	<hr style="border: solid 4px #ccc;">
   <!-- ------------------------------------------------------handlebar로 수정2 종료 -->     
   <!-- ------------------------------------------------------handlebar로 수정3 -->  
   <hr style="border: solid 4px #ccc;">
	<h4>
		<b>보유 자격증 목록</b>
	</h4>
	<div id="license_div"></div>
	<hr style="border: solid 4px #ccc;">
   <!-- ------------------------------------------------------handlebar로 수정3 종료 -->    
    <!-- ------------------------------------------------------handlebar로 수정4 -->  
   <hr style="border: solid 4px #ccc;">
	<h4>
		<b>어학 능력(자격증) 목록</b>
	</h4>
	<div id="language_div"></div>
	<hr style="border: solid 4px #ccc;">
   <!-- ------------------------------------------------------handlebar로 수정4 종료 -->    
     <div class="table-responsive">
       <table class="table table-bordered">
          <tbody>
            <tr>
               <th class="table-active" colspan="5" scope="row" style="text-align: center;">자기소개서</th>
            </tr> 
            <tr>
             <td colspan="5" rowspan="2">
               	<div class="form-group">
				<textarea class="form-control" rows="13" id="coverletter" name="coverletter" style = "resize:none;" required>${ResumeVO.coverletter}</textarea>
				</div>
             </td>   
            </tr>
           </tbody>
       </table>      
    </div>
      </div>
   </div>
   <br>
   	</form>
		<button id="write-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';" type="button">취소</button>
</div>

<script id="template_tel" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">

	<input type="hidden" class="form-control telid" value="{{telid}}"></input>
	<input type="hidden" class="form-control rid telclass" name="ptelvolist[].rid" placeholder="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="teltitle">전화번호 (종류)</label> 
		<input class="form-control teltitle telclass" name="ptelvolist[].teltitle" placeholder="{{teltitle}}"></input>
	</div>
	
	<div class="form-group col-md-4">
		<label for="tel">전화번호</label> 
		<input class="form-control tel telclass" name="ptelvolist[].tel" placeholder="{{tel}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label>추가/삭제</label>
		<br>
		<button class="btn btn-default btn-sm tel_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm tel_minus_btn" type="button"
			onclick="$(this).closest('.row').remove();">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>

<script id="template_web" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control webid" value="{{webid}}"></input>
	<input type="hidden" class="form-control webclass rid" name="pwebsitesvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-3">
		<label for="webtitle">사이트 (종류)</label> 
		<input class="form-control webtitle webclass" name= "pwebsitesvolist[].webtitle" value="{{webtitle}}"> </input>
	</div>

	<div class="form-group col-md-4">
		<label for="webadd">주소</label> 
		<input class="form-control webadd webclass" name="pwebsitesvolist[].webadd" value="{{webadd}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label>추가/삭제</label><br />
		<button class="btn btn-default btn-sm web_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm web_minus_btn" type="button"
			onclick="$(this).closest('.row').remove();">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>

</div>
<!-- end of row -->
</script>
 <script id="template_license" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control licenseid" value="{{licenseid}}"></input>
	<input type="hidden" class="form-control rid licenseclass" name="rlicensevolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="licensename">자격증명</label> 
		<input class="form-control licensename licenseclass" name="rlicensevolist[].licensename" placeholder="{{licensename}}"></input>
	</div>

	<div class="form-group col-md-4">
		<label for="publeoffice">발행기관</label> 
		<input class="form-control publeoffice licenseclass" name="rlicensevolist[].publeoffice" placeholder="{{publeoffice}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label for="acquidate">취득일자</label> 
		<input class="form-control acquidate licenseclass" name="rlicensevolist[].acquidate" placeholder="{{acquidate}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label>추가/삭제</label><br/>
		<button class="btn btn-default btn-sm license_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm license_minus_btn" type="button"
			onclick="$(this).closest('.row').remove();">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>

</div>
<!-- end of row -->
</script>           
            
 <script id="template_language" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control id" value="{{id}}"></input>
	<input type="hidden" class="form-control rid langclass" name="rlangvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-2">
		<label for="lid">언어 선택</label>
		<select class="form-control lid langclass" name="rlangvolist[].lid" >
			{{#select lid}}
			<option value="102" selected>선택</option>
			<option value="52">영어</option>
			<option value="53">일본어</option>
			<option value="54">중국어</option>
			<option value="55">그리스어</option>
			<option value="56">네덜란드어</option>
			<option value="57">노르웨이어</option>
			<option value="58">독일어</option>
			<option value="59">러시아어</option>
			<option value="60">루마니아어</option>
			<option value="61">마인어</option>
			<option value="62">몽골어</option>
			<option value="63">미얀마어</option>
			<option value="64">베트남어</option>
			<option value="65">세르비아어</option>
			<option value="66">스웨덴어</option>
			<option value="67">스페인어</option>
			<option value="68">슬로바키아어</option>
			<option value="69">아랍어</option>
			<option value="70">유고어</option>
			<option value="71">이란(페르시아어)</option>
			<option value="72">이탈리아어</option>
			<option value="73">체코어</option>
			<option value="74">태국어</option>
			<option value="75">터키어</option>
			<option value="76">포르투갈어</option>
			<option value="77">폴란드어</option>
			<option value="78">프랑스어</option>
			<option value="79">헝가리어</option>
			<option value="80">히브리어</option>
			<option value="81">히브리어</option>
			<option value="82">그 외</option>
			{{/select}}
		</select>
	</div>
	
	<div class="form-group col-md-2">
		<label for="test">공인인증시험명</label> 
		<input class="form-control test langclass" name="rlangvolist[].test" value="{{test}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label for="score">점수</label> 
		<input class="form-control score langclass" name="rlangvolist[].score" value="{{score}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label for="publeoffice">발행기관</label> 
		<input class="form-control publeoffice langclass" name="rlangvolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label for="acquidate">취득일자</label> 
		<input class="form-control acquidate langclass" name="rlangvolist[].acquidate" value="{{acquidate}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label>추가/삭제</label><br/>
		<button class="btn btn-default btn-sm lang_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm lang_minus_btn" type="button"
			onclick="$(this).closest('.row').remove();">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->

</script>

  <br>
  <br>

<script type='text/javascript'>
$(document).ready(function(){
   
	Handlebars.registerHelper('select', function( value, options ){
        var $el = $('<select />').html( options.fn(this) );
        $el.find('[value="' + value + '"]').attr({'selected':'selected'});
        return $el.html();
    });
	
	
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
   
   $("#write-success").on("click", function(){
      formObj.attr("action", "/personal/write");
      formObj.attr("method", "post");
      numberingList();
      formObj.submit();
   });
   
  ////////////img uploadedList start//////////////////////////////////////////////////////////
  // var upload = document.getElementsByTagName('input')[0];
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
			  // img.width = 200;
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
		//$("#uploadedList").remove();
		$("#uploadedList").empty();
		console.log("img File appended deleted");
		
		$.ajax({
			url:"deleteFile",
			type:"post",
			data : {fileName:$(this).attr("data-src")},
			dataType:"text",
			succss:function(result){
				if(result=='deleted'){
					console.log("img File on server eleted");
					that.parent("div").remove();
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
	
	function numberingList() {
			$(".telclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		});
			 $(".webclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 16) + parseInt(index/num) + name.substring(16);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
		 $(".langclass").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 12) + parseInt(index/num) + name.substring(12);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
		$(".licenseclass").each(function(index){
			var num = 4;
			var name = $(this).attr("name");
			name = name.substring(0, 15) + parseInt(index/num) + name.substring(15);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
	}
	
	// tel 추가버튼 이벤트
	$("#tel_div").on("click", ".tel_plus_btn", function(){
		/* var item = {
				rid : ${ResumeVO.bno}
			}; */
		add_tel(item);
	});
	
	function add_tel(item) {
		var source_tel = $("#template_tel").html();
		var template_tel = Handlebars.compile(source_tel);
		$("#tel_div").append(template_tel(item));
	}
	function tel_list() {
		
		var item = {
				//rid :  ${ResumeVO.bno},
				teltitle : "${PTelVO.teltitle}", 
				tel : "${PTelVO.tel}" 
				};
		add_tel(item);
		
	}
	
	//웹 추가 버튼 이벤트
	$("#web_div").on("click", ".web_plus_btn", function(){
		var item = {
				//rid : ${ResumeVO.bno}
			}
		add_web(item);
	});
	
	function add_web(item) {
		var source_web = $("#template_web").html();
		var template_web = Handlebars.compile(source_web);
		$("#web_div").append(template_web(item));
	}
	function web_list() {
			var item = {
					//rid :  ${ResumeVO.bno},
					webtitle : "", 
					webadd : ""
			}
			add_web(item);
	}
	//자격증 추가 버튼 이벤트
	$("#license_div").on("click", ".license_plus_btn", function(){
		var item = {
				//rid : ${ResumeVO.bno}
		}
			
		add_license(item);
	});
	
	function add_license(item) {
		var source_license = $("#template_license").html();
		var template_license = Handlebars.compile(source_license);
		$("#license_div").append(template_license(item));
	}
	function license_list() {
			var item = {
					//rid :  "${ResumeVO.bno}",
					licensename : "", 
					publeoffice : "",
					acquidate : ""
			};
			add_license(item);
	}
	//언어 추가 버튼 이벤트
	$("#language_div").on("click", ".lang_plus_btn", function(){
		var item = {
				//rid : ${ResumeVO.bno}
			};
		add_language(item);
	});
	
	function add_language(item) {
		var source_language = $("#template_language").html();
		var template_language = Handlebars.compile(source_language);
		$("#language_div").append(template_language(item));
	}
	function language_list() {
			var item = {
					//rid :  ${ResumeVO.bno},
					//lid : ${ResumeLanguageVO.lid},
					test : "", 
					score : "",
					publeoffice : "",
					acquidate : ""
			};
			add_language(item);
	}
	
	tel_list();
	web_list();
	license_list();
	language_list();
	
});
</script>
<%@include file="../include/cfooter.jsp"%>