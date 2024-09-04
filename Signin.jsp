<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
font-family: Arial, sans-serif;
margin: 0;
padding: 0;
animation: animateBackground 10s linear infinite;
}
nav {
			background-color:#337ab7 ;
			padding: 10px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		nav ul {
			list-style: none;
			margin: 0;
			padding: 0;
			display: flex;
		}
		nav li {
			margin-right: 20px;
		}
		nav a {
			color: #fff;
			text-decoration: none;
			transition: color 0.2s ease;
		}
		nav a:hover {
			color: #ccc;
		}

form {
max-width: 600px;
margin: auto;
padding: 20px;
background-color: #fff;
border-radius: 10px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
animation: animateForm 5s linear infinite;
}
input[type="email"] {
width: 100%;
padding: 10px;
margin-bottom: 20px;
border: none;
border-radius: 5px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
input[type="password"] {
width: 100%;
padding: 10px;
margin-bottom: 20px;
border: none;
border-radius: 5px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
input[type="text"] {
width: 100%;
padding: 10px;
margin-bottom: 20px;
border: none;
border-radius: 5px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

input[type="submit"] {
background-color: #337ab7;
color: #fff;
padding: 10px 20px;
border: none;
border-radius: 5px;
cursor: pointer;
animation: animateButton 5s linear infinite;
}
input[type="reset"] {
background-color: #337ab7;
color: #fff;
padding: 10px 20px;
border: none;
border-radius: 5px;
cursor: pointer;
animation: animateButton 5s linear infinite;
}

footer {
background-color: #337ab7;
padding: 10px;
display: flex;
justify-content: space-between;
align-items: center;
animation: animateFooter 5s linear infinite;
}

footer li {
margin-right: 20px;
}

footer a {
color: #fff;
text-decoration: none;
transition: color 0.2s ease;
}

footer a:hover {
color: #ccc;
}

@keyframes animateBackground {
0% {
background-color: #337ab7;
}
50% {
background-color: #45b3f7;
}
100% {
background-color: #337ab7;
}
}

@keyframes animateForm {
0% {
transform: translateY(0);
}
50% {
transform: translateY(-10px);
}
100% {
transform: translateY(0);
}
}

@keyframes animateButton {
0% {
transform: scale(1);
}
50% {
transform: scale(1.1);
}
100% {
transform: scale(1);
}
}

@keyframes animateFooter {
0% {
transform: translateY(0);
}
50% {
transform: translateY(-10px);
}
100% {
transform: translateY(0);
}
}



</style>
</head>
<body>
<center>
    <span style="color: red; font-size: 24px;">
        <% String msg = (String) request.getAttribute("msg"); if (msg != null) out.print(msg); %>
    </span>
</center>
<nav>
<div class="header">
 <nav>
		<ul>
			<li><a href="#">Home</a></li>
               
                    <li><a href="#"><i class="fa fa-user me-2"></i>About</small></li>
                </a>
                <li><a href="#">
                <i class="fa fa-sign-in-alt me-2"></i>Banking</small></li></a>
            
    
            </ul>
        </nav>
</div>
</nav>
<center>
  <h1>Sign In</h1>
</center>
<form action="clogin" method="post">
  <div class="form-group">
    <label for="uname">Enter Username:</label>
    <input type="email" name="uname" required><br><br>
  </div>
  <div class="form-group">
    <label for="upass">Enter Your Password:</label>
    <input type="password" name="upass" required><br><br>
  </div><center>
  <div class="form-group">
    <input type="reset" value="Reset"><br><br>
    <input type="submit" value="Signin">
  </div>
  </center>
</form>


</body>
</html>