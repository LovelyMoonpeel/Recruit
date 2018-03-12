<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<!-- 기업 페이지 -->
<div class="col-md-9">
	
	<input type="hidden" id="id" value="${CInfoVO.id}">
	
	
	<div class="col-md-9">
	<h1>채용 공고 목록</h1>
	<table class="table table-bordered">
		<tr class="active">
			<th>순번</th>
			<th>공고 제목</th>
			<th style="text-align: center">기간</th>
			<th>인재보기</th>
			
		</tr>
		

					<% int manage = 0; %>
						<c:forEach items="${recruitList}" var="RecruitVO">
					<%manage++; %>
					<tr>
					<th><%=manage%></th>
					<th>${RecruitVO.title}</th>
					<th>~${RecruitVO.period}</th>
					<th><button id=${RecruitVO.bno} value=${RecruitVO.bno}>인재보기</button></th>
					</tr>
					
					
				<tr class="tr${RecruitVO.bno}" style="display:none">
                <th style="width:5%;"></th>
                <th style="width:20%;" class="text-center">이름</th>
                <th class="text-center">이력서 요약</th>
                <th style="width:15%;" class="text-center">업데이트일</th>
          	  </tr>
          	  
          	 <tbody class="tr${RecruitVO.bno}" id="recomList${RecruitVO.bno}" style="display:none"> 
          	 
          	  </tbody>
          	  
  
						</c:forEach>
		
	</table>
	
	

</div>

</div>

<script>
$("button").click(function() {
	var bno = $(this).val();
	
	$(".tr"+bno).toggle();
	PersonList(bno);
	/* $(".tr"+bno).toggle(); */
	
})
$(document).ready(function(){
	
	
})
	
function PersonList(bno){
	
	
	$.getJSON("/companyAjax/personList/" + bno, function(data) {
		var str = "";
		$(data).each(
				function() {
					str += "<tr><td><a id=r1 value="+this.bno+">"+1+"</a></td><td>"+this.img+"</td><td><h1  id="+this.bno+">"+this.title+"</h1></td><td>"+this.rgbid+"</td></tr>";
							
				});
		
		$("#recomList"+bno).html(str);
	})
}
</script>

<script>
$(document).ready(function(){
	
	
	
	$(document).on("click", '#r1', function(){
		
		var id = $('#id').attr('value');
		var bno = $(this).attr('value');
		
		favFun(bno, id);
	})
	
	
	
	
})
function favFun(bno, id){
			alert(bno);
			alert(id);
	$.getJSON("/companyAjax/favor/"+bno+"/"+id, function(data) {
		var str = "";
		$(data).each(
				function() {
					alert("관심 인재에 등록 됐습니다.");		
				});
		
		
	})
	
		}
</script>



<!-- //기업 페이지 -->




<%@include file="../include/cfooter.jsp"%> 