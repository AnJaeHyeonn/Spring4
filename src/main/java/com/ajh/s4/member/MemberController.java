package com.ajh.s4.member;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ajh.s4.board.BoardDTO;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("check")
	public ModelAndView check() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/check");
		return mv;
	}

	@GetMapping("join")
	public ModelAndView join() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join");
		return mv;

	}

	@PostMapping("join")
	public ModelAndView setInsert(MemberDTO memberDTO, MultipartFile photo, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();

		int result = memberService.setJoin(memberDTO, photo, session);

		String message = "회원가입 실패";
		if (result > 0) {
			message = "회원가입 성공";
		}

		mv.addObject("msg", message);
		mv.addObject("url", "../");
		mv.setViewName("common/result");

		return mv;
	}

	@GetMapping("idCheck")
	public ModelAndView getIdCheck(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();

		memberDTO = memberService.getIdCheck(memberDTO);

		System.out.println("id 중복체크 ");

		mv.addObject("dto", memberDTO);

		mv.setViewName("member/idCheck");

		return mv;

	}
	
	@GetMapping("idCheckAjax")
	public ModelAndView getIdCheckAjax(MemberDTO memberDTO) throws Exception {
		// 중복 검사 할 id 출력
		System.out.println(memberDTO.getId());

		memberDTO = memberService.getIdCheck(memberDTO);
		// 1이면 사용 가능
		// 0이면 사용 불가 (중복)
		int result = 0;
		
		if(memberDTO == null) {
			result = 1;
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		return mv;
		
		
	}

	@GetMapping("login")
	public ModelAndView login() throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("member/login");

		return mv;
	}

	@PostMapping("login")
	public ModelAndView login(MemberDTO memberDTO, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();

		memberDTO = memberService.getLogin(memberDTO);

		if (memberDTO != null) {
			System.out.println("로그인 성공");
			session.setAttribute("member", memberDTO);
		} else {
			System.out.println("로그인 실패");
		}

		mv.addObject("dto", memberDTO);

		mv.setViewName("redirect:../");

		return mv;
	}

	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) throws Exception {
		// 1.
		// session.removeAttribute("member");

		// 2. 세션의 시간을 0으로
		session.invalidate();

		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:../");

		return mv;
	}

	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session) throws Exception {

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		MemberFilesDTO memberFilesDTO = memberService.getFile(memberDTO);

		ModelAndView mv = new ModelAndView();
		//mv.addObject("files", memberFilesDTO);
		mv.setViewName("member/mypage");
		return mv;
	}

	@GetMapping("update")
	public ModelAndView setUpdate() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/update");
		return mv;
	}

	@PostMapping("update")
	public ModelAndView setUpdate(MemberDTO memberDTO, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();

		int result = memberService.setUpdate(memberDTO);

		session.setAttribute("member", memberDTO);

		mv.setViewName("redirect:../");

		return mv;
	}

	@GetMapping("delete")
	public ModelAndView setDelete(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		MemberDTO sessionDTO = (MemberDTO) session.getAttribute("member");
		memberDTO.setId(sessionDTO.getId());
		int result = memberService.setDelete(memberDTO);
		session.invalidate();
		mv.setViewName("redirect:../");

		return mv;
	}

}
