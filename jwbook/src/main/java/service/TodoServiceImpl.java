package service;

import java.util.List;

import dao.TodoMapper;
import domain.TodoVO;

public class TodoServiceImpl {
	public String create(TodoVO vo) {
		TodoMapper mapper = new TodoMapper();
		return mapper.create(vo);
	}
	public List<TodoVO> read() {
		TodoMapper mapper = new TodoMapper();
		return mapper.read();
	}
	public void delete(TodoVO vo) {
		TodoMapper mapper = new TodoMapper();
		mapper.delete(vo);
	}
}
