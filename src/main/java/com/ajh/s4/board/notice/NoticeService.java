package com.ajh.s4.board.notice;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ajh.s4.board.BoardDTO;
import com.ajh.s4.board.BoardFilesDTO;
import com.ajh.s4.board.BoardService;
import com.ajh.s4.board.CommentsDTO;
import com.ajh.s4.util.FileManager;
import com.ajh.s4.util.Pager;

@Service
public class NoticeService implements BoardService {

	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileManager fileManager;

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
		return noticeDAO.getSelect(boardDTO);
	}

	public List<BoardFilesDTO> getFiles(BoardDTO boardDTO) throws Exception {

		return noticeDAO.getFiles(boardDTO);
	}

	@Override
	public int setInsert(BoardDTO boardDTO, MultipartFile[] files) throws Exception {
		// 1. 어느 폴더 /resources/upload/notice/
		String realPath = servletContext.getRealPath("/resources/upload/notice/");
		File file = new File(realPath);

		System.out.println(realPath);

		int result = noticeDAO.setInsert(boardDTO);

		for (MultipartFile multipartFile : files) {
			String fileName = fileManager.fileSave(multipartFile, file);
			BoardFilesDTO boardFilesDTO = new BoardFilesDTO();
			boardFilesDTO.setFileName(fileName);
			boardFilesDTO.setOriName(multipartFile.getOriginalFilename());
			boardFilesDTO.setNum(boardDTO.getNum());

			result = noticeDAO.setFile(boardFilesDTO);
		}
		return result;

	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		String realPath = servletContext.getRealPath("/resources/upload/notice/");
		List<BoardFilesDTO> ar = noticeDAO.getFiles(boardDTO);

		for (int i = 0; i < ar.size(); i++) {
			File file = new File(realPath, ar.get(i).getFileName());
			file.delete();
		}

		return noticeDAO.setDelete(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int setComments(CommentsDTO commentsDTO) throws Exception {
		return noticeDAO.setComments(commentsDTO);
	}
	
	public List<CommentsDTO> getCommnets(CommentsDTO commentsDTO, Pager pager) throws Exception {
		pager.setPerPage(5L);
		pager.makeRow();
		pager.makeNum(noticeDAO.getCommentCount(commentsDTO));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("comments", commentsDTO);
		map.put("pager", pager);
		return noticeDAO.getComments(map);
	}
	
	public int setDeleteComments (CommentsDTO commentsDTO) throws Exception {
		return noticeDAO.setDeleteComments(commentsDTO);
	}
	
	public int setCommentUpdate (CommentsDTO commentsDTO)throws Exception {
		return noticeDAO.setCommentUpdate(commentsDTO);
	}
	
	public int setFileDelete (BoardFilesDTO boardFilesDTO) throws Exception {
		//폴더에서 파일 삭제
		String realPath = servletContext.getRealPath("/resources/upload/notice/");
		File file = new File(realPath, boardFilesDTO.getFileName());
		file.delete();
		
		return noticeDAO.setFileDelete(boardFilesDTO);
	}
}
