package service;

import mapper.BoardMapper;
import model.BoardVO;

public class BoardServiceImpl implements BoardService {

	@Override
	public void create(BoardVO vo) {
		BoardMapper mapper = new BoardMapper();
		mapper.create(vo);
	}

}
