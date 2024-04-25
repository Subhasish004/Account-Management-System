package com.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.entity.BankAccount;
import com.entity.Transaction;

@Repository
public interface TransactionRepo extends JpaRepository<Transaction, Long> {

	@Query("SELECT t FROM Transaction t WHERE t.bankAccount = :bankAccount")
	List<Transaction> findAllByAccountId(BankAccount bankAccount);
	@Query("SELECT t.id FROM Transaction t WHERE t.bankAccount = :bankAccount")
	List<Long> findAllIdByAccountId(BankAccount bankAccount);
	//@Query("DELETE FROM Transaction t WHERE t.bankAccount = :bankAccount")
	 void deleteAllByBankAccount(BankAccount bankAccount);
}
