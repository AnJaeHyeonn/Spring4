/**
 *  boardFile.js
	  최대 5개까지만 추가 가능
 */

let file = '<div class="input-group mb-3">';
file = file + '<input type="file" class="form-control">';
file = file + '<button class="btn btn-outline-secondary del" type="button">X</button>';
file = file + '</div>';

let flag = 0;

$('#fileAdd').click(function() {

	if (flag <= 4) {
		$('#fileAddResult').append(file);
		flag++;
	} else {
		alert('첨부파일은 최대 5개까지만 가능합니다.');
	}
});

$('.del').click(function() {
	alert('test');
});