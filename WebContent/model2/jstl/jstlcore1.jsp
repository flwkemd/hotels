<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL core �±� ���� : �帧���� , ����ó��, ��������</title>
</head>
<body>
<h1> �������� : set,remove,out core �±�</h1>
<h3>&lt:c:set ..&gt: : page������ �Ӽ� ��� �ٸ� ������ �Ӽ� ��Ͻ� score="request" �߰��ϸ� ��</h3>
<c:set var="test" value="${'Hello JSTL' }" scope="request" />
<h3>&lt;c:out ..&gt; : ��ϵ� �Ӽ� ���� ȭ�鿡 ���</h3>
<c:out value="${test }" />,${test } <br>
<h3>&lt;c:remove ..&gt; : ��ϵ� �Ӽ� ���� ����</h3>
<c:remove var="test" />,${test } <br>

<h1>����ó�� : catch �±�</h1>
<c:catch var="err">
<%=10/0 %>
</c:catch>
<c:out value="${err }" />

<h1>���ǽ� ���� �±� : if,choose �±�</h1>
<c:if test="${5 < 10 }">
<h3>5�� 10���� �۴�</h3>
</c:if>
<c:if test="${6 + 3 != 10 }">
<h3>6�� 3�� ���� 10�� �ƴϴ�</h3>
</c:if>
<c:choose>
<c:when test="${5 + 10 == 40 }">
<h3>5+10�� 40�̴�</h3>
</c:when>
<c:otherwise>
<h3>5+10�� 15�̴�</h3>
</c:otherwise>
</c:choose>
</body>
</html>