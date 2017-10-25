<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 수정 화면</title>
<script type = "text/javascript">
function win_open() {
	var op = "width=300,height=50, scrollbars=yes," + "resizable=yes,left=50,top=150";
	window.open("memberimg.me" , "picture", op);
}
</script>
</head>
<body>
<form action="updateCheck.me" name="f" method="post">
<table border="1" cellpadding="0" cellspacing="0">
<caption>회원 수정</caption>
<tr><td rowspan="4" valign="bottom" align="center">
<a href="javascript:win_open()">
</td><td>아이디</td>
<td><input type="text" name="id" readonly value="${mem.id}"></td></tr>
<tr><td>이름</td>
<td><input type="text" name="name" value="${mem.name}"></td></tr>
<tr><td>비밀번호</td>
<td><input type="password" name="pass" value="${mem.password}"></td></tr>
<tr><td>전화</td>
<td colspan="2">
<input type="text" name="tel" value="${mem.place}"></td></tr>
<tr><td>이메일</td>
<td colspan="2"><input type="text" name="email" value="${mem.regnumber}"></td></tr>
<tr><td colspan="3" align="center">
<a href="javascript:document.f.submit()"> [회원수정] </a></td></tr>
</table>
</form>

</body>
</html>