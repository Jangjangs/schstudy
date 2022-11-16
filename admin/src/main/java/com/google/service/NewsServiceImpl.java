package com.google.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.google.domain.BoardVO;
import com.google.domain.Criterib;
import com.google.domain.NewsVO;
import com.google.mapper.BoardMapper;
import com.google.mapper.NewsMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class NewsServiceImpl implements NewsService {
	
	
	private NewsMapper mapper;
	
	@Override
	public List<NewsVO> getList() {
		return mapper.getList();
	}

	@Override
	public void register(NewsVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public NewsVO get(long bno) {
		mapper.updatehit(bno);
		return mapper.read(bno);
	}

	@Override
	public void remove(long bno) {
		mapper.delete(bno);
		
	}

	@Override
	public void modify(NewsVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public List<NewsVO> getList(Criterib cri) {
		return mapper.getListWithPaging(cri);
	}

}
