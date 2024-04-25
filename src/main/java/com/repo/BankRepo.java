package com.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.Bank;

@Repository
public interface BankRepo extends JpaRepository<Bank, Long>{

}
