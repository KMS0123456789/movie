package cProject.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cProject.movie.repo.BoardRepository;
import cProject.movie.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardRepository repository;
	
	@RequestMapping(value="/freelist.do", method=RequestMethod.GET)
	public String freelist(Model model, BoardVO vo) {
		List<BoardVO> flist = repository.freelist();
		model.addAttribute("flist", flist);
		return "freelist";
	}
	@RequestMapping(value="/reviewlist.do", method=RequestMethod.GET)
	public String reviewlist(Model model, BoardVO vo) {
		List<BoardVO> rlist = repository.reviewlist();
		model.addAttribute("rlist", rlist);
		return "reviewlist";
	}
	@RequestMapping(value="/minfolist.do", method=RequestMethod.GET)
	public String minfolist(Model model, BoardVO vo) {
		List<BoardVO> mlist = repository.minfolist();
		model.addAttribute("mlist", mlist);
		return "minfolist";
	}
	@RequestMapping(value="/goodslist.do", method=RequestMethod.GET)
	public String goodslist(Model model, BoardVO vo) {
		List<BoardVO> glist = repository.goodslist();
		model.addAttribute("glist", glist);
		return "goodslist";
	}
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write() {
		return "write";
	}
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String writeOK() {
		return "write";
	}
}
