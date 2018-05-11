<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../include/aheader.jsp"%>

<!-- picker : https://lalwr.blogspot.kr/2016/04/bootstrap-datepicker.html -->
<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>

<style>
#map {
	width: 100%;
	height: 300px;
}

.controls {
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}
#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 300px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

.pac-container {
	font-family: Roboto;
}

#type-selector {
	color: #fff;
	background-color: #4d90fe;
	padding: 5px 11px 0px 11px;
}

#type-selector label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

#target {
	width: 345px;
}
</style>

<!-- 기업정보수정 페이지 -->
<!-- <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main"> -->
<div class="col-md-9">



	<h1>기업정보 수정</h1>
	<form role="form" action="A_cmodify" method="POST">
     <input type='hidden' name='page' value="${cri.page}">
     <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
     <input type='hidden' name='searchType' value="${cri.searchType}">
     <input type='hidden' name='keyword' value="${cri.keyword}">
		<table class="table table-bordered">
			<tr>
				<th style="padding-top:22px;">ID</th>
				<td>
					<input class="form-control" type="text" id="userid" name="id" value="${UserVO.id}" readonly>
					<input type="hidden" name="userid" value="${UserVO.id}">
				</td>
			</tr>
			<tr>
				<th style="padding-top:22px;">비밀번호</th>
				<td>
				<div class="form-group" id="PWDiv" style="margin-bottom:0;">
	                    <input type="password" class="form-control" id='pw' name='pw' 
	                    	data-rule-required="true" data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top"  placeholder="변경할 비밀번호를 입력하세요." maxlength="30">
	               		<span class="glyphicon glyphicon-remove form-control-feedback" 
	               			id="PWXIcon" aria-hidden="true" style="visibility:hidden"></span>
	  				 	<span class="glyphicon glyphicon-ok form-control-feedback" 
	  				 		id="PWOKIcon" aria-hidden="true" style="visibility:hidden"></span> 
	            	</div>
				<%-- <input class="form-control" type="password" name="pw" id="pw"
					placeholder="변경할 비밀번호를 입력하세요." value="${UserVO.pw}" required> --%>
				</td>
			</tr>
			<tr>
				<th style="padding-top:22px;">비밀번호확인</th>
				<td>
					<div class="form-group" id="PWCDiv" style="margin-bottom:0;">
                    	<input type="password" class="form-control" id="pwc" data-rule-required="true" placeholder="비밀번호를 다시 입력하세요." 
                    		data-toggle="popover" data-trigger="focus" data-content="" data-placement="auto top" maxlength="30">
                		<span class="glyphicon glyphicon-remove form-control-feedback" 
                			id="PWCXIcon" aria-hidden="true" style="visibility:hidden"></span>
  				 		<span class="glyphicon glyphicon-ok form-control-feedback" 
  				 			id="PWCOKIcon" aria-hidden="true" style="visibility:hidden"></span>
            		</div>
				<!-- <input class="form-control" type="password" name="pwc" id="pwc"
					placeholder="비밀번호를 다시 입력하세요." required>
				<span id="pwchk"></span> -->				
				</td>
			</tr>
			<tr>
				<th style="padding-top:22px;">회사명</th>
				<td><input class="form-control" type="text" name="cname" value="${UserVO.cname}"></td>
			</tr>
			<tr>
				<th style="padding-top:22px;">이름</th>
				<td><input class="form-control" type="text" name="pname" value="${UserVO.pname}" required></td>
			</tr>
			<%-- <tr>
				<th>담당자 연락처</th>
				<td><input class="form-control" type="text" name="phone" value="${CInfoVO.phone}" required></td>
			</tr> --%>
			<tr>
				<th style="padding-top:22px;">E-mail</th>
				<td><input class="form-control" type="text" name="email"
					value="${UserVO.email}" required></td>
			</tr>
			<tr>
				<th style="padding-top:22px;">사업자등록번호</th>
				<td><input class="form-control" type="text" name="registnum"
					value="${UserVO.registnum}" required maxlength="10"></td>
			</tr>
			<tr>
				<th height="63"  style="padding-top:22px;">이메일 인증</th>
					<c:choose>
					<c:when test="${UserVO.authCode eq null}">
					<td style="padding-top: 20px;padding-left: 15px;">
						<div id="authDiv">인증완료</div>
					</td>
					</c:when>
					<c:otherwise>
					<td style="padding-top: 15px;padding-left: 15px;" id="emailCheck">
						<div id="authDiv">인증이 필요합니다.&nbsp;&nbsp;<button type="button" class="btn btn-info" id="emailAuth">인증</button></div>
					</td>
					</c:otherwise>
					</c:choose>
			</tr>
		</table>
	
	<!-- 기업기본정보 -->
	<h2>기업기본정보</h2>
	<table class="table table-bordered">
		<tr>
			<th>
				기업로고
			</th>
			<td>
				<div id='uploadedList' style='width: 127px; height: 152px;'>
					<img id='imgsrc' height="152px;" alt="${CInfoVO.img}" />
				</div>
	
				<div>
					<input id='imgsrccheck' type='hidden' value="${CInfoVO.img}" />
					<input type='hidden' id='uploadfilename' name='img' value="${CInfoVO.img}"> <br>
				</div>
	
				<div>
					<input type='file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
					<input type='hidden' id='xornot' value='0'> 
					<input type='hidden' id='preexistenceimg' value='0'> 
						
				</div>
			</td>
		</tr>
		<tr>
			<th>기업소개</th>
			<td colspan="3"><textarea class="form-control" cols="7" rows="10" name="intro" style="resize: none;">${CInfoVO.intro}</textarea></td>
		</tr>
		<tr>
			<th>기업명</th>
			<td><input class="form-control" type="text" value="${CInfoVO.cname}" readonly></td>
			<th>대표자명</th>
			<td><input class="form-control" type="text" name="ceo" value="${CInfoVO.ceo}"></td>
		</tr>
		<tr> 
			<th>업종</th>
			<td colspan="3"><input class="form-control" type="text" name="ctype" value="${CInfoVO.ctype}"></td>
		</tr>
		<tr>
			<th>기업형태</th>
			<td colspan="3"><input class="form-control" type="text" name="form" value="${CInfoVO.form}"></td>
		</tr>
		<tr>
			<th>설립일</th>
			<td>
				<div class="input-group date" data-provide="datepicker">
					<input class="form-control" type="text" name="establish" value="${CInfoVO.establish}">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
						</span>
				</div>
			</td>
			<th>사원수</th>
			<td colspan="3"><input class="form-control" type="text" name="numemp" value="${CInfoVO.numemp}"></td>
		</tr>
		<tr>
			<th>매출액</th>
			<td colspan="3"><input class="form-control" type="text" name="sales" value="${CInfoVO.sales}"></td>
		</tr>
		<tr>
			<th>대표전화</th>
			<td><input class="form-control" type="text" name="tel" value="${CInfoVO.tel}"></td>
			<th>FAX</th>
			<td><input class="form-control" type="text" name="fax" value="${CInfoVO.fax}"></td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td><input class="form-control" type="text" name="homepage" value="${CInfoVO.homepage}"></td>
			<th>SNS / 블로그</th>
			<td><input class="form-control" type="text" name="sns" value="${CInfoVO.sns}"></td>
		</tr>
		<tr>
			<th>기업주소</th>
			<td colspan="3"><label>기업주소</label>
				<input id="pac-input" class="controls" type="text" placeholder="Search Box">
				<input type="hidden" name="lat" id="lat">
				<input type="hidden" name="lng" id="lng">
				<input type="hidden" name="location" id="test">
				<div id="map"></div>
			</td>
		</tr>
	</table>
	<!-- //기업기본정보 -->
	</form>
		<input type="submit" class="btn btn-warning" value="수정">
		<input type="submit" class="btn btn-danger" value="삭제">
		<input type="submit" class="btn btn-primary" value="목록">
	
	<!-- 이미지 모달 -->
	<div class="modal" id="ORIGINAL_modal">
		<div class="modal-dialog modal-dialog-centered">

			<div class="modal-content modal-dialog-centered">
				<div class="modal-head"
					style="text-align: center; vertical-align: middle; margin: 10px;">
					<br>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 10px;">&times;</button>
					이미지 크게 보기
				</div>

				<div class="modal-body modal-dialog-centered">

					<!--x표시 누르면 창 사라지게 하는 코드 -->
					<div class="row"
						style="border: solid 3px #ccc; padding: 10px; margin: 10px;">
						<img id="modal_get_Imgname1" style="width: 100%; height: auto;">
					</div>
				</div>
				<!--//class="modal-body"  -->
			</div>
			<!--//class="modal-content"-->
		</div>
		<!--//modal-dialog -->
	</div>
	<!-- //이미지 모달 -->
	
	<!-- 이력서 보기  -->
	<h1>채용공고 수정</h1>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>채용공고 제목</th>
			<th>수정</th>
		</tr>
		
	<c:forEach items="${recruitList}" var="RecruitVO">
	
		<tr>
			<td>${RecruitVO.bno}</td>
			<td>${RecruitVO.title}</td>
			<td><input type="button" class="btn btn-success" onclick="location.href='/admin/rmodify?id=${UserVO.id}&bno=${RecruitVO.bno}'" value="채용공고수정"></td>
		</tr>
	</c:forEach>
	</table>
	<!-- //이력서 보기 -->
