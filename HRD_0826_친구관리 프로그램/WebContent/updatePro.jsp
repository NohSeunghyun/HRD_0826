<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	try {
		sql = "update member_tbl_11 set member_id = ?, member_name = ?, member_grade = ?, member_hobby = ?, member_date = ? where member_no = ?";
		
		String[] hobby1 = request.getParameterValues("member_hobby");
		String hobby2 = "";
		for (int i=0; i < hobby1.length ; i++) {
			hobby2 = hobby2 + ((i==0)? hobby1[i] : "," + hobby1[i]); 
		}
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, request.getParameter("member_id"));
		ps.setString(2, request.getParameter("member_name"));
		ps.setString(3, request.getParameter("member_grade"));
		ps.setString(4, hobby2);
		ps.setString(5, request.getParameter("member_date"));
		ps.setString(6, request.getParameter("member_no"));
		
		ps.executeUpdate();
%>
<script>
		alert("회원수정이 완료 되었습니다.");
		location = "select.jsp";
</script>
<%
	} catch (Exception e) {
%>
<script type="text/javascript">
		alert("회원수정이 실패 하였습니다.")
		history.back();
</script>
<%
	} finally {
		try {
			if (conn != null) conn.close();
			if (stmt != null) stmt.close();
			if (ps != null) ps.close();
			if (rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>