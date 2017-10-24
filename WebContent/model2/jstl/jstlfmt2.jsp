<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="today" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ȭ �±� ����</title>
</head>
<body>
   <fmt:requestEncoding value="euc-kr" />
   <form method="POST">
      <table border="1">
         <tr>
            <td>�̸�</td>
            <td><input type="text" name="name" value="${param.name }"></td>
         </tr>
         <tr>
            <td>�Ի���</td>
            <td><input type="text" name="date" value="${param.date }"></td>
         </tr>
         <tr>
            <td>�޿�</td>
            <td><input type="text" name="pay" value="${param.pay }"></td>
         </tr>
         <tr>
            <td><input type="submit" value="����"></td>
         </tr>
      </table>
   </form>
   <br> �̸� : ${param.name }
   <br> �Ի��� :
   <fmt:parseDate value="${param.date }" pattern="yyyy-MM-dd" var="day" />
   <fmt:formatDate value="${day }" type="date" timeStyle="long"
      dateStyle="long" />
   <br> �޿� :
   <fmt:formatNumber value="${param.pay }" type="currency" />
</body>
</html>