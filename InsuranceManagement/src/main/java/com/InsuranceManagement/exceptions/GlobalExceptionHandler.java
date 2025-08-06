package com.InsuranceManagement.exceptions;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	
	@ExceptionHandler(ResourceNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
	public String handleResourceNotFoundException(ResourceNotFoundException ex,Model model ,HttpServletRequest request)  {
		model.addAttribute("error", ex.getMessage());
		
		
		String uri = request.getRequestURI();

        if (uri.contains("/admin")) {
            return "404";
        } else if (uri.contains("/agent")) {
            return "ag404";
	
		
	}
		return "/aent/agentlogin";
	 

}
}