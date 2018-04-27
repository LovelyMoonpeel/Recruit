<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/pheader.jsp"%>

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

	<div class="container col-md-12">
	
		<c:forEach items="${MessageVOlist }" var="MessageVO">
			<div class="alert alert-success alert-dismissible fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>${MessageVO.bno}</strong>${MessageVO.message}
			</div>
	
			<div class="alert alert-info alert-dismissible fade in">
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
		</c:forEach>
	</div>
</div>
</body>

<script>
$(document).ready(function () {
	$(document).scroll(function() {
		
	    var maxHeight = $(document).height();
	    var currentScroll = $(window).scrollTop() + $(window).height();
	
	    if (maxHeight <= currentScroll + 100) {
	    	console.log("scroll if문");
	    	
	      /* $.ajax({
	    	  console.log
	        // Append next contents
	      }); */
	    }
	});
});


</script>
</html>