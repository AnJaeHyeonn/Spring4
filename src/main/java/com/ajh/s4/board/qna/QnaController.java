package com.ajh.s4.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ajh.s4.board.BoardDTO;
import com.ajh.s4.board.BoardFilesDTO;
import com.ajh.s4.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {

	@Autowired
	private QnaService qnaService;

	@ModelAttribute("board")
	public String getBoard() {
		return "qna";
	}

	@GetMapping("list")
	public ModelAndView getList(Pager pager) throws Exception {

		List<BoardDTO> ar = qnaService.getList(pager);

		ModelAndView mv = new ModelAndView();
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("board/list");

		return mv;
	}

	@GetMapping("insert")
	public ModelAndView setInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/insert");
		return mv;
	}

	@PostMapping("insert")
	public ModelAndView setInsert(BoardDTO boardDTO, MultipartFile[] files) throws Exception {
		
		for (MultipartFile muFile : files) {
			System.out.println(muFile.getOriginalFilename());
		}
		
		ModelAndView mv = new ModelAndView();

		int result = qnaService.setInsert(boardDTO, files);

		mv.setViewName("redirect:./list");

		return mv;
	}

	@GetMapping("select")
	public ModelAndView getSelect(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();

		boardDTO = qnaService.getSelect(boardDTO);
		
		List<BoardFilesDTO> ar = qnaService.getFiles(boardDTO);

		mv.addObject("dto", boardDTO);
		mv.addObject("fileList", ar);

		mv.setViewName("board/select");

		return mv;
	}

	@GetMapping("reply")
	public ModelAndView setReply() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/reply");
		return mv;
	}

	@PostMapping("reply")
	public ModelAndView setReply(QnaDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setReply(qnaDTO);

		mv.setViewName("redirect:./list");

		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setDelete(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setDelete(boardDTO);
		mv.setViewName("redirect:../");

		return mv;
	}
}
