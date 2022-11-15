package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.BoardVO;
import com.google.domain.NewsVO;
import com.google.service.BoardService;
import com.google.service.NewsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/news/*")
public class NewsController {
	
private NewsService service;
	
	@GetMapping("/list")
	public void list(Model model ) {
		model.addAttribute("list", service.getList());
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(NewsVO board, RedirectAttributes rttr) {
		
		service.register(board);
		
		//board/list로 이동하면서 result값(글번호)를 가져감
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/news/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") long bno,Model model) {
		model.addAttribute("board", service.get(bno));
			
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") long bno) {
		service.remove(bno);
		return "redirect:/news/list";
	}
	
	/*
	 * @GetMapping("/modify") 
	 * public void modify(@RequestParam("bno") long bno,Model model) { 
	 * model.addAttribute("board", service.get(bno)); 
	 * }
	 */
	
	@PostMapping("/modify")
	public String modify(NewsVO board, RedirectAttributes rttr) {
		
		service.modify(board);
		
		//board/list로 이동하면서 result값(글번호)를 가져감
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/news/list";
	}
}
