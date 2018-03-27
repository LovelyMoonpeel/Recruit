<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--로그인 실패시 처리  -->
 <script type="text/javascript">
 	var result = '${msg}';
 	if(result == 'login_fail'){
		alert("아이디 혹은 비밀번호를 다시 확인해주세요."); 		
 	}else if(result == 'email'){
 		alert("이메일 인증을 진행해주세요.");
 	}else if(result == 'company'){
 		alert("기업 회원으로 로그인 해주세요.");
 	}else if(result == 'personal'){
 		alert("개인 회원으로 로그인 해주세요.");
 	}
    self.location = "/srch/index";
 </script>
  
  
</body>
</html>



<!--640
결과 페이지에 해당
게시물의 목록으로 이동할 수 있게 작성
  -->
