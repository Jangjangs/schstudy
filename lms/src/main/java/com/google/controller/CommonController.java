package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/Login")
@Log4j
public class CommonController {
	
	@GetMapping("")
	public String login() {
		return "login";
	}
	
}
