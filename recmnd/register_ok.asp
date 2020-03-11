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

	Dim mem_id, mem_pwd, mem_type, mem_phone, mem_own_no, mem_std_id, mem_nm
	
	mem_id = request("registerID")
	mem_pwd = request("registerPW")
	mem_type = request("registerType")
	mem_phone = request("registerPhone")
	mem_own_no = request("registerShop")
	mem_std_id = request("registerSID")
	mem_nm = request("registerName")
	
	sql = "select max(mem_no)+1 as rs from tbl_member"
	Set Rs0 = Dbcon.Execute(sql)
	
	sql = "insert tbl_member(mem_no, mem_id, mem_pwd,  mem_type, mem_phone, mem_own_no, mem_std_id, mem_nm)values('{mem_no}', '{mem_id}','{mem_pwd}','{mem_type}','{mem_phone}', '{mem_own_no}', '{mem_std_id}', '{mem_nm}')"
	sql = Replace(sql, "{mem_no}", Rs0("rs"))
	sql = Replace(sql, "{mem_id}", mem_id)
	sql = Replace(sql, "{mem_pwd}", mem_pwd)
	sql = Replace(sql, "{mem_type}", mem_type)
	sql = Replace(sql, "{mem_phone}", mem_phone)
	sql = Replace(sql, "{mem_own_no}", mem_own_no)
	sql = Replace(sql, "{mem_std_id}", mem_std_id)
	sql = Replace(sql, "{mem_nm}", mem_nm)
	
	Set Rs = Dbcon.Execute(sql)

		session("mem_no") =Rs0("rs")
		if mem_type = 2 then
			session("ownerYn") = 1	
			session("mem_own_no") = mem_own_no
		else
			session("ownerYn") = 0	
		end if
		response.redirect("main_page.asp?mem_no="&Rs0("rs"))
	
	'DB닫기
	Dbcon.Close()
	Set Dbcon = Nothing
	Set Rs = Nothing
%>