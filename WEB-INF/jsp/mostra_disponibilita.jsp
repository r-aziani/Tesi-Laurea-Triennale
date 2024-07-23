<%@page import="dao.DisponibilitaDAO"%>
<%@ page import="org.postgresql.ssl.DbKeyStoreSocketFactory.DbKeyStoreSocketException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="dao.PrenotazioneDAO" %>
<%@ page import="dao.DisponibilitaDAO" %>
<%@ page import="dao.Database" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
  <jsp:useBean id="db" scope="page" class="dao.Database"></jsp:useBean>
  <jsp:useBean id="calendario" scope="session" class="bean.Calendario"></jsp:useBean>
  <jsp:setProperty property="*" name="calendario"/>
  <head>
  <title>Vedi Disponibilita</title>
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
	
	.tableContainer {
		width: 98%;
		margin-left: auto;
		margin-right: auto;
		display: flex;
		justify-content: space-between;
		margin-bottom: 5%;
	}
	
	.tableContainer form {
		widht: 100%;
		height: 100%;
	}
	
	.tableContainer button {
		width: 100%;
		height: 50%;
		border-radius: 4em;
		border-color: #112d4e;
		box-shadow: 0.3em 0.3em 1em #112d4e;
		
		background: #3f72af;
		color: #f9f7f7;
		cursor: pointer;
		transition: background 0.5s ease;
	}
	
	#disabled {
	    background: #b8c6df;
		color: #f9f7f7;
		cursor: not-allowed;
	}
	
	.tableContainer button:hover {
		box-shadow: 0.3em 0.3em 1.4em #112d4e;
		background: #6e95c4;
	}
	
	
	.arrow {
		font-size: xx-large;
	}
	
	.tableContainer table {
		border-collapse: collapse;
		width: 78%;
		box-shadow: 0.3em 0.3em 1em #112d4e;
		table-layout: fixed;
		
		background: #dbe2ef;
	}
	
	td {
		width: 100%;
		height: 100%;
		min-height: 40px;
		border-collapse: separate;
		box-sizing: border-box;
	}
	
	.thead {
		width: 100%;
		text-align: center;
		border-collapse: separate;
		box-sizing: border-box;
	}
	
	.thead p {
		border: 0.05em solid #112d4e;
	}
	
	.giorno {
		font-size: large;
		font-weight: bold;
		margin-bottom: 1%;
	}
	
	.data {
		font-size: large;
		font-weight: normal;
		margin-top: 1%;
	}
	
	#libero {
		border: 0.05em solid #112d4e;
		background: #16a34a;
		width: 100%;
		height: 100%;
		border-radius: 0;
		box-shadow: none;
		font-size: x-large;
		color: #112d4e;
		font-family: "Poppins", sans-serif;
		transition: background 0.5s ease;
	}
	
	#libero:hover {
		background: #22c55e;
	}
	
	#occupato {
		border: 0.05em solid #112d4e;
		background: #e60023;
		width: 100%;
		height: 100%;
		cursor: not-allowed;
		border-radius: 0;
		box-shadow: none;
		font-size: x-large;
		color: #112d4e;
		font-family: "Poppins", sans-serif;
	}
	
	#nonDisponibile {
		border: 0.05em solid #112d4e;
		background: #9a9a9a;
		width: 100%;
		height: 100%;
		cursor: not-allowed;
		border-radius: 0;
		box-shadow: none;
		font-size: x-large;
		color: #112d4e;
		font-family: "Poppins", sans-serif;
	}
	
	td button {
		display: flex;
		justify-content: space-between;
	}
	
	.legendaContainer {
		width: 95%;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 1%;
	}
	
	.legenda {
		width: 78%;
		margin-left: auto;
		margin-right: auto;
	}
	
	.legenda span {
		font-family: "Poppins", sans-serif;
		color: #112d4e;
		display: inline-block;
		margin-left: 0.75%;
	}
	
	.quadrato {
		height: 20px;
		width: 20px;
		margin-left: 1%;
		box-shadow: 0.05em 0.05em 0.3em #112d4e;
	}
	
	@media(max-width: 500px) {
		#libero, #occupato, #nonDisponibile {
			font-size: large;
	    }
	    
	    .giorno, .data {
	    	font-size: medium;
	    }
	}
	
	
	
	table {
	display: table;
	}
	table tr {
	display: table-cell;
	}
	table tr td {
	display: block;
	}
	
