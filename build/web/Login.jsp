

<% 
    if(session.getAttribute("id")!=null)
    {
        response.sendRedirect("home.jsp");
    }
    %>

<html>
<head>
<title>Login Form</title>

    <link rel="stylesheet" href="login.css">
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    
</head>
<body>


<div class="back-image"></div>
<div class="back-gradient"></div>
    
    
<div class="login">
    <div class="blue">
        <a href="index.jsp"  > <img src="logo.png" /></a>
    <p> Property Dealer</p>
        <hr>
        <form action="match" method="post">
	<h2>Login </h2>
        
	<input type="text" placeholder="Enter User Id" name="user" />
	<input type="password" placeholder="Enter Password" name="password" />
      <button id="sub1"> Sign In </button>    </form>
        <p id="jk">Don't Have An Account ? <a href="registration.html" >Click Here</a> </p>
</div>
        
        
        </div>

</body>
</html>