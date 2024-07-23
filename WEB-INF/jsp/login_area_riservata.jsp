<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style type="text/css">

	.background {
    	position: absolute;
    	overflow: hidden;
    	width: 100%;
    	height: 100%;
    	top: 0;
    	left: 0;
    	background: #f9f7f7;
    	display: flex;
    	flex-grow: 1;
    	z-index: -1;
	}

	.background div {
   		position: absolute;
    	border-radius: 100%;
    	height: 0;
    	filter: blur(240vw);
    	opacity: 0.4;
	}

	.background div:nth-child(1) {
		linear-gradient(132deg, #0080c0 0.00%, #dbe2ef 100.00%);
    	background: linear-gradient(132deg, #ffffff 0.00%, #5760e0 100.00%);
    	width: 22%;
    	padding-top: 22%;
    	left: 0%;
    	top: 0%;
    	transform: translateX(-50%) translateY(-50%);
	}

	.background div:nth-child(2) {
    	background: linear-gradient(132deg, #ffffff 0.00%, #5760e0 100.00%);
    	width: 42%;
    	padding-top: 42%;
    	left: 39%;
    	top: 100%;
    	transform: translateX(-50%) translateY(-50%);
	}

	.background div:nth-child(3) {
    	background: linear-gradient(132deg, #ffffff 0.00%, #5760e0 100.00%);
    	width: 49%;
    	padding-top: 49%;
    	left: 90%;
    	top: 11%;
    	transform: translateX(-50%) translateY(-50%);
	}
	
	.container {
		border: 0.2em solid #112d4e;
		width: 400px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 10%;
		padding: 1%;
		border-radius: 0.5em;
		font-family: monospace;
		box-shadow: 0.3em 0.3em 1em #112d4e;
		font-size: larger;
		background: #dbe2ef;
		color: #112d4e;
	}
	
	.riga {
		display: flex;
		margin-top: 2%;
	}
	
	.riga label, input {
		width: 50%;
	}
	
	input {
		color: #112d4e;
		background: #f9f7f7;
	}
	
	#login {
		margin-left: auto;
		margin-top: 1%;
		width: 20%;
		font-size: medium;
		cursor: pointer;
		background: #3f72af;
		color: #f9f7f7;
	}

</style>
</head>
<body>

<div class="background">
   <div></div>
   <div></div>
   <div></div>
</div>

<form action="areaRiservata.do" method="post">

<div class="container">
  <div class="riga">
    <label>User</label>
    <input type="text" name="username">
  </div>
  <div class="riga">
    <label>Password</label>
    <input type="password" name="pwd">
  </div>
  <div class="riga">
    <button id="login">Login</button>
  </div>
</div>

</form>

</body>
</html>