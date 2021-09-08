/**
 * 
 */
 
 function fn1(){
   alert("!!!!!!!!!!!!!");
}

/*let b1 = document.getElementById("b1");
b1.addEventListener("click", fn1);*/

function fn2() {
	alert(document.getElementById("title").value);
	alert(document.getElementById("contents").value);
}

let b1 = document.getElementById("b1");
b1.addEventListener("click", fn2);

let title = document.getElementById("title").value;
let contents = document.getElementById("contents").value;