<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구관리 프로그램</title>
<script type="text/javascript">
	function check() {
		if (f.member_no.value == "") {
			alert("회원 번호를 입력해 주세요!")
			return f.member_no.focus();
		}
		if (f.member_id.value == "") {
			alert("회원 아이디를 입력해 주세요!")
			return f.member_id.focus();
		}
		if (f.member_name.value == "") {
			alert("회원 이름을 입력해 주세요!")
			return f.member_name.focus();
		}
		if (f.member_grade.value == "") {
			alert("회원 등급을 체크해 주세요!")
			return false;
		}
		if (f.member_hobby[0].checked == false &&
				f.member_hobby[1].checked == false &&
					f.member_hobby[2].checked == false) {
			alert("회원 취미를 체크해 주세요!")
			return false;
		}
		if (f.member_date.value == "") {
			alert("등록일자를 입력해 주세요!")
			return f.member_date.focus();
		}
		f.submit();
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%
	String select1 = "";
	String select2 = "";
	String select3 = "";
	String check1 = "";
	String check2 = "";
	String check3 = "";
	String member_no = request.getParameter("member_no");
	
	sql += "select member_id, member_name, member_grade, member_hobby,";
	sql += " to_char(member_date, 'yyyy/mm/dd')";
	sql += " from member_tbl_11";
	sql += " where member_no = " + member_no;
	
	rs = stmt.executeQuery(sql);
	rs.next();
	
	if (rs.getString(3).equals("S")) {
		select1 = "selected";
	} else if (rs.getString(3).equals("A")) {
		select2 = "selected";
	} else if (rs.getString(3).equals("B")) {
		select3 = "selected";
	}
	
	if (rs.getString(4) != null) {
		String[] member_hobby = rs.getString(4).split(",");
	
		for (int i = 0 ; i < member_hobby.length ; i++) {
			if (member_hobby[i].equals("독서")) {
				check1 = "checked";
			} else if (member_hobby[i].equals("운동")) {
				check2 = "checked";
			} else if (member_hobby[i].equals("영화")) {
				check3 = "checked";
			}
		}
	}
%>
	<section>
		<div>
			<h2>친구 수정</h2>
		</div>
		<form action="updatePro.jsp" name="f" method="post">
			<table border="1" width="600" style="margin: 0 auto;">
				<tr>
					<th>회원번호</th>
					<td>
						<input type="text" value="<%=member_no %>" name="member_no" size="30" readonly>
					</td>
				</tr>
				<tr>
					<th>회원ID</th>
					<td>
						<input type="text" value="<%=rs.getString(1) %>" name="member_id" size="30" maxlength="10">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" value="<%=rs.getString(2) %>" name="member_name" size="30" maxlength="20">
					</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<select name="member_grade" size="4">
							<option value="S" <%=select1 %>>특별회원</option>
							<option value="A" <%=select2 %>>우수회원</option>
							<option value="B" <%=select3 %>>일반회원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						&nbsp;<label><input type="checkbox" value="독서" name="member_hobby" <%=check1 %>>독서</label>
						&nbsp;<label><input type="checkbox" value="운동" name="member_hobby" <%=check2 %>>운동</label>
						&nbsp;<label><input type="checkbox" value="영화" name="member_hobby" <%=check3 %>>영화</label>
					</td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td>
						<input type="text" value="<%=rs.getString(5) %>" name="member_date" size="30" placeholder="yyyy/mm/dd">
					</td>
				</tr>
			</table>
			<center>
				<input type="button" value="수정" onclick="check(); return false">&nbsp;&nbsp;
				&nbsp;&nbsp;<input type="button" value="조회" onclick="location='select.jsp'">
			</center>
		</form>
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>