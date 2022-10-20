package service;

import mapper.MemberMapper;
import model.MemberVO;

public class MemberServiceImpl implements MemberService {

	@Override
	public void create(MemberVO vo) {
		MemberMapper mapper = new MemberMapper();
		mapper.create(vo);
		//=new MemberMapper().create(vo);
	}

}
