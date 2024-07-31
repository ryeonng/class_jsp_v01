<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 위 구문은 JSP 페이지의 설정을 정의하는 지시자이다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>인사말을 완성하였습니다.</h1>
	
	<%
		// 자바 실행 코드
		// request 객체에서 값 추출하기
		
		String name = request.getParameter("name");
		if(name == null || name.trim().isEmpty()) {
			out.println("<p> 이름을 먼저 입력해주세요. </p>");
		} else {
			out.println("<p> 안녕하세요, " + name + "! JSP Site 방문을 환영합니다.");
		}
	%>
	
	<!-- 다시 이전 페이지(특정 페이지)로 이동 처리 만들기 -->
	<a href="greet_form_page.html">Back</a>
	
</body>
</html>