package cProject.movie.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import cProject.movie.vo.FileVO;

import cProject.movie.repo.BoardRepository;
import cProject.movie.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardRepository repository;
	
	@RequestMapping(value="/freelist.do", method=RequestMethod.GET)
	public String freelist(Model model, BoardVO vo, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		int categoryNo = 0;
		Page<BoardVO> data = repository.freelist(pageable, searchType, keyword, categoryNo);
		model.addAttribute("fPage", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		return "freelist";
	}
	@RequestMapping(value="/reviewlist.do", method=RequestMethod.GET)
	public String reviewlist(Model model, BoardVO vo, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		int categoryNo = 1;
		Page<BoardVO> data = repository.reviewlist(pageable, searchType, keyword, categoryNo);
		model.addAttribute("rPage", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		return "reviewlist";
	}
	@RequestMapping(value="/minfolist.do", method=RequestMethod.GET)
	public String minfolist(Model model, BoardVO vo, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		int categoryNo = 2;
		Page<BoardVO> data = repository.minfolist(pageable, searchType, keyword, categoryNo);
		model.addAttribute("mPage", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		return "minfolist";
	}
	@RequestMapping(value="/goodslist.do", method=RequestMethod.GET)
	public String goodslist(Model model, BoardVO vo, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		int categoryNo = 3;
		Page<BoardVO> data = repository.goodslist(pageable, searchType, keyword, categoryNo);
		model.addAttribute("gPage", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		return "goodslist";
	}
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write() {
		return "write";
	}
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String writeOK(BoardVO vo, @RequestParam("file") MultipartFile[] files) {
		String author = "SessionScope.user.id";
		repository.insertOne(vo);
		int result = vo.getBno();
		
		if(result > 0) {
			return "redirect:/board/post.do?bno="+vo.getBno();
		}else {
			return "redirect:/board/board.do";
		}
	}
	@RequestMapping(value="/post.do",method =RequestMethod.GET)
	public String view(@RequestParam(name="bno" , defaultValue="0") int bno,Model model){
		
		BoardVO vo =repository.selectOne(bno);
		model.addAttribute("vo", vo);
		
		return "post"; 
	}
	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public String modify(@RequestParam(name="bno", required=false, defaultValue="0") int bno, Model model) {
		BoardVO vo = repository.selectOne(bno);
		model.addAttribute("vo", vo);
		return "modify";
	}
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modifyOK(
			BoardVO vo) {
		int result = repository.update(vo);
		if(result > 0) {
			return "redirect:/board/post.do?bno="+vo.getBno();
		}else {
			return "redirect:/board/modify.do?bno="+vo.getBno();
		}
	}
	@RequestMapping(value="/off.do", method=RequestMethod.POST)
	public String off(BoardVO vo, int categoryNo) {
		int result = repository.off(vo);
		if(result > 0) {
			if(categoryNo == 0 ) {
				return "redirect:/board/freelist.do";
			}else if(categoryNo == 1) {
				return "redirect:/board/reviewlist.do";
			}else if(categoryNo == 2) {
				return "redirect:/board/minfolist.do";
			}else if(categoryNo == 3) {
				return "redirect:/board/goodslist.do";
			}else {
				return "redirect:/board/board.do";
			}
		}else {
			return "redirect:/board/board.do";
		}
	}
	@RequestMapping(value="/return.do", method=RequestMethod.GET)
	public String returnList(int categoryNo) {
		if(categoryNo == 0 ) {
			return "redirect:/board/freelist.do";
		}else if(categoryNo == 1) {
			return "redirect:/board/reviewlist.do";
		}else if(categoryNo == 2) {
			return "redirect:/board/minfolist.do";
		}else if(categoryNo == 3) {
			return "redirect:/board/goodslist.do";
		}else {
			return "redirect:/board/board.do";
		}
	}

}
