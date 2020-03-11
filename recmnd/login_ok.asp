<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>
<%@Language = "VBScript" CODEPAGE = "65001" %>
<%
   Response.CharSet = "utf-8"
   Session.codepage = "65001"
   Response.codepage = "65001"
   Response.ContentType = "text/html; charset = utf-8"
%>

<%
	'DB 열기
	Set Dbcon = Server.CreateObject("ADODB.Connection") 'Set은 객체 생성에 사용
	Dbcon.Open Application("dbConnect")
	
	if Dbcon.state<> 1 Then
		Response.Write "데이터베이스에 연결 실패<br/>"
		Response.end
	End If
		
	Dim mem_id, mem_pwd	
	mem_id = request("mem_id")
	mem_pwd = request("mem_pwd")	
	
	'SQL 실행 가즈아!
	sql = "select mem_no, mem_type, mem_own_no from tbl_member where mem_id= '{mem_id}' and mem_pwd='{mem_pwd}'"
	sql = Replace(sql, "{mem_id}", mem_id)
	sql = Replace(sql, "{mem_pwd}", mem_pwd)
	Set Rs = Dbcon.Execute(sql)
		
	if Rs.Bof = true then		
		response.write "if(confirm('아이디를 입력하십시오.')) document.location = './login.asp';"
	else
		session("mem_no") =Rs("mem_no")
		if Rs("mem_type") = 2 then
			session("ownerYn") = 1	
			session("mem_own_no") = Rs("mem_own_no")
		else
			session("ownerYn") = 0	
		end if
		response.redirect("main_page.asp?mem_no="&Rs("mem_no"))
	end if
	
	'DB닫기
	Dbcon.Close()
	Set Dbcon = Nothing
	Set Rs = Nothing
	
	
%>