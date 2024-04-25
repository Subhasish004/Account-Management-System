package com.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Customer;
import com.repo.CustomerRepo;

@Service
public class CustomerService {

	@Autowired
	private CustomerRepo customerrepo;
	
	public Customer createCustomer(Customer customer) {
		return customerrepo.save(customer);
	}
	public Customer getCustomerById(Long customerId) {
		Optional<Customer> optionalCustomer = customerrepo.findById(customerId);
		return optionalCustomer.get();
	}
	public List<Customer> getAllCustomers(){
		return customerrepo.findAll();
	}
	public Customer updateCustomer(Long id, Customer customer) {
		Customer existingCustomer = customerrepo.findById(id).get();
		existingCustomer.setFirstName(customer.getFirstName());
		existingCustomer.setLastName(customer.getLastName());
		existingCustomer.setEmail(customer.getEmail());
		existingCustomer.setAddress(customer.getAddress());
		existingCustomer.setPhoneNumber(customer.getPhoneNumber());
		Customer updateCustomer = customerrepo.save(existingCustomer);
		return updateCustomer;
	}
	public void deleteCustomer(Long customerId) {
		customerrepo.deleteById(customerId);
	}
}
