<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 관리 프로그램</title>
</head>
<body>
<h3>${sessionScope.login } 회원님 반갑습니다.</h3>
<h3><a href="logout.me">로그아웃</a></h3>
<h3><a href="info.me?id=${sessionScope.login }">내 정보</a></h3>
<%-- 관리자 로그인일 경우 회원목록 보기 메뉴 추가 --%>
<c:if test="${sessionScope.login == 'admin' }">
<h3><a href="list.me">회원 목록 보기</a></h3>
</c:if>
</body>
</html>