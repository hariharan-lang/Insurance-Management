package com.InsuranceManagement.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class AgentDTO {
	
	@NotBlank(message="username is required")
	@Size(min=3,max=20,message="username must be between 3 to 20 characters")
	 private String userName;  
	@NotBlank(message="Password is required")
	@Size(min=3,max=20,message="Password must be between 3 to 6 characters")
	 private String password ;
	    
	    
	 public   AgentDTO(){
	    	
	    }


	public AgentDTO(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "AgentDTO [userName=" + userName + ", password=" + password + "]";
	}
	 
	    
}
