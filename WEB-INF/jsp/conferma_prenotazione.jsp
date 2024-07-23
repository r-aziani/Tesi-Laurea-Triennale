<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.PrenotazioneDAO" %>
<!DOCTYPE html>
<html>
<jsp:useBean id="prenotazione" scope="session" class="bean.Prenotazione"></jsp:useBean>
<jsp:setProperty property="*" name="prenotazione"/>
<head>
<title>Inserire il codice di verifica</title>
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
    
    .progressBar {
 		display: flex;
  		align-items: center;
  		justify-content: space-between;
  		width: 70%;
 		margin: 0 auto;
 		margin-top: 2%;
	}

	.cerchioPieno {
 		width: 4%;
  		padding-top: 4%;
  		background: #3f72af;
  		box-sizing: content-box;
  		border: 3.5px solid #112d4e;
  		border-radius: 50%;
	}
	
	.cerchioVuoto {
		width: 4%;
  		padding-top: 4%;
  		background: #dbe2ef;
  		box-sizing: content-box;
  		border: 3.5px solid #112d4e;
  		border-radius: 50%;
	}
	
	.linea {
		width: 28%;
		border: 2px solid #112d4e;
	}
	
	.container {
		width: 95%;
		max-width: 400px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 4%;
		padding: 2%;
		font-family: "Poppins", sans-serif;
		border-radius: 0.8em;
		box-shadow: 0.4em 0.4em 1.5em #112d4e;
		background: #dbe2ef;
		border: 0.2em solid #112d4e;
		color: #112d4e;
	}
	
	.container span {
		display: block;
		
	}
	
	.title {
		margin-top: 1%;
		font-weight: bold;
		text-align: center;
		font-size: x-large;
	}
	
	.text {
		font-size: medium;
		text-align: center;
		margin-top: 1%;
	}
	
	.inputContainer {
		display: flex;
		flex-direction: row;
		justify-content: center;
		gap: 20px;
	}
	
	.inputContainer input {
		margin-top: 4%;
		width: 50px;
		height: 50px;
		font-size: 40px;
		text-align: center;
		background: #f9f7f7;
		border-radius: 10px;
		border: 3px solid #3f72af;
		outline: none;
		color: #112d4e;
	}
	
	.inputContainer input:disabled {
		background: #e0dede;
		border: 3px solid #658ebf;
		cursor: not-allowed;
	}
	
	.button {
		width: 100%;
		padding: 2%;
		margin-top: 8%;
		font-family: "Poppins", sans-serif;
		font-size: larger;
		color: #f9f7f7;
    	border: 0.15em solid #112d4e;	
		background: #3f72af;
		cursor: pointer;
		border-radius: 1rem;
		transition: background 0.5s ease; 
	}
	
	.button:hover {
		background: #6e95c4;
	}
	
	.button:disabled {
		cursor: not-allowed;
		background: rgba(63,114,175,0.5);
	}
	
	#formNewCode {
		width: 100%;
	}
	
	.newCode {
		background: none;
		border: none;
		display: block;
		margin-left: auto;
		margin-right: auto;
		text-decoration: underline;
		cursor: pointer;
		font-family: "Poppins", sans-serif;
		font-size: medium;
		color: #112d4e; 
	}

</style>

<script type="text/javascript">

	function sendForm(event) {
		event.preventDefault();
		const inputs = document.querySelectorAll('.otp-input');
		var codice = document.getElementById('codice');
		var code = '';

		inputs.forEach(input => {
            code += input.value;
        });
		
        codice.value = code;
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

  <div class="progressBar">
    <div class="cerchioPieno"></div>
    <div class="linea"></div>
    <div class="cerchioPieno"></div>
    <div class="linea"></div>
    <div class="cerchioPieno"></div>
    <div class="linea"></div>
    <div class="cerchioVuoto"></div>
  </div>
  
  <div class="container">
    <form action="riepilogo.do" id="form">
      <span class="title">Inserire il codice di verifica</span>
      <span class="text">Abbiamo inviato un codice di verifica a <%= prenotazione.getEmail() %></span>
      <div class="inputContainer">
        <input type="text" maxlength="1" class="otp-input" autofocus="autofocus">
        <input type="text" maxlength="1" class="otp-input" disabled="disabled">
        <input type="text" maxlength="1" class="otp-input" disabled="disabled">
        <input type="text" maxlength="1" class="otp-input" disabled="disabled">
        
        <input type="hidden" name="id_campo" value="<%= prenotazione.getId_campo() %>">
        <input type="hidden" name="data" value="<%= prenotazione.getData() %>">
        <input type="hidden" name="orario" value="<%= prenotazione.getOrario() %>">
        <input type="hidden" name="tariffa" value="<%= prenotazione.getTariffa() %>">
        <input type="hidden" name="nome" value="<%= prenotazione.getNome() %>">
        <input type="hidden" name="cognome" value="<%= prenotazione.getCognome() %>">
        <input type="hidden" name="email" value="<%= prenotazione.getEmail() %>">
        <input type="hidden" name="telefono" value="<%= prenotazione.getTelefono() %>">
        <input type="hidden" name="codiceConferma" value="<%= prenotazione.getCodiceConferma() %>">
        <input type="hidden" name="inputCodiceConferma" id="codice">
        
        <input type="hidden" name="idToDelete" value="<%= prenotazione.getIdToDelete() %>">
		        
      </div>
      <button type="button" class="button" disabled="disabled" onclick="sendForm(event)">Verifica</button>
    </form>
    <form id="formNewCode" action="confermaPrenotazione.do" method="post">
      <input type="hidden" name="id_campo" value="<%= prenotazione.getId_campo() %>">
      <input type="hidden" name="data" value="<%= prenotazione.getData() %>">
      <input type="hidden" name="orario" value="<%= prenotazione.getOrario() %>">
      <input type="hidden" name="tariffa" value="<%= prenotazione.getTariffa() %>">
      <input type="hidden" name="nome" value="<%= prenotazione.getNome() %>">
      <input type="hidden" name="cognome" value="<%= prenotazione.getCognome() %>">
      <input type="hidden" name="email" value="<%= prenotazione.getEmail() %>">
      <input type="hidden" name="telefono" value="<%= prenotazione.getTelefono() %>">
      <input type="hidden" name="codiceConferma" value="<%= PrenotazioneDAO.generaCodiceConferma() %>">
      
      <input type="hidden" name="idToDelete" value="<%= prenotazione.getIdToDelete() %>">
      
      <button class="newCode">Richiedi un nuovo codice</button>
    </form>
  </div>
  
  <script>
	document.addEventListener('DOMContentLoaded', function() {
    	const inputs = document.querySelectorAll('.otp-input');
    	const verifyButton = document.querySelector('.button');
    	
    	function checkInputsFilled() {
            const allFilled = Array.from(inputs).every(input => input.value.trim() !== '');
            verifyButton.disabled = !allFilled;
        }

    	inputs.forEach((input, index) => {
        	input.addEventListener('keyup', (event) => {
            	if (input.value.trim() !== '' && index < inputs.length - 1) {
                	// Sposta il focus all'input successivo se l'input corrente non è vuoto
                	inputs[index + 1].disabled = false;
                	inputs[index + 1].focus();
            	}
            	if (event.key === "Backspace" && index > 0) {
                	// Sposta il focus all'input precedente se si preme backspace
                	inputs[index].disabled = true;
                	inputs[index - 1].focus();
            	}
            	checkInputsFilled();
        	});
        	input.addEventListener('input', checkInputsFilled);
    	});
    	checkInputsFilled();
	});
  </script>

</body>
</html>