package com.InsuranceManagement.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class Admindto {
	@NotBlank(message="username is required")
	@Size(min = 3, max =20, message = "username must be between 3 and 20 characters")
	private String username;
	@NotBlank(message="password is required")
	@Size(min = 3, max = 8, message = "password must be between 3 and 8characters")
	private String password;
	
	
	public Admindto(){
		
	}
	public Admindto(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
