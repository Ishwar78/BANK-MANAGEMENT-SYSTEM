<%@page import="com.Bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<style>

body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f9; 
  color: #333; /* Main text color */
  margin: 0;
  padding: 0;
}


.header {
  background-color: #34495e;
  color: #fff;
  padding: 15px;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.header a {
  color: #fff; 
  text-decoration: none;
  padding: 10px 15px;
  transition: color 0.3s ease;
}

.header a:hover {
  color: #ccc;
}


h1 {
  color: #2c3e50; 
  margin: 20px 0;
  text-align: center;
  font-size: 2rem;
}


.container {
  max-width: 800px;
  margin: 30px auto;
  padding: 20px;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  grid-gap: 20px;
  justify-items: center;
}


button {
  background-color: #3498db; 
  color: #fff;
  height: 150px;
  width: 150px;
  border: none;
  border-radius: 8px; 
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #2980b9; 
}

button a {
  text-decoration: none;
  color: inherit; 
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100%;
}


.btnn {
  background-color: #3498db; 
  transition: background-color 0.3s ease;
}

.btnn:hover {
  background-color: #2980b9; 
}


@media (max-width: 600px) {
  .header {
    flex-direction: column;
    padding: 10px;
  }
  .container {
    grid-template-columns: 1fr; 
  }
}

font[color="red"] {
  display: block;
  text-align: center;
  margin-top: 10px;
}

</style>

</head>
<body>
<%
HttpSession hs = request.getSession(false);
CustomerBean cb = (CustomerBean) request.getAttribute("bean");
if (cb == null) {
  request.setAttribute("msg", "Session Expired");
  request.getRequestDispatcher("index.jsp").include(request, response);
} else {
 
%>
<font color="red"> 
     <% String msg = (String) request.getAttribute("msg"); 
     if (msg != null)
    	 out.print(msg);
     %> 
     </font>
<nav>
<div class="header">

  <a href="#">Home</a>
  <a href="#">About</a>
  <a href="#">Banking</a>
  <a href="LogOut.jsp">Logout</a>
 
</div>
</nav>
<center><h1>
 <%out.println("" + cb.getCname() + "<br>");%>
 <%out.print("Account No."+cb.getAno()); %>

 </h1>
 </center>
<div class="container">
  <button><a href="custprofile.jsp">Customer Information</a></button>
  <button><a href="Balanceinfo.jsp">Check Balance</a></button>
  <button><a href="SendMoney.jsp">Send Money</a></button>	
  <a href="TransHistory.jsp"><button class="btnn">View transaction</button></a>
  <button><a href="Editprofile.jsp">Edit Profile</a></button>
</div>
<% } %>

</body>
</html>
