<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구관리 프로그램</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>친구 조회/수정</h2>
		</div>
		<table border="1" width="600" style="margin: 0 auto;">
			<tr>
				<th>회원번호</th>
				<th>회원ID</th>
				<th>이름</th>
				<th>등급</th>
				<th>취미</th>
				<th>등록일자</th>
			</tr>
			<%
				sql += "select member_no, member_id, member_name,";
				sql += " decode(member_grade, 'S', '특별', 'A', '우수', 'B', '일반'),";
				sql += " member_hobby,"; 
				sql += " to_char(member_date, 'yyyy.mm.dd')";
				sql += " from member_tbl_11";
				sql += " order by member_id";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td>
				<a href="update.jsp?member_no=<%=rs.getString(1) %>">
				<%=rs.getString(2) %>
				</a>
				</td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>