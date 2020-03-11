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
			search_keyword = request.queryString("search_keyword") 
			response.write("<button type=button onclick=location.href='main_page.asp?mem_no="&mem_no&"' >홈으로</button>")
		%>
		</br>
		<span style = " font-size:2em;  color: green;">* 음식점 검색 결과 목록</span>	
		<%
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
				
			sql="select * from tbl_rstrnt where rest_nm like '%"&search_keyword&"%'"
			Set Rs=Dbcon.Execute(sql)
			
			
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