</div>
<!-- //기업정보수정 페이지 -->

<!-- 비밀번호 일치 여부  -->
<script>
/* keyup을 통해 비밀번호가 맞는지 확인하는 작업 */
var pwchk = $('#pwchk');
var pwcheck = "ok";
var pwReg = /^[A-Za-z0-9]{1,20}$/;
var expReg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{1,20}/i;

function PWCXcheck(){
	$("#PWCDiv").removeClass();
	$("#PWCOKIcon").css("visibility","hidden");
	$("#PWCDiv").addClass("form-group has-error has-feedback"); 
	$("#PWCXIcon").css("visibility","visible");
	$("#pwc").attr("data-content", "사용 불가능한 비밀번호 입니다.");
	$("#pwc").focusout();
	$("#pwc").focus();
	pwcheck = "no";
}

function PWXcheck(){
	$("#PWDiv").removeClass();
	$("#PWOKIcon").css("visibility","hidden");
	$("#PWDiv").addClass("form-group has-error has-feedback"); 
	$("#PWXIcon").css("visibility","visible");
	$("#pw").attr("data-content", "사용 불가능한 비밀번호 입니다.");
	$("#pw").focusout();
	$("#pw").focus();
	pwcheck = "no";
}

function PWCOcheck(){
	$("#PWCDiv").removeClass();
	$("#PWCXIcon").css("visibility","hidden");
	$("#PWCDiv").addClass("form-group has-success has-feedback"); 
	$("#PWCOKIcon").css("visibility","visible");
	$("#pwc").attr("data-content", "사용 가능한 비밀번호 입니다.");
	$("#pwc").focusout();
	$("#pwc").focus();
	pwcheck = "ok";
}

