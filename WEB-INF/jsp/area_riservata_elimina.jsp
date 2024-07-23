<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.PrenotazioneDAO" %>
<%@ page import="dao.Database" %>
<%@ page import="dao.CampoDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Area Riservata | Elenco prenotazioni</title>
<style type="text/css">
	
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
	
	table {
		width: 99%;
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
		overflow: scroll;
	}
	
	.thead {
		text-align: center;
		border: 1px solid #112d4e;
		padding: 0.5%;
		font-size: large;
		font-weight: bold;
		background: #7ca2d0;
	}
	
	.tbody {
		border: 1px solid #112d4e;
		padding: 0.3%;
		font-size: medium;
	}
	
	#body:nth-child(odd) {
		background: #dbe2ef;
	}
	
	table button {
		font-family: monospace;
	}
	
	table form {
		width: 100%;
		height: 100%;
		margin-top: 0.5%;
		margin-bottom: -0.1%;
		display: inline-block;
		padding: 5%;
	}
	
	nav {
		width: 99%;
		margin-left: auto;
		margin-right: auto;
		font-family: monospace;
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
		border-bottom: 2px solid #112d4e;
		color: #112d4e;
	}
	
	#elimina {
		border-right: none;
		background: #366196;
		color: #f9f7f7;
		cursor: not-allowed;
	}
	
	#elenco {
		border-right: none;
	}
	
	#elenco, #orari {
		background: #dbe2ef;
		cursor: pointer;
	}
	
	#elenco:hover , #orari:hover {
		background: #cad4e7;
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
</head>
<body>

  <div class="logout">
    <form action="index.do" method="post">
      <button id="logout">Logout</button>
    </form>
  </div>

  <p>Elenco prenotazioni</p>
  
  <nav>
    <form action="menuAreaRiservata.do" method="post">
      <button id="elenco" name="value" value="1">Gestisci pagamenti</button>
      <button id="elimina" name="value" value="2">Elimina prenotazioni</button>
      <button id="orari" name="value" value="3">Gestione orari</button>
    </form>
  </nav>
  
  <table>
    <thead>
      <tr>
        <td class="thead" style="width: 10%;">
          <span>Codice prenotazione</span>
        </td>
        <td class="thead" style="width: 10%;">
          <span>Campo</span>
        </td>
        <td class="thead" style="width: 10%;">
          <span>Data</span>
        </td>
        <td class="thead" style="width: 7%;">
          <span>Orario</span>
        </td>
        <td class="thead" style="width: 7%;">
          <span>Tariffa</span>
        </td>
        <td class="thead" style="width: 10%;">
          <span>Nome</span>
        </td>
        <td class="thead" style="width: 12%;">
          <span>Cognome</span>
        </td>
        <td class="thead" style="width: 19%;">
          <span>Email</span>
        </td>
        <td class="thead" style="width: 8%;">
          <span>Telefono</span>
        </td>
        <td class="thead" style="width: 7%;">
        </td>
      </tr>
    </thead>
    <tbody>
      <%
      Connection con = new Database().getCon(); 
      ResultSet rs = PrenotazioneDAO.getDaPagare(con);
      
      while(rs.next()) {
    	  %>
    	  <tr id="body">
    	    <td class="tbody">
    	      <span><%= rs.getString(1) %></span>
    	    </td>
    	    <td class="tbody">
    	      <span><%= CampoDAO.getNomeById(con, rs.getInt(2)) %></span>
    	    </td>
    	    <td class="tbody">
    	      <span><%= PrenotazioneDAO.getDataFormattata(rs.getDate(3).toString()) %></span>
    	    </td>
    	    <td class="tbody">
    	      <span><%= rs.getTime(4).toString().substring(0, 5) %></span>
    	    </td>
    	    <td class="tbody">
    	      <span><%= rs.getString(5) %></span>
    	    </td>
    	    <td class="tbody">
    	      <span><%= rs.getString(6) %></span>
    	    </td>
    	    <td class="tbody">
    	      <span><%= rs.getString(7) %></span>
    	    </td>
    	    <td class="tbody">
    	      <span><%= rs.getString(8) %></span>
    	    </td>
    	    <td class="tbody">
    	      <span><%= rs.getString(9) %></span>
    	    </td>
    	    <td class="tbody">
    	      <form action="areaRiservataElimina.do" method="post">
    	        <input type="hidden" value="<%= rs.getString(1) %>" name="id">
    	        <button>Elimina</button>
    	      </form>
    	    </td>
          </tr>
    	  <%
      }
      rs.close();
      con.close();
      %>
      
    </tbody>
  </table>
   
</body>
</html>