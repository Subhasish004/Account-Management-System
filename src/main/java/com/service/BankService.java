package com.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Bank;
import com.repo.BankRepo;

@Service
public class BankService {

	@Autowired
	private BankRepo bankrepo;
	
	public Bank createBank(Bank bank) {
		return bankrepo.save(bank);
	}
	public Bank getBankById(Long bankId) {
		Optional<Bank> optionalBank = bankrepo.findById(bankId);
		return optionalBank.get();
	}
	public List<Bank> getAllbanks(){
		return bankrepo.findAll();
	}
	public Bank updateBank(Bank bank) {
		Bank existingBank = bankrepo.findById(bank.getId()).get();
		existingBank.setBankAddress(bank.getBankAddress());
		Bank updateBank=bankrepo.save(existingBank);
		return updateBank;
	}
	public void deleteBank(Long bankId) {
		bankrepo.deleteById(bankId);
	}
}