</style>
</head>
<body>

  <% calendario.inizializzaDate(); %>
	
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
    <div class="cerchioVuoto"></div>
    <div class="linea"></div>
    <div class="cerchioVuoto"></div>
  </div>

  <p>Seleziona un orario tra quelli disponibili</p>
  
  <div class="legendaContainer">
    <div class="legenda">
      <div style="display: flex; margin-bottom: 1%;">
        <div class="quadrato" style="background: #16a34a;"></div><span>Libero</span>
        <div class="quadrato" style="background: #e60023; margin-left: 2%;"></div><span>Occupato</span>
        <div class="quadrato" style="background: #9a9a9a; margin-left: 2%;"></div><span>Non disponibile</span>
      </div>
    </div>
  </div>
  
  <% Connection con = new Database().getCon(); %>
  
  <div class="tableContainer">
  	<div style="width: 10%; height: 100%; margin-top: 0.5%;">
      <form action="mostraDisponibilita.do" method="post">
        <input type="hidden" name="id_campo" value="<%= calendario.getId_campo() %>">
        <%
        if(calendario.getOffset() == 0) { %>
        	<button disabled="disabled" id="disabled"><span class="arrow">&lt;</span></button>
        <%
        } else{ %>
        	<button name="offset" value="<%= calendario.getOffset() - 3 %>" id="arrowButton">
        	  <span class="arrow">&lt;</span>
        	</button>
        <%
        }
        %>
      </form>
    </div>
    
    <table>
    <%
    LocalTime orari[] = DisponibilitaDAO.getFinestraDisponibilita(con, calendario);
    for(int i = 0; i < 3; i++) {
    	%>
    	<tr>
    	  <td class="thead">
    	    <p>
    	      <span class="giorno" id="giorno"><%= calendario.getGiorno(i) %></span>
    	      <br>
    	      <span class="data"><%= calendario.getDataFormattata(i) %></span>
    	    </p>
    	  </td>
    	<% 
    	LocalTime ora = orari[0];
    	while(orari[1].compareTo(ora) == 1) {
    		int tariffa = DisponibilitaDAO.isPrenotabile(con, calendario.getData(i), 
    											ora, calendario.getId_campo());
    		if(tariffa >= 0) {
    			if(PrenotazioneDAO.esistePrenotazione(con, calendario.getId_campo(),
    					calendario.getData(i), ora)) {
    				%>
    				<td class="tbody">
        	  	      <div style="width: 100%; height: 100%;">
        	  	        <button id="occupato" disabled="disabled">
        	  	          <span><%= ora %></span> 
        	  	          <span><%= tariffa %>&euro;</span>  
        	  	        </button>
        	  	      </div>
        	  	    </td>
    				<%
    			} else {
    				%>
    				<td class="tbody">
        	  	      <div style="width: 100%; height: 100%;">
        	  	        <form action="inserisciDati.do" method="post" style="margin: 0">
        	  	          <input type="hidden" name="id_campo" value="<%= calendario.getId_campo() %>">
        	  	          <input type="hidden" name="data" value="<%= calendario.getData(i) %>">
        	  	          <input type="hidden" name="tariffa" value="<%= tariffa %>">
        	  	          
        	  	          <input type="hidden" name="idToDelete" value="<%= calendario.getId() %>">
        	  	          
        	  	          <button id="libero" name="orario" type="submit" value="<%= ora %>">
        	  	            <span><%= ora %></span>
        	  	            <span><%= tariffa %>&euro;</span>   
        	  	          </button>
        	  	        </form>
        	  	      </div>
        	  	    </td>
    				<%
    			}
    		} else {
    			%>
    			<td class="tbody">
        	  	  <div style="width: 100%; height: 100%;">
        	  	    <button id="nonDisponibile" disabled="disabled"><%= ora %></button>
        	  	  </div>
        	  	</td>
    			<%
    		}
    	ora = ora.plusHours(1);	
    	}
    	%>
    	</tr>
    <%	
    }
    %>
    </table>
    
    <div style="width: 10%; height: 100%; margin-top: 0.5%">
      <form action="mostraDisponibilita.do" method="post">
        <input type="hidden" name="id_campo" value="<%= calendario.getId_campo() %>">
        <button type="submit" name="offset" value="<%= calendario.getOffset() + 3 %>"><span class="arrow">&gt;</span></button>
      </form>
    </div>
  </div>
  
  <% con.close(); %>
  
</body>
</html>







