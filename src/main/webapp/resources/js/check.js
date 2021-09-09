/**
 * 
 */

const ca = document.getElementById('ca');
const btn = document.getElementById('btn');

const cl2 = document.getElementsByClassName('cl2');
const ess = document.getElementsByClassName('ess');


ca.addEventListener('click', function() {

	for (let ch of cl2) {
		ch.checked = ca.checked;
	}
});



for (let c of cl2) {

	c.addEventListener('click', function() {

		let flag = true;

		for (cc of cl2) {
			if (!cc.checked) {
				flag = false;
				break;
			}
		}

		ca.checked = flag;

	});


};



btn.addEventListener('click', function() {

	let flag = true;

	for (let es of ess) {
		if (!es.checked) {
			flag = false;
			break;
		}
	}

	if (flag) {
		location.href = "./join";
	} else {
		alert('약관에 동의해주십시오!');
	}
});
