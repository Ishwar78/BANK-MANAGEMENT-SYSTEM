<%@page import="com.Bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile</title>
<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9; 
    color: #333;
    margin: 0;
    padding: 0;
}


.header {
    background-color: #34495e; 
    color: #fff;
    padding: 15px;
    text-align: center;
    font-size: 1.8rem;
    margin-bottom: 20px;
}

/* Center error message */
.center span {
    display: block;
    margin-top: 20px;
    font-size: 1.5rem;
}

/* Container for the form */
.form-container {
    max-width: 600px;
    margin: 30px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    border-radius: 8px; 
}

/* Styling for form elements */
form {
    display: flex;
    flex-direction: column;
}

/* Label styling */
label {
    margin-bottom: 5px;
    font-weight: bold;
    color: #34495e; 
}

/* Input field styling */
input[type="text"] {
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 1rem;
    transition: border-color 0.3s ease; 
}

input[type="text"]:focus {
    border-color: #3498db; 
    outline: none; 
}

/* Button styling */
input[type="reset"], input[type="submit"] {
    background-color: #3498db; 
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 4px; /* Rounded corners */
    cursor: pointer;
    margin: 10px 0;
    transition: background-color 0.3s ease; 
}

input[type="reset"]:hover, input[type="submit"]:hover {
    background-color: #2980b9; 
}

/* Back button styling */
.back-button {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 15px;
    background-color: #3498db; 
    color: #fff;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s ease; 
}

.back-button:hover {
    background-color: #2980b9; 
    text-decoration: none; 
}

/* Error message styling */
span[style*="color: red"] {
    display: block;
    text-align: center;
    margin-top: 10px;
    font-weight: bold;
    font-size: 1.2rem;
}

</style>
</head>
<body>
<center>
    <span style="color: red; font-size: 24px;">
        <% String msg = (String) request.getAttribute("msg"); if (msg != null) out.print(msg); %>
    </span>
</center>
<%
    HttpSession hs = request.getSession(false);
    CustomerBean cb = (CustomerBean) hs.getAttribute("bean");
    if (cb == null) {
        request.setAttribute("msg", "Session Expired");
        request.getRequestDispatcher("Signin.jsp").include(request, response);
    } else { %>
    <div class="header">Edit Profile</div>
    <div class="form-container">
        <form action="editprofile" method="post">
            <label for="ano">Account Number:</label>
            <input type="text" id="ano" name="ano" value="<%=cb.getAno() %>" readonly />
            
            <label for="cid">Customer ID:</label>
            <input type="text" id="cid" name="cid" value="<%=cb.getCid() %>" readonly />
            
            <label for="cname">Name:</label>
            <input type="text" id="cname" name="cname" value="<%=cb.getCname() %>" />
            
            <label for="actype">Account Type:</label>
            <input type="text" id="actype" name="actype" value="<%=cb.getActype() %>" />
            
            <label for="hno">House Number:</label>
            <input type="text" id="hno" name="hno" value="<%=cb.getHno() %>" />
            
            <label for="sn">Street Name:</label>
            <input type="text" id="sn" name="sn" value="<%=cb.getSn() %>" />
            
            <label for="cty">City:</label>
            <input type="text" id="cty" name="cty" value="<%=cb.getCty() %>" />
            
            <label for="st">State:</label>
            <input type="text" id="st" name="st" value="<%=cb.getSt() %>" />
            
            <label for="pin">Pincode:</label>
            <input type="text" id="pin" name="pin" value="<%=cb.getPcode() %>" />
            
            <label for="mid">Mail ID:</label>
            <input type="text" id="mid" name="mid" value="<%=cb.getMid() %>" />
            
            <input type="reset" value="Reset"><br>
            <input type="submit" value="Submit">
        </form>
        <a href="welcome.jsp" class="back-button">Go Back</a>
    </div>
<% } %>
</body>
</html>
