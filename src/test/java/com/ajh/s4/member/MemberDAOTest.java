package com.ajh.s4.member;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ajh.s4.MyJunitTest;

public class MemberDAOTest extends MyJunitTest {

	@Autowired
	private MemberDAO memberDAO;

	@Test
	public void getIdCheckTest() throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("IUdddddddd");
		
		 memberDTO= memberDAO.getIdCheck(memberDTO);
		 
		 assertNotNull(memberDTO);
		
	}

}
