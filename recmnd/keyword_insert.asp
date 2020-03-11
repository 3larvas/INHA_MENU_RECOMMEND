<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>
<%@Language = "VBScript" CODEPAGE = "65001" %>
<%
   Response.CharSet = "utf-8"
   Session.codepage = "65001"
   Response.codepage = "65001"
   Response.ContentType = "text/html; charset = utf-8"
%>

<%
	Set Dbcon = Server.CreateObject("ADODB.Connection")
	Dbcon.Open Application("dbConnect")
	
	Dim mem_no, key_no
	
	mem_no = request.queryString("mem_no")
	key_no = request.queryString("key_no")

	'SQL 실행 가즈아!
	
	sql = "insert into tbl_keyword_mem values({mem_no},{key_no})"
	sql = Replace(sql, "{mem_no}", mem_no)
	sql = Replace(sql, "{key_no}", key_no)
	response.write "<script>alert("" "& sql &" ""); </script>"
	if mem_no <> 0 then
		
		response.write(sql)
		Set Rs=Dbcon.Execute(sql)
		
		Dbcon.close()
		Set Dbcon = Nothing
		Set Rs=Nothing
	end if
	response.redirect("mypage.asp?mem_no="&mem_no)

%>

