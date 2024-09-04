<%@page import="com.Bean.transactionBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Bean.CustomerBean"%>

<%@page import="java.util.concurrent.CopyOnWriteArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
<link rel="stylesheet" href="css/transactioin.css">

</head>
<body>

    <%
    String msg = (String) request.getParameter("msg");
    if (msg != null)
        out.print(msg);

    HttpSession hs = request.getSession(false);
    CustomerBean cb = (CustomerBean) hs.getAttribute("bean");
    if (cb == null) {
        request.setAttribute("msg", "Session Expired");
        request.getRequestDispatcher("Signin.jsp").include(request, response);
    } else {
        ArrayList<transactionBean> transactions = (ArrayList<transactionBean>) request.getAttribute("history");

        // Check for null before accessing the size
        if (transactions == null) {
            transactions = new ArrayList<>();
        }
    %>
    <div class="container">
        <header>
            <h1>Welcome to the <span>Banking</span> Dashboard</h1>
            <h2>Hello, <%=cb.getCname() %>!</h2>
        </header>

        <table class="transaction-table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Sender Account Number</th>
                    <th>Sender Name</th>
                    <th>Receiver Account Number</th>
                    <th>Receiver Name</th>
                    <th>Transaction Amount</th>
                    <th>Transaction Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (!transactions.isEmpty()) {
                    for (transactionBean transaction : transactions) {
                %>
                <tr>
                    <td><%=transaction.getId()%></td>
                    <td><%=transaction.getSenderAccount()%></td>
                    <td><%=transaction.getSender()%></td>
                    <td><%=transaction.getReceiverAccount()%></td>
                    <td><%=transaction.getReceiver()%></td>
                    <td>$ <%=transaction.getAmount()%></td>
                    <td><%= transaction.getTransactionDate()%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7">No transactions found.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <a href="welcome.jsp" class="back-link">Back to Dashboard</a>
    </div>
    <%
    }
    %>
</body>
</html>
