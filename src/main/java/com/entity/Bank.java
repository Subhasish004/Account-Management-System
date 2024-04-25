package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;



@Entity
public class Bank {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;
@Column(nullable=false)
private String bankName;
@Column(nullable=false,unique=true)
private String bankAddress;

public Bank() {

	// TODO Auto-generated constructor stub
}
public Bank(Long id, String bankName, String bankAddress) {

	this.id = id;
	this.bankName = bankName;
	this.bankAddress = bankAddress;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getBankName() {
	return bankName;
}
public void setBankName(String bankName) {
	this.bankName = bankName;
}
public String getBankAddress() {
	return bankAddress;
}
public void setBankAddress(String bankAddress) {
	this.bankAddress = bankAddress;
}


}
