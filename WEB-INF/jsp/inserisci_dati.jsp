<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.PrenotazioneDAO" %>
<!DOCTYPE html>
<html>
<jsp:useBean id="prenotazione" scope="session" class="bean.Prenotazione"></jsp:useBean>
<jsp:setProperty property="*" name="prenotazione"/>
<head>
<title>Inserisci dati</title>
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
	
	body {
		color: #112d4e;
	}
	
	body p {
		font-family: "Poppins", sans-serif;
        font-weight: 400;
  		font-style: normal;
  		text-align: center;
  		font-size: xx-large;
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
	
	.formContainer {
		border: 0.2em solid #112d4e;
		width: 95%;
		margin-left: auto;
		margin-right: auto;
		padding-bottom: 1.5%;
		padding-top: 0.5%;
		border-radius: 0.8em;
		box-shadow: 0.4em 0.4em 1.5em #112d4e;
		background: #dbe2ef;
		max-width: 400px;
	}
	
	.riga {
		width: 100%;
		margin-bottom: 24px;
	}
	
	.riga label, input {
		display: block;
		width: 95%;
		margin-left: auto;
		margin-right: auto;
		font-family: "Poppins", sans-serif;
		font-size: medium;
	}
	
	.riga label {
		margin-top: 2.5%;
		font-family: "Poppins", sans-serif;
		font-weight: 600;
	}
	
	.riga input {
		border-radius: 0.25em;
		background: none;
		border: none;
		border-radius: 0;
		border-bottom: 0.1em solid #94a9cf; 
		transition: border-bottom 0.75s ease;
	}
	
	.riga input:focus {
		outline: none;
		border-bottom: 0.1em solid #3f72af; 
	}
	
	input::placeholder {
		font-style: italic;
	}
	
	.rigaBottone {
		width: 100%;
		display: flex;
	}
	
	.rigaBottone button {
		width: 80%;
		font-size: medium;
		margin-right: 2.5%;
		margin-left: auto;
		margin-right: auto;
		padding-top: 1.5%;
		padding-bottom: 1.5%;
		margin-top: 1%;
		margin-bottom: 1%;
		font-family: "Poppins", sans-serif;
    	color: #f9f7f7;
    	border: 0.15em solid #112d4e;	
		background: #3f72af;
		cursor: pointer;
		border-radius: 1rem;
		transition: background 0.5s ease;
	}
	
	.rigaBottone button:hover {
		background: #6e95c4;
	}

</style>

<script type="text/javascript">

	function checkForm(event) {
		event.preventDefault();
		const regexName = /^[a-z ,.\'-]+$/i;
		const regexEmail = /^[^@]+@[^@]+$/;
		const regexTelefono = /^\+?\d+(\s\d+)*$/;
		
		var nome = document.getElementById('nome').value;
		var cognome = document.getElementById('cognome').value;
		var email = document.getElementById('email').value;
		var telefono = document.getElementById('telefono').value;
		
		if(!regexName.test(nome)) {
			alert('ATTENZIONE: inserire un nome valido');
			return;
		}
		if(!regexName.test(cognome)) {
			alert('ATTENZIONE: inserire un cognome valido');
			return;
		}
		if(!regexEmail.test(email)) {
			alert('ATTENZIONE: inserire un indirizzo email valido');
			return;
		}
		if(!regexTelefono.test(telefono)) {
			alert('ATTENZIONE: inserire un numero di telefono valido');
			return;
		}
		
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
  
  <p>Inserisci i dati richiesti per confermare la prenotazione</p>
  
  <form action="confermaPrenotazione.do" method="post" id="form">
  
  <input type="hidden" name="id_campo" value="<%= prenotazione.getId_campo() %>">
  <input type="hidden" name="data" value="<%= prenotazione.getData()%>">
  <input type="hidden" name="orario" value="<%= prenotazione.getOrario() %>">
  <input type="hidden" name="tariffa" value="<%= prenotazione.getTariffa() %>">
  <input type="hidden" name="idToDelete" value="<%= prenotazione.getIdToDelete() %>">
  
  <div class="formContainer">

    <div class="riga">
      <label for="nome">Nome*</label>
  	  <input type="text" id="nome" name="nome" required="required" placeholder="Nome">
    </div>
    <div class="riga">
      <label for="cognome">Cognome*</label>
      <input type="text" id="cognome" name="cognome" required="required" placeholder="Cognome">
    </div>
    <div class="riga">
      <label for="email">Email*</label>
      <input type="text" id="email" name="email" required="required" placeholder="email@email.com">
    </div>
    <div class="riga">
      <label for="telefono">Telefono*</label>
      <input type="text" id="telefono" name="telefono" required="required" placeholder="123456789">
    </div>
    
    <input type="hidden" name="codiceConferma" value="<%= PrenotazioneDAO.generaCodiceConferma() %>">
    
    <div class="rigaBottone">
      <button type="button" onclick="checkForm(event)">Conferma</button>
    </div>
    
  </div>
  
  </form>

</body>
</html>






