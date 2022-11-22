package com.google.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.Criteria;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;
import com.google.mapper.BoardMapper;
import com.google.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= {@Autowired})
	private ReplyMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private BoardMapper boardmapper;
	
	@Transactional
	@Override
	public int insert(ReplyVO vo) {
		boardmapper.updateReplyCnt(vo.getBno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO read(long rno) {
		return mapper.read(rno);
	}

	@Transactional
	@Override
	public int delete(long rno) {
		ReplyVO vo = mapper.read(rno);
		boardmapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public ReplyPageDTO getListWithPaging(Criteria cri, long bno) {
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}

}
