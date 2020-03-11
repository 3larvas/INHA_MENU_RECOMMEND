<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>
<%@Language = "VBScript" CODEPAGE = "65001" %>
<%
   Response.CharSet = "utf-8"
   Session.codepage = "65001"
   Response.codepage = "65001"
   Response.ContentType = "text/html; charset = utf-8"
%>

<% 	
	dim rest_no, mem_no, contents
	contents = request("contents") 
	rest_no = request("rest_no") 
	mem_no = request("mem_no") 
		
	Set Dbcon = Server.CreateObject("ADODB.Connection")
	Dbcon.Open Application("dbConnect")
	
	sql = "INSERT tbl_promo VALUES ((select mem_own_no from tbl_member where mem_no ="&mem_no&"), (SELECT ISNULL(MAX(promo_no) + 1, 1) FROM tbl_promo where rest_no=(select mem_own_no from tbl_member where mem_no ="&mem_no&")), "&mem_no&",  getdate(), '"&contents&"')"
	response.write(sql)
	Set Rs=Dbcon.Execute(sql)
	response.redirect("main_page.asp?mem_no="&mem_no)
%> 





