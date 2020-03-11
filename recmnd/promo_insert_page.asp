<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>

<%@Language = "VBScript" CODEPAGE = "65001" %>
<%
   Response.CharSet = "utf-8"
   Session.codepage = "65001"
   Response.codepage = "65001"
   Response.ContentType = "text/html; charset = utf-8"
%>

<% 
	rest_no = 1
	mem_no  = session("mem_no")
%> 
<html> 
	<head> 
		<title>인하 메뉴 추천</title> 
	</head>
	<body> 
	
		홍보 게시글 작성
		</br></br>
		
		<form action = "promo_insert.asp" method = "post">
		<textarea name = "contents" rows="17" cols="40" style='width:37%' placeholder = "내용을 입력하세요." /></textarea>
		<%
			response.write("<td><input type = 'hidden' name = 'mem_no' value ='"&mem_no&"' hidden/></td>")
			
			response.write("</div><input type = 'submit' id='pro_insert'  value='등록' />")
		%>
		</form>
	</body> 
</html>
