package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.BankAccount;
import com.entity.Transaction;
import com.service.TransactionService;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("atm/transactions")
public class TransactionController {

	@Autowired
	TransactionService transactionService;
	
	@GetMapping("/account")
	public String viewTransactionByAccountId(HttpSession session ,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		List<Transaction>  transactions = transactionService.getAllTransactionsByAccountId(bankAccount);
		model.addAttribute("transactions",transactions);
		return "accounttransactions";
	}
	
	@GetMapping
	public String allTransactions(HttpSession session,Model model) {
		if(session.getAttribute("admin").equals("admin")) { 
		List<Transaction> transactions = transactionService.getAllTransactions();
		model.addAttribute("transactions",transactions);
		
		return "transactions";
		}
		return "redirect:/atm/admin";
	}
	
		
}
