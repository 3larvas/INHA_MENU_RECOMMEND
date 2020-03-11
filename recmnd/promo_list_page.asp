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
		<span style = " font-size:2em;  color: green;">* 홍보 게시글</span>	
		</br>
		<%
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")

			if mem_no <> 0 then
				sql = "select top 7 p.rest_no, p.promo_no, p.promo_contents, p.reg_datetime, r.rest_nm, m.mem_nm from tbl_promo p join tbl_rstrnt r on r.rest_no = p.rest_no				 join tbl_member m on m.mem_no = p.regr_no order by p.reg_datetime desc"
				'response.write(sql)
				Set Rs=Dbcon.Execute(sql)
				response.write("</br>")
				response.write("<div id='content'>")
				response.write("<table border=1px width:60%;'>")
				response.write("<tr>")
				response.write("<td>음식점</td>")
				response.write("<td>작성자</td>")
				response.write("<td>내용</td>")
				response.write("<td>작성일자</td>")
				response.write("</tr>")
				
				do while not(Rs.Eof)
					response.write("<tr>")					
					response.write("<td>"&Rs("rest_nm")&"</td>")
					response.write("<td>"&Rs("mem_nm")&"</td>")
					response.write("<td><a href='promo_detail.asp?rest_no="&Rs("rest_no")&"&promo_no="&Rs("promo_no")&"&mem_no="&mem_no&"'>"&Rs("promo_contents")&"</a></td>")
					response.write("<td>"&Rs("reg_datetime")&"</td>")
					response.write("</tr>")
					Rs.movenext
				Loop
				response.write("</table>")
				response.write("</div>")
				
				Dbcon.close()
				Set Dbcon = Nothing
				Set Rs=Nothing
			end if
		%>	
		
	</body> 
</html>
