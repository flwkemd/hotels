<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모델2 게시판 답글쓰기</title>
</head>
<body>
<form action="reply.bo" method="post" name="f">
<input type="hidden" name="pageNum" value="${param.pageNum }">
<input type="hidden" name="num" value="${board.num }">
<input type="hidden" name="ref" value="${board.ref }">
<input type="hidden" name="reflevel" value="${board.reflevel }">
<input type="hidden" name="refstep" value="${board.refstep }">
<table border="1" cellspacing="0" cellpadding="0">
<tr><td colspan="2" align="center">모델 2 게시판 : 답변글</td></tr>
<tr><td>글쓴이</td>
<td><input type="text" name="name"></td></tr>
<tr><td>비밀번호</td>
<td><input type="text" name="pass"></td></tr>
<tr><td>제목</td>
<td><input type="text" name="subject" size="50" value="Re:${board.subject }"></td>
</tr>
<tr><td>내용</td>
<td><textarea rows="15" cols="65" name="content"></textarea>
</td></tr>
<tr><td colspan="2" align="center">
<a href="javascript:document.f.submit();">[답변등록]</a>
<a href="javascript:document.f.reset();">[다시작성]</a>
<a href="javascript:history.go(-1);">[뒤로가기]</a>
</td></tr></table></form>
</body>
</html>