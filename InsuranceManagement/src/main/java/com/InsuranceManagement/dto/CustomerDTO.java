package com.InsuranceManagement.dto;

import javax.persistence.Column;

public class CustomerDTO {
	private String name;  
    private int age;
    private String contactNo; 
    private String email;
    private String policyType;
    @Column(nullable = false)
    private String password;
    private String selectedPlan; 
    public  CustomerDTO () {
    	
    }
	public CustomerDTO(String name, int age, String contactNo, String email, String policyType, String password,
			String selectedPlan) {
		super();
		this.name = name;
		this.age = age;
		this.contactNo = contactNo;
		this.email = email;
		this.policyType = policyType;
		this.password = password;
		this.selectedPlan = selectedPlan;
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
}