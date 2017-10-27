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
	      alert("아이디를 입력하세요");
	      f.id.focus();
	      return false;
	   }
	   if(f.pass.value==''){
	      alert("비밀번호를 입력하세요");
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
        <h3><a id="mainHome" class="navbar-brand" href="${path}/model2/member/main.me">Hotels</a></h3>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-left">
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="${path}/model2/board/list.bo">호텔소개</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="${path}/model2/board/list5.bo">후기게시판</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="${path}/model2/board/list6.bo">Q&A</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="${path}/model2/board/list7.bo">자유게시판</a>
            </li>
          </ul>
          <ul class="navbar-nav ml-auto">
            <c:if test="${empty sessionScope.login}">
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="${path}/model2/member/joinForm.me">회원가입</a>
				</li>
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="${path}/model2/member/loginForm.me">로그인</a>
				</li>
			</c:if>
			<c:if test="${sessionScope.login == 'admin' }">
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="list.me">회원 목록 보기</a>
				</li>
			</c:if>
            <c:if test="${!empty sessionScope.login}">
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="#">${sessionScope.login}님</a>
				</li>
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="info.me?id=${sessionScope.login }">회원정보보기</a>
				</li>
				<li class="nav-item">
					<a id="navSub" class="nav-link" href="${path }/model2/member/logout.me">로그아웃</a>
				</li>
			</c:if>
          </ul>
        </div>
      </div>
    </nav>
    	<div class="container">
		  <div class="row">
		    <div class="col-md-4 offset-4">
		        <h3 class="panel-title" id="panelT">로그인</h3>
		      <div class="card my-4">
 				<form class="form1" action = "loginCheck.me" method="post">
		            <div class="card-body">
		                <input type="text" class="form-control" name="id" placeholder="아이디"><br>
		                <input type="password" class="form-control" name="password" placeholder="비밀번호">
		            </div>
	               <input class="btn btn-danger pull-right" id="loginBtn" type="submit" value="로그인">
	            </form>
	           </div>
	          </div>
	        </div>
	     </div>
</body>
</html>