package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Bank;
import com.service.BankService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("atm/bank")
public class BankController {

	@Autowired
	BankService bankService;
	
	@GetMapping
	public String Bank(HttpSession session,Model model) {
		List<Bank> banks = bankService.getAllbanks();
		model.addAttribute("banks",banks);
		return "bank";
	}
	
	@PostMapping("/create")
	public String createbank(HttpSession session,@ModelAttribute Bank bank) {
		bankService.createBank(bank);
		return "redirect:/atm/bank";
	}
	@GetMapping("/create")
	public String BankForm(HttpSession session,Model model) {
		model.addAttribute("bank",new Bank());
		return "bankform";
	}
	
	
	

}
