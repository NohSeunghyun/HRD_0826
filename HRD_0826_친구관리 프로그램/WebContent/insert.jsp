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
	
	function enterFocus(frm, objName) {
		var keycode = event.keyCode;        
        var i = 0;
    
        if( keycode == 13 ){
            for( i = 0; i < frm.length; ++i ){
	   			if( objName.name == frm[i].name ) break;
            }
            frm[++i].focus();
         }
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%
		sql = "select nvl(max(member_no), 0)+1 from member_tbl_11";
	
		rs = stmt.executeQuery(sql);
		rs.next();
		String member_no = rs.getString(1);
		
		sql = "select to_char(sysdate, 'yyyy/mm/dd') from dual";
		rs = stmt.executeQuery(sql);
		rs.next();
		String member_date = rs.getString(1);
%>
	<section>
		<div>
			<h2>친구 등록</h2>
		</div>
		<form action="insertPro.jsp" name="f" method="post">
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
						<input type="text" value="" name="member_id" size="30" maxlength="10" onkeydown="enterFocus(this.form, this)" autofocus>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" value="" name="member_name" size="30" maxlength="20">
					</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<select name="member_grade" size="4">
							<option value="S">특별회원</option>
							<option value="A">우수회원</option>
							<option value="B">일반회원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						&nbsp;<label><input type="checkbox" value="독서" name="member_hobby">독서</label>
						&nbsp;<label><input type="checkbox" value="운동" name="member_hobby">운동</label>
						&nbsp;<label><input type="checkbox" value="영화" name="member_hobby">영화</label>
					</td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td>
						<input type="text" value="<%=member_date %>" name="member_date" size="30" placeholder="yyyy/mm/dd">
					</td>
				</tr>
			</table>
			<center>
				<input type="button" value="등록" onclick="check(); return false">&nbsp;&nbsp;
				&nbsp;&nbsp;<input type="button" value="조회" onclick="location='select.jsp'">
			</center>
		</form>
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>