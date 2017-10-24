<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>forEach를 이용한 Http Header 정보 출력하기</title>
</head>
<body>
<h1> Header 정보 출력하기</h1>
<c:forEach var="head" items="${headerValues }">
name : ${head.key } <br>
value :
<c:forEach var="val" items="${head.value }">
${val}<br>
</c:forEach>
<p>
</c:forEach>
<h1> import 태그 : 다른 페이지의 결과 가져오기</h1>
<c:import url="jstlcore1.jsp" var="url" />
<hr>
<h3>jstlcore1.jsp 결과화면</h3>
${url}
</body>
</html>