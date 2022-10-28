package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mapper.TradingDetailMapper;
import model.TradingDetailVO;

public class TradingDetailServiceImpl implements TradingDetailService{

	private TradingDetailMapper mapper;
	
	public TradingDetailServiceImpl() {
		this.mapper = new TradingDetailMapper();
	}

	@Override
	public void create(TradingDetailVO vo) {
		mapper.create(vo);
		
	}

	@Override
	public List<TradingDetailVO> read(int tra_num) {
		return mapper.read(tra_num);
	}

	@Override
	public void modify(HttpServletRequest request) {
		int tra_num = Integer.parseInt(request.getParameter("tra_num"));
		
		//삭제
		mapper.delete(tra_num);
		
		//등록
		for(int i = 0 ; i < request.getParameterValues("tradingDate").length ; i++) {
			String tradingDatestr = request.getParameterValues("tradingDate")[i];
			String subject = request.getParameterValues("subject")[i];
			String standard = request.getParameterValues("standard")[i];
			String quantity = request.getParameterValues("quantity")[i];
			String unitPrice = request.getParameterValues("unitPrice")[i];
			String supplyPrice = request.getParameterValues("supplyPrice")[i];
			String taxAmount = request.getParameterValues("taxAmount")[i];
			String note = request.getParameterValues("note")[i];
			
			if(tradingDatestr == null || "".equals(tradingDatestr)) {
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
			
			mapper.create(tradingDetail);
			
		}
		
	}

}
