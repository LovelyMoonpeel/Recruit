<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/cheader.jsp"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"> 
<!-- Bootstrap (기존 Include된 부트스트랩이 색상 충돌 일어나서 추가 함)  -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
<!-- Main content -->
<!-- 기업 페이지 -->
<!-- <div class="col-md-9"> -->

<%@ page import="java.util.*, java.text.*"  %>

<%-- <%
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 String today = formatter.format(new java.util.Date());
 out.println(today);
%>
 --%>


	<input type="hidden" id="id" value="${CInfoVO.id}">

	
	<div class="col-md-9">
		<p class="lead"><strong>채용공고목록에 따른 추천인재</strong></p>
	
		<nav class="navbar navbar-default" style="margin-bottom: 0px; border: 1px solid #dce1eb; border-bottom: 2px solid #c0c6d3;">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				
				<div class="input-group" >
					<div class="input-group-btn" style="vertical-align:middle">

					<select class="selectpicker" name="searchType">
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							공고제목</option>
						<%-- <option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							담당자</option> --%>
				</select>
				</div>
					<input type="text" class="form-control" name='keyword' id="keywordInput" placeholder="Search for..." value='${cri.keyword}'> <span class="input-group-btn">
						<button class="btn btn-default" type="button" id="searchBtn">검색하기</button>
					</span>
					
				</div>
				
				
				<!-- /.navbar-collapse -->
			</div>
		
			<!-- /.container-fluid -->
	</nav>

	<table class="table table-bordered">
		<tr class="active " >
			<th style="text-align: center">공고 상태</th>
			<th style="text-align: center">모집 내용</th>
			<th style="text-align: center">기간</th>
			<th style="text-align: center">인재보기</th>
			
		</tr>
		

						<c:forEach items="${recruitList}" var="RecruitVO">					
					<tr>
					<th><span class=badge name=stateName>${RecruitVO.recruitstate}</span></th>
					<th style="text-align: center"><a id="gR" target="_blank" href=/company/C_recruitMent?recruitNum=${RecruitVO.bno}>${RecruitVO.title}</a>
					</th>
					<th style="text-align: center">${RecruitVO.periodstart}  ${RecruitVO.period}</th>
					<th style="text-align: center"><button class="btn btn-default" name="onLoad" id=${RecruitVO.bno} value=${RecruitVO.bno} data-toggle="modal" data-target="#myModal">인재보기</button></th>
					</tr>
					

						</c:forEach>
		
	</table>
	
	
	
	<script>
	$(document).ready(function(){
		
	var stateLen = $("span[name='stateName']").length;

	for(var sT = 0; sT< stateLen; sT++){
		
		$("span[name='stateName']").eq(sT).css("background-color","#3AA0D9");
		$("span[name='stateName']").eq(sT).addClass("center-block clearfix");
		
	}
	})

	 </script>
	
	<div id="myModal" class="modal fade" role="dialog">
 	 <div class="modal-dialog modal-lg">
	   <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" name="offLoad" id="off" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">추천인재목록</h4>
        </div>
        <div class="modal-body">
         
         	 <table class="table table-striped" >
          <tr class=active>
          <th class="text-center"></th>
          <th class="text-center">이름</th>
          <th class="text-center">이력서 요약</th>
       	  <th class="text-center">업데이트일</th>
          </tr>
          <tbody id="recomList">
          
          </tbody>
          </table>
          
        </div>
        <div class="modal-footer">
          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        </div>
      	</div> 
       </div>
    </div>
	
	
	<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="C_recom${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="C_recom${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="C_recom${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				
					<table class="table table-bordered">
		<tr class="active gobox2">
			<td style="line-height: 200%">
				<ul style="list-style-type: circle">
					<li><small>추천인재는 공고에 기입된 원하는 인적사항과 <b style="color:#7F0000">유사한 인적사항을 가진 인재를 매칭</b>해 추천해줍니다.</small></li>
					<li><small><b style="color:#7F0000">최초 개인정보 수집한 목적이 달성되면</b> <r>지체 없이 파기</r>하여야 합니다.</small></li>
					<li><small>채용이 아닌 영업이나 마케팅 등으로 이용하실 경우, 정보통신망법 제71조 3에 의거 <b style="color:#7F0000">5년 이하징역 또는 5,000만원 이하의 벌금</b>에 처해질 수 있습니다.</small></li>
				<br> <font style="font-size:15px">※ RecruIT 규정상 부적합한 공고로 판별된 경우, <b style="font-size:15px; color:#7F0000">별도 통보 없이 공고가 마감/삭제</b> 처리될 수 있습니다.</font>
				</ul>
			</td>
		</tr>
	</table>

</div>



<c:forEach items="${FavorCompareList}" var="FavorCompareListVO">
<input type="hidden" name="CompareList" value="${FavorCompareListVO.presume}">
</c:forEach>


<!-- </div> -->






<script>
$("button[name=onLoad]").on("click", function() {
	
	var bno = $(this).val();
	
	$("#recomList > *").remove();
	
	PersonList(bno);
	
	
})
	
function PersonList(bno){
	
	
	$.getJSON("/companyAjax/personList/" + bno, function(data) {
		var str = "";
		var comparison = [];
		
		$(data).each(
				function() {
					
					var item ={
						
						bno : this.bno,
						name : this.name,
						title : this.title,
						career : this.career,
						edu : this.edu,
						rgbid : this.rgbid,
						rgsid : this.rgsid,
						salary : this.salary,
						jobgroup1 : this.jobgroup1,
						jobgroup2 : this.jobgroup2,
						days : this.days,
						todays : this.todays
												
					};
					
					console.log(item)
					
					
					CreateRecomList(item);
					
					
					comparison.push(this.bno)
					
				});
		
		
	
		favorComparison(comparison)
		
	})
	
	
	
}

function CreateRecomList(item){
	
	var source_tel = $("#template_appList").html();
	var template = Handlebars.compile(source_tel);
	$("#recomList").append(template(item));
	
}




function favorComparison(comparison){
	
	var compare = document.getElementsByName('CompareList');
	var compareList = [];
	for(var i=0; i<compare.length; i++){
		
	compareList.push(compare[i].value);
	}
	/*
 	$('#recomList img').prop("src","/resources/rpjt/img/non.png")
 	$("img[value="+i+"]").prop("src","/resources/rpjt/img/on.png")
   */
 	for(var i= 0; i<compareList.length; i++){
 		
 		for(var j = 0; j<comparison.length; j++){
 			if(compareList[i] == comparison[j]){
 				$("img[value="+compareList[i]+"]").prop("src","/resources/rpjt/img/on.png")
 			}
 		}
 	}
	
	
}
</script>

 <script id="template_appList" type="text/x-handlebars-template">

	<tr>
		<td class=text-center style=vertical-align:middle><img src=/resources/rpjt/img/non.png id=r1 value="{{bno}}">
		</td>
		<td class=text-center style=vertical-align:middle><strong>{{name}}</strong><br>
		</td>
		
		<td><span class=careerLine>{{career}}</span>
			<a id=btt class="{{bno}}" href=/personal/detail_nonavi?bno={{bno}}>{{title}}</a>
			<p>학력: {{edu}}</p>
			<p>희망 근무지 : {{rgbid}}({{rgsid}})</p>
			<p>희망연봉: {{salary}}</p>
			<p>희망직종: {{jobgroup1}}({{jobgroup2}})</p>
		</td>
	
	<td class="text-center" style="vertical-align:middle">

	{{#fn_isIf}}
		{{days}}
	{{/fn_isIf}}

	</td>
	</script> 
	
	<script type="text/javascript">
  
        Handlebars.registerHelper("fn_isIf", function(option) {
 
            if (this.days == 0) {
				
            	if(this.todays.substr(0,1)==0 && this.todays.substr(1,1)!=0){
					
            		return this.todays.substr(1,1) +"시간"+ this.todays.substr(2,2) +"분"
				
				}if(this.todays.substr(0,2)>=10){
					
					return this.todays.substr(0,2) +"시간"+ this.todays.substr(2,2) +"분"
				
				}
				else if(this.todays.substr(0,2)==00 && this.todays.substr(2,2)!=00){
					
					return this.todays.substr(2,2) +"분"
				
				}
				else{
				
					return "방금전"
				
				}
				
            } else {
                return this.days+"일"; // 반대
            }
 
        });


	</script>
<script>
$(document).ready(function(){
	
	$(document).on("click", '#r1', function(){
		
		var id = $('#id').attr('value');
		var bno = $(this).attr('value');
		
		if($("img[value="+bno+"]").attr("src")=="/resources/rpjt/img/on.png"){
			favDel(bno, id);
		}else if($("img[value="+bno+"]").attr("src")!="/resources/rpjt/img/on.png"){
			favAdd(bno, id);
		}
		
			
		})
	
	
})


function favAdd(bno, id){   // 관심인재 등록
			
	
	$.getJSON("/companyAjax/favorAdd/"+bno+"/"+id, function(data) {
		var str = "";
		
		$(data).each(
				function() {
				});
		
	})
	$("img[value="+bno+"]").attr("src","/resources/rpjt/img/on.png")
	alert("관심인재에 등록 됐습니다.")
	
	
}
function favDel(bno, id){ 	// 관심인재 삭제
	
	$.getJSON("/companyAjax/favorDelete/"+bno+"/"+id, function(data){
	var str = "";
		
		$(data).each(
				function() {
				});
		
	})
	$("img[value="+bno+"]").attr("src","/resources/rpjt/img/non.png")
	alert("관심인재에서 삭제 됐습니다.")
	
}
$(document).ready(
		function() {
			$('#searchBtn').on(
					"click",
					function(event) {
						self.location = "C_recom"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + $('#keywordInput').val();
					});
		
		});
</script>


<script>
		$(document).on("click","#gR",function(){

			window.open(this.href, '', 'width=1240, height=960'); 
			
			return false;
				
		})
</script>

			<script>
			 $("#keywordInput").keypress(function (e) {
			        if (e.which == 13){
			        	
			        	$('#searchBtn').trigger('click');
			        }
			    });
			</script>
			
			
			<script>
			
			$(document).on("click","#btt",function(){
				window.open(this.href, '', 'width=400', 'height=430'); 
				
				return false;
			})
			
			</script>




<!-- //기업 페이지 -->




<%@include file="../include/cfooter.jsp"%> 