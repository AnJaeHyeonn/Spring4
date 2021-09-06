package com.ajh.s4.notice;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ajh.s4.MyJunitTest;

public class NoticeDAOTest extends MyJunitTest {

	@Autowired
	private NoticeDAO noticeDAO;

	//@Test
	public void getSelectTest() {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNum(23);
		noticeDTO = noticeDAO.getSelect(noticeDTO);

		System.out.println(noticeDTO.getTitle());

		assertNotNull(noticeDTO);
	}

	// @Test
	public void getListTest() {
		List<NoticeDTO> ar = noticeDAO.getList();
		assertNotEquals(0, ar.size());
	}

	@Test
	public void setInsertTest() throws Exception {

		for (int i = 0; i < 200; i++) {

			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setTitle("Title" + i);
			noticeDTO.setContents("Contents" + i);
			noticeDTO.setWriter("Writer"+i);
			
			int result = noticeDAO.setInsert(noticeDTO);

			if (i % 10 == 0) {
				Thread.sleep(500);
			}
		}

		System.out.println("End");
	}

	// @Test
	public void setDeleteTest() {
		int result = noticeDAO.setDelete(1000L);
		assertEquals(1, result);
	}

}
