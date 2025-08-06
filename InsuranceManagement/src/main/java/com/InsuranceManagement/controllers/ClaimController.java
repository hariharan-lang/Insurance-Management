package com.InsuranceManagement.controllers;

import java.io.IOException;
import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.InsuranceManagement.entities.Claim;
import com.InsuranceManagement.repostitories.ClaimRepository;

@Controller
public class ClaimController {
	
	
	private ClaimRepository claimrepository;

	
	 @GetMapping("/plans")
	    public String showPlans(Model model) {
	        // Load and add plans to model
	        return "plans"; // plans.jsp
	    }

	    // 👇 Add this here
	    @GetMapping("/claim-form")
	    public String showClaimForm(@RequestParam Long planId, Model model) {
	        model.addAttribute("planId", planId);
	        return "claim_form"; // claim_form.jsp
	    }
	   
}
