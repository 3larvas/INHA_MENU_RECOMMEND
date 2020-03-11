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
	mem_no = request("mem_no") 
	rest_no = request("rest_no") 
	promo_no = request("promo_no") 
	response.write(contents)
	response.write(rest_no)
	response.write(mem_no)
	response.write(promo_no)
	
	Set Dbcon = Server.CreateObject("ADODB.Connection")
	Dbcon.Open Application("dbConnect")
	sql = "INSERT tbl_promo_cmt VALUES ("&rest_no&","&promo_no&", (SELECT ISNULL(MAX(promo_cmt_no) + 1, 1) FROM tbl_promo_cmt where rest_no="&rest_no&" and promo_no = "&promo_no&"), "&mem_no&",  getdate(), '"&contents&"')"
	response.write(sql)
	Set Rs=Dbcon.Execute(sql)
	response.redirect("promo_detail.asp?rest_no="&rest_no&"&mem_no="&mem_no&"&promo_no="&promo_no)
%> 
