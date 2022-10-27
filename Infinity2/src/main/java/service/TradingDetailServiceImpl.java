package service;

import java.util.List;

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

}
