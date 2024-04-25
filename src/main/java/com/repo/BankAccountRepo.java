package com.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.entity.BankAccount;

@Repository
public interface BankAccountRepo extends JpaRepository<BankAccount, Long>{
	
	@Query("SELECT ba FROM BankAccount ba WHERE ba.accountNumber = :accountNumber")
	BankAccount findByAccountNumber(String accountNumber);

}
