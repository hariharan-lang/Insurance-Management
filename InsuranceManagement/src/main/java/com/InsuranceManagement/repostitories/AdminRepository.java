package com.InsuranceManagement.repostitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.InsuranceManagement.entities.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
	  boolean existsByUsernameAndPassword(String username, String password);
	  Admin findByUsername(String username);

}
