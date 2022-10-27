package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardVO;
import model.PagingDTO;
import model.TradingVO;
import service.BoardServiceImpl;
import service.TradingServiceImpl;

/**
 * Servlet implementation class TradingStatementListController
 */
@WebServlet("/TradingList")
public class TradingListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradingListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징
		String param= request.getParameter("p");
				
		PagingDTO paging = new PagingDTO();
		if(!(param == null || "".equals(param))){
			paging.setP(Integer.parseInt(param));
		}
		//System.out.println(paging);
				
		TradingServiceImpl service = new TradingServiceImpl();
		
		List<TradingVO> list = service.readWithPaging(paging);
		

		//전체 글수
		int total = service.totalCnt();
		paging.setTotal(total);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		
		request.getRequestDispatcher("views/tradingStatementList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
