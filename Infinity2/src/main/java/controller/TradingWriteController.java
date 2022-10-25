package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TradingVO;
import service.TradingServiceImpl;

/**
 * Servlet implementation class TradingController
 */
@WebServlet("/TradingStatementWrite")
public class TradingWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradingWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/tradingStatementWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String tra_account = request.getParameter("tra_account");
		
		TradingVO trading = new TradingVO();
		trading.setTra_account(tra_account);
		
		TradingServiceImpl service = new TradingServiceImpl();
		int tra_num = service.create(trading);
		
		System.out.println("A.I: "+tra_num);
		
		//목요일
		for(int i = 0 ; i < request.getParameterValues("tradingDate").length ; i++) {
			String tradingDate = request.getParameterValues("tradingDate")[i];
			String subject = request.getParameterValues("subject")[i];
			String standard = request.getParameterValues("standard")[i];
			String quantity = request.getParameterValues("quantity")[i];
			String unitPrice = request.getParameterValues("unitPrice")[i];
			String supplyPirce = request.getParameterValues("supplyPirce")[i];
			String taxAmount = request.getParameterValues("taxAmount")[i];
			String note = request.getParameterValues("note")[i];
			
			if(tradingDate ==null || "".equals(tradingDate)) {
				break;
			} 
			System.out.println(tradingDate);
			System.out.println(subject);
			System.out.println(standard);
			System.out.println(quantity);
			System.out.println(unitPrice);
			System.out.println(supplyPirce);
			System.out.println(taxAmount);
			System.out.println(note);
			
		}
	}

}
