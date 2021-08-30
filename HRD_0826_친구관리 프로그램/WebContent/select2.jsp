<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구관리 프로그램</title>
<script type="text/javascript">
	function check() {
		if (f.member_name.value == "") {
			alert("친구검색할 회원이름을 입력해 주세요!")
			return f.member_name.focus();
		}
		f.submit();
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>친구 조회</h2>
		</div>
		<form action="select3.jsp" name="f" method="post">
			<center>
				<h4>이름을 입력하시면 해당 회원님의 친구를 검색합니다.</h4>
				<input type="text" value="" name="member_name" size="10" autofocus>
				<input type="submit" value="검색" onclick="check(); return false">
			</center>
		</form>
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>