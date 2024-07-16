package cProject.movie.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		Page<BoardVO> data = repository.freelist(pageable, searchType, keyword);
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
		Page<BoardVO> data = repository.reviewlist(pageable, searchType, keyword);
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
		Page<BoardVO> data = repository.minfolist(pageable, searchType, keyword);
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
		Page<BoardVO> data = repository.goodslist(pageable, searchType, keyword);
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
		repository.insertOne(vo);
		int result = vo.getBno();
		
		if(result > 0) {
			return "redirect:/board/post.do?bno="+vo.getBno();
		}else {
			return "redirect:/board";
		}
	}
}
