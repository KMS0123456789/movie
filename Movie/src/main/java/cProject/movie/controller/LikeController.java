package cProject.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String like(LikeVO vo, HttpServletRequest request, Model model,
			@RequestParam("bno") int bno,
			@RequestParam("likeUser") String likeUser) {
		
		vo.setBno(vo.getBno());
		vo.setLikeUser(vo.getLikeUser());
		
		model.addAttribute("findlike", bno);
		model.addAttribute("likeOn", likeUser);
		
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/home";
		}
	}
}
