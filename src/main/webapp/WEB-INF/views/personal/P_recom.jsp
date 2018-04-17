<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/pheader.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link href="/resources/personal/css/bootstrap-slider.css" rel="stylesheet">

<script src="/resources/personal/js/bootstrap-slider.js"></script>

<style>
.material-icons:hover {
   color: #56c0e0;
}
#slider_job .slider-selection {
	background: #c0c6d3;
}
#slider_region .slider-selection {
	background: #c0c6d3;
}
#slider_employstatus .slider-selection {
	background: #c0c6d3;
}
#slider_levelofeducation .slider-selection {
	background: #56c0e0;
}
#slider_lastcareer .slider-selection {
	background: #c0c6d3;
}
.slider.slider-horizontal{
	 width:90%;
 }
</style>
<!-- Main content -->
<form role="form">
		<input type='hidden' id='userid' name='id' value="${PUserVO.id}">
</form>
<!--  스크랩한채용공고 페이지 -->
<div class="col-md-9" style="padding-top:20px;">
	<h1 class="ci_name">${PUserVO.pname}</h1><h4>님에게 추천드리는 채용 공고</h4>
	<br>
	<div class="container"
		style="width: 100%; border: 1px solid #c0c6d3; background-color: #e0e0e0; padding: 20px;">

		<div class="container" style="width: 100%; background-color: #e0e0e0;">
			<input id="slider_job" type="text" data-provide="slider"
			data-slider-min="1"	data-slider-max="5" data-slider-step="1"
			data-slider-value="2" />
		</div>
		<span style="line-height:200%">직무 중요도 : <span id="val_job">${PreferenceVO.pref_job}</span></span>
		
 		<br>
		<div class="container" style="width: 100%; background-color: #e0e0e0;">
			<input id="slider_region" type="text" data-provide="slider"
			data-slider-min="1" data-slider-max="5" data-slider-step="1"
			data-slider-value='5' />
		</div>
		<span style="line-height:200%">지역 중요도 : <span id="val_region">${PreferenceVO.pref_region}</span></span>

		<br>
		<div class="container" style="width: 100%; background-color: #e0e0e0;">
			<input id="slider_employstatus" type="text" data-provide="slider"
			data-slider-min="1" data-slider-max="5" data-slider-step="1"
			data-slider-value="5" />
		</div>
		<span style="line-height:200%">근무형태 중요도 : <span id="val_employstatus">${PreferenceVO.pref_employstatus}</span></span>
		<br>
		
		<div class="container" style="width: 100%; background-color: #e0e0e0;">
			<input id="slider_levelofeducation" type="text" data-provide="slider"
				data-slider-min="1" data-slider-max="5" data-slider-step="1"
				data-slider-value="3" />
		</div>
		<span style="line-height:200%">학력 중요도 : <span id="val_levelofeducation">${PreferenceVO.pref_levelofeducation}</span></span>
		
		<div class="container" style="width: 100%; background-color: #e0e0e0;">
			<input id="slider_lastcareer" type="text" data-provide="slider"
			data-slider-min="1" data-slider-max="5" data-slider-step="1"
			data-slider-value="3" />
		</div>
		<span style="line-height:200%">경력 중요도 : <span id="val_lastcareer">${PreferenceVO.pref_lastcareer}</span></span>
		<br> 
	</div>
<script>

