package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

import com.DBconnection.DBconnection;

public class editprofileDAO {
	
	private static final String bankCustomer = "UPDATE BANKCUSTOMER SET CustomerName = ? , AccountType = ? WHERE AccountNumber = ?";
	private static final String customerContact = "UPDATE CustomerContact SET Email = ? WHERE AccountNumber = ?";
	private static final String customerAddress = "UPDATE CustomerAddress SET HouseNumber = ? , StreetName = ? , city = ? , state = ? , PostalCode = ? WHERE AccountNumber = ?";

	public int update(HttpServletRequest req) {
		int k = 0;
		try {
			Connection con = DBconnection.getConnection();
			PreparedStatement ps1 = con.prepareStatement(bankCustomer);
			PreparedStatement ps2 = con.prepareStatement(customerContact);
			PreparedStatement ps3 = con.prepareStatement(customerAddress);

			String accountNumberStr = req.getParameter("ano");
			if (accountNumberStr == null || accountNumberStr.isEmpty()) {
				throw new IllegalArgumentException("Account number cannot be null or empty");
			}
			long accountNumber = Long.parseLong(accountNumberStr);

			ps1.setString(1, req.getParameter("cname"));
			ps1.setString(2, req.getParameter("actype"));
			ps1.setLong(3, accountNumber);

			ps2.setString(1, req.getParameter("mid"));
			ps2.setLong(2, accountNumber);

			ps3.setString(1, req.getParameter("hno"));
			ps3.setString(2, req.getParameter("sn"));
			ps3.setString(3, req.getParameter("cty"));
			ps3.setString(4, req.getParameter("st"));

			String pinStr = req.getParameter("pin");
			if (pinStr != null && !pinStr.isEmpty()) {
				ps3.setInt(5, Integer.parseInt(pinStr));
			} else {
				ps3.setNull(5, java.sql.Types.INTEGER);
			}
			ps3.setLong(6, accountNumber);

			int p = ps1.executeUpdate();
			int q = ps2.executeUpdate();
			int r = ps3.executeUpdate();

			if (p > 0 && q > 0 && r > 0) {
				k = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}
