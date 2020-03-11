<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>
	<%@Language = "VBScript" CODEPAGE = "65001" %>
		<%
		   Response.CharSet = "utf-8"
		   Session.codepage = "65001"
		   Response.codepage = "65001"
		   Response.ContentType = "text/html; charset = utf-8"
		%>
		<% 
			key_no = request.queryString("key_no") 
			mem_no = request.queryString("mem_no") 

		%> 
<html> 
	<head> 
		<title>인하 메뉴 추천</title> 
	</head>
	<body> 
		
		<%
			dim mem_no
			mem_no = request.queryString("mem_no") 
			response.write("<button type=button onclick=location.href='main_page.asp?mem_no="&mem_no&"' >홈으로</button>")
		%>
		</br>
		<%
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
				
			sql="select *from tbl_rstrnt r join tbl_keyword_rest kr on r.rest_no = kr.rest_no join tbl_keyword kw on kr.key_no = kw.key_no where kr.key_no = "+key_no
			Set Rs=Dbcon.Execute(sql)
			'response.write(sql)
			response.write(Rs("key_nm")&" 음식점 목록")
			response.write("<div id='content'>")
			response.write("<table border=1px style='width:40%'>")
			
			response.write("<tr>")
			
			response.write("<td>이름</td>")
			response.write("<td>소개</td>")
			response.write("</tr>")
			
			do while not(Rs.Eof)
				response.write("<tr>")
				
				response.write("")
				response.write("<td><a href='rest_detail.asp?rest_no="&Rs("rest_no")&"&mem_no="&mem_no&"'>"&Rs("rest_nm")&"</a></td>")
				response.write("<td>"&Rs("rest_desc")&"</td>")
				response.write("")
				response.write("</tr>")
				Rs.movenext
			Loop
			response.write("</table>")
			response.write("</div>")
			
			Dbcon.close()
			Set Dbcon = Nothing
			Set Rs=Nothing
		%>	
		
	</body> 
</html>
