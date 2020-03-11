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
	
	if Dbcon.state<> 1 then
					Response.Write "데이터베이스에 연결 실패<br/>"
					Response.end
	End If
	
	Dim my_mem_id, isOverlap
	
	my_mem_id = request.queryString("my_id")
	
	if my_mem_id = "" then
		response.write "<script>"
		response.write "if(confirm('아이디를 입력하십시오.')) document.location = './register.asp?';"
		response.write "</script>"
	end if
	
	sql = "select count(*) as rs from tbl_member where mem_id = '{my_mem_id}'"
	sql = Replace(sql, "{my_mem_id}", my_mem_id)
	Set Rs = Dbcon.Execute(sql)
	
	
	if( Rs("rs") ) > 0 then
		
		response.write "<script>"
		response.write "if(confirm('이미 사용중인 아이디 입니다.')) document.location = './register.asp?my_id=" &my_mem_id& "&isOverlap=1';"
		response.write "</script>"

	elseif(RS("rs")) = 0 then
		isOverlap = 0
		response.write "<script>"
		response.write "if(confirm('사용 가능한 아이디 입니다.')) document.location = './register.asp?my_id=" &my_mem_id& "&isOverlap=0';"
		response.write "</script>"	
	end if

	'DB닫기
	Dbcon.Close()
	Set Dbcon = Nothing
	Set Rs = Nothing
%>