package com.InsuranceManagement.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.InsuranceManagement.dto.Admindto;
import com.InsuranceManagement.entities.Admin;
import com.InsuranceManagement.entities.Agent;
import com.InsuranceManagement.entities.Claim;
import com.InsuranceManagement.entities.Customer;
import com.InsuranceManagement.repostitories.ClaimRepository;
import com.InsuranceManagement.services.AdminService;
import com.InsuranceManagement.services.AgentService;
import com.InsuranceManagement.services.CustomerService;

@Controller
//@RequestMapping("/admin")
public class AdminControl {
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private AgentService agentService;

    @Autowired
    private CustomerService customerService;
    
    @Autowired
    private ClaimRepository claimrepository;
   

    @GetMapping("/adminlogin")
    public String showLoginForm() {
        return "adminlogin"; 
    }

    @PostMapping("/save")
    public String handleLogin(@RequestParam String username, @RequestParam String password, Model model) {
        boolean valid = adminService.validateLogin(username, password);
        if (valid) {
            model.addAttribute("agents", agentService.getAllAgents());
            model.addAttribute("customers", customerService.getAllCustomers());
            model.addAttribute("claims", claimrepository.findByStatus("PENDING"));
            return "adminDashboard"; 
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "adminlogin";
        }
    }
    @GetMapping("/createadmin")
    public String showRegisterForm(Model model) {
        model.addAttribute("admindto", new Admindto());
        return "createadmin";
    }
    @PostMapping("/adminregister")
    public String createAdmin(@Valid @ModelAttribute("admindto") Admindto adminDTO,
                              BindingResult result,
                              RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
        	System.out.println("Validation failed! Admin not registered.");
            return "createadmin";
        }

        Admin admin = new Admin();
        admin.setUsername(adminDTO.getUsername());
        admin.setPassword(adminDTO.getPassword());
        adminService.saveAdmin(admin);

        redirectAttributes.addFlashAttribute("success", "Admin registered successfully!");
        return "redirect:/adminlogin";
    }


    @GetMapping("/adminall")
    public String viewAllAdmins(Model model) {
        model.addAttribute("admins", adminService.getAllAdmins());
        return "adminview";
    }
    @GetMapping("/admindelete/{id}")
    public String deleteAdmin(@PathVariable("id") Long id) {
    	adminService.deleteadminById(id);
        return "redirect:/adminall";
    }
    @GetMapping("/adminupdate/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Admin admin = adminService.getAdminById(id);
        model.addAttribute("admin", admin);
        return "editadmin";  
    }
    @PostMapping("/updateadmin/{id}")
    public String updateAdmin(@PathVariable Long id,  @ModelAttribute Admindto adminDTO) {
        adminService.updateById(id, adminDTO);
        return "redirect:/adminall";  
    }
    
    @GetMapping("/forgetadmin")
    public String showForgerForm() {
		return "adminforgotpassword";
    	
    }
    @PostMapping("/adminforgot")
    public String verifyUsername(@RequestParam String username, Model model) {
        Admin admin = adminService.findByUsername(username);
        if (admin == null) {
            model.addAttribute("error", "Username not found!");
            return "adminforgotpassword";
        }
        model.addAttribute("username", username);
        model.addAttribute("showReset", true);
        return "adminforgotpassword";
    }
    @PostMapping("/adminreset")
    public String resetPassword(@RequestParam String username,
                                @RequestParam String newPassword,
                                Model model) {
        boolean updated = adminService.updatePassword(username, newPassword);
        if (updated) {
            model.addAttribute("message", "Password updated successfully!");
        } else {
            model.addAttribute("error", "Failed to update password!");
        }
        return "adminforgotpassword";
    }
    @GetMapping("/admin/agent/{agentId}/customers")
    public String viewAgentCustomers(@PathVariable Long agentId, Model model) {
        List<Customer> customers = agentService.getCustomersByAgentId(agentId);
        model.addAttribute("customers", customers);
        return "agent-customers";  
    }
    @GetMapping("/admin/agentlist")
    public String showAllAgentsForAdmin(Model model) {
        List<Agent> agents = agentService.getAllAgents();
        model.addAttribute("agents", agents);
        return "admin_agentlist";  // JSP filename
    }
	    @GetMapping("/admin/viewcustomerdetails/{agentId}")
	    public String viewCustomersByAgent(@PathVariable Long agentId, Model model) {
	        Agent agent = agentService.getAgentById(agentId);
	        List<Customer> customers = customerService.getCustomersByAgent(agent);
	
	        System.out.println("Agent: " + agent.getUserName());
	        System.out.println("Customers size: " + customers.size());
	        
	        model.addAttribute("agentName", agent.getUserName());
	        model.addAttribute("customers", customers);
	        return "admin_agent_customers"; 
	    }
	    @PostMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate();  
	        return "redirect:/adminlogin";
	    }
	    @GetMapping("/admin/claims")
	    public String viewAllClaims(Model model) {
	    	List<Claim> claims = claimrepository.findAll();
	        System.out.println("Pending claims count: " + claims.size());
	        model.addAttribute("claims", claims);
	        return "view_claims";
	    }
	    @GetMapping("/admin/view-claims")
	    public String viewFilteredClaims(Model model) {
	    	List<Claim> claims = claimrepository.findByStatusAndDocumentIsNotNull("PENDING");
	        model.addAttribute("claims", claims);
	        return "admin_view_claims"; // JSP page
	    }
	    @PostMapping("/admin/approveClaim")
	    public String approveClaim(@RequestParam Long claimId, RedirectAttributes redirectAttributes) {
	        claimrepository.findById(claimId).ifPresent(claim -> {    
	            claim.setStatus("APPROVED");
	            claimrepository.save(claim);
	        });
	        redirectAttributes.addFlashAttribute("message", "Claim approved successfully!");
	        return "redirect:/admin/claims";
	    }

	    @PostMapping("/admin/rejectClaim")
	    public String rejectClaim(@RequestParam Long claimId, RedirectAttributes redirectAttributes) {
	        claimrepository.findById(claimId).ifPresent(claim -> {
	            claim.setStatus("REJECTED");
	            claimrepository.save(claim);
	        });
	        redirectAttributes.addFlashAttribute("message", "Claim rejected!");
	        return "redirect:/admin/claims";
	    }
	    @PostMapping("/admin/updateClaimStatus")
	    public String updateClaimStatus(@RequestParam Long claimId, @RequestParam String status) {
	        Claim claim = claimrepository.findById(claimId).orElse(null);
	        if (claim != null) {
	            claim.setStatus(status.toUpperCase());
	            claimrepository.save(claim);
	        }
	        return "redirect:/admin/view-claims";
	    }
	    @GetMapping("/admin/view-document/{claimId}")
	    public ResponseEntity<byte[]> viewDocument(@PathVariable Long claimId) {
	        Claim claim = claimrepository.findById(claimId).orElse(null);
	        if (claim != null && claim.getDocument() != null) {
	            return ResponseEntity.ok()
	                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"report_" + claimId + ".pdf\"")
	                .contentType(MediaType.APPLICATION_PDF)  // or appropriate type
	                .body(claim.getDocument());
	        }
	        return ResponseEntity.notFound().build();
	    }
   
}

