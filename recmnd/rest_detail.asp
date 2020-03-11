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
			response.write("<button type=button onclick=location.href='main_page.asp?mem_no="&mem_no&"' >홈으로</button>")
		%>
		<br/> 
		<span style = " font-size:2em;  color: green;">* 음식점 상세</span>	
		<br/> 
		<%
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			sql="insert into tbl_viewlog values ("&mem_no&", "&rest_no&", (SELECT ISNULL(MAX(view_no) + 1, 1) FROM tbl_viewlog where mem_no="&mem_no&" and rest_no="&rest_no&"),getdate())"
			Set Rs=Dbcon.Execute(sql)
			Dbcon.close()
			Set Dbcon = Nothing
			Set Rs=Nothing
		%>	
		<%
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			sql="select *,  SUBSTRING(CONVERT(NVARCHAR, rest_start_time, 121), 0, 6) as rest_start_time_,  SUBSTRING(CONVERT(NVARCHAR, rest_end_time, 121), 0, 6) as rest_end_time_ from tbl_rstrnt r where r.rest_no="+rest_no
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
				
				response.write("<td>"&Rs("rest_nm")&"</td>")
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
		%>	
		</br></br>
		메뉴표
		<%
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			sql="select * from tbl_menu m where m.rest_no="+rest_no
			Set Rs=Dbcon.Execute(sql)
			response.write("<div id='content'>")
			response.write("<table border=1px style='width:40%'>")
			response.write("<tr>")
			response.write("<td>메뉴</td>")
			response.write("<td>가격</td>")
			response.write("</tr>")
			do while not(Rs.Eof)
				response.write("<tr>")
				
				response.write("<td>"&Rs("menu_nm")&"</td>")
				response.write("<td>"&Rs("menu_price")&"</td>")
				
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
		음식점 해당 키워드
		<%				
		Set Dbcon = Server.CreateObject("ADODB.Connection")
		Dbcon.Open Application("dbConnect")			
		if mem_no <> 0 then
			sql  = "select kk.key_nm, kk.key_no from tbl_keyword_rest kr join tbl_keyword kk on kk.key_no = kr.key_no where kr.rest_no={rest_no}"
			sql = Replace(sql, "{rest_no}", rest_no)
			Set Rs=Dbcon.Execute(sql)
			response.write("</br>")
			response.write("<div id='content'>")
			response.write("<table border=1px style='width:40%'>")
			
			do while not(Rs.Eof)
			if StrComp(session.contents("mem_own_no"),rest_no,1) = 0 then
				response.write("<td>"&Rs("key_nm")&"<input type = submit id=del_keyword onclick=keyword_rest_delete("&Rs("key_no")&","&rest_no&","&mem_no&"); value='삭제' /></td>")
			else
				response.write("<td>"&Rs("key_nm")&"</td>")
			end if
				Rs.movenext
			Loop
			response.write("</table>")
			response.write("</div>")
			Dbcon.close()
			Set Dbcon = Nothing
			Set Rs=Nothing
		end if
			
		if StrComp(session.contents("mem_own_no"),rest_no,1) = 0 then
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			if mem_no <> 0 then
				sql  = "select *from tbl_keyword kk where kk.key_no not in (select	kr.key_no from tbl_keyword_rest kr where kr.rest_no={rest_no})"
				sql = Replace(sql, "{rest_no}", rest_no)
				Set Rs=Dbcon.Execute(sql)
				response.write("</br>")
				response.write("사장님! 키워드를 추가하시겠어요?")
				response.write("</br>")
				response.write("<div id='content'>")
				response.write("<table border=1px style='width:40%'>")

				do while not(Rs.Eof)
					response.write("<td>"&Rs("key_nm")&"<input type = submit id=del_keyword onclick=keyword_rest_insert("&Rs("key_no")&","&rest_no&","&mem_no&"); value='등록' /></td>")
					Rs.movenext
				Loop
				response.write("</table>")
				response.write("</div>")
				Dbcon.close()
				Set Dbcon = Nothing
				Set Rs=Nothing
			end if
			
		end if
		%>
		
		</br>
		리뷰
		</br>
		<%
			Set Dbcon = Server.CreateObject("ADODB.Connection")
			Dbcon.Open Application("dbConnect")
			sql="select r.rev_no,m.mem_nm, r.rev_contents, r.reg_datetime, r.regr_no from tbl_review r join tbl_member m on r.regr_no = m.mem_no where r.rest_no="+rest_no
			Set Rs=Dbcon.Execute(sql)
			response.write("<div id='content'>")
			response.write("<table border=1px  style='width:40%'>")
			response.write("<tr>")
			response.write("<td>회원명</td>")
			response.write("<td>내용</td>")
			response.write("<td>등록일자</td>")		
			response.write("</tr>")
			do while not(Rs.Eof)
				rev_no = Rs("rev_no")
				response.write("<tr>")
				response.write("<td style='width:10%'>"&Rs("mem_nm")&"</td>")
				response.write("<td>"&Rs("rev_contents")&"</td>")
				if Rs("regr_no") = session.contents("mem_no") then
					response.write("<td style='width:30%'>"&Rs("reg_datetime")&"<input type = button id=del_review onclick=review_delete("&rev_no&","&rest_no&","&mem_no&"); value='삭제' /></td>")
				else
					response.write("<td style='width:30%'>"&Rs("reg_datetime")&"</td>")
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
		리뷰 작성
		</br>
		<form action = "review_insert.asp" method = "post">
		<textarea name = "contents" rows="4" cols="100" style='width:37%'placeholder = "내용을 입력하세요." /></textarea>
		<%
			response.write("<td><input type = 'hidden' name = 'mem_no' value ='"&mem_no&"' hidden/></td>")
			response.write("<td><input type = 'hidden' name = 'rest_no' value ='"&rest_no&"' hidden/></td>")
			response.write("</div><input type = 'submit' id='rev_insert'  value='등록' />")
		%>
		<script>
			function review_insert(mem_no, rest_no) {
				location.href="./main_page.asp?mem_no="+mem_no+"&rest_no=" + rest_no;
			}
			function review_delete(rev_no, rest_no, mem_no) {
				location.href="./review_delete.asp?rev_no="+rev_no+"&rest_no=" + rest_no + "&mem_no="+mem_no;
			}
			function keyword_rest_delete(key_no, rest_no, mem_no) {			
				location.href="keyword_rest_delete.asp?rest_no="+rest_no+"&key_no="+key_no+"&mem_no="+mem_no;
			}
			function keyword_rest_insert(key_no, rest_no, mem_no) {
				location.href="keyword_rest_insert.asp?rest_no="+rest_no+"&key_no="+key_no+"&mem_no="+mem_no;
			}
		</script>
		
	</body> 
</html>
