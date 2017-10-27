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
        <h3><a id="mainHome" class="navbar-brand" href="${path}/model2/member/main.me">Hotels</a></h3>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-left">
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="${path}/model2/board/list.bo">ȣ�ڼҰ�</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="${path}/model2/board/list5.bo">�ı�Խ���</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="${path}/model2/board/list6.bo">Q&A</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="${path}/model2/board/list7.bo">�����Խ���</a>
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
    
    	<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-2">
				<h4>�亯�ϱ�</h4>
					<form action="reply.bo" method="post" name="f">
					<input type="hidden" name="pageNum" value="${param.pageNum }">
					<input type="hidden" name="num" value="${board.num }">
					<input type="hidden" name="btype" value="${board.btype }">
					<input type="hidden" name="subtype" value="${board.subtype }">
					<input type="hidden" name="ref" value="${board.ref }">
					<input type="hidden" name="reflevel" value="${board.reflevel }">
					<input type="hidden" name="refstep" value="${board.refstep }">
					<table class="table table-bordered table-hover">
				<tbody>
				<tr>
					<td style="width:110px;"><h5>����</h5></td>
					<td colspan="3"><input class="form-control" type="text" name="subject" maxlength="20" placeholder="������ �Է��ϼ���.">
				</tr>
				<tr>
					<td style="width:110px;"><h5>����</h5></td>
					<td colspan="3"><textarea type="text" class="form-control" name="content" maxlength="2048" placeholder="������ �Է��ϼ���."></textarea></td>
				</tr>
				<tr>
					<td style="width:110px;"><h5>����</h5></td>
					<td colspan="3"><input class="form-control" type="file" name="files" maxlength="20"></td>
				</tr>
				</tbody>
				</table>
						<input type="hidden" name="id" value="${sessionScope.login }">
						<a href="javascript:document.f.submit();">[�亯���]</a>
						<a href="javascript:document.f.reset();">[�ٽ��ۼ�]</a>
						<a href="javascript:history.go(-1);">[�ڷΰ���]</a>
				</form>
				</div>
				</div>
			</div>
			
</body>
</html>