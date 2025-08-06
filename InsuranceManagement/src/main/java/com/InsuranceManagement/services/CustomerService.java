package com.InsuranceManagement.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;

import com.InsuranceManagement.dto.CustomerDTO;
import com.InsuranceManagement.entities.Agent;
import com.InsuranceManagement.entities.Customer;

import com.InsuranceManagement.repostitories.CustomerRepository;
@Service
public class CustomerService {
	
@Autowired
	private CustomerRepository crep;
	
	 public Customer saveCustomer(Customer customer) {
	        return crep.save(customer);
	    }

	    public List<Customer> getAllCustomers() {
	        return crep.findAll();
	    }

	  
	    public void deleteCustomerById(Long id) {
			crep.deleteById(id);
	       
			
	    }
	    public Customer getCustomrByid(@PathVariable Long id) {
	    	return crep.findById(id).orElseThrow(()->  new ResponseStatusException(HttpStatus.NOT_FOUND, "Customer not found with ID: " + id));	
	    }
	    public  Customer updateCustomerById(@PathVariable Long id,CustomerDTO customerdto) {
	    	Customer c=crep.findById(id).orElseThrow(()-> new ResponseStatusException(HttpStatus.NOT_FOUND,"Customer not found with ID:"+id));
	    	c.setContactNo(customerdto.getContactNo());
	    	c.setName(customerdto.getName());
	    	c.setEmail(customerdto.getEmail());
	    	c.setPolicyType(customerdto.getPolicyType());
	    	c.setAge(customerdto.getAge());
	    	
	    	return crep.save(c);
	    	
	    }
	    public Customer findByEmailAndPassword(String email, String password) {
	        return crep.findByEmailAndPassword(email, password);
	    }
	    public List<Customer> getCustomersByAgent(Agent agent) {
	        return crep.findByAgent(agent);
	    }
}
