<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ���α׷�</title>
</head>
<body>
<h3>${sessionScope.login } ȸ���� �ݰ����ϴ�.</h3>
<h3><a href="logout.me">�α׾ƿ�</a></h3>
<h3><a href="info.me?id=${sessionScope.login }">�� ����</a></h3>
<%-- ������ �α����� ��� ȸ����� ���� �޴� �߰� --%>
<c:if test="${sessionScope.login == 'admin' }">
<h3><a href="list.me">ȸ�� ��� ����</a></h3>
</c:if>
</body>
</html>