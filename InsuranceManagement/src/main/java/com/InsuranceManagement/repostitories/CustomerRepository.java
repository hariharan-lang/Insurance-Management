package com.InsuranceManagement.repostitories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.InsuranceManagement.entities.Agent;
import com.InsuranceManagement.entities.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
	Customer findByEmailAndPassword(String email, String password);
	List<Customer> findByAgent(Agent agent);
	Customer findByEmail(String email);
}