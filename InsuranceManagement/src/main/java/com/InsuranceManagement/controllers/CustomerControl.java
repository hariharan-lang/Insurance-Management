package com.InsuranceManagement.controllers;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.InsuranceManagement.dto.CustomerDTO;
import com.InsuranceManagement.entities.Agent;
import com.InsuranceManagement.entities.Claim;
import com.InsuranceManagement.entities.Customer;
import com.InsuranceManagement.repostitories.ClaimRepository;
import com.InsuranceManagement.repostitories.CustomerRepository;
import com.InsuranceManagement.services.AgentService;
import com.InsuranceManagement.services.CustomerService;

@Controller
//@RequestMapping("/customer")
public class CustomerControl {
	
	@Autowired
	private AgentService agentService;
	
    @Autowired
    private CustomerService cserv; 
    
    @Autowired
    private ClaimRepository claimrespository;
    @Autowired
    private CustomerRepository customerrepository;
    

    @GetMapping("/customerlogin")
    public String showLoginForm() {
        return "customerlogin";
    }
    @PostMapping("/log")
    public String loginCustomer(@RequestParam String email, @RequestParam String password,HttpSession session, Model model) {
        Customer customer = cserv.findByEmailAndPassword(email, password);
        if (customer != null) {
        	 session.setAttribute("loggedInCustomer", customer);
            model.addAttribute("customer", customer);
            return "plan-selection";
        } else {
            model.addAttribute("error", "Invalid Credentials");
            return "customerlogin";
        }
    }
    
    @PostMapping("/select-plan")
    public String selectPlan(@RequestParam Long id, @RequestParam String planType, Model model) {
        Customer customer = cserv.getCustomrByid(id);
        if (customer.getSelectedPlan() == null) {
            customer.setSelectedPlan(planType.toUpperCase());
            cserv.saveCustomer(customer);

            model.addAttribute("customer", customer);
            if (planType.equalsIgnoreCase("normal")) {
                return "claim_form";
            } else {
                return "claim_form";
            }
        } else {
            model.addAttribute("message", "You have already claimed a plan.");
            return "claimed";
        }
    }

    @GetMapping("/createcustomer")  
    public String showCustomerForm(Model model) {
        model.addAttribute("agents", agentService.getAllAgents()); 
        return "customerregister";  
    }

    @PostMapping("/customercreate")
    public String createCustomer(Customer customer, @RequestParam Long agentId) {
        Agent agent = agentService.findById(agentId);
        customer.setAgent(agent);
        cserv.saveCustomer(customer);
        return "redirect:/customerlogin";
    }

    @GetMapping("/viewcustomer")
    public String viewCustomersForAgent(Model model, @RequestParam Long agentId) {
        Agent agent = agentService.findById(agentId);  
        List<Customer> customers = cserv.getCustomersByAgent(agent);
        model.addAttribute("customers", customers);
        return "viewcustomer";
    }
    @GetMapping("/cusdelete/{id}")
    public String deleteCustomer(@PathVariable("id") Long id) {
        cserv.deleteCustomerById(id);
        return "redirect:/viewcustomer";
    }
    @GetMapping("/cusupd/{id}")
    public String showUpdateForm(@PathVariable Long id,Model model) {
    	Customer e=cserv.getCustomrByid(id);
    	model.addAttribute("customer",e);
		return "editcustomer";
    }
    @PostMapping("/updcus/{id}")
    public String updateCustomer(@PathVariable Long id, @ModelAttribute Customer customer) {
        cserv.saveCustomer(customer);
        return "redirect:/viewcustomer";
    }
    @PostMapping("/customer/submitClaim")
    public String submitClaim(@RequestParam String patientName,
                              @RequestParam String hospitalName,
                              @RequestParam String admissionDate,
                              @RequestParam String reason,
                              @RequestParam double amount,
                              @RequestParam("document") MultipartFile document,
                              HttpSession session) throws IOException {

        Customer customer = (Customer) session.getAttribute("loggedInCustomer"); // ✅ from session
        if (customer == null) {
            return "redirect:/customerlogin";
        }

        Claim claim = new Claim();
        claim.setPatientName(patientName);
        claim.setHospitalName(hospitalName);
        claim.setAdmissionDate(LocalDate.parse(admissionDate));
        claim.setReason(reason);
        claim.setAmount(amount);
        claim.setStatus("PENDING");
        claim.setCustomer(customer); // ✅ Link customer

        if (!document.isEmpty()) {
            claim.setDocument(document.getBytes());
        }

        claimrespository.save(claim);
        return "submitted_claim";
    }
    @GetMapping("/customer/view-claims")
    public String viewCustomerClaims(Model model, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("loggedInCustomer");
        if (customer == null) {
            return "redirect:/customerlogin";
        }

        List<Claim> claims = claimrespository.findByCustomer_Id(customer.getId());
        model.addAttribute("claims", claims);
        return "customer_claims"; 
    }
   
   
}
