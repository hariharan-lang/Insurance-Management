package com.InsuranceManagement.dto;

import java.time.LocalDate;

public class ClaimFormDto {
	 private String patientName;
	    private String hospitalName;
	    private LocalDate admissionDate;
	    private String reason;
	    private double amount;
	    private Long planId;
	    
	     private ClaimFormDto(){
	    	
	    }

		public ClaimFormDto(String patientName, String hospitalName, LocalDate admissionDate, String reason,
				double amount, Long planId) {
			super();
			this.patientName = patientName;
			this.hospitalName = hospitalName;
			this.admissionDate = admissionDate;
			this.reason = reason;
			this.amount = amount;
			this.planId = planId;
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

		public Long getPlanId() {
			return planId;
		}

		public void setPlanId(Long planId) {
			this.planId = planId;
		}
	     

}
