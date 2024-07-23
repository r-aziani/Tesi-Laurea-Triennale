<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>


<head>
	<title>Home</title>
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
	
	
	#formPrincipale {
		width: 100%;
		height: 100%;
	}
	
	.TitleImage{
		width: 80%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 6%;
		height: 60%;
	}
	
	.containerTitle, .containerImage{
		height: 100%;
		width: 50%;
	}
	
	.containerTitle p{
		font-family: "Poppins", sans-serif;
        font-weight: 400;
  		font-style: normal;
  		font-size: xxx-large;
  		margin-top: 14%;
  		margin-bottom: 2%;
  		color: #112d4e;
	}
	
	.bottoni{
		width: 100%;
		height: 15%;
		display: flex;
		justify-content: center;
		margin-left: auto;
		margin-right: auto;
	}
	
	
	button {
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none
	}
	
	
	#prenota {
    	display: inline-block;
    	font-size: large;
    	text-decoration: none;
    	margin-top: 2%;
    	font-family: "Poppins", sans-serif;
    	color: #f9f7f7;
    	border-radius: 1.75rem;
    	padding: 0.5rem 1rem;
    	cursor: pointer;
		border: 3px solid #112d4e;	
		background: #3f72af;
    	transition: background 2s ease;
    	box-shadow: 0;
    	transition: box-shadow 0.3s ease;
    	width: 85%;
    	margin-left: 7%;
	}
	
	#prenota:hover {
		background: #6e95c4;
		box-shadow: 0.2em 0.2em 0.7em #112d4e;
	}
	
	.containerImage img{
		max-height: 100%;
		max-width: 100%;
		margin-left: 6%;
		object-fit: contain;
	}
	
	@media (max-width: 800px) {
    .containerImage { 
    	display: none;
    	}
    .containerTitle {
    	width: 100%;
        }
    }
    
    .areaRiservata form {
    	display: flex;
    	justify-content: flex-end;
    }
    
    #bottoneAreaRiservata {
    	font-family: "Poppins", sans-serif;
    	border-radius: 0.25em;
    	margin-top: 0.5%;
    	margin-right: 0.5%;
    }
    
    #formGestisciPrenotazione button {
    	font-family: "Poppins", sans-serif;
    	cursor: pointer;
    	font-size: medium;
    	margin-top: 2%;
    	color: #112d4e;
    	border-radius: 1.75rem;
    	padding: 0.5rem 1rem;
    	width: 100%;
    	border: 3px solid #3f72af;
    	background: #f9f7f7;
    	transition: background 2s ease;
    	box-shadow: 0;
    	transition: box-shadow 0.3s ease;
    }
    
    #formGestisciPrenotazione button:hover {
    	background: #dbe2ef;
    	box-shadow: 0.2em 0.2em 0.7em #112d4e;
    }
    
    .container2 {
    	text-align: center;
		margin-left: auto;
		margin-right: auto;
		width: 85%;
		margin-left: 7%;
    }
	
	</style>
	
</head>

<body>

<div class="background">
   <div></div>
   <div></div>
   <div></div>
</div>

<div class="areaRiservata">
  <form action="login.do" method="post">
    <button id="bottoneAreaRiservata">Area riservata</button>
  </form>
</div>

<div class="TitleImage">
  <div style="display: flex; height: 100%; width: 100%;">
    <div class="containerTitle">
      <p>Prenota subito uno dei nostri campi</p>
      <div class="bottoni">
        <form action="scegli.do" method="post" id="formPrincipale">
          <button id="prenota">Prenota ora</button>
        </form>
      </div>
      <div class="container2">
        <div style="width: 96%; display: flex; justify-content: space-between; margin: auto; margin-top: 2%;">
          <div style="border-bottom: 2px solid #112d4e; width: 35%; margin-bottom: 10px;"></div>
          <span style="font-family: Poppins, sans-serif; color: #112d4e;">oppure</span>
          <div style="border-bottom: 2px solid #112d4e; width: 35%; margin-bottom: 10px;"></div>
        </div>
        <form action="goDigitaCodice.do" method="post" id="formGestisciPrenotazione">
          <button>Gestisci la tua prenotazione</button>
        </form>
      </div>
    </div>
    <div class="containerImage">
      <img src="football-pitch.png">
    </div>
  </div>
</div>

</body>
