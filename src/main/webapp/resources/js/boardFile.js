/**
 *  boardFile.js
	  최대 5개까지만 추가 가능
 */
 
 let file = '<div class="input-group mb-3">';
	file = file + '<input type="file" name="files" class="form-control">';
	file = file + '<button class="btn btn-outline-secondary del" type="button">X</button>';
	file = file + '</div>';



let flag = 0;
// let index = 0;

$('#fileAdd').click(function() {

	/*index++;

	let file = '<div class="input-group mb-3" id="del' + index + '">';
	file = file + '<input type="file" class="form-control">';
	file = file + '<button data-btn-id="'+index+'" class="btn btn-outline-secondary del" type="button">X</button>';
	file = file + '</div>';*/

	if (flag <= 4) {
		$('#fileAddResult').append(file);
		flag++;
	} else {
		alert('첨부파일은 최대 5개까지만 가능합니다.');
	}
});

/*$('.del').click(function() {
	alert('test');
});
*/
$("#fileAddResult").on('click', '.del', function() {
	/*let num=$(this).attr('data-btn-id');
	$("#del"+num).remove();*/
	
	$(this).parent().remove();
	
	flag--;
});