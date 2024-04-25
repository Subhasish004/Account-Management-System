package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Bank;
import com.entity.BankAccount;
import com.entity.Customer;
import com.entity.Transaction;
import com.service.BankAccountService;
import com.service.BankService;
import com.service.CustomerService;
import com.service.TransactionService;

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/atm")
public class AdminController {
	@Autowired
	BankAccountService bankAccountService;
	@Autowired
	CustomerService customerService;
	@Autowired
	BankService bankService;
	@Autowired
	TransactionService transactionService;
	
	@GetMapping("/admin")
	public String adminHome(HttpSession session) {
		if(session.getAttribute("admin").equals("admin"))
			return "admin";
		return "redirect:/admin/adminlogin";
		
	}
	@GetMapping("/adminlogin")
	public String adminLogin() {
		return "adminlogin";
	}
	@GetMapping("/adminlogout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/atm";
	}
	
	@PostMapping("/adminlogin")
	public String admin(HttpSession session,@RequestParam String adminName,@RequestParam String adminPassword) {
		if(adminName.equals("Subhasish") && adminPassword.equals("ADMIN")) {
			session.setAttribute("admin","admin");
			return "redirect:/atm/admin";
		}
		return "redirect:/atm/adminlogin";
	}
	
	@GetMapping("/accountlist")
	public String listCustomer(HttpSession session,Model model) {
		if(session.getAttribute("admin").equals("admin")) {
			List<BankAccount> bankAccounts = bankAccountService.getAllAccounts();
		model.addAttribute("bankAccounts",bankAccounts );
		return "accountlist";
		}else {
			return "redirect:/atm/account";
		}
	}

	@GetMapping("/account/{id}")
	public String displayAccount(@PathVariable Long id, HttpSession session,Model model) {
		if(session.getAttribute("admin").equals("admin")) {
		BankAccount bankAccount = bankAccountService.getAccountById(id);
		if(bankAccount.getStatus().equals("active")) {
			session.setAttribute("bankAccount", bankAccount);
		//model.addAttribute("bankAccount",bankAccount);
		return "bankaccount";
		}}
		model.addAttribute("msg", "Account Not Active.");
		return "msg";
	}
	@GetMapping("/transactions/{id}")
	public String	viewTransactionsByAccountId(HttpSession session,@PathVariable Long id,Model model) {
		if(session.getAttribute("admin").equals("admin")) {	
			BankAccount bankAccount = bankAccountService.getAccountById(id);
			List<Transaction>  transactions = transactionService.getAllTransactionsByAccountId(bankAccount);
			model.addAttribute("transactions",transactions);
			return "transactions";
		}			
		return "redirect:/atm/accountlogin";
	}
	
	@GetMapping("/bankaccount/activate/{id}")
	public String activateAccount(HttpSession session,@PathVariable Long id) {
		if(session.getAttribute("admin").equals("admin")) {	
			BankAccount bankAccount = bankAccountService.getAccountById(id);
			bankAccount.setStatus("active");
			bankAccountService.createAccount(bankAccount);
			return "redirect:/atm/accountlist";
		}			
		return "redirect:/atm/accountlist";
	}
	@GetMapping("/bankaccount/deactivate/{id}")
	public String deactivateAccount(HttpSession session,@PathVariable Long id) {
		if(session.getAttribute("admin").equals("admin")) {	
			BankAccount bankAccount = bankAccountService.getAccountById(id);
			bankAccount.setStatus("inactive");
			bankAccountService.createAccount(bankAccount);
			return "redirect:/atm/accountlist";
		}			
		return "redirect:/atm/accountlist";
	}
	@GetMapping("/bankaccount/delete/{id}")
	public String deleteAccount(HttpSession session,@PathVariable Long id) {
		if(session.getAttribute("admin").equals("admin")) {	
			BankAccount bankAccount = bankAccountService.getAccountById(id);
			Long customerId = bankAccount.getCustomer().getId();
			transactionService.deleteTransactionsByAccountId(bankAccount);
			bankAccountService.deleteAccount(id);
			customerService.deleteCustomer(customerId);

			return "redirect:/atm/accountlist";
		}			
		return "redirect:/atm/accountlist";
	}
	//ADMIN
	@GetMapping("/bankaccount/edit/{id}")
	public String editCustomerFormByAdmin(HttpSession session,@PathVariable Long id,Model model) {
		if(session.getAttribute("admin").equals("admin") ) {	
			BankAccount bankAccount = bankAccountService.getAccountById(id);
			Customer customer = customerService.getCustomerById(bankAccount.getCustomer().getId());
			session.setAttribute("bankAccount",bankAccount);
			model.addAttribute("customer",customer);
			
			return "editadmincustomerform";
		}			
		return "redirect:/atm/accountlist";
	}
	
	@PostMapping("/admin/updatecustomer")
	public String editCustomer(@ModelAttribute Customer customer,HttpSession session) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		customerService.updateCustomer(bankAccount.getCustomer().getId(),customer);
		return "redirect:/atm/admin/bank/edit";
		
	}
	
	@GetMapping("/admin/bank/edit")
	public String editAccountFormByAdmin(HttpSession session,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		model.addAttribute("bankAccount",bankAccount);
		model.addAttribute("banks",bankService.getAllbanks());
		return "editadminbankform";
	}

	@PostMapping("/admin/updatebank")
	public String editAccountByAdmin(@RequestParam("bank")Long id,HttpSession session,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		Bank bank = bankService.getBankById(id);
		bankAccount.setBank(bank);
		bankAccountService.createAccount(bankAccount);
		return "redirect:/atm/accountlist";
	}
	
	
	/*
	 * @GetMapping("/bank/delete/{id}") public String deleteBank(HttpSession
	 * session,@PathVariable Long id) {
	 * if(session.getAttribute("admin").equals("admin")) bankService.deleteBank(id);
	 * return "redirect:/atm/bank"; }
	 */
	
}
