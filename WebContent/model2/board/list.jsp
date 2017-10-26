<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/board/list.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��2 �Խ���</title>
<script type="text/javascript">
  function listsubmit(p){
	  document.sf.pageNum.value = p;
	  document.sf.submit(); //submit��ư�� Ŭ���ȰͰ� ���� ȿ���� ����
	  						//onsubmit �̺�Ʈ�� �߻� ����.
  }
</script>
</head>
<body>
<div align="center">
	<form action="list.bo" method="post" name="sf">
	<input type="hidden" name="pageNum" value="1">
 		�Խñ� �˻�:
 		<select name="column">
 			<option value="">�����ϼ���</option>
 			<option value="subject">����</option>
 			<option value="content">����</option>
 			<option value="name">�ۼ���</option>
 		</select>
 		<script type="text/javascript">
 			document.sf.column.value="${param.column}";
 		</script>
 		<input type="text" name="find" size="50" value="${find}">
 		<input type="submit" value="�˻�">
 	</form>
 </div>
   <table border="1" width="100%" cellspacing="0" cellpadding="0" class="table-bordered table-hover" >
      <tr align="center">
         <td colspan="4">��2 �Խ���</td>
         <c:if test="${listcount == 0 }">
            <td align="center">��ϵ� ���� �����ϴ�.</td>
         </c:if>
         <c:if test="${ listcount > 0 }">
            <td align="center">�۰��� :${listcount}</td>
      </tr>
      <tr align="center" valign="middle">
         <td width="8%">��ȣ</td>
         <td width="50%">����</td>
         <td width="14%">�ۼ���</td>
         <td width="17%">��¥</td>
         <td width="11%">��ȸ��</td>
      </tr>
      <c:forEach var="board" items="${list }">
         <tr align="center" valign="middle">
            <td>${boardNum }</td>
            <c:set var="boardNum" value="${boardNum -1}" />
            <td align="left">
            <%--el, jstl�� ����Ͽ� ÷������, �亯�� ǥ���ϱ�. --%>
            <c:if test="${!empty board.files}">
            <a href="./file/${board.files }">@</a>
            </c:if>
            <c:if test="${empty board.files }">
            &nbsp;&nbsp;&nbsp;</c:if>
            <c:forEach var="a" begin="1" end="${board.reflevel }">
            &nbsp;&nbsp;</c:forEach>
            <c:if test="${board.reflevel > 0 }">��</c:if>
            <a href="info.bo?num=${board.num}&pageNum=${pageNum}">
                  ${board.subject }</a></td>
            <td>${board.name }</td>
            <td><fmt:formatDate value="${board.date1 }" var="regdate" pattern="yyyy-MM-dd" />
            <c:if test="${today==date1 }">
            <fmt:formatDate value="${board.date1 }" pattern="HH:mm:ss" />
            </c:if> <c:if test="${today!=date1 }">
            <fmt:formatDate value="${board.date1 }" pattern="yyyy-MM-dd:mm" />
            </c:if></td>
            <td>${board.date1 }</td>
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
      <a href="writeForm.bo">[�۾���]</a>
      </td>
      </tr>
   </table>
</body>
</html>