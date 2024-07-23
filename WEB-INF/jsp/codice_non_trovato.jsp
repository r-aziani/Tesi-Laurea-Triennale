<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Digita codice prenotazione</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
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
	
	.home form {
    	display: flex;
    	justify-content: flex-start;
    }
    
    .home button {
    	font-family: "Poppins", sans-serif;
    	border-radius: 8px;
    	margin-top: 0.5%;
    	background: #f9f7f7;
    	border: 2px solid #3f72af;
    	cursor: pointer;
    	color: #112d4e;
    	padding-left: 1%;
    	padding-right: 1%;
    	padding-top: 0.5%;
    	padding-bottom: 0.5%;
    	transition: all 0.5s ease;
    }
    
    .home button:hover {
    	background: #dbe2ef;
    }
    
    .container {
    	color: #112d4e;
    	width: 96%;
    	max-width: 640px;
    	margin-left: auto;
    	margin-right: auto;
    	font-family: "Poppins", sans-serif;
    	margin-top: 2%;
    	text-align: center;
    }
    
    .container p {
    	font-size: x-large;
    }
    
    .container form {
    	margin-top: 6%;
    	width: 90%;
    	max-width: 320px;
    	margin-left: auto;
    	margin-right: auto;
    	display: flex;
    	justify-content: space-between;
    }
    
    .container input {
    	font-size: large;
    	outline: none;
    	color: #112d4e;
    	background: #f9f7f7;
    	border-color: #3f72af;
    	width: 144px;
    	padding: 1%;
    	box-shadow: 0.1em 0.1em 0.3em #112d4e;
    	border-radius: 0.4em; 
    }
    
    .container form button {
    	font-size: medium;
    	padding: 2%;
    	padding-left: 5%;
    	padding-right: 5%;
    	color: #f9f7f7;
    	border: 0.15em solid #112d4e;	
		background: #3f72af;
		cursor: pointer;
		border-radius: 0.75em;
		transition: all 0.5s ease;
    }
    
    .container form button:hover {
		background: #6e95c4;
		box-shadow: 0.2em 0.2em 0.5em #112d4e;
	}
	
	.container span {
		color: red;
		margin-left: auto;
		margin-right: auto;
	}

</style>

<script type="text/javascript">

	function checkInput(event) {
		event.preventDefault();
		var input = document.getElementById('input').value;
		if(input.length !== 12)
			alert('ATTENZIONE: il codice ha una lunghezza di 12 caratteri. Controlla di averlo inserito correttamente');
		else
			document.getElementById('form').submit();
	}

</script>
</head>
<body>

  <div class="background">
    <div></div>
    <div></div>
    <div></div>
  </div>
  
  <div class="home">
    <form action="index.do" method="post">
      <button>Home</button>
    </form>
  </div>
  
  <div class="container">
  	<p>Inserisci il codice prenotazione che hai ricevuto nella tua mail di conferma</p>
  	<form action="" method="post" id="form">
  	  <input type="text" placeholder="Codice" id="input" name="id">
      <button type="button" onclick="checkInput(event)">Conferma</button>
  	</form>
  	<span>Il codice inserito non è assocciato a nessuna prenotazione</span>
  </div>

</body>
</html>