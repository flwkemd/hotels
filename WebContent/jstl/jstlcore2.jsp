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
<title>�ݺ� ���� jstl �±�</title>
</head>
<body>
	<h1>�ݺ� ���� �±� : forEach</h1>
	<c:forEach var="test" begin="1" end="10" step="2">${ test }&nbsp;,&nbsp;
</c:forEach>

	<h1>1���� 100������ ���� ���ϱ�</h1>
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:set var="sum" value="${sum+i }" />
	</c:forEach>
	<h3>1���� 100������ �� : ${sum }</h3>
	<h1>forEach�� �̿��Ͽ� ������ �ۼ��ϱ�</h1>
	<c:forEach var="i" begin="2" end="9">
		<br>i��<br>
		<c:forEach var="j" begin="2" end="9">
${i} * ${j}=${i*j}<br>
		</c:forEach>
	</c:forEach>
	<%-- ���� : 1���� 100���� �� ¦���� �� ����ϱ� --%>
	
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="2" end="100" step="2">
	<c:set var="sum" value="${sum+i }" />
	</c:forEach>
	<h3>1���� 100���� �� ¦���� �� : ${sum} </h3>
	
	<h1>forEach �±׸� �̿��ϸ� Map��ü ����ϱ�</h1>
	<%
	Map <String,Object> map = new HashMap <String,Object> ();
	map.put("name","ȫ�浿");
	map.put("today",new Date());
	map.put("age",20);
	pageContext.setAttribute("map", map);
	%>
	<c:forEach var="m" items="${map }">
	${m.key }=${m.value }<br>
	</c:forEach>
	<h1></h1>
	<h1>EL��ü�� ����Ͽ� MAP ��ü ���� ����ϱ�</h1>
	${map.name }<br>
	${map.today }<br>
	${map.age }<br>
	<h1>forEach �±׸� �̿��� List ��ü ����ϱ�</h1>
	<%
	List<String> list = new ArrayList<String>();
	list.add("first"); list.add("second");
	list.add("third"); list.add("fourth");
	pageContext.setAttribute("list",list);
	%>
	<c:forEach var ="n" items="${list }" varStatus="stat">
	<c:if test="${stat.index==0 }">
	<h3>list ��ü ����ϱ�</h3></c:if>
	${stat.index } : ${n}<br>
	</c:forEach>
	
	<h1> forEach �±׸� �̿��� �迭 ��ü ����ϱ� </h1>
	<c:set var="arr" value="<%=new int[]{10,20,30,40,50} %>" />
	<c:forEach var="i" items="${arr }" varStatus="stat">
	arr[${stat.index}]=${i}&nbsp;&nbsp;
	</c:forEach>
	<h3>�ι�° �迭 �� ���� �ΰ��� ����ϱ�</h3>
	<c:forEach var="i" items="${arr}" begin="1" end="2" varStatus="stat">
	arr[${stat.index}]=${i}&nbsp;&nbsp;
	</c:forEach>
	<h3>�迭�� ¦�� �ε����� ����ϱ�</h3>
	<c:forEach var ="i" items="${arr}" step="2" varStatus="stat">
	arr[${stat.index}]=${i}&nbsp;&nbsp;
	</c:forEach>
	<%-- ��ū : ���ڿ� �߿��� �ǹ��ִ� ���ڿ�,
	        ��ūȭ : ���ڿ��� �߶󳽰� --%>
	<h1>forTokens ����</h1>
	<c:forTokens items="a,b,c,d,e,f,g," delims="," var="a">  ${a}&nbsp;&nbsp;
	</c:forTokens>
	
	<c:set var="sum" value="0"/>
	<h1>���ڿ� 20,30,80,90,50 ���� ������ �� ���ϱ�</h1>
	<c:forTokens items="20,30,80,90,50" delims="," var="a">
	<c:set var="sum" value="${ sum + a }" />
	</c:forTokens>
	��:${sum }
</body>
</html>