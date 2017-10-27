<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html">
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
	function file_delete(){
		document.f.files.value="";
		document.getElementById("file_desc").innerHTML="";
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
				<div class="col-lg-6 offset-2">
				<h4>글 수정</h4>
				<form method="post" action="update.bo" name="f" enctype="multipart/form-data">
				<input type="hidden" name="num" value="${board.num }">
				<input type="hidden" name="file2" value="${board.files }">
				<table class="table table-bordered table-hover">
				<tbody>
				<tr>
				
					<td style="width:110px;"><h5>분류</h5></td>
					<td><select name="btype">
							  <option value="1">호텔소개</option>
							  <option value="2">후기게시판</option>
							  <option value="3">Q&A</option>
							  <option value="4">자유게시판</option>
					    </select></td>
					<td style="width:110px;"><h5>지역분류</h5></td>
					<td><select name="subtype">
							  <option value="0">미사용</option>
							  <option value="1">강남구</option>
							  <option value="2">강동구</option>
							  <option value="3">강서구</option>
							  <option value="4">강동구</option>
					    </select></td>
				</tr>
				<tr>
					<td style="width:110px;"><h5>제목</h5></td>
					<td colspan="3"><input class="form-control" type="text" name="subject" maxlength="20" placeholder="제목을 입력하세요." value="${board.subject }">
				</tr>
				<tr>
					<td style="width:110px;"><h5>내용</h5></td>
					<td colspan="3"><input type="text" id="content" class="form-control" name="content" maxlength="2048" placeholder="내용을 입력하세요." value="${board.content }"></td>
				</tr>
				<tr>
					<td style="width:110px;"><h5>파일</h5></td>
					<td colspan="3"><input class="form-control" type="file" name="files" maxlength="20"></td>
				</tr>
				<tr>
					<c:if test="${! empty board.files }">
					<div id="file_desc">
						<td style="width:110px;">첨부파일</td>
						<td style="width:110px;"><a href="file/${board.files }">${board.files }</a>&nbsp;</td>
						<td colspan="2" style="text-align: center;"><a href="javascript:file_delete()">[첨부파일삭제]</a></td>
					</div>
					</c:if>
				</tr>	
				</tbody>
				</table>
						<input type="hidden" name="id" value="${sessionScope.login }">
						<a style="float: left;" href="javascript:history.go(-1);">뒤로가기</a>
						<a style="float: right;" href="javascript:document.f.submit();">게시물 수정</a>
				</form>
				</div>
				</div>
			</div>
				
</body>
</html>