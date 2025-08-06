package com.InsuranceManagement.entities;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@javax.persistence.Entity
public class Admin {	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    private String username;
	    private String password;
		public Admin(Long id, String username, String password) {
			super();
			this.id = id;
			this.username = username;
			this.password = password;
		}
		 public Admin(){
			
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
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
		@Override
		public String toString() {
			System.out.println("Hi hari");
			System.out.println("git");
			return "AdminEntity [id=" + id + ", username=" + username + ", password=" + password + "]";
			
		}

}

