<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ȭ��</title>
<style type="text/css">
td { background-color:#F6F6F6; }
</style>
<script type="text/javascript">
function check() {
	return true;

}</script>
</head>
<body>
<form action="joinCheck.me" method="post" name="f" onsubmit="return check()">
<input type="hidden" name="picture" value="">
<table border="1" cellspacing="0" cellpadding="0">
<caption>ȸ������</caption>
<tr>
<td align="right">���̵�</td>
<td><input type="text" name="id"></td>
</tr>
<tr><td align="right">�̸�</td>
<td><input type="text" name="name"></td>
</tr>
<tr><td align="right">�г���</td>
<td><input type="text" name="nickname"></td>
</tr>
<tr><td align="right">��й�ȣ</td>
<td><input type="password" name="password"></td>
</tr>
<tr><td align="right">���� ��￡ ���� ���</td>
<td><input type="text" name="place"></td>
<tr><td align="right">��ȭ��ȣ</td>
<td colspan="2"><input type="text" name="regnumber"></td></tr>
<tr><td colspan="3" align="center">
<input type="submit" value="ȸ������">
<input type="reset" value="�ٽ��ۼ�"></td></tr>
</table></form>
</body>
</html>