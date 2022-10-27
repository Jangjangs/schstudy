package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.TradingDetailVO;
import model.TradingVO;
import service.TradingDetailServiceImpl;
import service.TradingServiceImpl;

/**
 * Servlet implementation class TradingController
 */
@WebServlet("/TradingWrite")
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
			String tradingDatestr = request.getParameterValues("tradingDate")[i];
			String subject = request.getParameterValues("subject")[i];
			String standard = request.getParameterValues("standard")[i];
			String quantity = request.getParameterValues("quantity")[i];
			String unitPrice = request.getParameterValues("unitPrice")[i];
			String supplyPrice = request.getParameterValues("supplyPrice")[i];
			String taxAmount = request.getParameterValues("taxAmount")[i];
			String note = request.getParameterValues("note")[i];
			
			if(tradingDatestr ==null || "".equals(tradingDatestr)) {
				break;
			} 
			
			Date tradingDate = null;
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				tradingDate = format.parse(tradingDatestr);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			TradingDetailVO tradingDetail = new TradingDetailVO();
			tradingDetail.setTrad_refnum(tra_num);
			tradingDetail.setTrad_tradingDate(tradingDate);
			tradingDetail.setTrad_subject(subject);
			tradingDetail.setTrad_standard(standard);
			tradingDetail.setTrad_quantity(Integer.parseInt(quantity));
			tradingDetail.setTrad_unitPrice(Integer.parseInt(unitPrice));
			tradingDetail.setTrad_supplyPrice(Integer.parseInt(supplyPrice));
			tradingDetail.setTrad_taxAmount(Integer.parseInt(taxAmount));
			tradingDetail.setTrad_note(note);
			
			TradingDetailServiceImpl service2 = new TradingDetailServiceImpl();
			service2.create(tradingDetail);
			System.out.print(tradingDetail);
		}
		
		response.sendRedirect("TradingList");
		
	}

}
