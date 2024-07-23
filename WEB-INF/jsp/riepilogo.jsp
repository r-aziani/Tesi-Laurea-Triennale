<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.PrenotazioneDAO"  %>
<%@ page import="dao.CampoDAO" %>
<%@ page import="dao.Database" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<jsp:useBean id="prenotazione" scope="session" class="bean.Prenotazione"></jsp:useBean>
<jsp:setProperty property="*" name="prenotazione"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<title>Riepilogo</title>
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
	
	.container {
		border: 0.2em solid #112d4e;
		margin-left: auto;
		margin-right: auto;
		margin-top: 2%;
		width: 95%;
		max-width: 450px;
		padding: 1.5%;
		border-radius: 0.8em;
		box-shadow: 0.3em 0.3em 1.5em #112d4e;
		background: #dbe2ef;
	}
	.riga {
		border-bottom: 0.05em solid #112d4e;
		display: flex;
		justify-content: space-between;
		margin-bottom: 1%;
	}
	
	.dato {
		width: 60%;
		text-align: left;
		height: 100%;
	}
	
	.container span {
		font-family: "Poppins", sans-serif;
        font-weight: 400;
  		font-style: normal;
  		padding: 1%;
	}
	
	.dato span {
		display: inline-block;
		font-weight: bold;
		padding-top: 1.5%;
	}
	
	form {
		margin-top: 3%;
	}
	
	form button {
		background: none;
		border: none;
		width: 100%;
	}
	
	form button span {
		font-family: "Poppins", sans-serif;
        font-weight: 500;
        font-size: larger;
  		color: blue;
  		cursor: pointer;
  		text-decoration: underline;
	}
	
	form button span:hover {
		color: #0000e5;
	}
	
	#message {
		font-family: "Poppins", sans-serif;
		width: 95%;
		display: block;
		text-align: center;
		max-width: 450px;
		margin-left: auto;
		margin-right: auto;
		margin-top: -2%;
		color: #112d4e; 
	}

</style>
</head>

<body>
	
  <div class="background">
   <div></div>
   <div></div>
   <div></div>
  </div>

  <div class="progressBar">
    <div class="cerchioPieno"></div>
    <div class="linea"></div>
    <div class="cerchioPieno"></div>
    <div class="linea"></div>
    <div class="cerchioPieno"></div>
    <div class="linea"></div>
    <div class="cerchioPieno"></div>
  </div>
  
  <p>Prenotazione avvenuta con successo!</p>
  <span id="message">Ti abbiamo inviato una mail con il riepilogo delle informazioni a <%= prenotazione.getEmail() %></span>
  
  <% Connection con = new Database().getCon(); %>
  
  <div class="container">
    <div class="riga">
      <span>Campo:</span>
      <div class="dato"><span><%= CampoDAO.getNomeById(con, prenotazione.getId_campo()) %></span></div>
    </div>
    <div class="riga">
      <span>Tariffa:</span>
      <div class="dato"><span><%= prenotazione.getTariffa() %> &euro;</span></div>
    </div>
    <div class="riga">
      <span>Data:</span>
      <div class="dato"><span><%= PrenotazioneDAO.getDataFormattata(prenotazione.getData()) %></span></div>
    </div>
    <div class="riga">
      <span>Orario:</span>
      <div class="dato"><span><%= prenotazione.getOrario() %></span></div>
    </div>
    <div class="riga">
      <span>Nome:</span>
      <div class="dato"><span><%= prenotazione.getNome() %></span></div>
    </div>
    <div class="riga">
      <span>Cognome:</span>
      <div class="dato"><span><%= prenotazione.getCognome() %></span></div>
    </div>
    <div class="riga">
      <span>Email:</span>
      <div class="dato"><span><%= prenotazione.getEmail() %></span></div>
    </div>
    <div class="riga">
      <span>Telefono:</span>
      <div class="dato"><span><%= prenotazione.getTelefono() %></span></div>
    </div>
  </div>
  
  <form action="index.do">
    <button><span>Clicca qui per tornare alla pagina iniziale</span></button>
  </form>
  
  <% con.close(); %>

</body>
</html>