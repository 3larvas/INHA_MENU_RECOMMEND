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
	
	' Dim id, pw, pw2, name, phone, sid, snm, mem_type
	Dim mem_id, mem_pwd, mem_type, mem_phone, mem_own_no, mem_std_id, mem_nm
	mem_no = request("mem_no")	
	mem_id = request("mem_id")
	mem_pwd = request("mem_pwd")
	mem_nm = request("mem_nm")	
	mem_phone = request("mem_phone")	
	mem_std_id = request("mem_std_id")
	if mem_std_id = 0 then
	mem_std_id = 0
	end if
	
	sql = "update tbl_member set mem_id = '{mem_id}', mem_pwd = '{mem_pwd}',mem_nm = '{mem_nm}', mem_phone = '{mem_phone}', mem_std_id = {mem_std_id} where mem_no = {mem_no}"
	sql = Replace(sql, "{mem_id}", mem_id)
	sql = Replace(sql, "{mem_pwd}", mem_pwd)
	sql = Replace(sql, "{mem_no}", mem_no)
	sql = Replace(sql, "{mem_nm}", mem_nm)
	sql = Replace(sql, "{mem_phone}", mem_phone)	
	sql = Replace(sql, "{mem_std_id}", mem_std_id)	
	response.write "<script>alert("" "& sql &" ""); </script>"
	
	Set Rs = Dbcon.Execute(sql)
	
	'DB닫기
	Dbcon.Close()
	Set Dbcon = Nothing
	Set Rs = Nothing
	response.redirect("mypage.asp?mem_no="&mem_no)
%>