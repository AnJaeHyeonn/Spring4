<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<script type="text/javascript">
	alert('Hello World');
</script>
<link href="./resources/css/home.css" rel="stylesheet">
</head>
<body>
	<h1 class="c1">Hello world!</h1>
	
	<h1 id = "d1">Ohter H1</h1>
	
	<div id="d2">
		<h3>In DIV</h3>
	</div>
	
	<img class="c1" id="d3" alt="" src="./resources/images/jc.jpg">
	
	<div>
		<button onClick="fn1()">CLICK</button>
	</div>
	
	

	<P>The time on the server is ${serverTime}.</P>
	<script type="text/javascript">
		console.log('body Script');
	</script>
<!-- <script type="text/javascript" src="./resources/js/home.js"></script> -->	
	<script type="text/javascript" src="./resources/js/function_1.js"></script>
	
</body>
</html>
