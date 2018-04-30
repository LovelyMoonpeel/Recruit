<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.recruit.domain.BoardVO"%>
<%
	String id = "";
	BoardVO login = null;
	String cname = "";
	String location = ""; //mypage 경로 설정 변수
	String c_chk = null; //company_check
	String myPage = "MyPage"; //myPage 이름 변경

	try {
		login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			id = login.getId();
			cname = login.getCname();
			c_chk = login.getCname();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	if (cname!=null) { %>
    <jsp:include page="include/cheader.jsp" flush="true"/>
<% }else{%>
	<jsp:include page="include/pheader.jsp" flush="true"/>
<% }%>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>RecruIT 알림</title>
</head>
<body>

<div class="container col-md-9">
	<div class="top_cont">
		<h1 class="ci_name">RecruIT 알림창</h1>
	</div>
	<br><br>

	<div class="container col-md-11 col-md-offset-1 All">
	
		<c:forEach items="${MessageVOlist }" var="MessageVO">
			<div class="${MessageVO.color } scrolling alert alert-dismissible fade in" data-bno="${MessageVO.bno }">
				<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>${MessageVO.appliedpid}</strong>${MessageVO.message}
			</div>
		</c:forEach>
		
			<div class="alert alert-success alert-dismissible fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Info!</strong> This alert box could indicate a neutral
				informative change or action.
			</div>
			<div class="alert alert-warning alert-dismissible fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Warning!</strong> This alert box could indicate a warning
				that might need attention.
			</div>
			<div class="alert alert-danger alert-dismissible fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Danger!</strong> This alert box could indicate a dangerous or
				potentially negative action.
			</div>
	</div>
</div>
</body>

<script>
// 화면 공백 생성
function waitForSearching(str, num, del) {
	if (del !== false)
		deletespanel();
	str = '<h3 align="center">' + str + '</h3>';
	for (var i = 0; i < num; i++) {
		str = '<br/>' + str + '<br/><br/>';
	}
	$("#spanel").append(str);
}
function infiniteScroll(){
	if ($(window).scrollTop() >= $(document).height() - $(window).height() - 1) {
		 
    	var lastbno = $(".scrolling:last").attr("data-bno");
    	
    	$.ajax({
	    	type:'post',
	    	url:'/message_infinite',
	    	headers:{
	    		"Content-Type" : "application/json",
	    		"X-HTTP-Method-Override" : "POST"
    		},
	    	dataType:'json',
	    	data:JSON.stringify({
	    		bno : lastbno
    		}),
	    	success: function(data){
	    		var str="";
	    		
	    		if(data!=""){
	    			$(data).each(function(){
	    				console.log(this);
	    				console.log(this.color);
	    				
	    				str="<div class='"+this.color
	    				+" scrolling alert alert-info alert-dismissible fade in ' data-bno="+this.bno
	    				+"> <a href=# id='"+this.bno
	    				+"' class=close data-dismiss=alert aria-label=close>&times;</a> <strong>"
	    				+this.bno+" : "+this.appliedpid+"</strong>"+this.message+"</div>";
	    				
	    				$(".All").append(str).trigger("create");
	    			});//each // Append next contents
	    		}else{//data가 null이 아니면
	    			lastpage=true;
	    			console.log("끝");
	    			str="<br><br><p style='text-align:center;'>알림이 끝났습니다.</p><br><p style='text-align:center; color:#ffffff;'>박장우 천문필 박형훈 오지훈 진민경 안소연 제작~</p><br><br>";
	    			$(".All").append(str).trigger("create");
	    		}
	    	}//success end
		});//ajax end
	}//scrolling end
}	
 
$(document).ready(function () {
    var win = $(window);
 	lastpage = false;
    // Each time the user scrolls
    win.scroll(function() {
        // End of the document reached?
        if ($(document).height() - win.height() == win.scrollTop()) {
        	if(!lastpage){
	        	infiniteScroll();
        	}
        }
    });

	$(".1").each(function(index){
		$(this).addClass("alert-info");
	});
	$(".0").each(function(index){
		$(this).addClass("alert-info");
	});
	
	$(".close").each(function(index){//메시지 확인하는 ajax
		$(this).on("click", function(){
			
			console.log($(this).attr("id"));
			bno = $(this).attr("id");
			
			$.ajax({
				type:'POST',
				url:'/message_readornot',
				headers:{
					"Content-Type" : "application/json; charset=UTF-8",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType: 'text',
				data:JSON.stringify({
					bno : bno
				}),
				success : function(result){
					console.log(result);
				}
			})//ajax end
		});//onclick end
	});//each end
});

</script>
</html>