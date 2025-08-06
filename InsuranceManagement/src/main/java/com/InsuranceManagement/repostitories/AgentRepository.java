package com.InsuranceManagement.repostitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.InsuranceManagement.entities.Agent;


@Repository
public interface AgentRepository extends JpaRepository<Agent, Long> {
	Agent findByUserName(String userName); 

}
