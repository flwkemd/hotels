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
              <a id="navSub" class="nav-link" href="#">호텔소개
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="#">후기게시판</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="#">Q&A</a>
            </li>
            <li class="nav-item">
              <a id="navSub" class="nav-link" href="#">자유게시판</a>
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
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" id="panelT">회원가입</h3>
                    </div>
                    <div class="panel-body">
                        <form action="joinCheck.me" method="post" name="f" onsubmit="return check()">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디를 입력해주세요" name="id" type="text" maxlength="20" autofocus >
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="이름을 입력해주세요" name="name" type="text" maxlength="20">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="닉네임을 입력해주세요" name="nickname" type="text" maxlength="20">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호를 입력해주세요" name="password" type="password" maxlength="50">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="가장 기억에 남는 장소를 입력해주세요" name="place" type="text" maxlength="20">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="전화번호를 입력해주세요" name="regnumber" type="text" maxlength="20">
                                </div>
								<input type="submit" value="가입완료" class="btn btn-lg btn-danger btn-block">
                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="../../vendor/jquery/jquery.min.js"></script>
    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>