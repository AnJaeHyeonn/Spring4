package com.ajh.s4.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ajh.s4.board.BoardDAO;
import com.ajh.s4.board.BoardDTO;
import com.ajh.s4.util.Pager;

@Repository
public class QnaDAO implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ajh.s4.board.qna.QnaDAO.";

	@Override
	public Long getCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", pager);

	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {

		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}

	@Override
	public List<BoardDTO> getSelect(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
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

	// 답글
	public int setReply(QnaDTO qnaDTO) throws Exception {
		return 0;
	}

}
