package com.InsuranceManagement.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.InsuranceManagement.dto.Admindto;
import com.InsuranceManagement.entities.Admin;
import com.InsuranceManagement.exceptions.ResourceNotFoundException;
import com.InsuranceManagement.repostitories.AdminRepository;
@Service
public class AdminService {
	 @Autowired
	    private AdminRepository Arep;
	 
	 
	 
	 public Admin saveAdmin(Admin admin) {
	        return Arep.save(admin);
	    }

	  public boolean validateLogin(String username, String password) {
	        return Arep.existsByUsernameAndPassword(username, password);
	    }
	    public List<Admin> getAllAdmins() {
	        return Arep.findAll();
	    }
	    public void deleteadminById(Long id) {
	    	Arep.deleteById(id); 
	    }
	    public Admin getAdminById(Long id) {
	        return Arep.findById(id)
	            .orElseThrow(() -> new ResourceNotFoundException("Admin with id " + id + " not found"));
	    }
	    public Admin updateById(Long id,Admindto adminDTO) {
	    	Admin a= Arep.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Admin not found with ID: " + id));
			a.setUsername(adminDTO.getUsername());
			a.setPassword(adminDTO.getPassword());
	    	return Arep.save(a);

	    	
	    }
	    public Admin findByUsername(String username) {
	        return Arep.findByUsername(username);
	    }

	    public boolean updatePassword(String username, String newPassword) {
	        Admin admin = Arep.findByUsername(username);
	        if (admin != null) {
	            admin.setPassword(newPassword);
	            Arep.save(admin);
	            return true;
	        }
	        return false;
	    }
	   

}
