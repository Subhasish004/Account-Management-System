package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/atm/error")
public class ErrorController {
	
	public String errorHandler() {
		
		return "error";
	}
}
