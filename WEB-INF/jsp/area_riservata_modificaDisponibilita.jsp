<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="dao.PrenotazioneDAO" %>
<%@ page import="dao.DisponibilitaDAO" %>
<%@ page import="dao.Database" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<jsp:useBean id="disponibilita" scope="page" class="bean.ModificaDisponibilita"></jsp:useBean>
<jsp:setProperty property="*" name="disponibilita"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Area Riservata | Modifica disponibilita</title>
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
	
	p {
		font-size: xx-large;
		text-align: center;
		margin-top: 2%;
		color: #112d4e;
		font-family: monospace;
	}

	.grid-container {
		display: grid;
		grid-template-areas: 
			'left center right'
			'left center right'
			'left center right'
			'left center right'
			'left center right'
			'left center right'
			'left center right'
			'left center right';
		margin-left: auto;
		margin-right: auto;
		margin-top: 2%;
		width: 99%;
		max-width: 900px;	
	}
	
	.left, .center, .right {
		text-align: center;
	}
	
	.container {
		font-family: monospace;
		font-size: large;
		color: #112d4e;
		background: #dbe2ef;
		padding: 2%;
		border: 2px solid #112d4e;
		margin-left: auto;
		margin-right: auto;
		max-width: 900px;
	}
	
	.riga {
		margin-top: 2%;
	}
	
	input[type="text"] {
		max-width: 100px;
		font-family: monospace;
		color: #112d4e;
		background: #f9f7f7;
		font-size: large;
	}
	
	input[type="checkbox"] {
		cursor: pointer;
	}
		
	#read {
		background: #d3d3d3;
	}
	
	#conferma {
		font-family: monospace;
		font-size: large;
		color: #f9f7f7;
		border-color: #112d4e;
		background-color: #3f72af;
		padding: 1%;
		cursor: pointer;
		display: block;
		margin-top: 4%;
		margin-left: auto;
	}
	
	#conferma:hover {
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

<script type="text/javascript">

	function setToZero() {
		var elements = document.getElementsByClassName('zero');
		for(var i = 0; i < elements.length; i++) {
			elements[i].setAttribute('value', '0');
		}
		
		document.getElementById('form').reset();
	}
	
	function checkTariffe(event) {
		event.preventDefault();
		var flag = true;
		const reg = /^\d+$/;

		var tariffe = document.querySelectorAll('input[name="tariffa"]');
		for(var i = 0; i < tariffe.length; i++) {
			if( !(reg.test(tariffe[i].value)) ) {
				flag = false;
			} 
		}
		if(flag) {
			document.getElementById('form').submit();
		} else {
			alert('ATTENZIONE: inserire correttamente gli importi');
		}
	}
	

</script>

</head>

