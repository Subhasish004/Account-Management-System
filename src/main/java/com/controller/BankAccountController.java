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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
public class BankAccountController {

	@Autowired
	BankAccountService bankAccountService;
	
	@Autowired
	CustomerService customerService;
	
	
	@Autowired
	BankService bankService;
	
	@Autowired
	TransactionService transactionService;
	
	@GetMapping
	public String home(HttpSession session){
		session.invalidate();
		return "index";
	}
	
	
	
	@GetMapping("/account")
	public String displayAccount(HttpSession session,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		if(bankAccount.getStatus().equals("active")) {
		model.addAttribute("bankAccount",bankAccount);
		return "bankaccount";
		}
		model.addAttribute("msg", "Account Not Active. Please Contact Admin");
		return "msg";
	}
	
	@GetMapping("/login")
	public String loginForm(HttpSession session) {
		session.invalidate();
		return "loginform";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/atm";
	}
	
	@PostMapping("/login")
	public String login(String account ,String pass , HttpSession session , RedirectAttributes rt) {
		BankAccount bankAccount = bankAccountService.getAccountByAccountNumber(account);
		if(bankAccount !=null && pass.equals(bankAccount.getPassword())) {
			session.setAttribute("bankAccount", bankAccount);
			rt.addFlashAttribute("msg","Login Sucessfull");
			return "redirect:/atm/account";
		}
		rt.addFlashAttribute("msg","Invalid Account Number or Password");
		return "redirect:/atm/login";
	}
	
	@GetMapping("/createcustomer")
	public String showCustomerForm(HttpSession session,Model model) {
		session.invalidate();
		model.addAttribute("customer",new Customer());
		return "customerform";
	}
	
	@PostMapping("/createcustomer")
	public String createCustomer(@ModelAttribute Customer customer,HttpSession session) {
		session.setAttribute("customer", customerService.createCustomer(customer));
		return "redirect:/atm/createaccount";	
	}
	
	@GetMapping("/createaccount")
	public String showAccountForm(Model model,HttpSession session) {
		model.addAttribute("bankAccount",new BankAccount());
		model.addAttribute("banks",bankService.getAllbanks());
		Customer customer = (Customer) session.getAttribute("customer");
		model.addAttribute("customer",customer);
		return "accountform";
	}
	
	@PostMapping("/createaccount")
	public String createBankAccount(@ModelAttribute BankAccount bankAccount
			,@RequestParam("bank")Long id , HttpSession session) {
		Bank bank =bankService.getBankById(id);
		Customer customer = (Customer) session.getAttribute("customer");
		bankAccount.setCustomer(customer);
		bankAccount.setBank(bank);
		session.setAttribute("msg", "Details Submitted");
		bankAccountService.createAccount(bankAccount);
		return "msg";
	}

	public Transaction generateTransaction(String type,Bank bank , BankAccount bankAccount,double amount,double balance) {
		Transaction transaction = new Transaction();
		transaction.setType(type);
		transaction.setAmount(amount);
		transaction.setBalance(balance);
		transaction.setBank(bank);
		transaction.setBankAccount(bankAccount);
		return transactionService.createTransaction(transaction);
	}
	
	//Deposit
	@GetMapping("/debit")
	public String debitForm(HttpSession session ,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		model.addAttribute("bankAccount",bankAccount);
		return "debitform";
	}
	
