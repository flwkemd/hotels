<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 목록 보기</title>
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0">
<caption>회원목록</caption>
<tr><td>아이디</td><th>이름</th><th>닉네임</th>
<th>장소</th><th>핸드폰번호</th><th>&nbsp;</th></tr>
<c:forEach var="mem" items="${list}">
<tr><td><a href="info.me?id=${mem.id}">${mem.id}</a></td>
<td>${mem.name}</td>
<td>${(mem.nickname)}</td>
<td>${mem.place}</td><td>${mem.regnumber}</td>
<td><a href="updateForm.me?id=${mem.id}">수정</a>
<a href="delete.me?id=${mem.id}">강제탈퇴</a>
</td></tr>
</c:forEach>
</table>
</body>
</html>