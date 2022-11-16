package com.google.mapper;

import java.util.List;

import com.google.domain.BoardVO;
import com.google.domain.Criterib;
import com.google.domain.NewsVO;

public interface NewsMapper {

	//@Select("SELECT * FROM tbl_board ORDER BY bno DESC")
	public List<NewsVO> getList();
	
	public List<NewsVO> getListWithPaging(Criterib cri); 
	
	public void insert(NewsVO vo);

	public long insertLastId(NewsVO vo);
	
	public NewsVO read(long bno);
	
	public void updatehit(long bno);
	
	public void delete(long bno);
	
	public void update(NewsVO vo);
	
	
}

