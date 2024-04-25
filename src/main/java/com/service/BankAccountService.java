package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.BankAccount;
import com.repo.BankAccountRepo;

@Service
public class BankAccountService {

	@Autowired
	private BankAccountRepo bankaccountrepo;
	
	public BankAccount createAccount(BankAccount bankAccount) {
		return bankaccountrepo.save(bankAccount);
	}
	public BankAccount getAccountById(Long bankAccountId) {
		BankAccount bankAccount = bankaccountrepo.findById(bankAccountId).get();
		return bankAccount;
	}
	public List<BankAccount> getAllAccounts(){
		return bankaccountrepo.findAll();
	}
	
	public void deleteAccount(Long bankAccountId) {
		bankaccountrepo.deleteById(bankAccountId);
	}
	public boolean debit(BankAccount bankAccount,double balance , double amount) {
		if(balance >= amount) {
			double debitBalance = balance-amount;
			bankAccount.setBalance(debitBalance);
			bankaccountrepo.save(bankAccount);
			return true;
		}
		return false;
	}
	public String credit(BankAccount bankAccount,double balance , double amount) {
		double creditBalance = balance+amount;
		bankAccount.setBalance(creditBalance);
		bankaccountrepo.save(bankAccount);
		return "Credited Sucessfully";
	}
	public boolean fundTransfer(BankAccount fromBankAccount,BankAccount toBankAccount, double amount) {
		double balance = fromBankAccount.getBalance();
		if(balance >= amount) {
			double debitBalance = balance-amount;
			fromBankAccount.setBalance(debitBalance);
			bankaccountrepo.save(fromBankAccount);
			
			double creditBalance = balance+amount;
			toBankAccount.setBalance(creditBalance);
			bankaccountrepo.save(toBankAccount);
			
			return true;
		}
		return false;
	}
	public BankAccount getAccountByAccountNumber(String account) {
		BankAccount bankAccount = bankaccountrepo.findByAccountNumber(account);
		return bankAccount;
	}
	public BankAccount changePassword(BankAccount bankAccount, String password) {
		bankAccount.setPassword(password);
		return bankaccountrepo.save(bankAccount);
		
	}

	
	
	
}
