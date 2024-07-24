package cProject.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cProject.movie.repo.StarRepository;
import cProject.movie.vo.StarVO;

@Controller
@RequestMapping("/star")
public class StarController {

    @Autowired
    StarRepository repository;

    @RequestMapping(value="/star.do", method=RequestMethod.POST)
    public String star(StarVO vo, HttpServletRequest request, Model model,
    		@RequestParam("bno") int bno, 
           @RequestParam("author") String author,
           @RequestParam("star") int star) {
    	
    	model.addAttribute("bno", bno);
		model.addAttribute("author", author);
		model.addAttribute("star", star);
		repository.insertStar(vo);
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/board/board.do";
		}
    }
}
