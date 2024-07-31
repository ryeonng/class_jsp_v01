<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
    <%
		// http://localhost:8080/jsp/example.jsp // 서블릿과 달리 확장자가 붙어 있다.
		// 초기화 단계(jspInit 역할)
		if(application.getAttribute("initialized") == null ) {
			application.setAttribute("initialized", true);
			application.setAttribute("initializedTime", new Date());
			out.println("JSP가 초기화 되었습니다. <br>");
		}
		// initialized가 null이 아니라면, 이 부분이 실행된다.
		out.println("요청이 완료 되었습니다. <br>");
		out.println("현재 시간 : " + new Date() + " <br>");
	
		// 세션이라는 전역 메모리지에 데이터를 저장하고 확인해보자.
		String message = (String)session.getAttribute("message"); // String으로 다운캐스팅
		if(message != null) {
			out.println("세션 메시지 : " + message);
		} else {
			out.println("저장된 세션 메시지가 없습니다.");
		}
		
		// 세션이라는 메모리에 key, value를 할당해보자.
		session.setAttribute("message", "세션에 저장한 메세지 입니다.");
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>JSP 라이프 사이클 확인</h1>
	<p>이 페이지의 학습 목적은 JSP 동작 방식에 대한 이해와 라이프 사이클 이다.</p>

</body>
</html>

<%
	// 소멸 단계 확인 (jspDestroy)
	if(application.getAttribute("initialized") != null) {
		application.removeAttribute("initialized"); // 키 값 initialized를 날림
		application.removeAttribute("initializedTime");
		out.println("JSP 객체(서블릿)가 소멸 되었습니다. <br>");
	}
%>