function PWOcheck(){
	$("#PWDiv").removeClass();
	$("#PWXIcon").css("visibility","hidden");
	$("#PWDiv").addClass("form-group has-success has-feedback"); 
	$("#PWOKIcon").css("visibility","visible");
	$("#pw").attr("data-content", "사용 가능한 비밀번호 입니다.");
	$("#pw").focusout();
	$("#pw").focus();
	pwcheck = "ok";
}

$('#pwc').keyup(function(){	
	var pwcval = $('#pwc').val();
	var pwval = $('#pw').val();
	
	//1. 대소문자, 숫자가 들어왔는가
	if(pwReg.test(pwcval)){
		//2. 공백이나 특수문자가 들어왔는가
		if(pwcval.search(/\s/) == -1 || !pexpReg.test(pwcval)){
			//3. 길이가 일치하는가
			if(pwcval.length > 5 && pwcval.length <= 20){
				//4. 두개의 값이 같은가
				if(pwval == pwcval){
					PWOcheck();
					PWCOcheck();
				}else{
					PWCXcheck();
				}
			}else{
				PWCXcheck();
			}
		}else{
			PWCXcheck();
		}
	}else{
		PWCXcheck();
	}
})


$('#pw').keyup(function(){
	var pwval = $('#pw').val();
	var pwcval = $('#pwc').val();
	
	//1. 대소문자, 숫자가 들어왔는가
	if(pwReg.test(pwval)){
		//2. 공백이나 특수문자가 들어왔는가
		if(pwcval.search(/\s/) == -1 || !pexpReg.test(pwval)){
			//3. 길이가 일치하는가
			if(pwval.length > 5 && pwval.length <= 20){					
				//4. 두개의 값이 같은가
				if(pwcval.length != 0){
					if(pwval == pwcval){
						PWCOcheck();
						PWOcheck();
					}else{
						if(pwcval.length>0){
							PWCXcheck();							
						}
						PWXcheck();
					}						
				}else{
					PWOcheck();						
				}
			}else{
				if($("#PWCDiv").hasClass("has-success")){
					PWCXcheck();
				}
				PWXcheck();
			}
		}else{
			if($("#PWCDiv").hasClass("has-success")){
				PWCXcheck();
			}
			PWXcheck();
		}
	}else{
		if($("#PWCDiv").hasClass("has-success")){
			PWCXcheck();
		}
		PWXcheck();
	}
	
})
</script>
<!-- //비밀번호 일치 여부  -->

