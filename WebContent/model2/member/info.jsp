<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� �� ����</title>
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0">
<caption>ȸ�� ���� �� ����</caption>
<tr>
<td>���̵�</td><td>${mem.id }</td></tr>
<tr><td>�̸�</td><td>${mem.name}</td></tr>
<tr><td>�г���</td><td>${mem.nickname}</td></tr>
<tr><td>��й�ȣ</td><td>${mem.password }</td></tr>
<tr><td>���</td><td>${mem.place}</td></tr>
<tr><td>�ڵ�����ȣ</td><td>${mem.regnumber}</td></tr>
<tr><td colspan="3" align="center">
<a href="updateForm.me?id=${mem.id}">����</a>
<a href="delete.me?id=${mem.id}">Ż��</a>
</td></tr> 
</table>
</body>
</html>