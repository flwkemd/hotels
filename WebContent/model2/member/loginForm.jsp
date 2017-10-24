<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<style type="text/css">
body{
background:url('img/111.jpg') no-repeat center center fixed;
   -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
.form1{
   position: absolute;
   bottom:250px;
   left:150px;
}
table{
   opacity:0.8;
}
.td1{
   background-color:white;
   border:1px solid black;
}
.login{
   font-size:30px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>로그인 화면</title>
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
<form class="form1" action = "loginCheck.me" method="post"
onsubmit = "return check(this)">
<table class="badge badge-secondary">
<tr><td class="login" colspan="1" align="center"><div class="alert alert-dark" role="alert">
  LOGIN
</div></td></tr>
<tr><td><div class="input-group">
  <span class="input-group-addon" id="sizing-addon2"><span class="glyphicon glyphicon-user" aria-hidden="true" align="center"></span></span>
  <input type="text" name="id" class="form-control" placeholder="UserID" aria-describedby="sizing-addon2">
</div></td></tr>
<tr><td><div class="input-group">
  <span class="input-group-addon" id="sizing-addon2"><span class="glyphicon glyphicon-rub" aria-hidden="true" align="center"></span></span>
  <input type="password" name="password" class="form-control" placeholder="PassWord" aria-describedby="sizing-addon2">  
</div></td></tr>
<tr><td colspan = "2" align="center">

<br><div class="btn-group" role="group"><strong>
  <button type="submit" class="btn btn-default" style="font-size:2px bold;"><strong>Login</strong></button>
  <button type="button" class="btn btn-default" onclick="location.href='joinForm.me'"><strong>Join</strong></button>
</strong>
</div>
</td></tr>
</table>
</form>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
      integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
      crossorigin="anonymous"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
      integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
      crossorigin="anonymous"></script>
</body>
</html>