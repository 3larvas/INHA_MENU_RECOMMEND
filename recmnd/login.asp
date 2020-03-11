<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>
<%@Language = "VBScript" CODEPAGE = "65001" %>
<%
   Response.CharSet = "utf-8"
   Session.codepage = "65001"
   Response.codepage = "65001"
   Response.ContentType = "text/html; charset = utf-8"
%>

<html>
	<body>
	<div style="text-aglin:center">
	<div style="display:inline-block">
		<div id = "header">
			<ul>
				<li>
					<b> 로그인 <b>
				</li>

			</ul>
		</div>
	<!-- Header -->
		<div id = "content">
			<form action = "login_ok.asp" method = "post">
			
				<table>
					<tr>				
						<td> <b> 아이디 <b> </td>
						<td><input type = "text" name = "mem_id" placeholder = "ID" /></td>								
					</tr>			
					<tr>
						<td> <b> 비밀번호 <b> </td>
						<td><input type = "password" name = "mem_pwd" placeholder = "PW" /></td>
					</tr>
				</table>
				<input type = "button" onclick = "location.href ='register.asp'"  style='WIDTH: 80pt; HEIGHT: 30pt;' value = "회원가입" /> 
				<input type = "submit" style='WIDTH: 80pt; HEIGHT: 30pt;' value = "로그인" />
			
			</form>
		</div>
	</div>
	</div>
	
	</body>
</html>
