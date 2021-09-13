/**
 * 
 */

const btn = document.getElementById('btn');
const put = document.getElementsByClassName('put')
const pws = document.getElementsByClassName('pw')
const frm = document.getElementById('frm');
const id = document.getElementById('id');
const idResult = document.getElementById('idResult')
const pw1 = document.getElementById('pw1');
const pw2 = document.getElementById('pw2');
const idCheck = document.getElementById('idCheck');

idCheck.addEventListener('click', function () {
	open("./idCheck?id="+id.value, "", "width=400, height=200, top=200, left=300");
});


/*btn.addEventListener('click', function() {

	// 공백 검사
	let ce = checkEmpty(put);

	// 패스워드 확인 검사
	let ce2 = checkEqual(pws[0], pws[1]);

	let cl = checkLength();

	if (ce && ce2 && cl) {
		frm.submit();
	} else {
		alert("필수 입력");
	}


});

function checkEmpty(puts) {
	let result = true;

	for (r of puts) {
		if (r.value.trim() == "") {
			result = false;
			break;
		}
	}

	return result;
}

function checkEqual(check1, check2) {
	return check1.value == check2.value;
}

function checkLength() {
	let l = pws[0].value.trim().length;
	if (l >= 6) {
		return true;
	} else {
		return false;
	}
}



id.addEventListener('change', function() {
	alert('change');
});

pw2.addEventListener('blur', function() {
	if(pw1.value == pw2.value) {
		alert("일치");
	} else {
		alert("불일치");
	}
});
*/



