<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구관리 프로그램</title>
<style type="text/css">
.box {
width: 60%;
margin: 0 auto;
text-align: left;
padding: 10px;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%
	try {
		String member_name = request.getParameter("member_name");
	
		sql = "select member_no from member_tbl_11 where member_name = '" + member_name + "'";
		
		rs = stmt.executeQuery(sql);
		rs.next();
		
		String member_no = rs.getString(1);
%>
	<section>
		<div>
			<h2>친구 조회(<%=member_no %>)</h2>
			<h3><%=member_name %>님의 친구목록입니다.</h3>
		</div>
		<table border="1" width="60%" style="margin: 0 auto;">
			<tr>
				<th>회원ID</th>
				<th>회원명</th>
				<th>요청일자</th>
			</tr>
			<%
				int friendCnt=0;
				sql = "select member_id, member_name, to_char(req_date, 'yyyy-mm-dd') as req_date";
				sql += " from member_tbl_11 m, (select req_member_no, res_member_no, allow_yn, req_date";
				sql += " from friend_tbl_11"; 
				sql += " where allow_yn = 'Y' and req_member_no = " + member_no + " or res_member_no = " + member_no + ") f";
				sql += " where (m.member_no = f.res_member_no or m.member_no = f.req_member_no) and not member_no = " + member_no;
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
			%>
			<tr  align="center">
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
			</tr>
			<%
					friendCnt++;
				}
			%>
		</table>
		<div class="box">
			친구 : <%=friendCnt %>명
		</div>
	</section>
<%
	} catch (Exception e) {
%>
<script>
		alert("입력하신 회원님은 존재하지 않습니다.");
		history.back();
</script>
<%
	}
%>
<%@ include file="footer.jsp" %>
</body>
</html>