package cProject.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cProject.movie.repo.CommentRepository;
import cProject.movie.vo.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	CommentRepository repository;
	@RequestMapping(value="/cWrite.do", method=RequestMethod.POST)
	public String writeOK(CommentVO vo, HttpServletRequest request,
			@RequestParam(name="bno", required=false, defaultValue="0") int bno,
			@RequestParam(name="author", required=false) String author,
			@RequestParam(name="cbody", required=false) String cbody) {
		repository.insertOne(vo, bno,author,cbody);

		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/home";
		}
	}

}
