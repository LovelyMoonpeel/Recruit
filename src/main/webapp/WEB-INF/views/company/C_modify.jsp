<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@include file="../include/cheader.jsp"%>


<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script type="text/javascript" src="/resources/rpjt/js/upload.js"></script>

<!-- Main content -->
<!-- 기업 페이지 -->

<!-- 문> 파일 업로드할 때는 enctype 속성을 추가하고 속성값을 멀티파트 형식인 multipart/form-data로 지정해야 한다. -->
<form role="form" method="post" enctype="multipart/form-data">
	<div class="border border-primary col-md-9">

		<!-- 문> 왼쪽 사이드 바와 높이를 맞추기 위한 전략  -->
		<p class="lead">
			<strong>기업 정보 수정</strong>
		</p>

		<!-- 문> row를 안 붙이면 밑에 항목들과 다르게 위치가 세팅된다. 한마디로 열이 안 맞춰진다. -->
		<div class="row">
			<!-- 문> 이건 가로 길이  -->
			<div class="form-group col-lg-6">
				<label>기업 이미지</label>

				<!-- 문> 사진 틀의 가로와 세로 길이  -->
				<div id='uploadedList' style='width: 127px; height: 152px;'>
					<!-- 문> 여기서 height는 '회사정보수정'페이지에 뿌려주는 사진의 높이로 위에서 설정해준 틀에 맞게 써야 한다. 세로만 지정해도 가로도 자동으로 정해지는 듯  -->
					<img id='imgsrc' height="152px;" alt="${CInfoVO.img}" />
				</div>
					<input id='imgsrccheck' type='hidden' value="${CInfoVO.img}" /> 
							<!-- db에 있는 file img 이름 받아오는 hidden input -->
				<div>
					<!-- 문Q>디비에 있는 이미지 뿌려주는 거 같은데, hidden??  -->
					<input type='hidden' id='uploadfilename' name='img' value="${CInfoVO.img}"> <br>
				</div>

				<div>
					<!-- 문> 이건 파일 업로드 하는 버튼  -->
					<input type='file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">

					<!-- 문Q> 아래 두개 몰까? 지워도 상관없어서 일단 지움 -->
					<input type='hidden' id='xornot' value='0'> 
					<input type='hidden' id='preexistenceimg' value='0'> 
					
				</div>

			</div>
		</div>




		<div class="row">
			<div class="form-group col-lg-12">
				<label>기업소개</label>
				<textarea class="form-control" cols="7" rows="10" name="intro" style="resize: none;">${CInfoVO.intro}</textarea>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>기업명</label> <input type="text" name="cname" class="form-control" value="${CInfoVO.cname}" readonly>
			</div>
			<div class="form-group col-lg-6">
				<label>대표자명</label> <input type="text" name="ceo" class="form-control" value="${CInfoVO.ceo}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>업종</label> <input type="text" name="ctype" class="form-control" value="${CInfoVO.ctype}">
			</div>
			<div class="form-group col-lg-6">
				<label>기업형태</label> <input type="text" name="form" class="form-control" value="${CInfoVO.form}">
			</div>
		</div>


		<!-- ☆google search : datepicker -->
		<div class="row">
			<div class="form-group col-lg-6">
				<label>설립일</label>
				<div class="input-group date" data-provide="datepicker">
					<input type="text" class="form-control" name="establish" value="${CInfoVO.establish}" /> <span class="input-group-addon"> <i class="glyphicon glyphicon-calendar"></i>
					</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>사원수</label> 
				<input type="text" name="numemp" class="form-control" value="${CInfoVO.numemp}">
				
			</div>
			<div class="form-group col-lg-6">
			
				<label>매출액</label> 
			
				<input type="text" name="sales" class="form-control" value="${CInfoVO.sales}">
			
			
				
               
          		
				
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>대표전화</label> <input type="text" name="tel" class="form-control" value="${CInfoVO.tel}">
			</div>
			<div class="form-group col-lg-6">
				<label>FAX</label> <input type="text" name="fax" class="form-control" value="${CInfoVO.fax}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>홈페이지</label> <input type="text" name="homepage" class="form-control" value="${CInfoVO.homepage}">
			</div>
			<div class="form-group col-lg-6">
				<label>SNS</label> <input type="text" name="sns" class="form-control" value="${CInfoVO.sns}">
			</div>
		</div>

		<div class="row">
			<div class="form-group col-lg-12">
				<label>기업주소</label>
				<input id="pac-input" class="controls" type="text" placeholder="Search Box">
				<input type="hidden" name="lat" id="lat">
				<input type="hidden" name="lng" id="lng">
				<input type="hidden" name="location" id="test">
				<div id="map"></div>
			</div>
		</div>


		<!-- 컨트롤러 request에서 인식할 수 있게 임의의 name값을 지정해줘야한다 (controller랑 맞출 필요 X) -->

		<br> <br>


		<p class="lead">
			<strong>기업 아이디 및 이메일</strong>
		</p>

		<div class="row">
			<div class="form-group col-lg-6">
				<label>기업 아이디</label> <input type="text" name="id" class="form-control" value="${CInfoVO.id}" readonly>
			</div>

			<div class="form-group col-lg-6">
				<label>기업 이메일</label> <input type="text" name="email" class="form-control" value="${CInfoVO.email}" readonly>
			</div>
		</div>

		<br>

		<!-- 수정 버튼 -->
		<div class="box-footer text-center">
			<button type="button" class="btn btn-primary btn-lg">저장하기</button>
			<button type="button" class="btn btn-danger btn-lg" id="modify">취소하기</button>
		</div>
		<!-- //수정 버튼 -->
		<br> <br>
	</div>
