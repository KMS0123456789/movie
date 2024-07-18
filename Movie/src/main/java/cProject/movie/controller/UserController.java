package cProject.movie.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cProject.movie.repo.UserRepository;
import cProject.movie.vo.BoardVO;
import cProject.movie.vo.UserVO;

@Controller
@RequestMapping("/board")
public class UserController {
	
	@Autowired
	UserRepository repository;
	private String id;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginOK(@ModelAttribute UserVO vo, HttpSession session, HttpServletRequest request) {
		UserVO user = repository.login(vo);
		session.setAttribute("user", user);
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/home";
		}
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinOk(UserVO vo) {
		int result = repository.join(vo);
		if(result>0) {
			return "redirect:/board/home.do";
		}else {
			return "redirect:/board/join.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public Map<String, String> idCheck(@RequestParam("id") String id) {
		
		int count = repository.idCheck(id);
		
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) {
			map.put("result", "failed");
		}else {
			map.put("result", "success");
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/nickCheck.do", method=RequestMethod.POST)
	public Map<String, String> nickCheck(@RequestParam("nick") String nick) {
		
		int count = repository.nickCheck(nick);
		
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) {
			map.put("result", "failed");
		}else {
			map.put("result", "success");
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/emailCheck.do", method=RequestMethod.POST)
	public Map<String, String> emailCheck(@RequestParam("email") String email) {
		
		int count = repository.emailCheck(email);
		
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) {
			map.put("result", "failed");
		}else {
			map.put("result", "success");
		}
		
		return map;
	}
	
	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "findid";
	}
	
	@RequestMapping(value="/findId.do",method =RequestMethod.POST)
	public String view(@RequestParam(name="email") String email, Model model){
		
		UserVO vo =repository.findId(email);
		model.addAttribute("vo", vo);
		
		return "findidresult"; 
	}
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/freelist.do";
	}
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
		
		
}
