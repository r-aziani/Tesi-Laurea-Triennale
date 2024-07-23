<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.CampoDAO" %>
<%@ page import="dao.Database" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<jsp:useBean id="campo" scope="page" class="bean.Campo"></jsp:useBean>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.34/moment-timezone-with-data-1970-2030.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Area riservata | Modifica disponibilita</title>
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

	body{
		font-family: monospace;
		background: #f9f7f7;
		color: #112d4e;
	}
	
	body p {
		font-size: xx-large;
		text-align: center;
		margin-top: 2%;
	}
	
	nav {
		width: 99%;
		margin-left: auto;
		margin-right: auto;
		font-family: monospace;
		max-width: 512px;
	}
	
	nav form {
		width: 100%;
		margin: 0;
		display: flex;
	}
	
	nav button {
		height: 40px;
		font-size: large;
		padding-left: 5%;
		padding-right: 5%;
		margin: 0;
		font-family: monospace;
		border: 3px solid #112d4e;
		border-bottom: 1px solid #112d4e;
		color: #112d4e;
	}
	
	#orari {
		background: #366196;
		color: #f9f7f7;
		cursor: not-allowed;
	}
	
	#elimina {
		border-right: none;
		border-left: none;
	}
	
	#elimina, #elenco {
		background: #dbe2ef;
		cursor: pointer;
	}
	
	#elimina:hover , #elenco:hover {
		background: #cad4e7;
	}
	
	.container {
		width: 99%;
		margin-left: auto;
		margin-right: auto;
		border: 2px solid #112d4e;
		max-width: 512px;
		background: #dbe2ef;
	}
	
	.riga {
		display: flex;
		margin-top: 2%;
		margin-left: 2%;
		font-size: large;
	}
	
	.container span {
		display: inline-block;
		margin-top: 4%;
		margin-left: 2%;
		font-size: large;
	}
	
	.riga input {
		margin-left: 1%;
		border-color: #112d4e;
		color: #112d4e;
		cursor: pointer;
	}
	
	.container button {
	    display: block;
	    margin-top: 1%;
		margin-left: auto;
		margin-right: 5%;
		margin-bottom: 3.5%;
		font-family: monospace;
		font-size: large;
		color: #f9f7f7;
		border-color: #112d4e;
		background-color: #3f72af;
		padding: 1%;
		cursor: pointer;
	}
	
	.container button:hover {
		background-color:  #6e95c4;
	}
	
	.logout form {
    	display: flex;
    	justify-content: flex-end;
    }
    
    #logout {
    	font-family: monospace;
    	border-radius: 0.25em;
    	font-weight: bold;
    	color: red;
    	cursor: pointer;
    }

</style>

<script>
	function checkDate(event) {
		event.preventDefault();
		
		const data = new Date(document.getElementById('inputData').value);
		
		var opzioni = { year: 'numeric', month: '2-digit', day: '2-digit' };
		var d = new Date().toLocaleDateString('it-IT', opzioni);
		d = d.split('/').reverse().join('-');
		
		const currData = new Date(d);
		
		if(data < currData) {
			alert('ATTENZIONE: la data inserita è antecedente alla data odierna');
		} else {
			var radio = document.querySelector('input[name = "id_campo"]:checked');
			if(document.getElementById('inputData').value && radio != null)
				document.getElementById('form').submit();
			else
				alert('Inserire la data e il campo');
		}
	}
</script>

</head>
<body>

  <div class="background">
    <div></div>
    <div></div>
    <div></div>
  </div>
  
  <div class="logout">
    <form action="index.do" method="post">
      <button id="logout">Logout</button>
    </form>
  </div>

  <p>Modifica disponibilita</p>
  
  <nav>
    <form action="menuAreaRiservata.do" method="post">
      <button id="elenco" name="value" value="1">Gestisci pagamenti</button>
      <button id="elimina" name="value" value="2">Elimina prenotazioni</button>
      <button id="orari" name="value" value="3">Gestione orari</button>
    </form>
  </nav>
  
  <% Connection con = new Database().getCon(); %>
  
  <form action="scegliData.do" method="post" id="form">
    <div class="container">
      <div class="riga">
        <label>Seleziona la data: </label>
        <input type="date" name="data" required="required" id="inputData">
      </div>
      <span>Seleziona il campo:</span>
      <%
      for(int i = 0; i < CampoDAO.size(con); i++) {
    	  campo = CampoDAO.getCampo(con, i);
    	  %>
    	  <div class="riga">
		    <input type="radio" id="idcampo" name="id_campo"
		           value="<%= campo.getId() %>"><%= campo.getNome() %>
		  </div>  	
      <%	  
      }
      %>
      
      <button type="button" onclick="checkDate(event)">Conferma</button>
    </div>
  </form>

<% con.close(); %>

</body>
</html>






