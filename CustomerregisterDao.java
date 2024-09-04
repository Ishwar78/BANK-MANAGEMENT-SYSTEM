package com.Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.Bean.CustomerBean;
import com.DBconnection.DBconnection;

public class CustomerregisterDao {

	public int register(CustomerBean cb) {
		
		int k = 0; 
		
		try {
			Connection con = DBconnection.getConnection();
			
	        CallableStatement cs = con.prepareCall("{call Register (?,?,?,?,?,?,?,?,?,?,?,?)}");
	        PreparedStatement ps = con.prepareStatement("INSERT INTO custAuth values(?,?,?)");
			
			
			cs.setLong(1, cb.getAno());
		    cs.setInt(2, cb.getCid());
		    cs.setString(3, cb.getCname());  
		    cs.setFloat(4, cb.getBal());
		    cs.setString(5, cb.getActype());
		    cs.setString(6, cb.getHno());
		    cs.setString(7, cb.getSn());
		    cs.setString(8, cb.getCty());
		    cs.setString(9, cb.getSt());
		    cs.setString(10, cb.getPcode());
		    cs.setString(11, cb.getMid());
		    cs.setLong(12, cb.getNumber());
		    
			ps.setFloat(1, cb.getAno());
			ps.setString(2, cb.getMid());
			ps.setString(3, cb.getPass());
			
			 cs.execute(); 
		        ps.executeUpdate(); 
		        
		        k = 1;
		        System.out.println("Record Saved ");
			
		}catch(Exception e) {
			System.err.println("Customer Register Related Problem");
			e.printStackTrace();
		}
		
		return k;
		
	}
	

}