$(document).ready(function (){

	$("#val_job").html(${PreferenceVO.pref_job});
	$("#slider_job").attr("data-slider-value",(${PreferenceVO.pref_job}));
	
	$("#val_region").html(${PreferenceVO.pref_region});
	$("#slider_region").attr("data-slider-value",(${PreferenceVO.pref_region}));
	
	$("#val_employstatus").html(${PreferenceVO.pref_employstatus});
	$("#slider_employstatus").attr("data-slider-value",(${PreferenceVO.pref_employstatus}));
	
	$("#val_levelofeducation").html(${PreferenceVO.pref_levelofeducation});
	$("#slider_levelofeducation").attr("data-slider-value",(${PreferenceVO.pref_levelofeducation}));
	
	$("#val_lastcareer").html(${PreferenceVO.pref_lastcareer});
	$("#slider_lastcareer").attr("data-slider-value",(${PreferenceVO.pref_lastcareer})); 	

	
	$("#slider_job").slider({	
		id: "slider_job" ,
		formatter: function(value) {
			return value;
		}
	}).on('change', function(){
      var newvalue = parseInt($(this).val());
      var oldvalue = parseInt($("#val_job").text());
      
     // var val_job = ${PreferenceVO.pref_job};
      var val_region = ${PreferenceVO.pref_region};
      var val_employstatus = ${PreferenceVO.pref_employstatus};
      var val_levelofeducation = ${PreferenceVO.pref_levelofeducation};
      var val_lastcareer = ${PreferenceVO.pref_lastcareer};
      
      if(newvalue!=oldvalue){
    	 $("#val_job").text(newvalue);
    	 
    	 $.ajax({
       	  type:'POST',
       	  url: '/personal/recom_modify',
       	  headers:{
       		  "Content-Type" : "application/json; charset=UTF-8",
       		  "X-HTTP-Method-Override" : "POST"
       	  },
       	  dataType: 'text',
       	  data:JSON.stringify({
				pref_job : newvalue,
				pref_region : val_region,
				pref_employstatus : val_employstatus,
				pref_levelofeducation : val_levelofeducation,
				pref_lastcareer : val_lastcareer
       	  }),
       	  success : function(result){
       		  if(result=='success'){
       			  location.href="/personal/recom";
       		  }
       	  }//success end
         });//ajax end
      }//if end
    });
	
	$("#slider_region").slider({ 
		id: "slider_region",
		formatter: function(value) {
			return value;
		}
	}).on('change', function(){
      var newvalue = parseInt($(this).val());
      var oldvalue = parseInt($("#val_region").text());
      
      var val_job = ${PreferenceVO.pref_job};
      //var val_region = ${PreferenceVO.pref_region};
      var val_employstatus = ${PreferenceVO.pref_employstatus};
      var val_levelofeducation = ${PreferenceVO.pref_levelofeducation};
      var val_lastcareer = ${PreferenceVO.pref_lastcareer};
      
      if(newvalue!=oldvalue){
    	 $("#val_region").text(newvalue);

    	 $.ajax({
       	  type:'POST',
       	  url: '/personal/recom_modify',
       	  headers:{
       		  "Content-Type" : "application/json; charset=UTF-8",
       		  "X-HTTP-Method-Override" : "POST"
       	  },
       	  dataType: 'text',
       	  data:JSON.stringify({
				pref_job : val_job,
				pref_region : newvalue,
				pref_employstatus : val_employstatus,
				pref_levelofeducation : val_levelofeducation,
				pref_lastcareer : val_lastcareer
       	  }),
       	  success : function(result){
       		  if(result=='success'){
       			location.href="/personal/recom";
       		  }
       	  }//success end
         });//ajax end
      }//if end
    });
	
	$("#slider_employstatus").slider({	
		id: "slider_employstatus",
	}).on('change', function(){
      var newvalue = parseInt($(this).val());
      var oldvalue = parseInt($("#val_employstatus").text());
      
      var val_job = ${PreferenceVO.pref_job};
      var val_region = ${PreferenceVO.pref_region};
      //var val_employstatus = ${PreferenceVO.pref_employstatus};
      var val_levelofeducation = ${PreferenceVO.pref_levelofeducation};
      var val_lastcareer = ${PreferenceVO.pref_lastcareer};
      
      if(newvalue!=oldvalue){
    	 $("#val_employstatus").text(newvalue);
    	 
    	 $.ajax({
       	  type:'POST',
       	  url: '/personal/recom_modify',
       	  headers:{
       		  "Content-Type" : "application/json; charset=UTF-8",
       		  "X-HTTP-Method-Override" : "POST"
       	  },
       	  dataType: 'text',
       	  data:JSON.stringify({
       		
       		pref_job : val_job,
	       	pref_region : val_region,
	 		pref_employstatus : newvalue,
	 		pref_levelofeducation : val_levelofeducation,
	 		pref_lastcareer : val_lastcareer
 		  
       	  }),
       	  success : function(result){
       		  if(result=='success'){
       			  location.href="/personal/recom";
       		  }
       	  }//success end
         });//ajax end
      }//if end
    });

	$("#slider_levelofeducation").slider({ 
		id: "slider_levelofeducation",
		formatter: function(value) {
			return value;
		}
	}).on('change', function(){
      var newvalue = parseInt($(this).val());
      var oldvalue = parseInt($("#val_levelofeducation").text());
      
      var val_job = ${PreferenceVO.pref_job};
      var val_region = ${PreferenceVO.pref_region};
      var val_employstatus = ${PreferenceVO.pref_employstatus};
      //var val_levelofeducation = ${PreferenceVO.pref_levelofeducation};
      var val_lastcareer = ${PreferenceVO.pref_lastcareer};
      
      if(newvalue!=oldvalue){
    	 $("#val_levelofeducation").text(newvalue);
    	 
    	 $.ajax({
       	  type:'POST',
       	  url: '/personal/recom_modify',
       	  headers:{
       		  "Content-Type" : "application/json; charset=UTF-8",
       		  "X-HTTP-Method-Override" : "POST"
       	  },
       	  dataType: 'text',
       	  data:JSON.stringify({
       		pref_job : val_job,
       		pref_region : val_region,
	 		pref_employstatus : val_employstatus,
	 		pref_levelofeducation : newvalue,
	 		pref_lastcareer : val_lastcareer
       	  }),
       	  success : function(result){
       		  if(result=='success'){
       			  location.href="/personal/recom";
       		  }
       	  }//success end
         });//ajax end
      }//if end
    });

	$("#slider_lastcareer").slider({	
		id: "slider_lastcareer",
		formatter: function(value) {
			return value;
		}
	}).on('change', function(){
      var newvalue = parseInt($(this).val());
      var oldvalue = parseInt($("#val_lastcareer").text());
      
      var val_job = ${PreferenceVO.pref_job};
      var val_region = ${PreferenceVO.pref_region};
      var val_employstatus = ${PreferenceVO.pref_employstatus};
      var val_levelofeducation = ${PreferenceVO.pref_levelofeducation};
      //var val_lastcareer = ${PreferenceVO.pref_lastcareer};
      
      if(newvalue!=oldvalue){
    	 $("#val_lastcareer").text(newvalue);
    	 
    	 $.ajax({
          	  type:'POST',
          	  url: '/personal/recom_modify',
          	  headers:{
          		  "Content-Type" : "application/json; charset=UTF-8",
          		  "X-HTTP-Method-Override" : "POST"
          	  },
          	  dataType: 'text',
          	  data:JSON.stringify({
           		pref_job : val_job,
           		pref_region : val_region,
           		pref_employstatus : val_employstatus,
           		pref_levelofeducation : val_levelofeducation,
           		pref_lastcareer : newvalue
          	  }),
          	  success : function(result){
          		  if(result=='success'){
          			  location.href="/personal/recom";
          		  }
          	  }//success end
            });//ajax end
      }//if end
    });
});