<body onload="setToZero()">

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
  
  <form action="cambiaDisponibilita.do" method="post" id="form">
  <div class="container">
    <span>Seleziona gli orari da rendere disponibili e inserisci il relativo importo:</span>
    <div class="grid-container">
    <%
    Connection con = new Database().getCon();
    LocalTime ora = LocalTime.MIDNIGHT;
    %>
	<div class="left">
	<%
    for(int cont = 0; cont < 8; cont++) {
    	if(DisponibilitaDAO.isPrenotabile(con, LocalDate.parse(disponibilita.getData()), 
    			ora, disponibilita.getId_campo()) >= 0) {
    		if(PrenotazioneDAO.esistePrenotazione(con, disponibilita.getId_campo(), 
    				LocalDate.parse(disponibilita.getData()), ora)) {
    			%>
    			<div class="riga">
    			  <input type="hidden" name="noDelete" value="<%= ora %>">
    			  <input type="checkbox" disabled="disabled" checked="checked"><%= ora %>
    			  <input type="text" value="<%= DisponibilitaDAO.getTariffa(con, disponibilita.getId_campo(),
    					  LocalDate.parse(disponibilita.getData()), ora) %>" readonly="readonly" 
    					 id="read" name="tariffa">
    			</div> 
    			<%
    		} else {
    			%>
    			<div class="riga">
    			  <input type="checkbox" checked="checked" name="toAdd" value="<%= ora%>"><%= ora %>
    			  <input type="text" name="tariffa" value="<%= DisponibilitaDAO.getTariffa(con, 
    					  disponibilita.getId_campo(),LocalDate.parse(disponibilita.getData()), ora) %>">
    			</div>
    			<%
    		}
    	} else {
    		%>
    		<div class="riga">
    		  <input type="checkbox" name="toAdd" value="<%= ora%>" class="no"><%= ora %>
    		  <input type="text" name="tariffa" class="zero">
    		</div>
    		<%
    	}
    ora = ora.plusHours(1);
    }
    %>
    </div>
    
    <div class="center">
	<%
    for(int cont = 8; cont < 16; cont++) {
    	if(DisponibilitaDAO.isPrenotabile(con, LocalDate.parse(disponibilita.getData()), 
    			ora, disponibilita.getId_campo()) >= 0) {
    		if(PrenotazioneDAO.esistePrenotazione(con, disponibilita.getId_campo(), 
    				LocalDate.parse(disponibilita.getData()), ora)) {
    			%>
    			<div class="riga">
    			  <input type="hidden" name="noDelete" value="<%= ora %>">
    			  <input type="checkbox" disabled="disabled" checked="checked"><%= ora %>
    			  <input type="text" name="tariffa" value="<%= DisponibilitaDAO.getTariffa(con, 
    					  disponibilita.getId_campo(),LocalDate.parse(disponibilita.getData()), ora) %>" 
    					  readonly="readonly" id="read">
    			</div>
    			<%
    		} else {
    			%>
    			<div class="riga">
    			  <input type="checkbox" checked="checked" name="toAdd" value="<%= ora%>"><%= ora %>
    			  <input type="text" name="tariffa" value="<%= DisponibilitaDAO.getTariffa(con, 
    					  disponibilita.getId_campo(), LocalDate.parse(disponibilita.getData()), ora) %>">
    			</div>
    			<%
    		}
    	} else {
    		%>
    		<div class="riga">
    		  <input type="checkbox" name="toAdd" value="<%= ora%>" class="no"><%= ora %>
    		  <input type="text" name="tariffa" class="zero">
    		</div>
    		<%
    	}
    ora = ora.plusHours(1);
    }
    %>
    </div>
    
    <div class="right">
	<%
    for(int cont = 16; cont < 24; cont++) {
    	if(DisponibilitaDAO.isPrenotabile(con, LocalDate.parse(disponibilita.getData()), 
    			ora, disponibilita.getId_campo()) >= 0) {
    		if(PrenotazioneDAO.esistePrenotazione(con, disponibilita.getId_campo(), 
    				LocalDate.parse(disponibilita.getData()), ora)) {
    			%>
    			<div class="riga">
    			  <input type="hidden" name="noDelete" value="<%= ora %>">
    			  <input type="checkbox" disabled="disabled" checked="checked"><%= ora %>
    			  <input type="text" name="tariffa" value="<%= DisponibilitaDAO.getTariffa(con, 
    					  disponibilita.getId_campo(), LocalDate.parse(disponibilita.getData()), ora) %>" 
    					 readonly="readonly" id="read">
    			</div>
    			<%
    		} else {
    			%>
    			<div class="riga">
    			  <input type="checkbox" checked="checked" name="toAdd" value="<%= ora%>"><%= ora %>
    			  <input type="text" name="tariffa" value="<%= DisponibilitaDAO.getTariffa(con, 
    					  disponibilita.getId_campo(), LocalDate.parse(disponibilita.getData()), ora) %>">
    			</div>
    			<%
    		}
    	} else {
    		%>
    		<div class="riga">
    		  <input type="checkbox" name="toAdd" value="<%= ora%>" class="no"><%= ora %>
    		  <input type="text" name="tariffa" class="zero">
    		</div>
    		<%
    	}
    ora = ora.plusHours(1);
    }
    %>
    </div>
    </div>
    
    <button type="button" onclick="checkTariffe(event)" id="conferma">Conferma</button>
    
  </div>
  </form>

<% con.close(); %>

</body>
</html>