package com.InsuranceManagement.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {
	
	 @GetMapping("/home")
	    public String homePage() {
		 System.out.println("hai");
		 System.out.println("hari");
	    	return"index";
	    }

}