</script>

	<div class="container"
		style="width: 100%; border: 1px solid #c0c6d3; padding: 10px 20px 20px 20px; margin-top: 30px; margin-bottom: 10px;">
		<h4>
			<i class="fa fa-bar-chart" style="font-size: 36px;"></i>&nbsp;&nbsp;
			항목 중요도 조절
		</h4>
		<ul>
			<li><p>추천 받을 때, 중요하게 생각하는 요소에 따라 각 점수를 1~5 사이에서 조절해주세요.</p></li>
		</ul>

		<div class="col-md-1">
			<div class="progress">
				<i id="icon_job" class="material-icons" style="cursor: pointer;"
					onclick="add_job();">business</i>
			</div>
			<div class="progress">
				<i id="icon_region" class="material-icons" style="cursor: pointer;"
					onclick="add_region();">location_on</i>
			</div>
			<div class="progress">
				<i id="icon_employstatus" class="material-icons"
					style="cursor: pointer;" onclick="add_employstatus();">people</i>
			</div>
			<div class="progress">
				<i id="icon_levelofeducation" class="material-icons"
					style="cursor: pointer;" onclick="add_.pref_levelofeducation();">school</i>
			</div>
			<div class="progress">
				<i id="icon_lastcareer" class="material-icons"
					style="cursor: pointer;" onclick="add_lastcareer();">work</i>
			</div>
		</div>

		<div class="col-md-11">
			<div class="progress">
				<div id="bar_job" class="progress-bar progress-bar-success"
					role="progressbar" aria-valuenow="20" aria-valuemin="0"
					aria-valuemax="5"
					style="width: ${PreferenceVO.pref_job}%; background-color: #c0c6d3;">직무
					${PreferenceVO.pref_job}%</div>
			</div>
			<div class="progress">
				<div id="bar_region" class="progress-bar progress-bar-info"
					role="progressbar" aria-valuenow="30" aria-valuemin="0"
					aria-valuemax="5"
					style="width: ${PreferenceVO.pref_region}%; background-color: #c0c6d3;">지역
					${PreferenceVO.pref_region}%</div>
			</div>
			<div class="progress">
				<div id="bar_employstatus" class="progress-bar progress-bar-warning"
					role="progressbar" aria-valuenow="40" aria-valuemin="0"
					aria-valuemax="100"
					style="width: ${PreferenceVO.pref_employstatus}%; background-color: #c0c6d3;">근무형태
					${PreferenceVO.pref_employstatus}%</div>
			</div>
			<div class="progress">
				<div id="bar_levelofeducation" class="progress-bar"
					role="progressbar" aria-valuenow="50" aria-valuemin="0"
					aria-valuemax="100"
					style="width: ${PreferenceVO.pref_levelofeducation}%; background-color: #c0c6d3;">학력
					${PreferenceVO.pref_levelofeducation}%</div>
			</div>
			<div class="progress">
				<div id="bar_lastcareer" class="progress-bar"
					role="progressbar" aria-valuenow="50" aria-valuemin="0"
					aria-valuemax="100"
					style="width: ${PreferenceVO.pref_lastcareer}%; background-color: #c0c6d3;">경력
					${PreferenceVO.pref_lastcareer}%</div>
			</div>
		</div>
	</div><!-- container end -->
	<div class="container" style="width: 100%; padding: 20px 0px 20px 0px;">
		<div class="table-responsive">
			<table class="table table-bordered">
				<tr>
					<th style="text-align: center; vertical-align:middle;">공고 번호</th>
					<th style="text-align: center; vertical-align:middle;">회사명</th>
					<th style="text-align: center; vertical-align:middle;">공고 제목</th>
					<th style="text-align: center; vertical-align:middle;">직무1 v</th>
					<th style="text-align: center; vertical-align:middle;">직무2 v</th>
					<th style="text-align: center; vertical-align:middle;">지역1 w1</th>
					<th style="text-align: center; vertical-align:middle;">지역2 w2</th>
					<th style="text-align: center; vertical-align:middle;">근무형태  x</th>
					<th style="text-align: center; vertical-align:middle;">학력  y</th>
					<th style="text-align: center; vertical-align:middle;">경력  z</th>
					<th style="text-align: center; vertical-align:middle;">관리</th>
				</tr>
				
				<c:choose>
				
				<c:when test="${CRecruitVOList eq null}">
					<tr>
						<td style="text-align: center; vertical-align:middle;"></td>
						<td style="text-align: center; vertical-align:middle;"></td>
						<td style="text-align: center; vertical-align:middle;">공개된 이력서가 없어 추천이 불가능합니다.<br>추천 서비스를 이용하려면 이력서를 공개로 설정해주세요. </td>
						<td style="text-align: center; vertical-align:middle;"></td>
						<td style="text-align: center; vertical-align:middle;"></td>
						<td style="text-align: center; vertical-align:middle;"></td>
						<td style="text-align: center; vertical-align:middle;"><span class="glyphicon glyphicon-star"></span></td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${CRecruitVOList}" var="CRecruitVO" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align:middle;">${CRecruitVO.bno}</td>
							<td style="text-align: center; vertical-align:middle;">${CRecruitVO.cid}</td>
							<td style="text-align: center; vertical-align:middle;">${CRecruitVO.title}</td>
							<td style="text-align: center; vertical-align:middle;"></td>
							<td style="text-align: center; vertical-align:middle;">직무2</td>
							<td style="text-align: center; vertical-align:middle;">지역1</ttdh>
							<td style="text-align: center; vertical-align:middle;">지역2</td>
							<td style="text-align: center; vertical-align:middle;">근무형태</td>
							<td style="text-align: center; vertical-align:middle;">학력</td>
							<td style="text-align: center; vertical-align:middle;">경력 </td>
							<td style="text-align: center; vertical-align:middle;"><span class="glyphicon glyphicon-star"></span></td>
						</tr>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</div>
