<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9">

<%@ page import="java.util.*, java.text.*"  %>



	
	<input type="hidden" id="id" value="${CInfoVO.id}">
	
	
	<div class="col-md-9">
	<h1>채용 공고 목록</h1>
	
		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
 



    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
    
      
        <div class="input-group" style="padding-top:10px">
     
  

      
    
           <div class="input-group-btn" style="">
           
             <select class="form-control" name="searchType" style="width:100px">
     <option value="n"<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
	<option value="t"<c:out value="${cri.searchType eq 't'?'selected':''}"/>>공고제목</option>
      </select>
      
      </div><!-- /btn-group -->
         
   
      
       <input type="text" class="form-control"  name='keyword' id="keywordInput" placeholder="Search for..." value='${cri.keyword }' >
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" id="searchBtn">검색하기</button>
      </span>
          
      

      <ul class="nav navbar-nav navbar-right">
        
    <select class="form-control" id="perPageNum" style="width:100px">
    <option value="5" selected>5개씩보기</option>
    <option value="10">10개씩보기</option>
	<option value="20">20개씩보기</option>
    </select>
    


      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


	<table class="table table-bordered">
		<tr class="active">
			<th>공고 상태</th>
			<th>모집 내용</th>
			<th style="text-align: center">기간</th>
			<th>인재보기</th>
			
		</tr>
		

						<c:forEach items="${recruitList}" var="RecruitVO">					
					<tr>
					<th>${RecruitVO.recruitstate}</th>
					<th><a target="_blank">${RecruitVO.title}</a>
					<li>근무형태 : ${RecruitVO.employstatusid}</li>
					<li>직종 : ${RecruitVO.jobgroupid} -> ${RecruitVO.jobgroupid2}</li>
					<li>경력 : ${RecruitVO.exp} </li>
					<li>접수기간 : ${RecruitVO.period}</li></th>
					<th>${RecruitVO.period}</th>
					<th><button name="onLoad" id=${RecruitVO.bno} value=${RecruitVO.bno} data-toggle="modal" data-target="#myModal">인재보기</button></th>
					</tr>
					

						</c:forEach>
		
	</table>
	
	
	<div id="myModal" class="modal fade" role="dialog">
 	 <div class="modal-dialog">
	   <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" name="offLoad" id="off" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">추천인재목록</h4>
        </div>
        <div class="modal-body">
         
         	 <table class="table table-striped" >
          <tr class=active>
          <th>번호</th>
          <th>이름</th>
          <th>이력서 요약</th>
          <th>업데이트일</th>
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

</div>

</div>

<c:forEach items="${FavorCompareList}" var="FavorCompareListVO">
<input type="text" name="CompareList" value="${FavorCompareListVO.presume}">
</c:forEach>




<script>





$("button[name=onLoad]").on("click", function() {
	
	var bno = $(this).val();
	
	PersonList(bno);
	
	
})

	
function PersonList(bno){
	
	
	$.getJSON("/companyAjax/personList/" + bno, function(data) {
		var str = "";
		var comparison = [];
		
		$(data).each(
				function() {
					
					str += "<tr><td><img src=/resources/rpjt/img/non.png id=r1 value="+this.bno+"></td><td>"+this.name+"  ⃝  ⃝ </td><td><span class=careerLine>경력 3년 5개월</span><a  id="+this.bno+">"+this.title+"</a><br>"+this.schoolname+""+this.major+"<br>"+this.rgbid+""+this.salary+"</td><td></td></tr>";		
					
					comparison.push(this.bno)
					
				});
		
		$("#recomList").html(str);
		
	
		favorComparison(comparison)
		
	})
	
	
	
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



<!-- //기업 페이지 -->




<%@include file="../include/cfooter.jsp"%> 