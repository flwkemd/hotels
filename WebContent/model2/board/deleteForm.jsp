<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��1 �Խ���</title>
</head>
<body>

<form name="f" method="post" action="delete.bo?num=${param.num }">;
<table border="1" cellspacing="0" cellpadding="0">
<tr><td>�Խñ� ��й�ȣ</td>
<td><input type="password" name="pass"></td>
</tr>
<tr><td colspan="2" align="center">
<a href="javascript:document.f.submit();">����</a>
<a href="javascript:location.go(-1);">�ڷ�</a>
</td></tr>
</table></form>
</body>
</html>