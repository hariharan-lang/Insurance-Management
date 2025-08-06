package com.InsuranceManagement.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Claim {
	 @Id
	    @GeneratedValue
	    private Long id;

	    private String patientName;
	    private String hospitalName;
	    private LocalDate admissionDate;
	    private String reason;
	    private double amount;
	    private String status; 
	    private Long planId; 
	    @ManyToOne
	    @JoinColumn(name = "customer_id")
	    private Customer customer;

	    @Lob
	    private byte[] document;
	    
	    public Claim() {
	    	
	    }

		public Claim(Long id, String patientName, String hospitalName, LocalDate admissionDate, String reason,
				double amount, String status, Long planId, Customer customer, byte[] document) {
			super();
			this.id = id;
			this.patientName = patientName;
			this.hospitalName = hospitalName;
			this.admissionDate = admissionDate;
			this.reason = reason;
			this.amount = amount;
			this.status = status;
			this.planId = planId;
			this.customer = customer;
			this.document = document;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getPatientName() {
			return patientName;
		}

		public void setPatientName(String patientName) {
			this.patientName = patientName;
		}

		public String getHospitalName() {
			return hospitalName;
		}

		public void setHospitalName(String hospitalName) {
			this.hospitalName = hospitalName;
		}

		public LocalDate getAdmissionDate() {
			return admissionDate;
		}

		public void setAdmissionDate(LocalDate admissionDate) {
			this.admissionDate = admissionDate;
		}

		public String getReason() {
			return reason;
		}

		public void setReason(String reason) {
			this.reason = reason;
		}

		public double getAmount() {
			return amount;
		}

		public void setAmount(double amount) {
			this.amount = amount;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public Long getPlanId() {
			return planId;
		}

		public void setPlanId(Long planId) {
			this.planId = planId;
		}

		public Customer getCustomer() {
			return customer;
		}

		public void setCustomer(Customer customer) {
			this.customer = customer;
		}

		public byte[] getDocument() {
			return document;
		}

		public void setDocument(byte[] document) {
			this.document = document;
		}

		
}
