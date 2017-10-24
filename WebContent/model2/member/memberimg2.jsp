<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- /WebContent/model2/member/memberimg2.jsp --%>
<script>
	img = opener.document.getElementById("pic");
	img.src="./picture/${filename}";
	opener.document.f.picture.value="${filename}";
	self.close();
</script>