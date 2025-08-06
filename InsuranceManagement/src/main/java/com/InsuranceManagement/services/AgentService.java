package com.InsuranceManagement.services;   

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.InsuranceManagement.dto.AgentDTO;
import com.InsuranceManagement.entities.Admin;
import com.InsuranceManagement.entities.Agent;
import com.InsuranceManagement.entities.Customer;
import com.InsuranceManagement.exceptions.ResourceNotFoundException;
import com.InsuranceManagement.repostitories.AgentRepository;
@Service
public class AgentService {
	@Autowired
	private AgentRepository Arep;
	  
	public Agent saveAgent(Agent agent) {
		return Arep.save(agent);
        
    }

    public List<Agent> getAllAgents() {
        return Arep.findAll();
    }
    
	
    public void  deleteById(Long id) { 
    Arep.deleteById(id);
    }
    public Agent getAgentById(Long id) {
    	return Arep.findById(id).orElseThrow(()->new ResourceNotFoundException("Agent not found with ID:"+id));	
    }
    public Agent updateById(Long id,AgentDTO agent) {
    	Agent e=Arep.findById(id).orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND,"Agent not found with ID"+id));
    	e.setUserName(agent.getUserName());
    	e.setPassword(agent.getPassword());
		return Arep.save(e);
    }
    public Agent findByUsername(String username) {
        return Arep.findByUserName(username);
    }
    public boolean updatePassword(String username, String newPassword) {
        Agent agent = Arep.findByUserName(username);
        if (agent != null) {
        	agent.setPassword(newPassword);
            Arep.save(agent);
            return true;
        }
        return false;
    }
    public List<Customer> getCustomersByAgentId(Long agentId) {
        Agent agent = Arep.findById(agentId).orElse(null);
        if (agent != null) {
            return agent.getCustomers();  // agent attend panna customers list
        }
        return Collections.emptyList();
    }
    public Agent findById(Long id) {
        return Arep.findById(id).orElse(null);
    }
}
