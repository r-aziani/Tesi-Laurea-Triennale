<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<title>Errore</title>
<style type="text/css">

	body {
		background: radial-gradient(circle, rgba(0, 71, 171, 0.3) 0%, rgba(253,253,253,1) 80%);
	}
	
	body p {
		font-family: "Poppins", sans-serif;
        font-weight: 400;
  		font-style: normal;
  		text-align: center;
  		font-size: xx-large;
	}
	
	.imgContainer {
		margin-left: auto;
		margin-right: auto;
		max-width: 280px;
		margin-top: 7%;
	}
	
	img {
		max-width: 280px;
	}
	
	form {
		max-width: 300px;
		margin-left: auto;
		margin-right: auto;
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

</style>
</head>
<body>

  <div class="imgContainer">
    <img alt="unicorno triste :(" src="unicorn.png">
  </div>

  <p>Si è verificato un errore: il campo che hai scelta risulta occupato</p>
  <form action="index.do">
    <button><span>Clicca qui per tornare alla pagina iniziale</span></button>
  </form>

</body>
</html>




