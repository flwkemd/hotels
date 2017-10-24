<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/list.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모델2 게시판</title>
<script type="text/javascript">
  function listsubmit(p){
	  document.sf.pageNum.value = p;
	  document.sf.submit(); //submit버튼이 클릭된것과 같은 효과를 얻음
	  						//onsubmit 이벤트는 발생 안함.
  }
</script>
</head>
<body>
<div align="center">
	<form action="list.bo" method="post" name="sf">
	<input type="hidden" name="pageNum" value="1">
 		게시글 검색:
 		<select name="column">
 			<option value="">선택하세요</option>
 			<option value="subject">제목</option>
 			<option value="content">내용</option>
 			<option value="name">작성자</option>
 		</select>
 		<script type="text/javascript">
 			document.sf.column.value="${param.column}";
 		</script>
 		<input type="text" name="find" size="50" value="${find}">
 		<input type="submit" value="검색">
 	</form>
 </div>
   <table border="1" width="100%" cellspacing="0" cellpadding="0" class="table-bordered table-hover" >
      <tr align="center">
         <td colspan="4">모델2 게시판</td>
         <c:if test="${listcount == 0 }">
            <td align="center">등록된 글이 없습니다.</td>
         </c:if>
         <c:if test="${ listcount > 0 }">
            <td align="center">글개수 :${listcount}</td>
      </tr>
      <tr align="center" valign="middle">
         <td width="8%">번호</td>
         <td width="50%">제목</td>
         <td width="14%">작성자</td>
         <td width="17%">날짜</td>
         <td width="11%">조회수</td>
      </tr>
      <c:forEach var="board" items="${list }">
         <tr align="center" valign="middle">
            <td>${boardNum }</td>
            <c:set var="boardNum" value="${boardNum -1}" />
            <td align="left">
            <%--el, jstl을 사용하여 첨부파일, 답변글 표시하기. --%>
            <c:if test="${!empty board.file1}">
            <a href="./file/${board.file1 }">@</a>
            </c:if>
            <c:if test="${empty board.file1 }">
            &nbsp;&nbsp;&nbsp;</c:if>
            <c:forEach var="a" begin="1" end="${board.reflevel }">
            &nbsp;&nbsp;</c:forEach>
            <c:if test="${board.reflevel > 0 }">└</c:if>
            <a href="info.bo?num=${board.num}&pageNum=${pageNum}">
                  ${board.subject }</a></td>
            <td>${board.name }</td>
            <td><fmt:formatDate value="${board.regdate }" var="regdate" pattern="yyyy-MM-dd" />
            <c:if test="${today==regdate }">
            <fmt:formatDate value="${board.regdate }" pattern="HH:mm:ss" />
            </c:if> <c:if test="${today!=regdate }">
            <fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd:mm" />
            </c:if></td>
            <td>${board.regdate }</td>
            <td>${board.readcnt }</td>
         </tr>
      </c:forEach>
      <tr align="center">
         <td colspan="5">
         <ul class = "pagination">
         <c:if test="${pageNum <= 1 }">
         <li class="disabled"><a href="#">
         <span class="glyphicon glyphicon-chevron-left"></span></a></li>
         </c:if>
         <c:if test="${pageNum > 1 }">
         <li><a href="javascript:listsubmit(${pageNum - 1 })">
         <span class="glyphicon glyphicon-chevron-left"></span></a></li>
         </c:if>
         <c:forEach var="a" begin="${startpage}" end="${endpage}">
         <c:if test="${a == pageNum }">
         <li class="active"><a href="#">${a}</a></li>
         </c:if>
         <c:if test="${a != pageNum}">
         <li><a href="javascript:listsubmit(${a})">${a}</a></li>
         </c:if>
         </c:forEach>
         <c:if test="${pageNum >= maxpage}">
         <li class="disabled"><a href="#">
         <span class="glyphicon glyphicon-chevron-right"></span></a></li>
         </c:if>
         <c:if test="${pageNum < maxpage }">
         <li><a href="javascript:listsubmit(${pageNum + 1})">
         <span class="glyphicon glyphicon-chevron-right"></span></a></li>
         </c:if>
         </ul>
         </td></tr></c:if>
      <tr align = "right"><td colspan="5">
      <a href="writeForm.bo">[글쓰기]</a>
      </td>
      </tr>
   </table>
</body>
</html>