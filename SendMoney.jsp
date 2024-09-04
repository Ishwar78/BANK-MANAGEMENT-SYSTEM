<%@page import="com.Bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Money</title>
<link rel="stylesheet" href="(link unavailable)" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="(link unavailable)" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
crossorigin="anonymous">
<style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  animation: animateBackground 10s linear infinite;
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

<% 

 


HttpSession hs = request.getSession(false);
CustomerBean cb = (CustomerBean) hs.getAttribute("bean");
if (cb == null) {
request.setAttribute("msg", "Session Expired");
request.getRequestDispatcher("Signin.jsp").include(request, response);
} else {
out.print("<center><h2>Welcome  " + cb.getCname() + "</h2></center>");
out.print("<center>Acc no: "+cb.getAno()+"</center>");




%>
<center>
    <span style="color: red; font-size: 24px;">
        <% String msg = (String) request.getAttribute("msg"); if (msg != null) out.print(msg); %>
    </span>
</center>
<form action="Sendmoney" method="post">
 
  <div class="form-group">
    <label for="sender">Enter Sender Account Number</label>
    <input type="text" name="sender" required>
  </div> 
  <div class="form-group">
    <label for="receiver">Enter Receiver Account Number</label>
    <input type="text" name="receiver" required>
  </div>
  <div class="form-group">
    <label for="amt">Enter Amount</label>
    <input type="text" name="amt" required>
  </div>
  <button>  <input type="submit"></button>
  
</form>
<a href="welcome.jsp">
  <button>Go Back</button>
</a>


<% } %>
</body>
</html>
    