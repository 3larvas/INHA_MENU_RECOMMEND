window.onload = function(){
	document.registerForm.submitButton.onclick = function(){
		
		var registerForm = document.registerForm;
		
		var id = registerForm.registerID.value;
		var pw = registerForm.registerPW.value;
		var pw2 = registerForm.registerPW2.value; // 비밀번호 확인
		var name = registerForm.registerName.value;
		
		var type = registerForm.registerType.value;
		
		var phone = registerForm.registerPhone.value;
		var sid = registerForm.registerSID.value;
		var shop = registerForm.registerShop.value;
		
		var regex; // 유효성 검사를 위한 정규표현식
		
		// 가입하기를 눌렀을때, 입력값이 모두 입력되었는지 유효성 검사
		if(id == "") {alert("ID를 입력해 주세요"); return false;}
		if(pw == "") {alert("비밀번호를 입력해 주세요"); return false;}
		if(pw2 == "") {alert("비밀번호 확인을 입력해 주세요"); return false;}
		if(name == "") {alert("이름을 입력해 주세요"); return false;}
		if(phone == "") {alert("전화번호를 입력해 주세요"); return false;}
		if(sid == "" && shop == "") {alert("학번 또는 가게를 입력해 주세요\n학생의 경우 학번, 점주의 경우 가게 이름"); return false;}
		// if(registerSID == "") {alert("학번를 입력해 주세요"); return;}
		// if(registerShop == "") {alert("가게 이름을 입력해 주세요"); return;}
		
		// 비밀번호와 비밀번호 확인이 같은지 유효성 검사
		if(pw != pw2) {alert("비밀번호와 비밀번호 확인이 다릅니다."); return false;}
		
		// 정규표현식을 이용한 유효성 검사
		
		// 이름 형식 확인 정규표현식(2-4글자)
		regex = /^[가-힣]{2,4}$/;
		if(regex.test(name) == false){
			alert("잘못된 이름 형식입니다(2~4글자로 입력).");
			return false;
		}
		
		// 전화번호 형식 확인 정규표현식
		regex = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		if(regex.test(phone) == false){
			alert("잘못된 전화번호입니다.");
			return false;
		}
		
		// 학번은 무조건 숫자만(무조건 8글자)
		// regex = ^[0-9]{0,8}$;
		regex = /^[0-9]{8}$/;
		if(sid != "" && regex.test(sid) == false){
			alert("잘못된 학번 입니다.");
			return false;
		}
		
		alert("회원가입 완료");
	}
}