package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.Bean.transactionBean;
import com.DBconnection.DBconnection;

public class TXHistory {

    public ArrayList<transactionBean> Sendinglist(Long Ano) {
        ArrayList<transactionBean> al = new ArrayList<>();
       String query = "SELECT * FROM TransactionHistory WHERE senderAccountNumber = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setLong(1, Ano);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                transactionBean tb = new transactionBean();
                tb.setId(rs.getInt(1));
                tb.setSenderAccount(rs.getLong(2));
                tb.setSender(rs.getString(3));
                tb.setReceiverAccount(rs.getLong(4));
                tb.setReceiver(rs.getString(5));
                tb.setAmount(rs.getDouble(6));
               tb.setTransactionDate(rs.getDate(7));

                al.add(tb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return al;
    }

    public ArrayList<transactionBean> receivingHistory(long ANo) {
        ArrayList<transactionBean> aal = new ArrayList<>();
        String query = "SELECT * FROM TransactionHistory WHERE receiverAccountNumber = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setLong(1, ANo);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                transactionBean tb = new transactionBean();
                tb.setId(rs.getInt(1));
                tb.setSenderAccount(rs.getLong(2));
                tb.setSender(rs.getString(3));
                tb.setReceiverAccount(rs.getLong(4));
                tb.setReceiver(rs.getString(5));
                tb.setAmount(rs.getDouble(6));
                tb.setTransactionDate(rs.getDate(7));
             

                aal.add(tb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return aal;
    }

    public ArrayList<transactionBean> allTransactionHistory(long Ano) {
        ArrayList<transactionBean> all = new ArrayList<>();
        String query = "SELECT * FROM TransactionHistory WHERE senderAccountNumber = ? OR receiverAccountNumber = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setLong(1, Ano);
            ps.setLong(2, Ano);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                transactionBean tb = new transactionBean();
                tb.setId(rs.getInt(1));
                tb.setSenderAccount(rs.getLong(2));
                tb.setSender(rs.getString(3));
                tb.setReceiverAccount(rs.getLong(4));
                tb.setReceiver(rs.getString(5));
                tb.setAmount(rs.getDouble(6));
                tb.setTransactionDate(rs.getDate(7));
               
                all.add(tb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return all;
    }
}
