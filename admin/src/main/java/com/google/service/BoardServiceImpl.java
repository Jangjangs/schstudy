package com.google.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.BoardAttachVO;
import com.google.domain.BoardVO;
import com.google.domain.Criteria;
import com.google.mapper.BoardAttachMapper;
import com.google.mapper.BoardMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	
	
	private BoardMapper mapper;
	private BoardAttachMapper attachMapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getListTotal(Criteria cri) {
		return mapper.getListTotal(cri);
	}
	
	@Transactional
	@Override
	public void register(BoardVO vo) {
		mapper.insertLastId(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		vo.getAttachList().forEach(attach ->{
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		});
		
	}

	@Override
	public BoardVO get(long bno) {
		mapper.updateHit(bno); //조회수 증가
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public boolean remove(long bno) {
		
		attachMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
		
	}

	/**
	 * 기존에 첨부파일을 전부 삭제하고 다시 등록하는 방식
	 */
	@Override
	public void modify(BoardVO vo) {
		//첨부파일 테이블내용 삭제
		attachMapper.deleteAll(vo.getBno());
		//첨부파일이 있으면 등록 
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		vo.getAttachList().forEach(attach ->{
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		});
		
		mapper.update(vo);
		
	}
	
	@Transactional
	@Override
	public List<BoardAttachVO> getAttachList(long bno) {
		
		return attachMapper.findByBno(bno);
	}





}
