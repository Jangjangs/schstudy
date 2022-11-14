package com.google.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.domain.SampleDTO;
import com.google.domain.SampleDTOList;
import com.google.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@RequestMapping("")
	public void basic() {
		log.info("basic......");
	}
	/**
	 * sample/ex01?name=홍길동&age=10
	 * sample dto 변수와 같은 이름으로 파라미터 입력 시
	 * setter가 동작해서 값을 넣어준다.
	 * request.getParameter()
	 * @param dto
	 * @return
	 */
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info(""+dto);
		return "ex01";
	}
	/**
	 * sample/ex02?fname=홍길동&fage=10
	 * fname fage로 입력하지만
	 * name age로 변경되어 값 입력
	 * request.getParameter()
	 * @param name
	 * @param age
	 * @return
	 */
	@GetMapping("/ex02")
	public String ex02(@RequestParam("fname") String name,@RequestParam("fage") int age){
		log.info("name:" + name);
		log.info("age:" + age);
		return "ex02";
	}
	
	/**
	 * List
	 * ?a=a&a=b&a=c
	 * hobby=야구&hobby=축구&hobby=골프
	 * request.getParameterValues()
	 */
	@GetMapping("/ex03")
	public String ex03(@RequestParam("hobby") ArrayList<String> hobbys) {
		log.info("hobbys:"+hobbys);
		return "ex03";
		
	}
	
	/**
	 * 배열
	 * ?a=a&a=b&a=c
	 * hobby=야구&hobby=축구&hobby=골프
	 * request.getParameterValues()
	 */
	@GetMapping("/ex04")
	public String ex04(@RequestParam("hobby") String[] hobbys) {
		log.info("hobbys:"+Arrays.toString(hobbys));
		return "ex04";
		
	}
	
	/**
	 * ?list[0].name=AAA&list[1].name=BBB&list[2].name=CCC
	 * @param list
	 * @return
	 */
	@GetMapping("/ex05")
	public String ex05(SampleDTOList list) {
		log.info("list:"+list);
		return "ex05";
	}
	
	/**
	 * URL에 날짜 (2022-11-11)를 전달할 경우 Sring에서 java.uil.date로 변환
	 * @param binder
	 */
	/*
	 * @InitBinder 
	 * public void initBinder(WebDataBinder binder) { 
	 * SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	 * binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(format, false)); }
	 */
	/**
	 * ?title=aaaa&dueDate=2022-11-11
	 * @param todo
	 * @return
	 */
	@GetMapping("/ex06")
	public String ex06(TodoDTO todo) {
		log.info(todo);
		return "ex06";
	}
	
	/**
	 * @ModelAttribute 어노테이션
	 * ?name=홍길동&age=10&page=1
	 * @param dto
	 * @param age
	 * @return
	 */
	@GetMapping("/ex07")
	public String ex07(SampleDTO dto, @ModelAttribute("page") int page, Model model) {
		log.info("dto: "+ dto);
		log.info("page: "+ page);
		model.addAttribute("dto", dto);
		//===request.setAttribute("dto",dto);
		return "sample/ex07";
	}
	
	/**
	 * response.sendRedirect();
	 * redirect:/
	 * @return
	 */
	
	@GetMapping("/ex08")
	public String ex08() {
		return "redirect:/sample/ex07";
	}
	
	/**
	 * return 타입 void;
	 *views/sample 폴더 안 ex09를 찾음
	 * 
	 */
	@GetMapping("/ex09")
	public void ex09_1() {
		log.info("ex09...");
	}
	
	/**
	 * return 타입 String;
	 * return "ex10";
	 * views/ex10.jsp 찾음
	 * return "/sample/ex10";
	 * views/sample/ex10.jsp 찾음
	 */
	@GetMapping("/ex10")
	public String ex10() {
		return "/sample/ex10";
	}
	
	@GetMapping("/ex11")
	public @ResponseBody SampleDTO ex11() {
		SampleDTO dto = new SampleDTO();
		dto.setName("홍길동");
		dto.setAge(10);
		return dto;
	}
	
	@GetMapping("/ex12")
	public ResponseEntity<String> ex12(){
		String msg = "{\"name\":\"홍길동\",\"age\":10}";
		HttpHeaders header = new HttpHeaders();
		header.add("content-Type", "application/json;charset=utf-8");
		
		return new ResponseEntity<String>(msg, header, HttpStatus.OK);
	}
	
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload...");
	}
	
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {
		files.forEach(file->{
			log.info("name:" + file.getOriginalFilename());
			log.info("size:" + file.getSize());
		});
	}
}
