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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cProject.movie.repo.CommentRepository;
import cProject.movie.vo.BoardVO;
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
	
	@RequestMapping(value="/cModify.do", method=RequestMethod.POST)
	public String modifyOk(CommentVO vo, HttpServletRequest request,
			@RequestParam(name="bno", required=false, defaultValue="0") int bno,
			@RequestParam(name="author", required=false) String author,
			@RequestParam(name="cbody", required=false) String cbody) {
		repository.modifyOne(vo, bno,author,cbody);
		
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/home";
		}
	}
	
	@RequestMapping(value="/cOff.do", method=RequestMethod.POST)
	public String offOk(CommentVO vo, HttpServletRequest request,
			@RequestParam(name="bno", required=false, defaultValue="0") int bno,
			@RequestParam(name="author", required=false) String author,
			@RequestParam(name="cbody", required=false) String cbody,
			@RequestParam(name="cno", required=false) int cno) {
		repository.offOne(vo, bno,author,cbody,cno);
		
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/home";
		}
	}
	@RequestMapping(value="/myComment.do", method=RequestMethod.GET)
	public String myComment(Model model, String author, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<CommentVO> data = repository.myComment(pageable, searchType, keyword, author);
		model.addAttribute("myComment", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		model.addAttribute("author",author);
		return "mypage";
	}
	@RequestMapping(value="/myCommentOff.do", method=RequestMethod.POST)
	public String myCommentOff(CommentVO vo) {
		int result = repository.myCommentOff(vo);
		
		if (result > 0) {
		    return "redirect:/comment/myComment.do";
		}else {
			return "redirect:/board/mypage.do";
		}
	}
	@RequestMapping(value="/offComment.do", method=RequestMethod.GET)
	public String offComment(Model model, String author, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<CommentVO> data = repository.offComment(pageable, searchType, keyword, author);
		model.addAttribute("offComment", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		model.addAttribute("author",author);
		return "manager";
	}
	@RequestMapping(value="/CommentOn.do", method=RequestMethod.POST)
	public String writeOn(CommentVO vo) {
		int result = repository.commentOn(vo);
		if(result > 0) {
			return "redirect:/board/manager.do";
		}else {
			return "redirect:/board/manager.do";
		}
		
	}
	@RequestMapping(value="/cpoliceWriteOff.do", method=RequestMethod.POST)
	public String managercWriteOff(CommentVO vo) {
		int result = repository.cpoliceWriteOff(vo);
		
		if(result > 0) {
			return "redirect:/cpolice/policeComment.do";
		}else {
			return "redirect:/board/manager.do";
		}
		
	}
}
