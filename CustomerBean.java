 package com.Bean;

public class CustomerBean {
private Long ano,number;
private Integer cid;
private String cname,actype,hno,sn,cty,st,pcode,mid,pass;
private Float bal;
public Long getAno() {
	return ano;
}
public void setAno(Long ano) {
	this.ano = ano;
}
public Long getNumber() {
	return number;
}
public void setNumber(Long number) {
	this.number = number;
}
public Integer getCid() {
	return cid;
}
public void setCid(Integer cid) {
	this.cid = cid;
}
public String getCname() {
	return cname;
}
public void setCname(String cname) {
	this.cname = cname;
}
public String getActype() {
	return actype;
}
public void setActype(String actype) {
	this.actype = actype;
}
public String getHno() {
	return hno;
}
public void setHno(String hno) {
	this.hno = hno;
}
public String getSn() {
	return sn;
}
public void setSn(String sn) {
	this.sn = sn;
}
public String getCty() {
	return cty;
}
public void setCty(String cty) {
	this.cty = cty;
}
public String getSt() {
	return st;
}
public void setSt(String st) {
	this.st = st;
}
public String getPcode() {
	return pcode;
}
public void setPcode(String pcode) {
	this.pcode = pcode;
}
public String getMid() {
	return mid;
}
public void setMid(String mid) {
	this.mid = mid;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public Float getBal() {
	return bal;
}
public void setBal(Float bal) {
	this.bal = bal;
}
@Override
public String toString() {
	return "CustomerBean [ano=" + ano + ", number=" + number + ", cid=" + cid + ", cname=" + cname + ", actype="
			+ actype + ", hno=" + hno + ", sn=" + sn + ", cty=" + cty + ", st=" + st + ", pcode=" + pcode + ", mid="
			+ mid + ", pass=" + pass + ", bal=" + bal + "]";
}






	
	
}