<!-- 버튼에 대한 스크립트  -->
<script type="text/javascript">

$(function(){
	var formObj = $("form[role='form']");
	
	//console.log(formObj);
	/* 수정버튼 */
	$(".btn-warning").on("click", function(){
		if($('#birth').val()==''){
			console.log("#birth.val()==''");
			$('#birth').val("0000-00-00");
		}
		
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();
		
		if(pw==pwc){
			if(confirm("수정하시겠습니까?")){
				if(pwcheck=="ok"){
					formObj.submit();
				}else{
					alert("비밀번호를 확인해주세요.");
				}
			}
		}else{
			alert("비밀번호를 확인해주세요.");
		}
	});
	
	/* 기업 회원 계정 삭제버튼 */
	$(".btn-danger").on("click", function(){
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();
		
		if(pw==pwc){
			if(confirm("삭제하시겠습니까?")){
				formObj.attr("action", "/admin/cremove");
				formObj.submit();
			}
		}else{
			alert("비밀번호를 확인해주세요.");
		}
	});
	
	/* 기업회원 목록으로 */
	$(".btn-primary").on("click", function(){
		self.location = "/admin/company?page=${cri.page}&perPageNum=${cri.perPageNum}"
			+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
	$("#emailAuth").on("click", function(){
		if(confirm("이메일 인증을 하시겠습니까?")){
			var id = $("#userid").val();
			
			$.ajax({
				type:'put',
				url:'/admin/emailAuth',
				headers:{
					"Content-Type": "application/json; charset=UTF-8",
					"X-HTTP-Method-Override":"PUT"},
				data:JSON.stringify({id:id}),
				dataType:'text',
				success:function(result){
					if(result == 'success'){
						alert("이메일 인증이 완료되었습니다.");
						document.getElementById("authDiv").innerHTML = "인증완료";
						$("#emailCheck").css("padding-top", "20px");
					}
				}});			
		}
	});
});
</script>
<!-- //버튼에 대한 스크립트  -->

<script>
var xornot = document.getElementById('xornot');
var preexistenceimg = document.getElementById('preexistenceimg');
    if ($('#imgsrccheck').val() != "") {
        console.log(" val이 널값아님");
        
        $('#imgsrc').attr("src", 'C_displayFile?fileName=${CInfoVO.img}');   // 문> .attr(attributeName, value)는 해당 요소의 속성(attributeName)의 값을 변경시킨다.
        console.log("이미지 주소: "+'${CInfoVO.img}');
           
        var str = "";     
       	str = "<a id='ORIGINAL'>크게보기</a>"+"<small data-src=${CInfoVO.img}>X</small>";
        
        $("#uploadedList").append(str);     
        $("#ORIGINAL").on("click", function() {
        	var src = "C_displayFile?fileName=${CInfoVO.img}";
            $("#ORIGINAL_modal").modal();
            $("#modal_get_Imgname1").attr("src", src);
        });
        
        $("#preexistenceimg").val("1");
    } else {
        console.log(" val이 널값이다");
        $('#imgsrc').attr("src", 'C_displayFile?fileName=/NoImage.png');
        $('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
        $("#preexistenceimg").val("0");
      
    }
    var upload = document.getElementById('fileupload'); 
    var uploadedList = document.getElementById('uploadedList');
    
    if (typeof window.FileReader === 'undefined') {     // 소연> fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
        console.log("window.FileReader 'fail'");
    } else {
        console.log("★★★★★★★★  window.FileReader 'success'  ★★★★★★★");
    } 
	
    upload.onchange = function(e) {
        var file = upload.files[0];
        var reader = new FileReader();
        
        reader.onload = function(event) {     //reader.onload start
            var image = new Image();
            image.src = event.target.result;
            uploadedList.innerHTML = '';
            image.height = 150;
            uploadedList.appendChild(image);
        };     //reader.onload end
        //img uploadedList에 추가 하는거 end //////////////////////////////////////////////////////////
        //img 서버에 저장되도록 ajax start //////////////////////////////////////////////////////////  
        event.preventDefault();
        console.log("file name");
        console.log(file);
        var formData = new FormData();
        formData.append("file", file);
        $.ajax({
            url : '/admin/C_uploadAjax',
            data : formData,
            dataType : 'text',
            processData : false,
            contentType : false,
            type : 'POST',
            success : function(data) {
                var str = "";
                console.log("★data: "+data);
                str = "<a id='ORIGINAL'>크게보기</a>"
                        + "<small data-src="+data+">X</small>";
                $("#uploadedList").append(str);
                
                $("#ORIGINAL").on("click", function() {
                    console.log("ORIGINAL click");
                    console.log("★★data: " + data);
                    console.log(getImageLink(data));
                    var src = "displayFile?fileName=" + data;
                    $("#ORIGINAL_modal").modal();
                    $("#modal_get_Imgname1").attr("src", src);
                });
                document.getElementById('uploadfilename').value = data;
            }//success : function(data){ end
        });//ajax end
        //});//filedrop end
        console.log(file);
        reader.readAsDataURL(file);
    };//upload change end
    
    //★★★ X버튼 ★★★
    $("#uploadedList").on("click", "small", function(event) {
        event.preventDefault();
        
        var that = $(this);
       
        
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
</script>

<!-- 알림처리 -->
<script>
var result = '${msg}';

if(result == 'remove'){
	alert("채용공고 삭제가 완료 되었습니다.");
}
</script>
<!-- //알림처리 -->

<script>
function initAutocomplete() {
	 
	 llat = "";
	 llng = "";
	 
	 llat1 = "<c:out value="${CInfoVO.lat}"/>";
	 llng1 = "<c:out value="${CInfoVO.lng}"/>";
	 
	 llat = Number(llat1);
	 llng = Number(llng1);
	 
	 
		 if("<c:out value="${CInfoVO.lat}"/>"==""){
			var map = new google.maps.Map(document.getElementById('map'), {
	        	
		          center: {lat: 37.49794199999999, lng: 127.02762099999995},
		          zoom: 13,
		          mapTypeId: 'roadmap'
		        });
		}else if("<c:out value="${CInfoVO.lat}"/>"!=""){ 
			 
			
			
			var map = new google.maps.Map(document.getElementById('map'), {
		        	
		          center: {lat: llat, lng: llng},
		          zoom: 13,
		          mapTypeId: 'roadmap'
		        });
		}
		
       
        
        

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));
            
            var lat = place.geometry.location.lat()
            var lng = place.geometry.location.lng()
				
           		$("#lat").attr("value","");
            	$("#lng").attr("value","");
            	
            	$("#lat").attr("value",lat);
            	$("#lng").attr("value",lng);
			
				
            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
        
        map.addListener('click', function(event) {
        	
        	
            deleteMarkers();
        
            addMarker(event.latLng);
        
           
           
          });
        
        function addMarker(location) {
    	    var marker = new google.maps.Marker({
    	      position: location,
    	      map: map
    	    });
    	 	
    	    
    	    
    	    markers.push(marker);
    	    
    	    var lat = location.lat();
            var lng = location.lng();
				
           		$("#lat").attr("value","");
            	$("#lng").attr("value","");
            	
            	$("#lat").attr("value",lat);
            	$("#lng").attr("value",lng);
            
            	
           		
           		locations();
           		
    	  }
    	  
    	//Sets the map on all markers in the array.
    	  function setMapOnAll(map) {
    	    for (var i = 0; i < markers.length; i++) {
    	      markers[i].setMap(map);
    	    }
    	  }
    	  
    	  function deleteMarkers() {
    	      clearMarkers();
    	      markers = [];
    	    }
    	  
    	  function clearMarkers() {
    	      setMapOnAll(null);
    	  }
    	 
          addMarker(map.center);
          
      } 
 
 </script>
 
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=255f0ac190064fdd43c712921a3fbb03&libraries=services"></script>
 
 
 <script>
 function locations(){
	 
	 
	 
	 	var lat = $("#lat").val();
   	 
		var lng = $("#lng").val();
		
		var 
		 mapOption = {
		            center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		            level: 1 // 지도의 확대 레벨
		        };
		 
		 var geocoder = new daum.maps.services.Geocoder();
		 
		 var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	        infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	    // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	  
	        searchDetailAddrFromCoords(mapOption.center, function(result, status) {

	        	
	        	var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	             detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	             
	
             
	        	
	        	
			$("#test").attr("value",result[0].address.address_name);
	           
	        });
	  

	    function searchDetailAddrFromCoords(coords, callback) {
	        // 좌표로 법정동 상세 주소 정보를 요청합니다
	        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	    }

	    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	    function displayCenterInfo(result, status) {
	        if (status === daum.maps.services.Status.OK) {
	            var infoDiv = document.getElementById('centerAddr');

	            for(var i = 0; i < result.length; i++) {
	                // 행정동의 region_type 값은 'H' 이므로
	                if (result[i].region_type === 'H') {
	                    infoDiv.innerHTML = result[i].address_name;
	                    break;
	                }
	            }
	        }
	    }
		 
 }
 
    </script> <!-- 구글 maps api -->

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3xjt6_kAjGLYyJN4Mjvd_3coDo3nB7tg&libraries=places&callback=initAutocomplete"
    async defer></script> <!--api 스크립트 -->
    
<script>
var result = '${msg}';

if(result == 'modify'){
	alert("수정 처리가 완료 되었습니다.");
}
</script>

<%@include file="../include/cfooter.jsp"%>