	@PostMapping("/debit")
	public String debit(@RequestParam Double amount,HttpSession session,RedirectAttributes redir) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		String msg="";
		Transaction transaction = null;
		if(bankAccountService.debit(bankAccount, bankAccount.getBalance(), amount)) {
			msg="Debited Sucessfully";
			transaction=generateTransaction("Debit",bankAccount.getBank(),bankAccount,amount,bankAccount.getBalance());
		}else {
			msg="Insufficent Funds";
		}
		session.setAttribute("transaction", transaction);
		redir.addFlashAttribute("msg", msg);
		return "redirect:/atm/debitsucessfully";
	}
	
	@GetMapping("/debitsucessfully")
	public String debitSucessfully(HttpSession session,Model model) {
		Transaction transaction =(Transaction)session.getAttribute("transaction");
		model.addAttribute("transaction", transaction);
		return "funded";
	}
	
	@GetMapping("/credit")
	public String creditForm(HttpSession session ,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		model.addAttribute("bankAccount",bankAccount);
		return "creditform";
	}
	
	@PostMapping("/credit")
	public String credited(HttpSession session,@RequestParam Double amount,RedirectAttributes redir) {
		BankAccount bankAccount = (BankAccount)session.getAttribute("bankAccount");
		String msg=bankAccountService.credit(bankAccount, bankAccount.getBalance(), amount);
		Transaction transaction = generateTransaction("Credit", bankAccount.getBank(), bankAccount, amount, bankAccount.getBalance());
		session.setAttribute("transaction", transaction);
		redir.addFlashAttribute("msg",msg);
		return "redirect:/atm/creditsucessfully";
	}
	
	@GetMapping("/creditsucessfully")
	public String creditSucessfully(HttpSession session,Model model) {
		Transaction transaction =(Transaction) session.getAttribute("transaction");
		model.addAttribute("transaction",transaction);
		return "funded";
	}
	
	@GetMapping("/fundtransfer")
	public String fundForm(HttpSession session ,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		model.addAttribute("bankAccount",bankAccount);
		List<BankAccount> bankAccounts = bankAccountService.getAllAccounts();
		model.addAttribute("bankAccounts",bankAccounts);
		return "fundtransfer";
	}
	
	@PostMapping("/fundtransfer")
	public String fundTrasfer(HttpSession session,@RequestParam Long id,@RequestParam Double amount,RedirectAttributes redir) {
		BankAccount fromBankAccount = (BankAccount) session.getAttribute("bankAccount");
		BankAccount toBankAccount = bankAccountService.getAccountById(id);
		String msg="";
		Transaction transaction = null;
		if(bankAccountService.fundTransfer(fromBankAccount, toBankAccount, amount)) {
			msg="Fund Transfered Sucessfully";
			transaction=generateTransaction("Fund Transfer", fromBankAccount.getBank(), fromBankAccount, amount,fromBankAccount.getBalance());
			generateTransaction("Fund Recieved",toBankAccount.getBank(),toBankAccount,amount,toBankAccount.getBalance());
		}else {
			msg="Transaction Failed. Insufficent Balance";
		}
		session.setAttribute("transaction", transaction);
		redir.addFlashAttribute("msg",msg);
		return "redirect:/atm/fundedsucessfully";
	}
	
	@GetMapping("/fundedsucessfully")
	public String fundedSucessfully(HttpSession session , Model model) {
		Transaction transaction = (Transaction) session.getAttribute("transaction");
		model.addAttribute(transaction);
		return "funded";
	}
	
	
	@GetMapping("/delete/{id}")
	public String deleteCustomer(HttpSession session,@PathVariable Long id) {
		if(session.getAttribute("admin").equals("admin"))
		bankAccountService.deleteAccount(id);
		return "redirect:/atm/accountlist";
	}	
	
	@GetMapping("/bankaccount/edit")
	public String editCustomer(HttpSession session,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		Customer customer = customerService.getCustomerById(bankAccount.getCustomer().getId());
		
		model.addAttribute("customer",customer);
		return "editcustomerform";
	}
	@PostMapping("/updatecustomer")
	public String editCustomer(@ModelAttribute Customer customer,HttpSession session) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		customerService.updateCustomer(bankAccount.getCustomer().getId(),customer);
		return "redirect:/atm/bank/edit";
		
	}
	@GetMapping("/bank/edit")
	public String editAccountForm(HttpSession session,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		model.addAttribute("bankAccount",bankAccount);
		model.addAttribute("banks",bankService.getAllbanks());
		return "editbankform";
	}
	@PostMapping("/updatebank")
	public String editAccount(@RequestParam("bank")Long id,HttpSession session,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		Bank bank = bankService.getBankById(id);
		bankAccount.setBank(bank);
		bankAccountService.createAccount(bankAccount);
		return "redirect:/atm/account";
	}
	@GetMapping("/changepassword")
	public String changePassword(HttpSession session,Model model) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		model.addAttribute("bankAccount",bankAccount);
		return "passwordform";
	}
	@PostMapping("/changepassword")
	public String changePassword(@RequestParam String password,@RequestParam String repassword,HttpSession session,RedirectAttributes redir) {
		String msg="";
		if(password.equals(repassword)) {
		BankAccount bankAccount = (BankAccount) session.getAttribute("bankAccount");
		BankAccount updatedAccount=bankAccountService.changePassword(bankAccount,password);
		session.setAttribute("bankAccount", updatedAccount);
		session.invalidate();
		msg= "Password changed Sucessfully";
		redir.addFlashAttribute("msg",msg);
		return "redirect:/atm/login";
		}else {
		 msg="Password Change Failed";
		 redir.addFlashAttribute("msg",msg);
			return "redirect:/atm/login";
		}
	}
}









