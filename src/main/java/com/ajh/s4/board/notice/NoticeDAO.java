package com.ajh.s4.board.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ajh.s4.board.BoardDAO;
import com.ajh.s4.board.BoardDTO;
import com.ajh.s4.board.BoardFilesDTO;
import com.ajh.s4.board.CommentsDTO;
import com.ajh.s4.util.Pager;

@Repository
public class NoticeDAO implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ajh.s4.board.notice.NoticeDAO.";

	@Override
	public Long getCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", pager);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {

		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}

	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getSelect", boardDTO);
	}

	@Override
	public int setInsert(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setInsert", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDelete", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setHitUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setHitUpdate", boardDTO);
	}

	@Override
	public int setFile(BoardFilesDTO boardFilesDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setFile", boardFilesDTO);
	}

	public List<BoardFilesDTO> getFiles(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFiles", boardDTO);
	}

	public int setComments(CommentsDTO commentsDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setComments", commentsDTO);
	}

	public List<CommentsDTO> getComments(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getComments", map);
	}

	public Long getCommentCount(CommentsDTO commentsDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCommentCount", commentsDTO);
	}

	public int setDeleteComments(CommentsDTO commentsDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDeleteComments", commentsDTO);
	}

	public int setCommentUpdate(CommentsDTO commentsDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setCommentUpdate", commentsDTO);

	}

	public int setFileDelete(BoardFilesDTO boardFilesDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setFileDelete", boardFilesDTO);
	}

}
