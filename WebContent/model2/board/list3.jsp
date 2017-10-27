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
    
    <!-- font-awesome CSS -->
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles -->
    <link href="../../css/custom.css" rel="stylesheet">

	<script type="text/javascript">
	  function listsubmit(p){
		  document.sf.pageNum.value = p;
		  document.sf.submit(); //submit버튼이 클릭된것과 같은 효과를 얻음
		  						//onsubmit 이벤트는 발생 안함.
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
    		<h4 style="padding-left: 150px;">강서구</h4>
    	<div class="row">
			<div class="col-md-2">
    			<h5><a href="${path}/model2/board/list.bo" id="menuItem">강남구</a></h5><br>
    			<h5><a href="${path}/model2/board/list2.bo" id="menuItem">강북구</a></h5><br>
    			<h5><a href="#" id="menuItem">강서구</a></h5><br>
    			<h5><a href="${path}/model2/board/list4.bo" id="menuItem">강동구</a></h5><br>
			</div>
			<div class="col-md-9">
				<div class="table-board" id="tableList">
				<table class="table table-bordered table-hover">
				<thead id="thead">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${list }">
				<c:if test="${board.subtype eq '3' }">
					<tr>
						<td>${board.num}</td>
						<td>${board.id}</td>
						<td><a href="info.bo?num=${board.num}&pageNum=${pageNum}">${board.subject }</a></td>
						<td>${board.readcnt}</td>
					</tr>
					</c:if>
				</c:forEach>	
				</tbody>
				</table>
				</div>
			</div>
    	</div>
    	<div class="row">
    		<div class="col-lg-12">
    		<div class="write" style="text-align:right">
    			<c:if test="${!empty sessionScope.login }">
					<a href="${path}/model2/board/writeForm.bo">글 쓰기</a>
				</c:if>
				</div>
				  <ul class="pagination justify-content-center">
				  	 <c:if test="${pageNum <= 1 }">
				         <li class="disabled"><a class="page-link" href="#">
				         <span class="glyphicon glyphicon-chevron-left"></span></a></li>
				         </c:if>
				         <c:if test="${pageNum > 1 }">
				         <li class="page-item"><a class="page-link" href="javascript:listsubmit(${pageNum - 1 })">
				         <span class="glyphicon glyphicon-chevron-left"></span></a></li>
				         </c:if>
				         <c:forEach var="a" begin="${startpage}" end="${endpage}">
				         <c:if test="${a == pageNum }">
				         <li class="active"><a class="page-link" href="#">${a}</a></li>
				         </c:if>
				         <c:if test="${a != pageNum}">
				         <li class="page-item"><a class="page-link" href="javascript:listsubmit(${a})">${a}</a></li>
				         </c:if>
				         </c:forEach>
				         <c:if test="${pageNum >= maxpage}">
				         <li class="disabled"><a class="page-link" href="#">
				         <span class="glyphicon glyphicon-chevron-right"></span></a></li>
				         </c:if>
				         <c:if test="${pageNum < maxpage }">
				         <li class="page-item"><a class="page-link" href="javascript:listsubmit(${pageNum + 1})">
				         <span class="glyphicon glyphicon-chevron-right"></span></a></li>
				         </c:if>
				  </ul>
    		</div>
    	</div>
    </div>
    
</body>
</html>