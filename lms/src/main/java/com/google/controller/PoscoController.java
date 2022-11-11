package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/posco/*")
@Log4j
public class PoscoController {
	
	@GetMapping("/")
	public  String main(){
		return "/posco/main";
		
	}
	
	@GetMapping("/Contact")
	public String contact() {
		return "/posco/contact";
	}
}
