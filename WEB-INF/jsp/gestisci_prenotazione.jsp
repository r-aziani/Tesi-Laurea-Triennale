<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.PrenotazioneDAO" %>
<%@ page import="dao.Database" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<jsp:useBean id="prenotazione" scope="page" class="bean.Prenotazione"></jsp:useBean>
<jsp:setProperty property="*" name="prenotazione"/>
<head>
<title>Gestione prenotazione</title>
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
    	background: #fefefe;
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
	
	.title {
		width: 96%;
		max-width: 512px;
		color: #112d4e;
		margin-left: auto;
		margin-right: auto;
		font-family: "Poppins", sans-serif;
		font-size: xx-large;
		text-align: center;
	}
	
	.buttonContainer {
		width: 96%;
		max-width: 512px;
		margin-left: auto;
		margin-right: auto;
		font-family: "Poppins", sans-serif;
		align-content: center;
	}
	
	.buttonContainer form {
		display: flex;
		justify-content: center;
	}
	
	.buttonContainer button {
		background: #dbe2ef;
		border: 3.5px solid #3f72af;
		color: #112d4e;
		font-size: large;
		font-family: "Poppins", sans-serif;
		height: 96px;
		padding-left: 4%;
		padding-right: 4%;
		cursor: pointer;
		border-radius: 1em;
		box-shadow: 0.2em 0.2em 0.7em #112d4e;
		transition: background 2s ease;
    	transition: box-shadow 0.3s ease;
	}
	
	.buttonContainer button:hover {
		background: #f9f7f7;
    	box-shadow: 0.4em 0.4em 1.5em #112d4e;
	}
	
	.confirm {
		width: 90%;
		max-width: 496px;
		text-align: center;
		font-family: "Poppins", sans-serif;
		font-size: large;
		color: #112d4e;
		border: 3px solid #3f72af;
		border-radius: 1em;
		padding-top: 2%;
		padding-bottom: 2%;
		background: #dbe2ef;
		position: fixed;
    	top: 40%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	box-shadow: 0 0 30em #112d4e;
    	z-index: 2;
    	display: none;
	}
	
	.bottoni {
		width: 50%;
		display: flex;
		justify-content: space-around;
		margin-left: auto;
		margin-right: auto;
		margin-top: 4%;
	}
	
	.bottoni button {
		font-family: "Poppins", sans-serif;
		font-size: medium;
		padding: 2%;
		padding-left: 6%;
		padding-right: 6%;
		border-radius: 0.75em;
		cursor: pointer;
	}
	
	.bottoni button:hover {
		box-shadow: 0 0 0.7em #112d4e;
	}
	
	#annulla {
		background: #f9f7f7;
		color: #112d4e;
		border: 2px solid #3f72af;
	}
	
	#elimina {
		background: red;
		color: #f9f7f7;
		border: 2px solid #4c0000;
	}

</style>
<script type="text/javascript">

	function nascondiConferma(event) {
		const window = document.querySelector('.confirm');
		window.style.display = 'none';
	}
	
	function mostraConferma(event) {
		const window = document.querySelector('.confirm');
		window.style.display = 'inline';
	}
	
	function submitForm(event) {
		event.preventDefault();
		document.getElementById('formElimina').submit();
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
  
  <p class="title">Gestisci prenotazione</p>
  <div class="buttonContainer">
    <form action="eliminaPrenotazione.do" method="post" id="formElimina">
      <input type="hidden" name="id" value="<%= prenotazione.getId() %>">
      <button type="button" onclick="mostraConferma(event)">Elimina prenotazione</button>
    </form>
  </div>
  
  <div class="confirm">
    <span>Sei sicuro di voler eliminare la tua prenotazione?</span>
    <div class="bottoni">
      <button id="annulla" onclick="nascondiConferma(event)">Annulla</button>
      <button id="elimina" onclick="submitForm(event)">Elimina</button>
    </div>
  </div>

</body>
</html>