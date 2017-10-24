<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL core 태그 예제 : 흐름제어 , 예외처리, 변수설정</title>
</head>
<body>
<h1> 변수설정 : set,remove,out core 태그</h1>
<h3>&lt:c:set ..&gt: : page영역에 속성 등록 다른 영역에 속성 등록시 score="request" 추가하면 됨</h3>
<c:set var="test" value="${'Hello JSTL' }" scope="request" />
<h3>&lt;c:out ..&gt; : 등록된 속성 값을 화면에 출력</h3>
<c:out value="${test }" />,${test } <br>
<h3>&lt;c:remove ..&gt; : 등록된 속성 값을 제거</h3>
<c:remove var="test" />,${test } <br>

<h1>예외처리 : catch 태그</h1>
<c:catch var="err">
<%=10/0 %>
</c:catch>
<c:out value="${err }" />

<h1>조건식 관련 태그 : if,choose 태그</h1>
<c:if test="${5 < 10 }">
<h3>5는 10보다 작다</h3>
</c:if>
<c:if test="${6 + 3 != 10 }">
<h3>6과 3의 합은 10이 아니다</h3>
</c:if>
<c:choose>
<c:when test="${5 + 10 == 40 }">
<h3>5+10은 40이다</h3>
</c:when>
<c:otherwise>
<h3>5+10은 15이다</h3>
</c:otherwise>
</c:choose>
</body>
</html>