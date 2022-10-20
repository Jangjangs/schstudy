package service;

import mapper.LoginMapper;
import model.MemberVO;

public class LoginServiceImpl implements Loginservice {

	@Override
	public MemberVO read(MemberVO vo) {
		LoginMapper mapper = new LoginMapper();
		return mapper.read(vo);
	}
	
}
