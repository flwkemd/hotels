<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 수정 화면</title>
<script type = "text/javascript">
function file_delete(){
	document.f.file2.value="";
	document.getElementById("file_desc").innerHTML="";
}</script>
</head>
<body>
<form method="post" action="update.bo" name="f" enctype="multipart/form-data">
<input type="hidden" name="num" value="${board.num }">
<input type="hidden" name="file2" value="${board.file1 }">
<table border="1" cellspacing="0" cellpadding="0">
<tr><td colspan="2">모델1 게시판: 게시판 수정 화면</td></tr>
<tr><td>제목</td>
<td><input type="text" name="subject" value="${board.subject }"></td>
</tr>
<tr><td>내용</td>
<td><textarea name="content" cols="65" rows="15">${board.content }</textarea>
</td></tr>
<tr><td>첨부파일</td>&nbsp;<td>
<c:if test="${! empty board.file1 }">
<div id="file_desc">
<a href="file/${board.file1 }">${board.file1 }</a>&nbsp;
<a href="javascript:file_delete()">[첨부파일삭제]</a>
</div>
</c:if>
<input type="file" name="file1" id="file1">
</td></tr>
<tr><td>비밀번호</td>
<td><input type="password" name="pass"></td>
</tr><tr><td colspan="2" align="center">
<a href="javascript:document.f.submit()">[수정]</a>
<a href="javascript:document.f.reset()">[취소]</a>
<a href="javascript:history.go(-1)">[뒤로]</a>
</td></tr></table></form>
</body>
</html>