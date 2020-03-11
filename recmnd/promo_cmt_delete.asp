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
	
	promo_no  = request.queryString("promo_no")
	promo_cmt_no  = request.queryString("promo_cmt_no")
	rest_no = request.queryString("rest_no")
	mem_no  = request.queryString("mem_no")
	
	'SQL 실행 가즈아!
	sql = "delete from tbl_promo_cmt where rest_no = {rest_no} and promo_no={promo_no} and promo_cmt_no ={promo_cmt_no}"
	sql = Replace(sql, "{promo_no}" , promo_no)
	sql = Replace(sql, "{promo_cmt_no}" , promo_cmt_no)
	sql = Replace(sql, "{rest_no}", rest_no)
	
	response.write(sql)
	Set Rs=Dbcon.Execute(sql)
	
	Dbcon.close()
	Set Dbcon = Nothing
	Set Rs=Nothing
	
	response.redirect("promo_detail.asp?rest_no="&rest_no&"&mem_no="&mem_no&"&promo_no="&promo_no)

%>

