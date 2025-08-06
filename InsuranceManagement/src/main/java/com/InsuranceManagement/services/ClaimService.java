package com.InsuranceManagement.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.InsuranceManagement.dto.ClaimFormDto;
import com.InsuranceManagement.entities.Claim;
import com.InsuranceManagement.repostitories.ClaimRepository;

@Service
public class ClaimService {
	
	@Autowired
    private ClaimRepository claimRepository;

    public void saveClaim(ClaimFormDto dto) {
        Claim claim = new Claim();
        claim.setPatientName(dto.getPatientName());
        claim.setHospitalName(dto.getHospitalName());
        claim.setAdmissionDate(dto.getAdmissionDate());
        claim.setReason(dto.getReason());
        claim.setAmount(dto.getAmount());
        claim.setPlanId(dto.getPlanId());
        claim.setStatus("PENDING");

        claimRepository.save(claim);
    }

}
