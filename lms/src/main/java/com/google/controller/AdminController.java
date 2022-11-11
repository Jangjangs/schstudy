package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@GetMapping("/Main")
	public String main() {
		return "admin/main";
	}
	
	@GetMapping("/MemberList")
		public String memberList() {
			return "admin/memberList";
		}
	@GetMapping("/MemberOutList")
	public String memberOutList() {
		return "admin/memberOutList";
	}
	
	@GetMapping("/Calc")
	public String calc() {
		return "admin/calc";
	}
	
	@GetMapping("Gallery")
	public String gallery() {
		return "admin/gallery";
	}
	
	@GetMapping("List")
	public String list() {
		return "admin/list";
	}
	
	@GetMapping("Modify")
	public String modify() {
		return "admin/modify";
	}
	
	@GetMapping("Profile")
	public String profile() {
		return "admin/profile";
	}
	
	@GetMapping("Signup")
	public String signup() {
		return "admin/signup";
	}
	
	@GetMapping("Slide")
	public String slide() {
		return "admin/slide";
	}
	
	@GetMapping("TradingList")
	public String tradingList() {
		return "admin/tradingList";
	}
	
	@GetMapping("TradingView")
	public String tradingView() {
		return "admin/tradingView";
	}
	
	@GetMapping("TradingWrite")
	public String tradingWrite() {
		return "admin/tradingWrite";
	}
	
	@GetMapping("View")
	public String view() {
		return "admin/view";
	}
	
	@GetMapping("Write")
	public String write() {
		return "admin/write";
	}
}
