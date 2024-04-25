package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.BankAccount;
import com.entity.Transaction;
import com.repo.TransactionRepo;

@Service
public class TransactionService {

	@Autowired
	private TransactionRepo transactionrepo;
	
	public Transaction createTransaction(Transaction transaction) {
		return transactionrepo.save(transaction);
	}
	public Transaction getTransaction (Long transactionId) {
		return transactionrepo.findById(transactionId).get();
	}
	public List<Transaction> getAllTransactionsByAccountId(BankAccount bankAccount){
		return transactionrepo.findAllByAccountId(bankAccount);
	}
	public List<Transaction> getAllTransactions(){
		return transactionrepo.findAll();
	}
	public void deleteTransactionsByAccountId(BankAccount bankAccount) {
		transactionrepo.deleteAllById(transactionrepo.findAllIdByAccountId(bankAccount));
		 //transactionrepo.deleteAllByBankAccount(bankAccount);
	}
}
