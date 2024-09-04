<%@page import="com.Bean.CustomerBean"%>
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
  background-color: #337ab7;
}

/* Style the header */
.header {
  background-color: #333;
  color: #fff;
  padding: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.header a {
  color: #fff;
  text-decoration: none;
  margin-right: 20px;
}

.header a:hover {
  color: #ccc;
}

/* Add grid properties */
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 10px;
}

/* Style the buttons */
button {
  background-color: #4CAF50;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 10px;
}

button:hover {
  background-color: #3e8e41;
}

/* Add some theme styles */
body {
  --primary-color: #333;
  --secondary-color: #4CAF50;
  --background-color: #f0f0f0;
}

.header {
  background-color: var(--primary-color);
}

button {
  background-color: var(--secondary-color);
}

/* Add some responsive design */
@media (min-width: 600px) {
  .container {
    grid-template-columns: repeat(3, 1fr);
  }
  button {
    margin: 20px;
  }
}

/* Add some styles for the table */
table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  border: 1px solid #ddd;
  padding: 10px;
  text-align: left;
}

th {
  background-color: #f0f0f0;
}

/* Add some styles for the footer */
.footer {
  background-color: #333;
  color: #fff;
  padding: 10px;
  text-align: center;
}

</style>





</head>




<body>


<%
HttpSession hs = request.getSession(false);
CustomerBean cb = (CustomerBean)hs.getAttribute("bean");

if (cb == null) {
    request.setAttribute("msg", "Session Expired");
    request.getRequestDispatcher("index.jsp").include(request, response);
}
else{
%>

<div class="header">
  <a href="#">Home</a>
  <a href="#">About</a>
  <a href="#">Banking</a>
  <a href="LogOut.jsp">Logout</a>
</div>
<center><h1>
 <%out.println("Hii " + cb.getCname() + "<br>"); %>
 </h1>
 </center>
<div class="container">
  <table>
  <tr>
      <th>Acc no..:</th>
      <td> <%= cb.getAno() %> </td>
    </tr>
    <tr>
      <th>Customer Name :</th>
      <td> <%= cb.getCname() %> </td>
    </tr>
    <tr>
      <th>Customer Id :</th>
      <td> <%= cb.getCid() %> </td>
    </tr>
    <tr>
      <th>Customer Balance :</th>
      <td> <%= cb.getBal() %> </td>
    </tr>
    <tr>
      <th>Account Type :</th>
      <td> <%= cb.getActype() %> </td>
    </tr>
    <tr>
      <th>House Number :</th>
      <td> <%= cb.getHno() %> </td>
    </tr>
    <tr>
      <th>City :</th>
      <td><%=cb.getSn() %> </td>
    </tr>
    <tr>
      <th>State :</th>
      <td> <%=cb.getCty()%> </td>
    </tr>
    <tr>
      <th>Pin Code :</th>
      <td> <%=cb.getSt() %></td>
    </tr>
    <tr>
      <th>Street name :</th>
      <td> <%=cb.getSn() %> </td>
    </tr>
    <tr>
      <th>MailId:</th>
      <td> <%= cb.getMid() %> </td>
    </tr>
    <tr>
      <th>Phone No..:</th>
      <td> <%= cb.getNumber() %> </td>
    </tr>
     
  </table>
  
</div>
<div class="footer">
  <p>&copy; 2023 SBI Bank. All rights reserved.</p>
</div>


<%
}
%>
</body>
</html>