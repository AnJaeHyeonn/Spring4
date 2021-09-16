package com.ajh.s4.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ajh.s4.util.Pager;

public interface BoardService {

	// List
	public abstract List<BoardDTO> getList(Pager pager) throws Exception;

	// Select
	public abstract BoardDTO getSelect(BoardDTO boardDTO) throws Exception;

	// Insert
	public int setInsert(BoardDTO boardDTO, MultipartFile[] files) throws Exception;

	// Delete
	public int setDelete(BoardDTO boardDTO) throws Exception;

	// Update
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	
}
