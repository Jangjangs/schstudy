package com.google.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.domain.BoardVO;
import com.google.domain.Criteria;
import com.google.domain.Criterib;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NewsMapperTests {

	@Setter(onMethod_= {@Autowired})
	private NewsMapper mapper;
	
	//@Test
	public void testGetList() {
		mapper.getList().forEach(board->log.info(board));
	}
	
	@Test
	public void testGetListWithPaging() {
		Criterib cri = new Criterib(1,20);
		mapper.getListWithPaging(cri).forEach(board->log.info(board));
	}
	
	//@Test
	public void testGetListTotal() {
	//	int total = mapper.getListTotal();
	//	log.info("[DEG]:"+total);
	}
	
	//@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새글제목");
		vo.setContent("새글내용");
		vo.setWriter("user00");
	//	mapper.insert(vo);
	}
	
	//@Test
	public void testInsertLastId() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새글제목");
		vo.setContent("새글내용");
		vo.setWriter("user00");
	//	mapper.insertLastId(vo);
		log.info(vo);
	}
	
	//@Test
	public void read() {
		mapper.read(51);
	}
	
	//@Test
	public void delete() {
		mapper.delete(52);
	}
	
	//@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(51L);
		vo.setTitle("변경제목");
		vo.setContent("변경내용");
	//	mapper.update(vo);
	}
	
}
