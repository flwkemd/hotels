<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��2 �Խ��� : �Խù� ��� ȭ��</title>
</head>
<body>
<form action="write.bo" method="post" enctype="multipart/form-data" name="f">
	<table border = "1" cellspacing="0" cellpadding="0">
	<caption>��1 �Խ���</caption>
	<tr><td align ="center">�۾��� </td>
	<td><input type = "text" name="name"></td></tr>
	<tr><td align ="center">��й�ȣ </td>
	<td><input type = "password" name="pass"></td></tr>
	<tr><td align ="center">���� </td>
	<td><input type = "text" name="subject" size="50"></td></tr>
	<tr><td align ="center">���� </td>
	<td><textarea rows="15" cols="65" name="content"></textarea></td></tr>
	<tr><td align = "center">÷������</td>
	<td><input type="file" name="file1"></td></tr>
	<tr><td colspan="2" align="center">
	<a href="javascript:document.f.submit();">�Խù� ���</a>
</table></form></body></html>