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
	
	Dim mem_no, rest_no, key_no
	mem_no = request.queryString("mem_no")
	rest_no = request.queryString("rest_no")
	key_no = request.queryString("key_no")
	'SQL 실행 가즈아!
	sql = "insert into tbl_keyword_rest values({rest_no},{key_no})"
	sql = Replace(sql, "{rest_no}", rest_no)
	sql = Replace(sql, "{key_no}", key_no)
	if rest_no <> 0 then		
		response.write(sql)
		Set Rs=Dbcon.Execute(sql)
		
		Dbcon.close()
		Set Dbcon = Nothing
		Set Rs=Nothing
	end if
	response.redirect("rest_detail.asp?mem_no="&mem_no&"&rest_no="&rest_no)

%>

