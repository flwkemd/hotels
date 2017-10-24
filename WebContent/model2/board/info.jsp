<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 상세보기</title>
</head>
<body>
<table align="center" valign="middle" border="1" cellspacing="0" cellpadding="0">
<tr><td colspan="2" align="center">
모델2 게시판 </td></tr>
<tr><td>글쓴이</td><td>${board.name}</td></tr>
<tr><td>제목</td><td>${board.subject}</td></tr>
<tr><td>내용</td><td>
<table border="0" width="490" height="250">
<tr><td valign="top">${board.content }</td></tr>
</table></td></tr>
<tr><td>첨부파일</td>
<td>&nbsp;
<c:if test="${!empty board.file1 }">
<a href="file/${board.file1 }">
${board.file1 }</a></c:if>&nbsp;
</td>
<tr align="center" valign="middle">
<td colspan="2">
<a href="replyForm.bo?num=${board.num }&pageNum=${param.pageNum}">[답변]</a>
<a href="updateForm.bo?num=${board.num }&pageNum=${param.pageNum}">[수정]</a>
<a href="deleteForm.bo?num=${board.num }&pageNum=${param.pageNum}">[삭제]</a>
<a href="javascript:history.go(-1);">[목록]</a>
</td></tr></table>
</body>
</html>