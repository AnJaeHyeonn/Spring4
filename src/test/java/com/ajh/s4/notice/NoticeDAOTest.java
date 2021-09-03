package com.ajh.s4.notice;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ajh.s4.MyJunitTest;

public class NoticeDAOTest extends MyJunitTest {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Test
	public void getSelectTest() {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNum(23);
		noticeDTO = noticeDAO.getSelect(noticeDTO);
		
		System.out.println(noticeDTO.getTitle());
		
		assertNotNull(noticeDTO);
	}
	
	@Test
	public void getListTest () {
		List<NoticeDTO> ar = noticeDAO.getList();
		assertNotEquals(0, ar.size());
	}
	
	@Test
	public void setInsertTest() {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setTitle("T5");
		noticeDTO.setContents("C5");
		noticeDTO.setWriter("W5");
		int result = noticeDAO.setInsert(noticeDTO);
		assertEquals(1, result);
	}
	
	@Test
	public void setDeleteTest() {
		int result = noticeDAO.setDelete(1000L);
		assertEquals(1, result);
	}

}
