<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Hotels</title>

    <!-- Bootstrap core CSS -->
    <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles -->
    <link href="../../css/custom.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-white bg-white fixed-top">
      <div class="container">
        <h3><a id="mainHome" class="navbar-brand" href="#">Hotels</a></h3>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-left">
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="#">ȣ�ڼҰ�
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="#">�ı�Խ���</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="#">Q&A</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="#">�����Խ���</a>
            </li>
          </ul>
          <ul class="navbar-nav ml-auto">
            <c:if test="${empty sessionScope.login}">
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="${path}/model2/member/joinForm.me">ȸ������</a>
				</li>
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="${path}/model2/member/loginForm.me">�α���</a>
				</li>
			</c:if>
			<c:if test="${sessionScope.login == 'admin' }">
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="list.me">ȸ�� ��� ����</a>
				</li>
			</c:if>
            <c:if test="${!empty sessionScope.login}">
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="#">${sessionScope.login}��</a>
				</li>
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="info.me?id=${sessionScope.login }">ȸ����������</a>
				</li>
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="${path }/model2/member/logout.me">�α׾ƿ�</a>
				</li>
			</c:if>
          </ul>
        </div>
      </div>
    </nav>
<body>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
				<div class="table-board" id="tableList">
				<table class="table table-bordered table-hover">
				<thead id="thead">
					<tr>
						<th>���̵�</th>
						<th>�̸�</th>
						<th>�г���</th>
						<th>���</th>
						<th>��ȭ��ȣ</th>
						<th>����/Ż��</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="mem" items="${list}">
					<tr>
						<td><a href="info.me?id=${mem.id}">${mem.id}</a></td>
						<td>${mem.name}</td>
						<td>${(mem.nickname)}</td>
						<td>${mem.place}</td>
						<td>${mem.regnumber}</td>
						<td><a href="updateForm.me?id=${mem.id}">���� /</a>
						<a href="delete.me?id=${mem.id}">����Ż��</a></td>
					</tr>
				</c:forEach>	
				</tbody>
				</table>
				</div>
				</div>
			</div>
		</div>
</body>
</html>