package com.Bean;

import java.io.Serializable;
import java.sql.Date;

public class transactionBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	
	private int id;
	private String sender;
	private String receiver;
	private Long senderAccount;
	private Long receiverAccount;
	private double Amount;
	private Date transactionDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Long getSenderAccount() {
		return senderAccount;
	}
	public void setSenderAccount(Long senderAccount) {
		this.senderAccount = senderAccount;
	}
	public Long getReceiverAccount() {
		return receiverAccount;
	}
	public void setReceiverAccount(Long receiverAccount) {
		this.receiverAccount = receiverAccount;
	}
	public double getAmount() {
		return Amount;
	}
	public void setAmount(double amount) {
		Amount = amount;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "transactionBean [id=" + id + ", sender=" + sender + ", receiver=" + receiver + ", senderAccount="
				+ senderAccount + ", receiverAccount=" + receiverAccount + ", Amount=" + Amount + ", transactionDate="
				+ transactionDate + "]";
	}

	
	
}