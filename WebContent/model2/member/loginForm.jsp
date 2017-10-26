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

	<script type="text/javascript">
	function check(f){
	   if(f.id.value==''){
	      alert("���̵� �Է��ϼ���");
	      f.id.focus();
	      return false;
	   }
	   if(f.pass.value==''){
	      alert("��й�ȣ�� �Է��ϼ���");
	      f.pass.focus();
	      return false;
	   }
	   
	   return true;
	}
	</script>
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
    	<div class="container">
		  <div class="row">
		    <div class="col-md-4 offset-4">
		        <h3 class="panel-title" id="panelT">�α���</h3>
		      <div class="card my-4">
 				<form class="form1" action = "loginCheck.me" method="post">
		            <div class="card-body">
		                <input type="text" class="form-control" name="id" placeholder="���̵�"><br>
		                <input type="password" class="form-control" name="password" placeholder="��й�ȣ">
		            </div>
	               <input class="btn btn-danger pull-right" id="loginBtn" type="submit" value="�α���">
	            </form>
	           </div>
	          </div>
	        </div>
	     </div>
</body>
</html>