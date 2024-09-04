<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>State Bank Of India </title>

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
input[type="number"] {
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
  <font color="red"> 
     <% String msg = (String) request.getAttribute("msg"); 
     if (msg != null)
    	 out.print(msg);
     %> 
     </font></center>
  <center>
    <h1>Registration Form</h1>
    <form action="cReg" method="post">
      <div class="form-group">
        <label for="ano">Enter Account Number</label>
        <input type="text" name="ano" required>
      </div>
      <div class="form-group">
        <label for="cid">Enter Customer Id</label>
        <input type="number" name="cid" required>
      </div>
      <div class="form-group">
        <label for="cname">Enter Customer Name</label>
        <input type="text" name="cname" required>
      </div>
      <div class="form-group">
        <label for="bal">Enter Balance</label>
        <input type="text" name="bal" required>
      </div>
      <div class="form-group">
        <label for="atype">Enter Account Type</label>
        <input type="text" name="atype" required>
      </div>
      <div class="form-group">
        <label for="hno">Enter House Number</label>
        <input type="text" name="hno" required>
      </div>

  
    <div class="form-group">
     Enter street Name: <input type="text" class="form-control" name="sn" >
  </div><br>
  
  <div class="form-group">
Enter Your City: <input Type="text" name="cty">
  </div><br>
  
  <div class="form-group">
Enter Your state: <input Type="text" name="st">
  </div><br>
  
  <div class="form-group">
Enter Pin Code : <input Type="text" name="pcode">
  </div><br>
  
   <div class="form-group">
        <label for="mid">Enter Your Mailid :</label>
        <input type="text" name="mid" required>
      </div>
  <div class="form-group">
        <label for="pass">Enter Your Password:</label>
        <input type="Password" name="pass" required>
      </div>
  
  <div class="form-group">
Enter Your Phone no: <input Type="text" name="pno">
  </div><br>

  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
      <label class="form-check-label" for="invalidCheck2">
        Agree to terms and conditions
      </label>
    </div>
  </div><br>
  <div class="form-group">
  <input type="reset"><br><br>
    <input type="submit">
  </div>
</form>
</center>

</body>
</html>