package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Customer;
import com.service.CustomerService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("atm/customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@GetMapping
	public String customers(HttpSession session,Model model) {
		List<Customer> customers  = customerService.getAllCustomers();
		model.addAttribute("customers",customers);
		return "customer";
	}
	
	@GetMapping("/create")
	public String customerForm(HttpSession session,Model model) {
		model.addAttribute("customer",new Customer());
		return "customerForm";
	}
	@PostMapping("/create")
	public String createCustomer(HttpSession session,@RequestBody Customer customer) {
		customerService.createCustomer(customer);
		return "redirect/atm/customer";
	}
	
	@GetMapping("/edit")
	public String editCustomerForm(HttpSession session,Model model) {
		Customer customer = (Customer) session.getAttribute("customer");
		model.addAttribute("customer",customer);
		return "editCustomer";
	}
	
	@PostMapping("/edit")
	public String editCustomer(HttpSession session , @ModelAttribute Customer updateCustomer) {
		Customer customer = (Customer) session.getAttribute("customer");
		customer.setFirstName(updateCustomer.getFirstName());
		customer.setLastName(updateCustomer.getLastName());
		customer.setAddress(updateCustomer.getAddress());
		customer.setEmail(updateCustomer.getEmail());
		customer.setPhoneNumber(updateCustomer.getPhoneNumber());
		customerService.createCustomer(customer);
		return "redirect:/atm/account";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteCustomer(HttpSession session,@PathVariable Long id) {
		if(session.getAttribute("admin").equals("admin"))
		customerService.deleteCustomer(id);
		return "redirect:/atm/customer";
	}
	
	
}

