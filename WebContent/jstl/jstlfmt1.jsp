<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="today" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>형식화 태그 예제</title>
</head>
<body>
<h1>숫자 관련 형식 출력하기 </h1>
<fmt:formatNumber value="500000" type="currency" /><br>
<fmt:setLocale value="en_US" />
<fmt:formatNumber value="500000" type="currency" /><br>
<fmt:setLocale value="ko-KR"/>
<fmt:formatNumber value="0.15" type="percent"/><br>
<fmt:formatNumber value="500000" pattern="###,###"/><br>

<h1>날짜 관련 형식 출력하기</h1>
${today } <br>
<fmt:formatDate value="${today }" type="date"/>
<fmt:formatDate value="${today }" type="time"/>
<fmt:formatDate value="${today }" type="both"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm:ss a"/> <br>
<p>
<fmt:formatDate value="${today }" type="both" timeStyle="short" dateStyle="short" /><br>
<fmt:formatDate value="${today }" type="both" timeStyle="long" dateStyle="long"/><br>
<fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full"/><br>
<fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full" timeZone="GMT"/><br>

<h1>포맷화된 숫자를 ㅣ일반 숫자로 변경</h1>
<fmt:parseNumber value="200,000" var="num1" pattern="###,###" />
<fmt:parseNumber value="100,000" var="num2" pattern="###,###" />
합: ${num1+num2}
<h1>포맷화된 날자를 일반 날짜로 변경</h1>
<fmt:parseDate value="2017-10-01" pattern="yyyy-MM-dd" var="day" />
${day}
<%-- 1. 합계를 세자리마다 ,로 출력하기. --%>
<fmt:parseNumber value="200,000" var="num1" pattern="###,###" />
<fmt:parseNumber value="100,000" var="num2" pattern="###,###" />
<c:set var="sum" value="${num1+num2}" />
합:<fmt:formatNumber value ="${sum }" />
<%-- 2. 날짜에 요일을 출력하기 --%>
<br><fmt:formatDate value="${day }" type="both" timeStyle="full" dateStyle="full"/><br>
</body>
</html>