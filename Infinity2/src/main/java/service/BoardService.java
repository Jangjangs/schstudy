package service;

import java.util.List;

import model.BoardVO;
import model.PagingDTO;
import model.ViewInfoVO;

public interface BoardService {

	public void create(BoardVO vo);
	
	public void update(BoardVO vo);
	
	public List<BoardVO> readWithPaging(PagingDTO dto);
	
	public int totalCnt();
	
	public BoardVO read(int bo_num);
	
	public BoardVO readModify(int bo_num);
	
	public ViewInfoVO view(int bo_num);
}
