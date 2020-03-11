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
		<title> 음식점 검색 </title>
	</head>
	<body>
	<script>
	function rstsearch(){
		var rst_search_name =  document.getElementById("input_rest_name").value;
		location.href="./Search_rst_popup.asp?rst_search_name="+rst_search_name;
		}
	function select_btn_clicked(rerst_no){
             opener.document.getElementById("registerShop").value = rerst_no;
			 close();
        }
	</script>	
			<table align = "center" border=1px style='width:90%'>
				<tr align = "center">
					<td> 
						<input type = "text" id = "input_rest_name" placeholder = "음식점 이름 입력" />
					</td>
					<td colspan = '2'>
						<button type= button onclick="rstsearch();" > 검색하기 </button>
					</td>
				</tr>
				<tr align = "center">
					<td colspan = '3' align = "center">
						<B> 검색 결과 </B>
					</td>
					<%
						 dim rest_no, rest_name
						 rest_name = request.queryString("rst_search_name") 
					%>
					<%
						Set Dbcon = Server.CreateObject("ADODB.Connection")
						Dbcon.Open Application("dbConnect")
							
						sql="select rest_no, rest_nm from tbl_rstrnt where rest_nm like '%"&rest_name&"%'"
						 Set Rs=Dbcon.Execute(sql)
						 rest_number = Rs("rest_no")
						 response.write("<tr>")
						 response.write("<td align = 'center'> 음식점 번호 </td>")
						 response.write("<td align = 'center'> 음식점 이름 </td>")
						 response.write("<td align = 'center'> 선택 </td>")
						 response.write("</tr>")
						 do while not(Rs.Eof)
							response.write("<tr>")
							response.write("")
							response.write("<td align = 'center'>"&Rs("rest_no")&"</td>")
							response.write("<td align = 'center'>"&Rs("rest_nm")&"</td>")
							response.write("<td align = 'center'><button type=button onclick='select_btn_clicked("&Rs("rest_no")&");'>선택</button></td>")
							response.write("")
							response.write("</tr>")
							Rs.movenext
						 Loop
						 Dbcon.close()
						 Set Dbcon = Nothing
						 Set Rs=Nothing
					  %>
				</tr>
			</table>
	</body>
</html>





