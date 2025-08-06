package com.InsuranceManagement.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class Customer {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	  	private String name;  
	    private int age;
	    private String contactNo; 
		private String email;
	    private String policyType;
	    @Column(nullable = false)
	    private String password;
	    private String selectedPlan; 
	    
	    @ManyToOne
	    @JoinColumn(name = "agent_id")  
	    private Agent agent;
	public    Customer() {
		
	}
	public Customer(Long id, String name, int age, String contactNo, String email, String policyType, String password,
			String selectedPlan, Agent agent) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.contactNo = contactNo;
		this.email = email;
		this.policyType = policyType;
		this.password = password;
		this.selectedPlan = selectedPlan;
		this.agent = agent;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPolicyType() {
		return policyType;
	}
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSelectedPlan() {
		return selectedPlan;
	}
	public void setSelectedPlan(String selectedPlan) {
		this.selectedPlan = selectedPlan;
	}
	public Agent getAgent() {
		return agent;
	}
	public void setAgent(Agent agent) {
		this.agent = agent;
	}
	
}