</form>



<!-- 소연 모달 -->
<div class="modal" id="ORIGINAL_modal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content modal-dialog-centered">
			<div class="modal-head" style="text-align:center; vertical-align:middle; margin:10px;">
				<br>
				<button type="button" class="close" data-dismiss="modal" style="margin:10px;">&times;</button>
				이미지 크게 보기
			</div>

			<div class="modal-body modal-dialog-centered">
				<!--x표시 누르면 창 사라지게 하는 코드 -->
				<div class="row" style="border: solid 3px #ccc; padding: 10px; margin: 10px;">
					<img id="modal_get_Imgname1" style="width: 100%; height: auto;">
				</div>
			</div>
			<!--//class="modal-body"  -->
		</div>
		<!--//class="modal-content"-->
	</div>
	<!--//modal-dialog -->
</div>
<!--//소연 모달 -->

<script>
    //★★★ 취소하기 버튼 ★★★
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		// 문> btn-warning은 취소하기 버튼 클래스 이름
		$(".btn-warning").on("click", function() {
			self.location = "/company/C_index";
		});
	});
</script>

<script type='text/javascript'>
	$(function() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			dateFormat : "yy-mm-dd",
			language : "kr"
		});
	});
</script>


 	<style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        #map {
      		width:	100%;
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

<script>

