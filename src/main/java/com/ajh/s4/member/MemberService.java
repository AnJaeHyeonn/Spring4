package com.ajh.s4.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ajh.s4.board.BoardDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.getIdCheck(memberDTO);

	}

	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.getLogin(memberDTO);
	}

	public int setJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.setJoin(memberDTO);
	}
	
	public int setUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.setUpdate(memberDTO);	
	}
	
	public int setDelete (MemberDTO memberDTO) throws Exception {
		return memberDAO.setDelete(memberDTO);
	}

}