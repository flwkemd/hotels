<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ȭ��</title>
<script type = "text/javascript">
function win_open() {
	var op = "width=300,height=50, scrollbars=yes," + "resizable=yes,left=50,top=150";
	window.open("memberimg.me" , "picture", op);
}
</script>
</head>
<body>
<form action="updateCheck.me" name="f" method="post">
<input type="hidden" name="picture" value="${mem.picture}">
<table border="1" cellpadding="0" cellspacing="0">
<caption>ȸ�� ����</caption>
<tr><td rowspan="4" valign="bottom" align="center">
<img src="./picture/${mem.picture}" id="pic" width="100" height="120"><br>
<a href="javascript:win_open()">
<font size="1">�������</font></a>
</td><td>���̵�</td>
<td><input type="text" name="id" readonly value="${mem.id}"></td></tr>
<tr><td>��й�ȣ</td>
<td><input type="password" name="pass" value="${mem.pass}"></td></tr>
<tr><td>�̸�</td>
<td><input type="text" name="name" value="${mem.name}"></td></tr>
<tr><td>����</td>
<td colspan="2">
<input type="radio" name="gender" value="1" id="g1">��
<input type="radio" name="gender" value="2" id="g2">��
<script type="text/javascript">
gender =${mem.gender};
if(gender ==1) {
	document.getElementById("g1").setAttribute("checked", "checked");
}else {
	document.getElementById("g2").setAttribute("checked", "checked");
}</script>
</td></tr>
<tr><td>��ȭ</td>
<td colspan="2">
<input type="text" name="tel" value="${mem.tel}"></td></tr>
<tr><td>�̸���</td>
<td colspan="2"><input type="text" name="email" value="${mem.email}"></td></tr>
<tr><td colspan="3" align="center">
<a href="javascript:document.f.submit()"> [ȸ������] </a></td></tr>
</table>
</form>

</body>
</html>