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
      <style>
         #header {background:red;}
         #header ul {text-align:left}
         #header ul li {display:inline-block}
         #content {background:white;}
         #footer {background:gray;}
      </style>
     <script src = "log_in.js"></script>
	 
	<title> 회원 가입 </title>
	<script language = "javascript">
	 function showrstPopup(){
		var openWin
		openWin = window.open("Search_rst_popup.asp", "음식점 번호 찾기", "width=500, height=500, left=100, top=50");
		}
	</script>
	 
   </head>
   
   <body>
      <div id = "header">
         <ul>
            <li>
               <b> 회원가입 <b>
            </li>
         </ul>
      </div>
      
<!-- Header -->

<div id = "content">
   <form name = "registerForm" action = "register_ok.asp" method = "post">
      <table>
	  
	    <tr>
               <td> <b> 아이디 <b> </td>
            <%
            dim isOver, my_id
            isOver = request.queryString("isOverlap") 
            my_id = request.queryString("my_id") 
            if isOver = 0 then
                response.write(" <td><input type = 'text' id = 'aaaaaaaa' name = 'registerID' placeholder = 'ID' value='"&my_id&"' /></td>")
            else
				response.write(" <td><input type = 'text' id = 'aaaaaaaa' name = 'registerID' placeholder = 'ID' /></td>")
            End if
               %>
			   
            <td>
               <input type = "button" id = "check_id" onclick = "check_id_func();" value = "ID 중복검사" />
            </td>
         </tr>
	  
         <tr>
            <td> <b> 회원 구분 <b> </td>
            <td> 
               <input type = "radio" name = 'registerType' value = '1' onchange="setDisplay(1)" checked> 학생			  
               <input type = "radio" name = 'registerType' value = '2' onchange="setDisplay(2)"> 점주
            </td>
         </tr>
      
       
         
         <tr>
            <td style='width:60%'> <b> 비밀번호 <b> </td>
            <td><input type = "password" name = "registerPW" placeholder = "PW" /></td>
         </tr>
         
         <tr>
            <td style='width:60%'> <b> 비밀번호 확인 <b> </td>
            <td><input type = "password" name = "registerPW2" placeholder = "PW again" /></td>
         </tr>
            
         <tr>
            <td style='width:60%'> <b> 이름 <b> </td>
            <td><input type = "text" name = "registerName" placeholder = "이름" /></td>
         </tr>
         
         <tr>
            <td style='width:60%'> <b> 휴대폰 번호 <b> </td>
            <td><input type = "text" name = "registerPhone" placeholder = "Phone number" /></td>
         </tr>
		          
         <tr id="std_area" style='width:60%'>
            <td> <b> 학번(학생 회원의 경우만 입력) <b> </td>
            <td><input type = "text" name = "registerSID" placeholder = "Student ID" value = "" /></td>
         </tr>         
		 
         <tr id="owner_area" style='width:60%; display:none;' >
            <td> <b> 운영 음식점 번호(점주 회원의 경우만 입력) <b>  </td>
            <td><input type = "text" name = "registerShop" id = "registerShop" placeholder = "Shop ID" value = "" /></td>
			<td><button type= button onclick="showrstPopup();" > 음식점 검색 </button></td>
         </tr>
         
      </table>
	<%
    if isOver = 0 then
       response.write("<input type = 'submit' name = 'submitButton' value = '회원 가입'/>")
    end if
     %>
   </form>
</div>
<script>
function setDisplay(v){
     // 라디오 버튼 value 값 조건 비교
	if(v == "1"){
		std_area.style.display = '';
		owner_area.style.display = 'none';
	}else{
		std_area.style.display = 'none';
		owner_area.style.display = '';
	}

}
</script>


<!-- Footer -->

      <div id = "footer">
         회원가입
      </div>
   </body>
</html>

<script>
   function check_id_func(){
      var my_id = document.getElementById("aaaaaaaa").value;
      
      location.href = "./id_register_ok.asp?my_id="+my_id;
   }
</script>
