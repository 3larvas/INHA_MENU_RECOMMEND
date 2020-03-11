
ss<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>

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
	mem_no = request("mem_no") 
	rest_no = request("rest_no") 
	response.write(contents)
	response.write(rest_no)
	response.write(mem_no)
	
	Set Dbcon = Server.CreateObject("ADODB.Connection")
	Dbcon.Open Application("dbConnect")
	sql = "INSERT tbl_review VALUES ("&rest_no&", (SELECT ISNULL(MAX(rev_no) + 1, 1) FROM tbl_review where rest_no="&rest_no&"), "&mem_no&",  getdate(), '"&contents&"')"
	response.write(sql)
	Set Rs=Dbcon.Execute(sql)
	response.redirect("rest_detail.asp?rest_no="&rest_no&"&mem_no="&mem_no)
%> 





