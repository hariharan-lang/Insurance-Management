package com.InsuranceManagement.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.InsuranceManagement.dto.AgentDTO;
import com.InsuranceManagement.entities.Admin;
import com.InsuranceManagement.entities.Agent;
import com.InsuranceManagement.entities.Customer;
import com.InsuranceManagement.repostitories.AgentRepository;
import com.InsuranceManagement.services.AgentService;
import com.InsuranceManagement.services.CustomerService;


@Controller
//@RequestMapping("/agent")
public class AgentControl {
    @Autowired
    private AgentService aserv;

    @Autowired
    private CustomerService customerservice;

    @Autowired
    private AgentRepository agentrepository;

    @GetMapping("/agentlogin")
    public String login() {
        return "agentlogin";
    }

    @PostMapping("/agentlogincheck")
    public String handleLogin(@RequestParam String userName,
                              @RequestParam String password,
                              HttpSession session,
                              Model model) {
        Agent agent = agentrepository.findByUserName(userName);

        if (agent != null && password.equals(agent.getPassword())) {
            session.setAttribute("loggedInAgent", agent);  

            List<Customer> customerList = customerservice.getCustomersByAgent(agent);
            model.addAttribute("agent", agent);
            model.addAttribute("customers", customerList);

            return "agent_dashboard";
        } else {
            model.addAttribute("error", "Invalid name or password");
            return "agentlogin";
        }
    }

    @GetMapping("/createagent")
    public String showRegisterform(Model model) {
        model.addAttribute("agentDTO", new AgentDTO());
        return "createagent";
    }

    @PostMapping("/agentreg")
    public String createAgent(@Valid @ModelAttribute("agentDTO") AgentDTO agentDTO,
                              BindingResult result,
                              RedirectAttributes redirectattributes) {
        if (result.hasErrors()) {
            return "createagent";
        }

        Agent agent = new Agent();
        agent.setUserName(agentDTO.getUserName());
        agent.setPassword(agentDTO.getPassword());
        aserv.saveAgent(agent);

        redirectattributes.addFlashAttribute("success", "Agent Registered successfully");
        return "redirect:/createagent";
    }

    @GetMapping("/agentall")
    public String viewAllAgents(Model model) {
        model.addAttribute("agents", aserv.getAllAgents());
        return "viewagent";
    }

    @GetMapping("/agentdelete/{id}")
    public String deleteAgent(@PathVariable("id") Long id) {
        aserv.deleteById(id);
        return "redirect:/agentall";
    }

    @GetMapping("/agentupdated/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Agent entity = aserv.getAgentById(id);
        model.addAttribute("agent", entity);
        return "editagent";
    }

    @PostMapping("/updatedagent/{id}")
    public String updateAgent(@PathVariable Long id, @ModelAttribute AgentDTO agent) {
        aserv.updateById(id, agent);
        return "redirect:/agentall";
    }

    @GetMapping("/forgotagent")
    public String showForgotForm() {
        return "agentforgotpassword";
    }

    @PostMapping("/agentforgot")
    public String verifyUserName(@RequestParam String username, Model model) {
        Agent agent = aserv.findByUsername(username);
        if (agent == null) {
            model.addAttribute("error", "Username not found!");
            return "agentforgotpassword";
        }
        model.addAttribute("username", username);
        model.addAttribute("showReset", true);
        return "agentforgotpassword";
    }

    @PostMapping("/agentreset")
    public String resetPassword(@RequestParam String username,
                                @RequestParam String newPassword,
                                Model model) {
        boolean updated = aserv.updatePassword(username, newPassword);
        if (updated) {
            model.addAttribute("message", "Password updated successfully!");
        } else {
            model.addAttribute("error", "Failed to update password!");
        }
        return "agentforgotpassword";
    }
    @GetMapping("/viewAgentCustomers/{id}")
    public String viewAgentCustomers(@PathVariable Long id, Model model) {
        Agent agent = aserv.getAgentById(id); 
        List<Customer> customers = customerservice.getCustomersByAgent(agent);
        System.out.println("Agent: " + agent.getUserName());
        System.out.println("Customers count: " + customers.size());
        model.addAttribute("agentName", agent.getUserName());
        model.addAttribute("customers", customers);
        return "admin_agent_customers";
    }

    @GetMapping("/adminDashboard")
    public String showAdminDashboard(Model model) {
        model.addAttribute("agents", aserv.getAllAgents());
        model.addAttribute("customers", customerservice.getAllCustomers());
        return "adminDashboard";
    }
}
