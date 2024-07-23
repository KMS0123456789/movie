package cProject.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cProject.movie.repo.LikeRepository;
import cProject.movie.vo.LikeVO;

@Controller
@RequestMapping("/like")
public class LikeController {

	@Autowired
	LikeRepository repository;
	
	@RequestMapping(value="/like.do", method=RequestMethod.POST)
	public String likeUp(LikeVO like, HttpServletRequest request, Model model,
			@RequestParam("bno") int bno,
			@RequestParam("likeUser") String likeUser) {

		model.addAttribute("bno", bno);
		model.addAttribute("likeUser", likeUser);
		repository.likeUp(like);
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/board/board.do";
		}
	}
	@RequestMapping(value="/likeOff.do", method=RequestMethod.POST)
	public String likeOff(LikeVO like, HttpServletRequest request) {
		repository.likeOff(like);
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/board/board.do";
		}
	}
	
}
