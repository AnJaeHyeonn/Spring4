package com.ajh.s4.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ajh.s4.board.BoardDTO;
import com.ajh.s4.board.BoardService;
import com.ajh.s4.util.Pager;

@Service
public class NoticeService implements BoardService {

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {

		Long totalCount = noticeDAO.getCount(pager);

		pager.makeNum(totalCount);
		pager.makeRow();
		return noticeDAO.getList(pager);
	}

	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {

		
		noticeDAO.setHitUpdate(boardDTO);
		
		boardDTO = noticeDAO.getSelect(boardDTO);

		return boardDTO;
	}

	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		return noticeDAO.setInsert(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
