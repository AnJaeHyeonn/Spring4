package com.ajh.s4.board;

import java.util.List;

public interface BoardDAO {
	
	//전체 갯수
	public Long getCount() throws Exception; 

	//List
	public abstract List<BoardDTO> getList() throws Exception;
	
	//Select
	public abstract List<BoardDTO> getSelect(BoardDTO boardDTO) throws Exception;
	
	//Insert
	public int setInsert(BoardDTO boardDTO) throws Exception;

	//Delete
	public int setDelete(BoardDTO boardDTO) throws Exception;
	
	//Update
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	
}
	
