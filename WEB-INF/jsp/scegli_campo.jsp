<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ page import="dao.CampoDAO" %>
<%@ page import="dao.Database" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<jsp:useBean id="db" scope="page" class="dao.Database"></jsp:useBean>
<jsp:useBean id="campo" scope="page" class="bean.Campo"></jsp:useBean>

<head>
	<title>Scegli campo</title>
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
	
	.grid-container {
		display: grid;
		width: 75%;
		margin-left: auto;
		margin-right: auto;
	}
	
	@media (min-width: 800px) {
    .grid-container { 
    	grid-template-columns: repeat(2, 1fr);
    	column-gap: 8%;
    	}
    }
	
	@media (min-width: 1100px) {
    .grid-container { 
    	grid-template-columns: repeat(3, 1fr);
    	column-gap: 8%; 
    	}
    }
    
    #form {
    	width: 80%;
    	margin: auto;
    	margin-bottom: 4%;
    }
    
    #element {
    	border: 1px solid red;
    	padding-top: 4%;
    	padding-bottom: 8%;
    	padding-left: 8%;
    	padding-right: 8%;
    	width: 100%;
    	border-radius: 1em;
    	cursor: pointer;
    	
    	border: 0.25em solid #3f72af;
    	color: #112d4e;
    	box-shadow: 0.2em 0.2em 0.7em #112d4e;
    	background: #dbe2ef;
    	transition: background 2s ease;
    	transition: box-shadow 0.3s ease;    	
    }
    
    #element:hover {
    	background: #f9f7f7;
    	box-shadow: 0.4em 0.4em 1.5em #112d4e;
    }
    
    #element span {
		display: block;
		font-family: "Poppins", sans-serif;
	}
    
    .title {
		text-align: center;
		text-decoration: underline;
		font-weight: bold;
		font-size: x-large;
		margin-bottom: 4%;
		margin-top: 2%;
	}
    
    .riga {
		display: flex;
		margin-left: 4%;
	}
	
	.riga img {
		height: 2em;
		width: auto;
		margin-top: 1%;
	}
	
	.info{
		margin-left: 4%;
		padding-top: 1.5%;
		font-size: larger;
	}
	
    </style>
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
    <div class="cerchioVuoto"></div>
    <div class="linea"></div>
    <div class="cerchioVuoto"></div>
    <div class="linea"></div>
    <div class="cerchioVuoto"></div>
  </div>
  
  <p>Scegli in quale campo giocare</p>
  
  <% Connection con = new Database().getCon(); %>
  
  <div class="grid-container">
  	<%
  	for(int i = 0; i < CampoDAO.size(con); i++) {
  		campo = CampoDAO.getCampo(con, i);
  	%>
  	
      <form action="mostraDisponibilita.do" method="post" id="form">
        <button value="<%= campo.getId() %>" name="id_campo" id="element">
          <span class="title"><%= campo.getNome() %></span>
          <div class="riga">
            <img alt="gruppo di giocatori" src="group.png">
    	    <span class="info"><%= campo.getGiocatori() %></span>
          </div>
        </button>
      </form>
      
  	<%
  	}
  	%>
  </div>
  
  <% con.close(); %>

</body>
</html>






