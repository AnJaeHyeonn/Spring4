package com.ajh.s4.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.ajh.s4.board.BoardFilesDTO;

@Component
public class FileDown extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		// model -> Controller의 model
		String board = (String) model.get("board");
		BoardFilesDTO boardFilesDTO = (BoardFilesDTO) model.get("dto");

		board = request.getSession().getServletContext().getRealPath("/resources/upload/" + board);
		File file = new File(board, boardFilesDTO.getFileName());

		// 한글처리
		response.setCharacterEncoding("UTF-8");

		// 파일크기
		response.setContentLength((int) file.length());

		// 다운 시 파일 이름 인코딩 (나중에)
		// String downName = URLEncoder.encode(boardFilesDTO.getOriName(), "UTF-8");
		String fileName = boardFilesDTO.getFileName();
		String downName = fileName.substring(fileName.lastIndexOf("_") + 1);
		// response header 설정
		response.setHeader("Content-Disposition", "attachment;fileName=\"" + downName + "\"");
		response.setHeader("Content-Transfer-Encoding", "binary");

		// 파일을 읽어서 Client 전송
		FileInputStream fi = new FileInputStream(file);
		OutputStream os = response.getOutputStream();

		FileCopyUtils.copy(fi, os);

		System.out.println(board);
		System.out.println(boardFilesDTO.getFileName());

		os.close();
		fi.close();

		System.out.println("File Down View");

	}

}