<br>
<br>
<br>
<script>
function add_job() {
	var bar_job = document.getElementById("bar_job");
	var width = parseInt($("#bar_job").text().substr(3));
	//background-color:
	//회색 #c0c6d3;
	//하늘색 #56c0e0;
	
	$("#icon_job").css("color", "#56c0e0");
	$("#icon_region").css("color", "#333333");
	$("#icon_employstatus").css("color", "#333333");
	$("#icon_levelofeducation").css("color", "#333333");
	$("#icon_lastcareer").css("color", "#333333");
	
	$("#bar_job").css("background-color", "#56c0e0");
	$("#bar_region").css("background-color", "#c0c6d3");
	$("#bar_employstatus").css("background-color", "#c0c6d3");
	$("#bar_levelofeducation").css("background-color", "#c0c6d3");
	$("#bar_lastcareer").css("background-color", "#c0c6d3");
	
	if (width >= 100) {
		width=0;
	} else {
		width=width+25;
	}
	
	bar_job.style.width = width + '%';
	$("#bar_job").text('직무	' + width * 1 + '%');
}
function add_region() {
	var bar_region = document.getElementById("bar_region");
	var width = parseInt($("#bar_region").text().substr(3));
	
	$("#icon_job").css("color", "#333333");
	$("#icon_region").css("color", "#56c0e0");
	$("#icon_employstatus").css("color", "#333333");
	$("#icon_levelofeducation").css("color", "#333333");
	$("#icon_lastcareer").css("color", "#333333");
	
	$("#bar_job").css("background-color", "#c0c6d3");
	$("#bar_region").css("background-color", "#56c0e0");
	$("#bar_employstatus").css("background-color", "#c0c6d3");
	$("#bar_levelofeducation").css("background-color", "#c0c6d3");
	$("#bar_lastcareer").css("background-color", "#c0c6d3");
	
	if (width >= 100) {
		width=0;
	} else {
		width=width+25;
	}
	
	bar_region.style.width = width + '%';
	$("#bar_region").text('지역	' + width * 1 + '%');
}
function add_employstatus() {
	var bar_employstatus = document.getElementById("bar_employstatus");
	var width = parseInt($("#bar_employstatus").text().substr(5));
	
	$("#icon_job").css("color", "#333333");
	$("#icon_region").css("color", "#333333");
	$("#icon_employstatus").css("color", "#56c0e0");
	$("#icon_evelofeducation").css("color", "#333333");
	$("#icon_lastcareer").css("color", "#333333");
	
	$("#bar_job").css("background-color", "#c0c6d3");
	$("#bar_region").css("background-color", "#c0c6d3");
	$("#bar_employstatus").css("background-color", "#56c0e0");
	$("#bar_levelofeducation").css("background-color", "#c0c6d3");
	$("#bar_lastcareer").css("background-color", "#c0c6d3");
	
	if (width >= 100) {
		width=0;
		bar_employstatus.style.width = width + '%';
		$("#bar_employstatus").text('근무형태	' + width * 1 + '%');
	} else {
		width=width+25;
		bar_employstatus.style.width = width + '%';
		$("#bar_employstatus").text('근무형태	' + width * 1 + '%');
	}
}
function add_levelofeducation() {
	var bar_levelofeducation = document.getElementById("bar_levelofeducation");
	var width = parseInt($("#bar_levelofeducation").text().substr(3));
	
	$("#icon_job").css("color", "#333333");
	$("#icon_region").css("color", "#333333");
	$("#icon_employstatus").css("color", "#333333");
	$("#icon_levelofeducation").css("color", "#56c0e0");
	$("#icon_lastcareer").css("color", "#333333");
	
	$("#bar_job").css("background-color", "#c0c6d3");
	$("#bar_region").css("background-color", "#c0c6d3");
	$("#bar_employstatus").css("background-color", "#c0c6d3");
	$("#bar_levelofeducation").css("background-color", "#56c0e0");
	$("#bar_lastcareer").css("background-color", "#c0c6d3");
	
	if (width >= 100) {
		width=0;
	} else {
		width=width+25;
	}
	
	bar_.pref_levelofeducation.style.width = width + '%';
	$("#bar_levelofeducation").text('학력	' + width * 1 + '%');
}
function add_lastcareer() {
	var bar_lastcareer = document.getElementById("bar_lastcareer");
	var width = parseInt($("#bar_lastcareer").text().substr(3));
	
	$("#icon_job").css("color", "#333333");
	$("#icon_region").css("color", "#333333");
	$("#icon_employstatus").css("color", "#333333");
	$("#icon_levelofeducation").css("color", "#333333");
	$("#icon_lastcareer").css("color", "#56c0e0");
	
	$("#bar_job").css("background-color", "#c0c6d3");
	$("#bar_region").css("background-color", "#c0c6d3");
	$("#bar_employstatus").css("background-color", "#c0c6d3");
	$("#bar_levelofeducation").css("background-color", "#c0c6d3");
	$("#bar_lastcareer").css("background-color", "#56c0e0");
	
	if (width >= 100) {
		width=0;
	} else {
		width=width+25;
	}
	
	bar_lastcareer.style.width = width + '%';
	$("#bar_lastcareer").text('경력	' + width * 1 + '%');
}

</script>
<%@include file="../include/cfooter.jsp"%>
