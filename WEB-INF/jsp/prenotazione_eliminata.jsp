<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Prenotazione eliminata</title>
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
    
    img {
    	margin-top: 2%;
    	display: block;
    	width: 196px;
    	margin-left: auto;
    	margin-right: auto;
    }
    
    p {
    	font-family: "Poppins", sans-serif;
    	color: #112d4e;
    	font-size: large;
    	width: 96%;
    	max-width: 512px;
    	margin-left: auto;
    	margin-right: auto;
    	text-align: center;
    	margin-top: 3%;
    }
    
    #backHome {
    	max-width: 512px;
    	width: 96%;
    	margin-left: auto;
    	margin-right: auto;
    	text-align: center;
    	margin-top: 2%;
    }
    
    #backHome button {
    	background: none;
		border: none;
		cursor: pointer;
    }
    
    #backHome span {
    	font-family: "Poppins", sans-serif;
        font-weight: 500;
        font-size: larger;
  		color: blue;
  		text-decoration: underline;
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
  
  <img alt="eliminazione completata con successo" src="check.png">
  <p>La tua prenotazione è stata eliminata con successo</p>
  
  <form action="index.do" method="post" id="backHome">
    <button><span>Clicca qui per tornare alla pagina iniziale</span></button>
  </form>

</body>
</html>