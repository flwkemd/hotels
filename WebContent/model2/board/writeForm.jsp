<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모델2 게시판 : 게시물 등록 화면</title>
</head>
<body>
<form action="write.bo" method="post" enctype="multipart/form-data" name="f">
	<table border = "1" cellspacing="0" cellpadding="0">
	<caption>모델1 게시판</caption>
	<tr><td align ="center">글쓴이 </td>
	<td><input type = "text" name="name"></td></tr>
	<tr><td align ="center">비밀번호 </td>
	<td><input type = "password" name="pass"></td></tr>
	<tr><td align ="center">제목 </td>
	<td><input type = "text" name="subject" size="50"></td></tr>
	<tr><td align ="center">내용 </td>
	<td><textarea rows="15" cols="65" name="content"></textarea></td></tr>
	<tr><td align = "center">첨부파일</td>
	<td><input type="file" name="file1"></td></tr>
	<tr><td colspan="2" align="center">
	<a href="javascript:document.f.submit();">게시물 등록</a>
</table></form></body></html>