var xornot = document.getElementById('xornot');
var preexistenceimg = document.getElementById('preexistenceimg');

    if ($('#imgsrccheck').val() != "") {    // 문> 여기서 #은 id값을 의미함 .은 class  ()앞에 $가 있어야 한다.
        console.log(" val이 널값아님");
        
        $('#imgsrc').attr("src", 'displayFile?fileName=${CInfoVO.img}');   // 문> .attr(attributeName, value)는 해당 요소의 속성(attributeName)의 값을 변경시킨다.
        console.log("이미지 주소: "+'${CInfoVO.img}');
           
/*         var hoho = "";
        hoho = '${CInfoVO.img}'; 
        console.log("hoho: "+ hoho); */
     
        var str = "";     // 문> str쓰기 위해서 선언, 변수를 쓸때는 항상 선언부터 한다.
       	str = "<br><a id='ORIGINAL'>크게보기</a>"+"<small data-src=${CInfoVO.img}>X</small>";
        
        $("#uploadedList").append(str);     // 문> 컨텐츠를 선택된 요소 내부의 끝 부분에서 삽입, 즉,사진 밑에 문구를 삽입 | uploadedList는 사진 id

        $("#ORIGINAL").on("click", function() {    // 문> ORIGINAL은 사진 밑에 '크게 보기'
            
        	console.log("☆☆크게보기☆☆");
        	
        	var src = "displayFile?fileName=${CInfoVO.img}";
            $("#ORIGINAL_modal").modal();     // 문> ORIGINAL_modal은 모달창 id값
            $("#modal_get_Imgname1").attr("src", src);       // 문> modal_get_Imgname1는 모달창에 들어가는 사진의 id값
        });
        
        $("#preexistenceimg").val("1");
    } else {
        console.log(" val이 널값이다");
        $('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
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
        var reader = new FileReader();     //p542다시 보기
        
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

        var formData = new FormData();       //문> FormData 객체를 이용하면 <form>태그로 만든 데이터의 전송방식과 동일하게 파일 데이터를 전송할 수 있다.
        formData.append("file", file);		 // 이용하는 방법은 객체를 생성하고, 필요한 데이터 '이름'과'값'을 추가하면 된다.

        $.ajax({
            url : '/company/uploadAjax',
            data : formData,
            dataType : 'text',
            processData : false,     //문> FormData 객체에 파일 데이터를 전송하기 위해서 false로 처리. 아래줄도 마찬가지
            contentType : false,
            type : 'POST',
            success : function(data) {
                var str = "";

                console.log("★data: "+data);
                str = "<br><a id='ORIGINAL'>크게보기</a>"
                        + "<small data-src="+data+">X</small>";

                $("#uploadedList").append(str);
                
                // 문> ORIGINAL은 크케보기 id값
                $("#ORIGINAL").on("click", function() {
                    console.log("ORIGINAL click");
                    console.log("★★data: " + data);
                   /*  console.log(getImageLink(data)); */
                    var src = "displayFile?fileName=" + data;
                    $("#ORIGINAL_modal").modal();
                    $("#modal_get_Imgname1").attr("src", src);
                });
                document.getElementById('uploadfilename').value = data;
                /* uploadedfilename_val = data; *///여기여기여기
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
        
        
        
        
/*         $("#fileupload").val("");     	// fileupload를 빈값으로 처리
        $("#uploadedList").empty();
        console.log("img File appended deleted");
        
        var fileName = $(this).attr("data-src");
        console.log("fileName"+fileName);
        
        var uploadfilename = document.getElementById('uploadfilename');
        $.ajax({
            url : "deleteFile",
            type : "post",
            data : {
                fileName : $(this).attr("data-src")
            },
            dataType : "text",
            success : function(result) {
                if (result == 'deleted') {
                    console.log("img File on server deleted");
                    that.parent("div").remove();
                    $('#uploadfilename').val('');
                }
            }
        }); */
        
        

			
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


    //★★★ 수정완료 버튼 ★★★
    $(".btn-primary").on("click", function() {     //문> btn-primary은 저장하기 클래스 이름 같은데. 뭐 클릭하면 안에꺼 실행

        /* alert(uploadedfilename_val); */
        formObj = $("form[role = 'form']");
        formObj.attr("method", "post");
        formObj.submit();

        // 문> 이 페이지를 보면 수정하기 버튼을 눌렀을 때 어디로 가란 정보가 없다.
        // 그럴 땐 컨트롤러에서 jsp파일명이 적힌 곳을 봐라 그럼 된다.CompanyController의 /C_modify
    });
</script>

<script>

var map;

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
    
  
<%@include file="../include/cfooter.jsp"%>