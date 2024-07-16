package cProject.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import cProject.movie.repo.UserRepository;
import cProject.movie.vo.UserVO;

@Controller
@RequestMapping("/board")
public class UserController {
	@Autowired
	UserRepository repository;
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
}