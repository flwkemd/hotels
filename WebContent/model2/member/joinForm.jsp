<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 가입 화면</title>
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
<caption>회원가입</caption>
<tr>
<td align="right">아이디</td>
<td><input type="text" name="id"></td>
</tr>
<tr><td align="right">이름</td>
<td><input type="text" name="name"></td>
</tr>
<tr><td align="right">닉네임</td>
<td><input type="text" name="nickname"></td>
</tr>
<tr><td align="right">비밀번호</td>
<td><input type="password" name="password"></td>
</tr>
<tr><td align="right">가장 기억에 남는 장소</td>
<td><input type="text" name="place"></td>
<tr><td align="right">전화번호</td>
<td colspan="2"><input type="text" name="regnumber"></td></tr>
<tr><td colspan="3" align="center">
<input type="submit" value="회원가입">
<input type="reset" value="다시작성"></td></tr>
</table></form>
</body>
</html>