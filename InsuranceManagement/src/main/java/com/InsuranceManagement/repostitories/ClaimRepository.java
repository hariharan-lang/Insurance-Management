package com.InsuranceManagement.repostitories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.InsuranceManagement.entities.Claim;

public interface ClaimRepository  extends JpaRepository<Claim, Long>{
	List<Claim> findByStatus(String status); 
	List<Claim> findByCustomer_Id(Long custId);
	 List<Claim> findByStatusAndDocumentIsNotNull(String status);
	}

