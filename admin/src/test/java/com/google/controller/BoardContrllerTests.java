package com.google.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
					,"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration //controller를 위한 test
public class BoardContrllerTests {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before //테스트 전에 수행해라
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//@Test
	public void testList() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn().getModelAndView().getModelMap()
				);
	}
	
	//@Test
	public void testRegister() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "테스트 제목")
				.param("content", "테스트 내용")
				.param("writer", "user00"))
		
		.andReturn().getModelAndView().getViewName();
	}
	
	//@Test
	public void testget() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/read")
				.param("bno", "1"))
				.andReturn().getModelAndView().getModelMap()
				);
	}
	
	//@Test
	public void testremove() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "1"))
				.andReturn().getModelAndView().getViewName()
				);
	}
	
	@Test
	public void testModify() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "37")
				.param("title", "테스트 수정 제목")
				.param("content", "테스트 수정 내용")
				.param("writer", "user00"))
		
		.andReturn().getModelAndView().getViewName();
	}
	
}
