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
	
	mem_no  = request.queryString("mem_no")
	temp    = request.queryString("temp")
	hum     = request.queryString("hum")
	atm     = request.queryString("atm")
	
	'SQL 실행 가즈아!
	sql = "delete from tbl_viewlog where mem_no={mem_no}"
	sql = Replace(sql, "{mem_no}" , mem_no)
	
	response.write(sql)
	Set Rs=Dbcon.Execute(sql)
	
	Dbcon.close()
	Set Dbcon = Nothing
	Set Rs=Nothing
	
	response.redirect("main_page.asp?mem_no="&mem_no&"&temp="&temp&"&hum="&hum&"&atm="&atm)

%>

