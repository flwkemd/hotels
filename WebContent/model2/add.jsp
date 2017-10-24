<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모델 2 연습 : ADD</title>
</head>
<body>
<form action="add.me" method="post">
<input type="text" name="num1" size="5"> +
<input type="text" name="num2" size="5"> =
<input type="submit" value="더하기"><br>
결과:<input type="text" name="result" value="${result }">
</form>
</body>
</html>