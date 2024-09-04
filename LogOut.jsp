<%@page import="com.Bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    request.setAttribute("msg", "Logout Succesfully");
  
}else{
hs.removeAttribute("bean");
  hs.invalidate();
  request.setAttribute("msg", "Logout Succesfully");
  request.getRequestDispatcher("index.jsp").include(request, response);

%>




<%} %>

</body>
</html>