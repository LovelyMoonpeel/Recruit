<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.recruit.domain.UserVO"%>
<%
	String id = "";
	UserVO login = null;
	String cname = "";
	String location = ""; //mypage 경로 설정 변수
	String c_chk = null; //company_check
	String myPage = "MyPage"; //myPage 이름 변경

	try {
		login = (UserVO) session.getAttribute("login");
		if (login != null) {
			id = login.getId();
			cname = login.getCname();
			c_chk = login.getCname();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	if (cname!=null) {
%>
    <jsp:include page="include/cheader.jsp" flush="true"/>
<% }else{
	if(id.equals("admin")){
%>
		<jsp:include page="include/aheader.jsp" flush="true"/>
<%	
	}else{
%>
		<jsp:include page="include/pheader.jsp" flush="true"/>
<%
	}
}%>	

<div class="container col-md-9">
	<div class="top_cont">
		<h1 class="ci_name">알림센터</h1>
	</div>
	<br><br>
	<div class="container col-md-11 col-md-offset-1 All">
		<%if (cname!=null) { %><!--  기업회원일 때 -->
		<c:forEach items="${MessageVOlist }" var="MessageVO">
			<div class="${MessageVO.color } scrolling alert alert-dismissible fade in" data-bno="${MessageVO.bno }">
				<c:choose>
					<c:when test="${MessageVO.color==1}">
						<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span class="glyphicon glyphicon-paperclip"></span>
						<a href="/company/C_manage">            &nbsp;&nbsp; <strong>${MessageVO.appliedpid}</strong>${MessageVO.message}</a>
					</c:when>
					<c:when test="${MessageVO.color==2}">
						<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span class="glyphicon glyphicon-warning-sign"></span>
						<a href="/company/C_index">&nbsp;&nbsp; <strong>${MessageVO.appliedpid}</strong>${MessageVO.message}</a> &nbsp;관련 내용은 공지를 확인해주세요. &nbsp;&nbsp; <a href="/cs/noticeread?bno=4">공지사항</a>
					</c:when>
					<c:when test="${MessageVO.color==3}">
						<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span class="glyphicon glyphicon-refresh"></span>
						<a href="/company/C_recruitMent?recruitNum=${MessageVO.rcno }" onClick="window.open(this.href, 'C${MessaveVO.rcno}', 'width=1100, height=960'); return false;">
						&nbsp;&nbsp; <strong>${MessageVO.appliedpid}</strong>${MessageVO.message}</a> &nbsp;관련 내용은 공지를 확인해주세요. &nbsp;&nbsp; <a href="/cs/noticeread?bno=6">공지사항</a>
					</c:when>
					<c:otherwise>
						<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span class="glyphicon glyphicon-comment"></span>
						<a href="/cs/qnaread?bno=${MessageVO.qbno }">&nbsp;&nbsp; <strong>${MessageVO.appliedpid}</strong>${MessageVO.message}</a>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
		<%}else{%>
		<c:forEach items="${MessageVOlist }" var="MessageVO">
			<div class="${MessageVO.color } scrolling alert alert-dismissible fade in" data-bno="${MessageVO.bno }">
				<c:choose>
					<c:when test="${MessageVO.color==0}">
						<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span class="glyphicon glyphicon-paperclip"></span>
						<a href="/personal/applied_all">&nbsp;&nbsp; <strong>${MessageVO.appliedpid}</strong>${MessageVO.message}</a>
						 &nbsp;&nbsp; 
						 <a href="/company/C_recruitMent?recruitNum=${MessageVO.rcno }" onClick="window.open(this.href, 'C${MessageVO.rcno}', 'width=1100, height=960'); return false;">공고보기</a>
					</c:when>
					<c:when test="${MessageVO.color==2}">
						<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span class="glyphicon glyphicon-warning-sign"></span>
						<a href="/personal/index">&nbsp;&nbsp; <strong>${MessageVO.appliedpid}</strong>${MessageVO.message}</a>&nbsp;관련 내용은 공지를 확인해주세요. &nbsp;&nbsp; <a href="/cs/noticeread?bno=3">공지사항</a>
					</c:when>
					<c:when test="${MessageVO.color==3}">
						<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span class="glyphicon glyphicon-refresh"></span>
						<a href="/personal/detail?bno=${MessageVO.rsno }">&nbsp;&nbsp;<strong>${MessageVO.appliedpid}</strong>${MessageVO.message}</a> &nbsp;관련 내용은 공지를 확인해주세요. &nbsp;&nbsp; <a href="/cs/noticeread?bno=7">공지사항</a>
					</c:when>
					<c:otherwise>
						<a href="#" id="${MessageVO.bno }" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span class="glyphicon glyphicon-comment"></span>
						<a href="/cs/qnaread?bno=${MessageVO.qbno }"> &nbsp;&nbsp;<strong>${MessageVO.appliedpid}</strong>${MessageVO.message}</a>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
		<%}%>	
	</div>
</div>

<script>

function infiniteScroll(){
	//if ($(window).scrollTop() >= $(document).height() - $(window).height() - 1) {
		 
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
    		
    		if(data!=''){
    			$(data).each(function(){
    				console.log(this.bno+""+this);
    				console.log(this.color);
    				
					<%if (cname!=null) { %> //기업회원일 때
						
						/* if (page % 5 !=0)
							moreView = false;
						} */
					
					
						switch(this.color){
							case '1' :
								str="<div class='"+this.color+" scrolling alert alert-dismissible fade in alert-info' data-bno='"+this.bno+"'>"
									+"<a href='#' id='"+this.bno+"' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
			    					+"<span class='glyphicon glyphicon-paperclip'></span><a href='/company/C_manage'>&nbsp;&nbsp; <strong>"+this.appliedpid+"</strong>"+this.message+"</a>"
			    					+"</div>";	
								 break;
							case '2' :
								str="<div class='"+this.color+" scrolling alert alert-dismissible fade in alert-danger' data-bno='"+this.bno+"'>"
									+"<a href='#' id='"+this.bno+"' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
			    					+"<span class='glyphicon glyphicon-warning-sign'></span>&nbsp;&nbsp;<a href='/company/C_index'><strong>"+this.appliedpid+"</strong>"+this.message+"</a> &nbsp;관련 내용은 공지를 확인해주세요. &nbsp;&nbsp; <a href='/cs/noticeread?bno=4'>공지사항</a>"
			    					+"</div>";
								 break;
							case '3' :
								str="<div class='"+this.color+" scrolling alert alert-dismissible fade in alert-warning' data-bno='"+this.bno+"'>"
									+"<a href='#' id='"+this.bno+"' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
			    					+"<span class='glyphicon glyphicon-refresh'></span>&nbsp;&nbsp; <a href='/company/C_recruitMent?recruitNum="+this.rcno+"' onClick='window.open(this.href, \""+this.rcno+"\", \"width=1100, height=960\"); return false;'><strong>"+this.appliedpid+"</strong>"+this.message+"</a> &nbsp;관련 내용은 공지를 확인해주세요. &nbsp;&nbsp; <a href='/cs/noticeread?bno=6'>공지사항</a>"
			    					+"</div>";
								 break;
							case '4' :
								str="<div class='"+this.color+" scrolling alert alert-dismissible fade in alert-success' data-bno='"+this.bno+"'>"
									+"<a href='#' id='"+this.bno+"' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
			    					+"<span class='glyphicon glyphicon-comment'></span>&nbsp;&nbsp;<a href='/cs/qnaread?bno="+this.qbno+"'><strong>"+this.appliedpid+"</strong>"+this.message+"</a>"
			    					+"</div>";
								 break;
							}//switch end
    				<%}else{%>//개인회원일 때
	    				switch(this.color){
							case '0' :
								str="<div class='"+this.color+" scrolling alert alert-dismissible fade in alert-info' data-bno='"+this.bno+"'>"
									+"<a href='#' id='"+this.bno+"' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
			    					+"<a href='/personal/applied_all'><span class='glyphicon glyphicon-paperclip'></span>            &nbsp;&nbsp; <strong>"+this.appliedpid+"</strong>"+this.message+"</a>"
			    					+" &nbsp;&nbsp;"
			    					+"<a href='/company/C_recruitMent?recruitNum="+this.rcno+"' onClick='window.open(this.href, \""+this.rcno+"\", \"width=1100, height=960\"); return false;'>공고보기</a>"
			    					+"</div>";	
								 break;
							case '2' :
								str="<div class='"+this.color+" scrolling alert alert-dismissible fade in alert-danger' data-bno='"+this.bno+"'>"
									+"<a href='#' id='"+this.bno+"' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
			    					+"<a href='/personal/index'><span class='glyphicon glyphicon-warning-sign'></span>  &nbsp;&nbsp; <strong>"+this.appliedpid+"</strong>"+this.message+"</a> &nbsp;관련 내용은 공지를 확인해주세요. &nbsp;&nbsp; <a href='/cs/noticeread?bno=3'>공지사항</a>"
			    					+"</div>";
								 break;
							case '3' :
								str="<div class='"+this.color+" scrolling alert alert-dismissible fade in alert-warning' data-bno='"+this.bno+"'>"
									+"<a href='#' id='"+this.bno+"' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
			    					+"<a href='/personal/detail?bno="+this.rsno+"'><span class='glyphicon glyphicon-refresh'></span>            &nbsp;&nbsp; <strong>"+this.appliedpid+"</strong>"+this.message+"</a> &nbsp;관련 내용은 공지를 확인해주세요. &nbsp;&nbsp; <a href='/cs/noticeread?bno=7'>공지사항</a>"
			    					+"</div>";
								 break;
							case '4' :
								str="<div class='"+this.color+" scrolling alert alert-dismissible fade in alert-success' data-bno='"+this.bno+"'>"
									+"<a href='#' id='"+this.bno+"' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
			    					+"<a href='/cs/qnaread?bno="+this.qbno+"'><span class='glyphicon glyphicon-comment'></span> &nbsp;&nbsp; <strong>"+this.appliedpid+"</strong>"+this.message+"</a>"
			    					+"</div>";
								 break;
							}//switch end	
    				<%}%>	
    				$(".All").append(str).trigger("create");
    			});//each // Append next contents
    		}else{//data가 null이 아니면
    			lastpage=true;
    			console.log("끝");
    			str="<br><br><p style='text-align:center;'><span class='glyphicon glyphicon-hand-right'></span>&nbsp;&nbsp;&nbsp;알림이 끝났습니다.&nbsp;&nbsp;</p><br><p style='text-align:center; color:#ffffff;'>박장우 천문필 박형훈 오지훈 진민경 안소연 제작~</p><br><br>";
    			$(".All").append(str).trigger("create");
    		}
    	}//success end
	});//ajax end
	//}//scrolling end
}	
 
$(document).ready(function () {
    var win = $(window);
 	lastpage = false;
    // Each time the user scrolls
    win.scroll(function() {
        // End of the document reached?
        if (($(document).height() - win.height() == win.scrollTop())&&!lastpage) {
        	infiniteScroll();
        }
    });

    $(".0").each(function(index){
		$(this).addClass("alert-info");
	});
	$(".1").each(function(index){
		$(this).addClass("alert-info");
	});
	$(".2").each(function(index){
		$(this).addClass("alert-danger");
	});
	$(".3").each(function(index){
		$(this).addClass("alert-warning");
	});
	$(".4").each(function(index){
		$(this).addClass("alert-success");
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
<%@include file="include/cfooter.jsp"%>