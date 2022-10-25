package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.TodoMapper;
import domain.TodoVO;
import service.TodoServiceImpl;



public class TodoController {
	public String create(HttpServletRequest request) {
		String todo = request.getParameter("item");
		String todoDate = request.getParameter("todoDate");
		TodoVO vo = new TodoVO();
		vo.setTodo(todo);
		vo.setTodoDate(todoDate);
		TodoServiceImpl service = new TodoServiceImpl();
		return service.create(vo);
	}
	public List<TodoVO> read() {
		TodoServiceImpl service = new TodoServiceImpl();
		return service.read();
	}
	public void delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		TodoVO vo = new TodoVO();
		vo.setNum(num);
		TodoServiceImpl service = new TodoServiceImpl();
		service.delete(vo);
	}
}
