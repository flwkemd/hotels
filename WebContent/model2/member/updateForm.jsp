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
            <div class="col-md-4 offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" id="panelT">ȸ����������</h3>
                    </div>
                    <div class="panel-body">
                        <form action="updateCheck.me" method="post" name="f" onsubmit="return check()">
                            <fieldset>
                                <div class="form-group">
                                  <h4><span>���̵�</span></h4>
                                  <input class="form-control" name="id" readonly value="${mem.id}" >
                                </div>
                                <div class="form-group">
                                   <h4><span>�̸�</span></h4>
                                   <input class="form-control" name="name" value="${mem.name }">
                                </div>
                                <div class="form-group">
                                   <h4><span>�г���</span></h4>
                                   <input class="form-control" name="nickname" value="${mem.nickname }">
                                </div>
                                <div class="form-group">
                                   <h4><span>��й�ȣ</span></h4>
                                   <input class="form-control" type="password" name="password" value="${mem.password }">
                                </div>
                                <div class="form-group">
                                   <h4><span>���</span></h4>
                                   <input class="form-control" name="place" value="${mem.place }">
                                </div>
                                <div class="form-group">
                                   <h4><span>��ȭ��ȣ</span></h4>
                                   <input class="form-control" name="regnumber" value="${mem.regnumber }">
                                </div>
								<input type="submit" value="ȸ������" class="btn btn-lg btn-danger btn-block">
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>