<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>반복 관련 jstl 태그</title>
</head>
<body>
	<h1>반복 관련 태그 : forEach</h1>
	<c:forEach var="test" begin="1" end="10" step="2">${ test }&nbsp;,&nbsp;
</c:forEach>

	<h1>1부터 100까지의 합을 구하기</h1>
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:set var="sum" value="${sum+i }" />
	</c:forEach>
	<h3>1부터 100까지의 합 : ${sum }</h3>
	<h1>forEach를 이용하여 구구단 작성하기</h1>
	<c:forEach var="i" begin="2" end="9">
		<br>i단<br>
		<c:forEach var="j" begin="2" end="9">
${i} * ${j}=${i*j}<br>
		</c:forEach>
	</c:forEach>
	<%-- 문제 : 1부터 100까지 중 짝수의 합 출력하기 --%>
	
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="2" end="100" step="2">
	<c:set var="sum" value="${sum+i }" />
	</c:forEach>
	<h3>1부터 100까지 중 짝수의 합 : ${sum} </h3>
	
	<h1>forEach 태그를 이용하며 Map객체 출력하기</h1>
	<%
	Map <String,Object> map = new HashMap <String,Object> ();
	map.put("name","홍길동");
	map.put("today",new Date());
	map.put("age",20);
	pageContext.setAttribute("map", map);
	%>
	<c:forEach var="m" items="${map }">
	${m.key }=${m.value }<br>
	</c:forEach>
	<h1></h1>
	<h1>EL객체를 사용하여 MAP 객체 내용 출력하기</h1>
	${map.name }<br>
	${map.today }<br>
	${map.age }<br>
	<h1>forEach 태그를 이용한 List 객체 출력하기</h1>
	<%
	List<String> list = new ArrayList<String>();
	list.add("first"); list.add("second");
	list.add("third"); list.add("fourth");
	pageContext.setAttribute("list",list);
	%>
	<c:forEach var ="n" items="${list }" varStatus="stat">
	<c:if test="${stat.index==0 }">
	<h3>list 객체 출력하기</h3></c:if>
	${stat.index } : ${n}<br>
	</c:forEach>
	
	<h1> forEach 태그를 이용한 배열 객체 출력하기 </h1>
	<c:set var="arr" value="<%=new int[]{10,20,30,40,50} %>" />
	<c:forEach var="i" items="${arr }" varStatus="stat">
	arr[${stat.index}]=${i}&nbsp;&nbsp;
	</c:forEach>
	<h3>두번째 배열 값 부터 두개만 출력하기</h3>
	<c:forEach var="i" items="${arr}" begin="1" end="2" varStatus="stat">
	arr[${stat.index}]=${i}&nbsp;&nbsp;
	</c:forEach>
	<h3>배열의 짝수 인덱스만 출력하기</h3>
	<c:forEach var ="i" items="${arr}" step="2" varStatus="stat">
	arr[${stat.index}]=${i}&nbsp;&nbsp;
	</c:forEach>
	<%-- 토큰 : 문자열 중에서 의미있는 문자열,
	        토큰화 : 문자열을 잘라낸것 --%>
	<h1>forTokens 연습</h1>
	<c:forTokens items="a,b,c,d,e,f,g," delims="," var="a">  ${a}&nbsp;&nbsp;
	</c:forTokens>
	
	<c:set var="sum" value="0"/>
	<h1>문자열 20,30,80,90,50 내의 숫자의 합 구하기</h1>
	<c:forTokens items="20,30,80,90,50" delims="," var="a">
	<c:set var="sum" value="${ sum + a }" />
	</c:forTokens>
	합:${sum }
</body>
</html>