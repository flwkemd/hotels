<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� �󼼺���</title>
</head>
<body>
<table align="center" valign="middle" border="1" cellspacing="0" cellpadding="0">
<tr><td colspan="2" align="center">
��2 �Խ��� </td></tr>
<tr><td>�۾���</td><td>${board.name}</td></tr>
<tr><td>����</td><td>${board.subject}</td></tr>
<tr><td>����</td><td>
<table border="0" width="490" height="250">
<tr><td valign="top">${board.content }</td></tr>
</table></td></tr>
<tr><td>÷������</td>
<td>&nbsp;
<c:if test="${!empty board.file1 }">
<a href="file/${board.file1 }">
${board.file1 }</a></c:if>&nbsp;
</td>
<tr align="center" valign="middle">
<td colspan="2">
<a href="replyForm.bo?num=${board.num }&pageNum=${param.pageNum}">[�亯]</a>
<a href="updateForm.bo?num=${board.num }&pageNum=${param.pageNum}">[����]</a>
<a href="deleteForm.bo?num=${board.num }&pageNum=${param.pageNum}">[����]</a>
<a href="javascript:history.go(-1);">[���]</a>
</td></tr></table>
</body>
</html>