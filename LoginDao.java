package com.Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;

import javax.servlet.ServletRequest;

import com.Bean.CustomerBean;
import com.DBconnection.DBconnection;

public class LoginDao {

    public Long getaccno(String uname , String upass) {
        Long ano = null;
       

        try {
            Connection con = DBconnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT accountNumber FROM custauth WHERE mid = ? AND pass = ?");
            ps.setString(1, uname);
            ps.setString(2, upass);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ano = rs.getLong(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ano;
    }
    public Long checkUser(String uname) {

		Long ano = null;

		try {
			Connection con = DBconnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM CUSTAUTH WHERE mid = ?");
			ps.setString(1, uname);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				ano = rs.getLong(1);
				
			System.out.println(ano);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ano;
    }

    public CustomerBean getallinformation(Long ano) {
        CustomerBean cb = null;

        try {
            Connection con = DBconnection.getConnection();
            CallableStatement cs = con.prepareCall("{call Retrieve1(?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setLong(1, ano);
            cs.registerOutParameter(2, Types.INTEGER);
            cs.registerOutParameter(3, Types.VARCHAR);
            cs.registerOutParameter(4, Types.FLOAT);
            cs.registerOutParameter(5, Types.VARCHAR);
            cs.registerOutParameter(6, Types.VARCHAR);
            cs.registerOutParameter(7, Types.VARCHAR);
            cs.registerOutParameter(8, Types.VARCHAR);
            cs.registerOutParameter(9, Types.VARCHAR);
            cs.registerOutParameter(10, Types.INTEGER);
            cs.registerOutParameter(11, Types.VARCHAR);
            cs.registerOutParameter(12, Types.BIGINT);

            cs.execute();
            cb = new CustomerBean();

            cb.setAno(ano);
            cb.setCid(cs.getInt(2));
            cb.setCname(cs.getString(3));
            cb.setBal(cs.getFloat(4));
            cb.setActype(cs.getString(5));
            cb.setHno(cs.getString(6));
            cb.setSn(cs.getString(8));
            cb.setCty(cs.getString(9));
            cb.setSt(cs.getString(10));
            cb.setMid(cs.getString(11));
            cb.setNumber(cs.getLong(12));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cb;
    }
}
