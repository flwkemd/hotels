<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 상세 보기</title>
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0">
<caption>회원 정보 상세 보기</caption>
<tr>
<td>아이디</td><td>${mem.id }</td></tr>
<tr><td>이름</td><td>${mem.name}</td></tr>
<tr><td>닉네임</td><td>${mem.nickname}</td></tr>
<tr><td>비밀번호</td><td>${mem.password }</td></tr>
<tr><td>장소</td><td>${mem.place}</td></tr>
<tr><td>핸드폰번호</td><td>${mem.regnumber}</td></tr>
<tr><td colspan="3" align="center">
<a href="updateForm.me?id=${mem.id}">수정</a>
<a href="delete.me?id=${mem.id}">탈퇴</a>
</td></tr> 
</table>
</body>
</html>