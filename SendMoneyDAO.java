package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;

import com.DBconnection.DBconnection;

public class SendMoneyDAO {

    public static final String checkuser = "SELECT * FROM BankCustomer WHERE AccountNumber = ?";
    public static final String updatebal = "UPDATE BankCustomer SET Balance = Balance + ? WHERE AccountNumber = ?";
    // Specify the columns explicitly excluding the auto-increment `id` column
    public static final String transactionHistory = "INSERT INTO TransactionHistory (senderaccount, sender, receiveraccount, receiver, amount, transactiondate) VALUES (?, ?, ?, ?, ?, ?)";

    public HttpServletRequest send(HttpServletRequest req) {
        Connection con = null;
        Savepoint sp = null;

        try {
            con = DBconnection.getConnection();
            con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement(checkuser);
            PreparedStatement ps1 = con.prepareStatement(updatebal);
            PreparedStatement ps2 = con.prepareStatement(transactionHistory);
            sp = con.setSavepoint();

            Long senderano = Long.parseLong(req.getParameter("sender").trim());
            ps.setLong(1, senderano);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String sender = rs.getString(3); // Adjust column index based on table structure
                Float bal = rs.getFloat(4); // Adjust column index based on table structure

                Long receiverano = Long.parseLong(req.getParameter("receiver").trim());
                ps.setLong(1, receiverano);
                ResultSet rs1 = ps.executeQuery();

                if (rs1.next()) {
                    String receiver = rs1.getString(3); // Adjust column index based on table structure
                    Float amt = Float.parseFloat(req.getParameter("amt").trim());

                    if (amt <= bal) {
                        // Deduct amount from sender's account
                        ps1.setFloat(1, -amt);
                        ps1.setLong(2, senderano);
                        int k = ps1.executeUpdate();

                        // Add amount to receiver's account
                        ps1.setFloat(1, amt);
                        ps1.setLong(2, receiverano);
                        int q = ps1.executeUpdate();

                        if (k > 0 && q > 0) {
                            // Insert transaction history
                            ps2.setLong(1, senderano);
                            ps2.setString(2, sender);
                            ps2.setLong(3, receiverano);
                            ps2.setString(4, receiver);
                            ps2.setFloat(5, amt);
                            Timestamp ts = Timestamp.valueOf(LocalDateTime.now());
                            ps2.setTimestamp(6, ts);

                            ps2.executeUpdate();

                            req.setAttribute("msg", "Transaction successful");
                            con.commit();
                        } else {
                            req.setAttribute("msg", "Transaction failed");
                            con.rollback(sp);
                        }
                    } else {
                        req.setAttribute("msg", "Insufficient Balance");
                        con.rollback(sp);
                    }
                    rs1.close();
                } else {
                    req.setAttribute("msg", "Invalid Receiver Account Number");
                }

            } else {
                req.setAttribute("msg", "Invalid Sender Account Number");
            }
            rs.close();

        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback(sp);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return req;
    }
}
