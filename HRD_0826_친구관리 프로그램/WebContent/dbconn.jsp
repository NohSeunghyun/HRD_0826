<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	
	Statement stmt = conn.createStatement();
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "";
%>