package com.google.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.google.domain.Criteria;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;

public interface ReplyService {

public int insert(ReplyVO vo);
	
	public ReplyVO read(long rno);
	
	public int delete(long rno);
	
	public int update(ReplyVO vo);
	
	public ReplyPageDTO getListWithPaging(Criteria cri, long bno);
}
