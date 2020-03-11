<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>

<%@Language = "VBScript" CODEPAGE = "65001" %>
<%
   Response.CharSet = "utf-8"
   Session.codepage = "65001"
   Response.codepage = "65001"
   Response.ContentType = "text/html; charset = utf-8"
%>

<% 
	rest_no = request.queryString("rest_no") 
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
			rest_no = request.queryString("rest_no") 
			promo_no = request.queryString("promo_no") 
			response.write("<button type=button onclick=location.href='main_page.asp?mem_no="&mem_no&"' >홈으로</button>")
		%>
		<br/> 
		<span style = " font-size:2em;  color: green;">* 홍보 게시글 상세</span>	
		<br/> 
		<%
			
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			sql = "select p.rest_no, p.promo_no, p.promo_contents, p.reg_datetime, r.rest_nm, m.mem_nm, p.regr_no from tbl_promo p join tbl_rstrnt r on r.rest_no = p.rest_no join tbl_member m on m.mem_no = p.regr_no where p.rest_no = {rest_no} and promo_no = {promo_no}		"	
			sql = Replace(sql, "{rest_no}", rest_no)
			sql = Replace(sql, "{promo_no}", promo_no)
			Set Rs=Dbcon.Execute(sql)
			if Rs("regr_no") = session.contents("mem_no") then
			response.write("<td>"&"<input type = button id=del_promo onclick=promo_delete("&promo_no&","&rest_no&","&mem_no&"); value='글삭제' /></td>")
			end if
			response.write("</br>")
			response.write("<div id='content'>")
			response.write("<table border=1px style='width:40%'>")
			response.write("<tr>")
			response.write("<td>음식점</td>")
			response.write("<td>작성자</td>")
			response.write("<td>내용</td>")
			response.write("<td>작성일자</td>")
			response.write("</tr>")
			do while not(Rs.Eof)
				response.write("<tr>")					
				response.write("<td><a href='rest_detail.asp?rest_no="&Rs("rest_no")&"&mem_no="&mem_no&"'>"&Rs("rest_nm")&"</a></td>")
				response.write("<td>"&Rs("mem_nm")&"</td>")
				response.write("<td>"&Rs("promo_contents")&"</td>")
				response.write("<td>"&Rs("reg_datetime")&"</td>")
				response.write("</tr>")
				Rs.movenext
			Loop
			response.write("</table>")
			response.write("</div>")
			Dbcon.close()
			Set Dbcon = Nothing
			Set Rs=Nothing
		%>	
		</br></br>
		댓글
		</br>
		<%
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			sql="select pc.promo_no, pc.rest_no, pc.promo_cmt_no, m.mem_nm, pc.cmt_contents, pc.reg_datetime, pc.regr_no from tbl_promo_cmt pc join tbl_member m on pc.regr_no = m.mem_no where pc.rest_no ={rest_no} and pc.promo_no={promo_no}"
			sql = Replace(sql, "{promo_no}", promo_no)
			sql = Replace(sql, "{rest_no}", rest_no)
			Set Rs=Dbcon.Execute(sql)
			response.write("<div id='content'>")
			response.write("<table border=1px style='width:40%'>")
			response.write("<tr>")
			response.write("<td style='width:10%'>회원명</td>")
			response.write("<td>내용</td>")
			response.write("<td style='width:35%'>등록일자</td>")
			response.write("</tr>")
			do while not(Rs.Eof)
				promo_cmt_no = Rs("promo_cmt_no")
				response.write("<tr>")
				response.write("<td>"&Rs("mem_nm")&"</td>")
				response.write("<td >"&Rs("cmt_contents")&"</td>")
				if Rs("regr_no") = session.contents("mem_no") then
					response.write("<td>"&Rs("reg_datetime")&"<input type = button id=del_promo_cmt onclick=promo_cmt_delete("&promo_no&","&promo_cmt_no&","&rest_no&","&mem_no&"); value='삭제' /></td>")
				else
					response.write("<td>"&Rs("reg_datetime")&"</td>")					
				end if
				response.write("</tr>")
				Rs.movenext
			Loop
			response.write("</table>")
			response.write("</div>")
			Dbcon.close()
			Set Dbcon = Nothing
			Set Rs=Nothing
		%>
		</br>
		댓글 작성
		</br>
		<form action = "promo_cmt_insert.asp" method = "post">
		<textarea name = "contents" rows="7" cols="40"style='width:37%' placeholder = "내용을 입력하세요." /></textarea>
		<%
			response.write("<td><input type = 'hidden' name = 'mem_no' value ='"&mem_no&"' hidden/></td>")
			response.write("<td><input type = 'hidden' name = 'promo_no' value ='"&promo_no&"' hidden/></td>")
			response.write("<td><input type = 'hidden' name = 'rest_no' value ='"&rest_no&"' hidden/></td>")
			response.write("</div><input type = 'submit' id='pro_cmt_insert'  value='등록' />")
		%>
		<script>
			function promo_delete(promo_no, rest_no, mem_no) {
				location.href="./promo_delete.asp?promo_no="+promo_no+"&rest_no=" + rest_no + "&mem_no="+mem_no;
			}
			function promo_cmt_delete(promo_no, promo_cmt_no, rest_no, mem_no) {
				location.href="./promo_cmt_delete.asp?promo_no="+promo_no+"&promo_cmt_no=" + promo_cmt_no +"&rest_no=" + rest_no + "&mem_no="+mem_no;
			}
		</script>
		</form>
	</body> 
</html>
