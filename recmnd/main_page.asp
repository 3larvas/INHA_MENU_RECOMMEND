<meta http-equiv = "Content-Type" content = "text/html; charset = utf-8"/>
<%@Language = "VBScript" CODEPAGE = "65001" %>
			
<%
   Response.CharSet = "utf-8"
   Session.codepage = "65001"
   Response.codepage = "65001"
   Response.ContentType = "text/html; charset = utf-8"
%>	
<html> 
	<body bgcolor="#ffffff">
	<head> 
		<title>인하 메뉴 추천</title> 
	</head> 
	<body> 		
		
		<div style="text-align:center;"> <span style = " font-size:5.5em;  color: green;">식사합시다.</span></br></div>
		
		<div style="float:right;">
		<%			
			dim mem_no
			mem_no = request.queryString("mem_no") 
			response.write("<button type=button onclick=location.href='mypage.asp?mem_no="&mem_no&"' style='WIDTH: 80pt; HEIGHT: 30pt;'>마이페이지</button>")
		%>
		<button type= button onclick = "location.href ='login.asp'" style='WIDTH: 80pt; HEIGHT: 30pt;'>로그아웃</button></br>
		</div>
		<input type = 'text' id = 'search_keyword' placeholder = "검색어를 입력하세요!" style='WIDTH: 250pt; HEIGHT: 30pt;' />
		<button type= button onclick="search();" style='WIDTH: 50pt; HEIGHT: 30pt;'>검색</button></br>
		<script>
		function search() {
			var mem_no =  <%=mem_no%>;
			var search_keyword   =  document.getElementById("search_keyword").value;			
			location.href="./rest_search_list_page.asp?mem_no="+mem_no+"&search_keyword=" +  search_keyword;
		}
		</script>
		<table border=1 bordercolor='black'  style="width:100%">
			<tr align = 'center'>
				<td tyle="width:40%"><!--========================= 1.2 표 영역 ========================= -->
				<span style = " font-size:2.5em;  color: green;">*키워드 분류</span>
					<table width="80" style='margin:auto;' >
						<tr height="20" align = 'center'>
						<%					
						  response.write("<td ><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt; text-align: center;' name='101' value='국밥' onclick = location.href='./rest_list_page.asp?key_no=101&mem_no="&mem_no&"'></td>")
						  response.write("<td ><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='102' value='국수' onclick = location.href='./rest_list_page.asp?key_no=102&mem_no="&mem_no&"'></td> ")
						  response.write("<td ><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='103' value='닭'  onclick = location.href='./rest_list_page.asp?key_no=103&mem_no="&mem_no&"'></td> ")
						  response.write("<td ><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='104' value='분식' onclick = location.href='./rest_list_page.asp?key_no=104&mem_no="&mem_no&"'></td> ")
						%>
						</tr>
						<tr height="20" align = 'center'>
						<%
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='105' value='한식'  onclick = location.href='./rest_list_page.asp?key_no=105&mem_no="&mem_no&"'></td>")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='106' value='햄버거' onclick = location.href='./rest_list_page.asp?key_no=106&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='108' value='양식'  onclick = location.href='./rest_list_page.asp?key_no=108&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='109' value='일식'  onclick = location.href='./rest_list_page.asp?key_no=109&mem_no="&mem_no&"'></td> ")
						%>			  
						</tr>
						<tr height="20" align = 'center'>
						<%
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='110' value='중식' onclick = location.href='./rest_list_page.asp?key_no=110&mem_no="&mem_no&"'></td>")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='112' value='고기' onclick = location.href='./rest_list_page.asp?key_no=112&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='113' value='피자' onclick = location.href='./rest_list_page.asp?key_no=113&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='114' value='치킨' onclick = location.href='./rest_list_page.asp?key_no=114&mem_no="&mem_no&"'></td> ")
						%>			  
						</tr>
						<tr height="20" align = 'center'>
						<%
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='201' value='조용한'    onclick = location.href='./rest_list_page.asp?key_no=201&mem_no="&mem_no&"'></td>")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='202' value='시끌벅적'  onclick = location.href='./rest_list_page.asp?key_no=202&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='203' value='고급진'    onclick = location.href='./rest_list_page.asp?key_no=203&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='204' value='인스타'  onclick = location.href='./rest_list_page.asp?key_no=204&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='205' value='시골집'    onclick = location.href='./rest_list_page.asp?key_no=205&mem_no="&mem_no&"'></td> ")
						%>			  
						</tr>
						<tr height="20" align = 'center'>			  
						<%
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='301' value='저렴한' onclick = location.href='./rest_list_page.asp?key_no=301&mem_no="&mem_no&"'></td>")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='302' value='푸짐한' onclick = location.href='./rest_list_page.asp?key_no=302&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='303' value='간편한'  onclick = location.href='./rest_list_page.asp?key_no=303&mem_no="&mem_no&"'></td> ")
						  response.write("<td><input type='button' style='WIDTH: 50pt; HEIGHT: 50pt;' name='304' value='자극적인' onclick = location.href='./rest_list_page.asp?key_no=304&mem_no="&mem_no&"'></td> ")
						%>			                                                               
						</tr>
					</table>
				</td>
				<td style="width:60%"><!--========================= 1.2 표 영역 ========================= -->
				<span style = " font-size:2.5em;  color: green;">* 날씨 및 검색트렌드 기반 메뉴추천</span></br>
					**현재 날씨 입니당.**
					</br>
					<table border=1 bordercolor='black' width="800" style='margin:auto;'>
						<tr height="10">
						
						<% 				
							mem_no = request.queryString("mem_no") 
							Set obj = CreateObject("MSXML2.ServerXMLHTTP")
							obj.Open "GET", "http://www.weather.go.kr/weather/observation/currentweather.jsp", False
							obj.Send ""


							dim weather_text
							dim text_ich
							dim tmp
							dim weather, view, cloud, h_cloud, temp_, temp_1, temp_2, rain, snow, hum_, wind_d, wind_s, atm_
							dim strt_idx
							dim end_idx
							
							weather_text = obj.ResponseText
							
							strt_idx = (InStr(weather_text,">인천<"))
							end_idx = (InStr(weather_text,">임실<"))
							
							text_ich = Mid(weather_text,strt_idx+12,end_idx - strt_idx-140)
							
							response.write("<th>현재일기&nbsp;</th> ")
							response.write("<th>시정<br/>km</th>   ")
							response.write("<th>운량<br/>1/10</th> ")
							response.write("<th>중하운량</th>       ")
							response.write("<th>현재<br/>기온</th>     ")
							response.write("<th>이슬점<br/>온도</th>    ")
							response.write("<th>체감<br/>온도</th>     ")
							response.write("<th>일강수<br/>mm</th>    ")
							response.write("<th>적설<br/>cm</th>      ")
							response.write("<th>습도<br/>%</th>       ")
							response.write("<th>풍향&nbsp;</th>       ")
							response.write("<th>풍속<br/><script>writeWindSpeedUnit();</script></th>")
							response.write("<th>해면<br/>기압</th>     ")
							response.write("</tr>   ")
							
							strt_idx = (InStr(text_ich,"<td>"))
							end_idx = (InStr(text_ich,"</td>"))
							'end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							weather =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							view =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							cloud =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							h_cloud =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							temp_ =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							temp_1 =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							temp_2 =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							rain =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							snow =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							hum_ =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							wind_d =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))

							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							wind_s =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							strt_idx = (InStr(strt_idx+1, text_ich, "<td>", 1))
							end_idx = (InStr(end_idx+1, text_ich, "</td>", 1))
							atm_ =  Mid(text_ich,strt_idx+4,end_idx-(strt_idx+4))
							
							session("temp") = temp_
							session("hum")  = hum_
							session("atm")  = atm_
							
							response.write("<tr>   ")
							'Response.Write text_ich
							response.write("<th>"&weather&"</th>")
							response.write("<th>"&view&"</th>")
							response.write("<th>"&cloud&"</th>")
							response.write("<th>"&h_cloud&"</th>")
							response.write("<th>"&temp_&"</th>")
							response.write("<th>"&temp_1&"</th>")
							response.write("<th>"&temp_2&"</th>")
							response.write("<th>"&rain&"</th>")
							response.write("<th>"&snow&"</th>")
							response.write("<th>"&hum_&"</th>")
							response.write("<th>"&wind_d&"</th>")
							response.write("<th>"&wind_s&"</th>")
							response.write("<th>"&atm_&"</th>")							
							response.write("</tr>   ")
							
							Set obj = Nothing 
						%>						
						</tr>
					</table>
					</br>
					날씨 기반 키워드 추천!</br>
					<%
					response.write("기온 ")
					response.write("<input type = 'text' id = 'temp_' value = "&temp_&" />")
					response.write("습도 ")
					response.write("<input type = 'text' id = 'hum_' value = "&hum_&" />")
					response.write("기압 ")
					response.write("<input type = 'text' id = 'atm_' value = "&atm_&" />")
					%>
					<script type="text/javascript">

					</script>
					<input type = "button" id="refresh_table" onclick="refresh_table_click();" value="조회!" />
					<script>
					
					function refresh_table_click() {
						var mem_no =  <%=mem_no%>;
						var temp   =  document.getElementById("temp_").value;
						var hum    =  document.getElementById("hum_").value;
						var atm    =  document.getElementById("atm_").value;
						
						location.href="./main_page.asp?mem_no="+mem_no+"&temp=" +  temp + "&hum=" + hum + "&atm=" + atm;

					}
					</script>

					<%
						Set Dbcon = Server.CreateObject("ADODB.Connection")
						Dbcon.Open Application("dbConnect")
						
						dim temp, hum, atm
						temp = request.queryString("temp") 
						hum = request.queryString("hum") 
						atm = request.queryString("atm") 
						
						if atm = 0 then
							temp = session.contents("temp")
							hum  = session.contents("hum") 
							atm  = session.contents("atm") 
						end if
						sql  = "exec prec_weather_recmnd {atm}, {hum}, {temp}"
						'sql  = "select top 7    www.date_no,   www.temp,   www.rain,   www.atm,   www.hum,   www.snow,   www.cloud,   round((www.s_101-15.15)/15.15 * 100,2) as s_101,   round((www.s_102-7.27)/7.27 * 100,2) as s_102,   round((www.s_103-28.41)/28.41 * 100,2) as s_103,   round((www.s_104-39.79)/39.79 * 100,2) as s_104,   round((www.s_105-42.58)/42.58 * 100,2) as s_105,   round((www.s_106-29.95)/29.95 * 100,2) as s_106,   round((www.s_108-21.02)/21.02 * 100,2) as s_108,   round((www.s_109-41.70)/41.70 * 100,2) as s_109,   round((www.s_110-23.53)/23.53 * 100,2) as s_110,   round((www.s_112-19.65)/19.65 * 100,2) as s_112,  round((www.s_113-32.56)/32.56 * 100,2) as s_113,   round((www.s_114-30.38)/30.38 * 100,2) as s_114,   round((www.s_115-30.20)/30.20 * 100,2) as s_115   from tbl_weather_search www  where www.date_no in (select top 10   ww.date_no from tbl_weather_search ww  where ww.date_no in (select top 20   w.date_no  from tbl_weather_search w    order by abs(w.atm-{atm}) asc)   order by abs(ww.hum-{hum}) asc)order by abs(www.temp-({temp})) asc	"
						'sql  = "select top 7    www.date_no,   www.temp,   www.rain,   www.atm,   www.hum,   www.snow,   www.cloud,   round((www.s_101-15.15)/15.15 * 100,2) as s_101,   round((www.s_102-12.72)/12.72 * 100,2) as s_102,   round((www.s_103-28.41)/28.41 * 100,2) as s_103,   round((www.s_104-39.79)/39.79 * 100,2) as s_104,   round((www.s_105-42.58)/42.58 * 100,2) as s_105,   round((www.s_106-29.95)/29.95 * 100,2) as s_106,   round((www.s_108-21.02)/21.02 * 100,2) as s_108,   round((www.s_109-41.70)/41.70 * 100,2) as s_109,   round((www.s_110-23.53)/23.53 * 100,2) as s_110,   round((www.s_112-19.65)/19.65 * 100,2) as s_112,  round((www.s_113-32.56)/32.56 * 100,2) as s_113,   round((www.s_114-30.38)/30.38 * 100,2) as s_114,   round((www.s_115-30.20)/30.20 * 100,2) as s_115   from tbl_weather_search www  where www.date_no in (select top 10   ww.date_no from tbl_weather_search ww  where ww.date_no in (select top 20   w.date_no  from tbl_weather_search w    order by abs(w.temp-{temp}) asc)   order by abs(ww.hum-{hum}) asc)order by abs(www.atm-{atm}) asc	"
						sql = Replace(sql, "{temp}", temp)
						sql = Replace(sql, "{hum}", hum)
						sql = Replace(sql, "{atm}", atm)
						
						'response.write(sql)
						Set Rs=Dbcon.Execute(sql)
						response.write("</br>")
						response.write("기온 : "&temp)
						response.write(" 습도 : "&hum)
						response.write(" 기압 : "&atm)
						
						response.write("<div id='content_'>")
						response.write("<table border=1  bordercolor='black' style='margin:auto;'>")
						
						response.write("<tr>")
						
						response.write("<td>날짜</td>")
						response.write("<td>온도</td>")
						response.write("<td>기압</td>")
						response.write("<td>습도</td>")
						response.write("<td>국밥</td>")
						response.write("<td>냉면</td>")
						response.write("<td>닭</td>")
						response.write("<td>분식</td>")
						response.write("<td>한식</td>")
						response.write("<td>햄버거</td>")
						response.write("<td>양식</td>")
						response.write("<td>일식</td>")
						response.write("<td>중식</td>")
						response.write("<td>고기</td>")
						response.write("<td>피자</td>")
						response.write("<td>치킨</td>")
						response.write("<td>간편식</td>")
						
						response.write("</tr>")
						dim percent_1
						dim	percent_2
						percent_1= 20
						percent_2= 10
						
						do while not(Rs.Eof)
						response.write("<tr>")
						
						response.write("<td>"&Rs("date_no")&"</td>")
						response.write("<td>"&Rs("temp")&"</td>")
						response.write("<td>"&Rs("atm")&"</td>")
						response.write("<td>"&Rs("hum")&"</td>")
						
						if Rs("s_101")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_101")&"</td>")
						elseif (percent_2 < Rs("s_101"))and (Rs("s_101") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_101")&"</td>")
						else
						response.write("<td>"&Rs("s_101")&"</td>")
						end if
						
						if Rs("s_102")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_102")&"</td>")
						elseif (percent_2 < Rs("s_102")) and (Rs("s_102") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_102")&"</td>")
						else
						response.write("<td>"&Rs("s_102")&"</td>")
						end if
						
						if Rs("s_103")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_103")&"</td>")
						elseif (percent_2 < Rs("s_103")) and (Rs("s_103") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_103")&"</td>")
						else
						response.write("<td>"&Rs("s_103")&"</td>")
						end if
						
						if Rs("s_104")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_104")&"</td>")
						elseif (percent_2 < Rs("s_104")) and (Rs("s_104") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_104")&"</td>")
						else
						response.write("<td>"&Rs("s_104")&"</td>")
						end if
						
						if Rs("s_105")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_105")&"</td>")
						elseif (percent_2 < Rs("s_105")) and (Rs("s_105") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_105")&"</td>")
						else
						response.write("<td>"&Rs("s_105")&"</td>")
						end if
						
						if Rs("s_106")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_106")&"</td>")
						elseif (percent_2 < Rs("s_106")) and (Rs("s_106") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_106")&"</td>")
						else
						response.write("<td>"&Rs("s_106")&"</td>")
						end if
						
						if Rs("s_108")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_108")&"</td>")
						elseif (percent_2 < Rs("s_108")) and (Rs("s_108") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_108")&"</td>")
						else
						response.write("<td>"&Rs("s_108")&"</td>")
						end if
						
						if Rs("s_109")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_109")&"</td>")
						elseif 0 < Rs("s_109") and Rs("s_109") <= percent_1 then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_109")&"</td>")
						else
						response.write("<td>"&Rs("s_109")&"</td>")
						end if
						
						if Rs("s_110")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_110")&"</td>")
						elseif (percent_2 < Rs("s_110")) and (Rs("s_110") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_110")&"</td>")
						else
						response.write("<td>"&Rs("s_110")&"</td>")
						end if
						
						if Rs("s_112")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_112")&"</td>")
						elseif (percent_2 < Rs("s_112")) and (Rs("s_112") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_112")&"</td>")
						else
						response.write("<td>"&Rs("s_112")&"</td>")
						end if
						
						if Rs("s_113")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_113")&"</td>")
						elseif (percent_2 < Rs("s_113")) and (Rs("s_113") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_113")&"</td>")
						else
						response.write("<td>"&Rs("s_113")&"</td>")
						end if
						
						if Rs("s_114")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_114")&"</td>")
						elseif (percent_2 < Rs("s_114")) and (Rs("s_114") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_114")&"</td>")
						else
						response.write("<td>"&Rs("s_114")&"</td>")
						end if
						
						if Rs("s_115")>percent_1 then
						response.write("<td bgcolor='#44ee44'>"&Rs("s_115")&"</td>")
						elseif (percent_2 < Rs("s_115")) and (Rs("s_115") <= percent_1) then
						response.write("<td bgcolor='#ccffcc'>"&Rs("s_115")&"</td>")
						else
						response.write("<td>"&Rs("s_115")&"</td>")
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
				</td>					
			</tr>	
			<tr align = 'center'>
				<td tyle="width:40%"> <!--========================= 2.1 표 영역 ========================= -->
				<span style = " font-size:2.5em;  color: green;">* 관심 키워드 기반 메뉴추천</span></br>
				회원님의 관심 키워드는?
					<%
						Set Dbcon = Server.CreateObject("ADODB.Connection")
						Dbcon.Open Application("dbConnect")
						
						if mem_no <> 0 then
							sql  = "select kk.key_nm from tbl_keyword_mem km join tbl_keyword kk on kk.key_no = km.key_no where km.mem_no={mem_no}"
							sql = Replace(sql, "{mem_no}", mem_no)
							Set Rs=Dbcon.Execute(sql)
							if Rs.Bof = true then
								response.write("</br></br> '마이페이지'에서 관심 키워드를 설정해주세요!</br>")
							end if
							response.write("</br>")
							response.write("<div id='content'>")
							response.write("<table border=1px style='margin:auto; width:90%;'>")
							do while not(Rs.Eof)
								response.write("<td>"&Rs("key_nm")&"</td>")
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
					회원님을 위한 관심 키워드 맞춤 추천!		
					<input type = "button" id="refresh_table" onclick="delete_viewlog();" value="초기화!" />
					<script>	
					function delete_viewlog() {
						var mem_no =  <%=mem_no%>;
						var temp   =  document.getElementById("temp_").value;
						var hum    =  document.getElementById("hum_").value;
						var atm    =  document.getElementById("atm_").value;
						
						location.href="./viewlog_delete.asp?mem_no="+mem_no+"&temp=" +  temp + "&hum=" + hum + "&atm=" + atm;
					}
					</script>
					<%
						Set Dbcon = Server.CreateObject("ADODB.Connection")
						Dbcon.Open Application("dbConnect")
						if mem_no <> 0 then
							sql  = "select top 5 kr.rest_no,rs.rest_nm,rs.rest_desc,count(*) as rate from tbl_keyword_mem km  join tbl_keyword_rest kr on km.key_no= kr.key_no 						 join tbl_rstrnt rs on rs.rest_no = kr.rest_no where km.mem_no = {mem_no} 	and kr.rest_no not in(				select 				vv.rest_no				from tbl_viewlog vv 				where vv.mem_no ={mem_no}				and vv.view_datetime > GETDATE()-2	)	group by kr.rest_no, rs.rest_nm, rs.rest_desc order by count(*) desc, newid()"
							sql = Replace(sql, "{mem_no}", mem_no)
							Set Rs=Dbcon.Execute(sql)
							response.write("</br>")
							response.write("<div id='content'>")
							response.write("<table border=1px style='margin:auto; width:90%;'>")
							response.write("<tr>")
							response.write("<td>이름</td>")
							response.write("<td>소개</td>")
							response.write("<td>점수</td>")
							response.write("</tr>")
							
							do while not(Rs.Eof)
								response.write("<tr>")
								response.write("<td><a href='rest_detail.asp?rest_no="&Rs("rest_no")&"&mem_no="&mem_no&"'>"&Rs("rest_nm")&"</a></td>")
								response.write("<td>"&Rs("rest_desc")&"</td>")
								response.write("<td>"&Rs("rate")&"</td>")
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
				</td>	
				
				<td tyle="width:60%"> <!--========================= 2.2 표 영역 ========================= -->
					<span style = " font-size:2.5em;  color: green;">* 홍보 게시글</span>		
					<%		
					if session.contents("ownerYn") = 1 then
					response.write("<input type = 'button' id='refresh_table' onclick=location.href='./promo_insert_page.asp?mem_no="&mem_no&"' value='글작성!'/>")
					else
					end if					
					%>
					</br>
					<%
						Set Dbcon = Server.CreateObject("ADODB.Connection")
						Dbcon.Open Application("dbConnect")

						if mem_no <> 0 then
							sql = "select top 7 p.rest_no, p.promo_no, p.promo_contents, p.reg_datetime, r.rest_nm, m.mem_nm from tbl_promo p join tbl_rstrnt r on r.rest_no = p.rest_no				 join tbl_member m on m.mem_no = p.regr_no order by p.reg_datetime desc"
							Set Rs=Dbcon.Execute(sql)
							response.write("</br>")

							response.write("<div id='content'>")
							response.write("<table border=1px style='margin:auto; width:90%;'>")
							
							response.write("<tr>")
							
							response.write("<td>음식점</td>")
							response.write("<td>작성자</td>")
							response.write("<td>내용</td>")
							response.write("<td style='width:25%'>작성일자</td>")
							response.write("</tr>")
							
							do while not(Rs.Eof)
								response.write("<tr>")					
								response.write("<td>"&Rs("rest_nm")&"</td>")
								response.write("<td>"&Rs("mem_nm")&"</td>")
								response.write("<td><a href='promo_detail.asp?rest_no="&Rs("rest_no")&"&promo_no="&Rs("promo_no")&"&mem_no="&mem_no&"'>"&Rs("promo_contents")&"</a></td>")
								'response.write("<td>"&Rs("promo_contents")&"</td>")
								response.write("<td>"&Rs("reg_datetime")&"</td>")
								response.write("</tr>")
								Rs.movenext
							Loop
							response.write("</table>")
							response.write("</div>")
							
							response.write("<div style='float:right;'><button type=button onclick=location.href='promo_list_page.asp?mem_no="&mem_no&"' >더보기...</button></div>")
					
							Dbcon.close()
							Set Dbcon = Nothing
							Set Rs=Nothing
						end if
					%>	
				</td>
			</tr>
		</table>
	</body> 
</html>

