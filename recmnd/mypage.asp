<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>
<%@Language = "VBScript" CODEPAGE = "65001" %>			
<%
   Response.CharSet = "utf-8"
   Session.codepage = "65001"
   Response.codepage = "65001"
   Response.ContentType = "text/html; charset = utf-8"
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
		 <script src = "mypage_update.js"></script>
		<span style = " font-size:2em;  color: green;">* 마이페이지</span>	</br></br>
		기본정보
		<form name = "mypage_update" action = "mypage_update.asp" method = "post">
		<%
			
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			dim rest_no
			if mem_no <> 0 then
				sql  = "select *from tbl_member m where m.mem_no = {mem_no}"
				sql = Replace(sql, "{mem_no}", mem_no)

				'response.write(sql)
				Set Rs=Dbcon.Execute(sql)
				response.write("</br>")

				response.write("<div id='content'>")
				response.write("<table border=1px style='width:40%'>")
			
				response.write("<tr style='display:none;'>")
				response.write("<td>mem_no</td>")
				response.write("<td><input type = text id = mem_no name = mem_no value = "&Rs("mem_no")&" /></td>")
				response.write("</tr>")
				response.write("<tr style='display:none;'>")
				response.write("<td>mem_type</td>")
				response.write("<td><input type = text id = mem_type name = mem_type value = "&Rs("mem_type")&" /></td>")
				response.write("</tr>")
				response.write("<tr>")
				response.write("<td>아이디</td>")
				response.write("<td><input type = text name = mem_id value = "&Rs("mem_id")&" readonly/></td>")
				response.write("</tr>")
				response.write("<tr>")
				response.write("<td>비밀번호</td>")
				response.write("<td><input type = text name = mem_pwd value = "&Rs("mem_pwd")&" /></td>")
				response.write("</tr>")
				response.write("<tr>")
				response.write("<td>이름</td>")
				response.write("<td><input type = text name = mem_nm value = "&Rs("mem_nm")&" /></td>")
				response.write("</tr>")
				response.write("<tr>")
				response.write("<td>휴대폰 번호</td>")
				response.write("<td><input type = text name = mem_phone value = "&Rs("mem_phone")&" /></td>")
				response.write("</tr>")
				if session.contents("ownerYn") <> 1 then
					response.write("<tr>")
					response.write("<td>학번</td>")
					response.write("<td><input type = text name = mem_std_id value = "&Rs("mem_std_id")&" /></td>")
					response.write("</tr>")
				else
					response.write("<tr style='display:none;'>")
					response.write("<td>학번</td>")					
					response.write("<td><input type = text name = mem_std_id value = "&Rs("mem_std_id")&" /></td>")
					response.write("</tr>")
					rest_no = Rs("mem_own_no")				
				end if
				
				
				
				Rs.movenext
				
				response.write("</table>")
				response.write("</div>")
				
				Dbcon.close()
				Set Dbcon = Nothing
				Set Rs=Nothing
			end if
		%>	
		<input type = 'submit' name = 'submitButton' value = '수정'/>
		</form>
		
		</br>
		<%'
		if session.contents("ownerYn") = 1 then
			response.write("운영중인 음식점.</br>")
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
				
			sql="select *,  SUBSTRING(CONVERT(NVARCHAR, rest_start_time, 121), 0, 6) as rest_start_time_,  SUBSTRING(CONVERT(NVARCHAR, rest_end_time, 121), 0, 6) as rest_end_time_ from tbl_rstrnt r where r.rest_no={rest_no}"
			sql = Replace(sql, "{rest_no}", rest_no)
			Set Rs=Dbcon.Execute(sql)
			
			response.write("<div id='content'>")
			response.write("<table border=1px style='width:40%'>")
			
			response.write("<tr>")
			
			response.write("<td>이름</td>")
			response.write("<td>소개</td>")
			response.write("<td>영업시작</td>")
			response.write("<td>영업종료</td>")
			response.write("</tr>")
			
			do while not(Rs.Eof)
				response.write("<tr>")
				
				'response.write("<td>"&Rs("rest_nm")&"</td>")
				response.write("<td><a href='rest_detail.asp?rest_no="&Rs("rest_no")&"&mem_no="&mem_no&"'>"&Rs("rest_nm")&"</a></td>")
								
				response.write("<td>"&Rs("rest_desc")&"</td>")
				response.write("<td>"&Rs("rest_start_time_")&"</td>")
				response.write("<td>"&Rs("rest_end_time_")&"</td>")
					
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
		</br>
		회원님의 관심 키워드는?
		<%
			mem_no = request.queryString("mem_no") 
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			
			if mem_no <> 0 then
				sql  = "select kk.key_nm, kk.key_no from tbl_keyword_mem km join tbl_keyword kk on kk.key_no = km.key_no where km.mem_no={mem_no}"
				sql = Replace(sql, "{mem_no}", mem_no)

				'response.write(sql)
				Set Rs=Dbcon.Execute(sql)
				response.write("</br>")

				response.write("<div id='content'>")
				response.write("<table border=1px style='width:40%'>")
				
				do while not(Rs.Eof)
					response.write("<td>"&Rs("key_nm")&"<input type = button id=del_keyword onclick=keyword_delete("&Rs("key_no")&","&mem_no&"); value='삭제' /></td>")
					
					Rs.movenext
				Loop
				response.write("</table>")
				response.write("</div>")
				
				Dbcon.close()
				Set Dbcon = Nothing
				Set Rs=Nothing
			end if
		%>	
		
		<script>
			function keyword_delete(key_no, mem_no) {			
				location.href="keyword_delete.asp?mem_no="+mem_no+"&key_no="+key_no;
			}
			function keyword_insert(key_no, mem_no) {
				location.href="keyword_insert.asp?mem_no="+mem_no+"&key_no="+key_no;
			}
			</script>
		
		</br>
		관심키워드를 추가하시겠어요?
		<%
			mem_no = request.queryString("mem_no") 
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			
			if mem_no <> 0 then
				sql  = "select *from tbl_keyword kk where kk.key_no not in (select	km.key_no from tbl_keyword_mem km where km.mem_no={mem_no})"
				sql = Replace(sql, "{mem_no}", mem_no)
				Set Rs=Dbcon.Execute(sql)
				response.write("</br>")

				response.write("<div id='content'>")
				response.write("<table border=1px style='width:40%'>")

				do while not(Rs.Eof)
					response.write("<td>"&Rs("key_nm")&"<input type = button id=del_keyword onclick=keyword_insert("&Rs("key_no")&","&mem_no&"); value='등록' /></td>")
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

