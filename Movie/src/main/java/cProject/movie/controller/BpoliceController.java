package cProject.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import cProject.movie.repo.BpoliceRepository;
import cProject.movie.vo.BoardVO;
import cProject.movie.vo.BpoliceVO;

@Controller
@RequestMapping("/bpolice")
public class BpoliceController {

    @Autowired
    private BpoliceRepository repository;

    @PostMapping("/police.do")
    public String bPolice(BpoliceVO police, HttpServletRequest request, Model model,
                          @RequestParam(name="policeMan") String policeMan,
                          @RequestParam(name="bno") int bno,
                          @RequestParam(name="villain") String villain,
                          @RequestParam(name="policeReason") String policeReason) {

        model.addAttribute("policeMan", policeMan);
        model.addAttribute("villain", villain);
        model.addAttribute("bno", bno);
        model.addAttribute("policeReason", policeReason);
        
        repository.bPolice(police);

        if (request.getHeader("Referer") != null) {
            return "redirect:" + request.getHeader("Referer");
        } else {
            return "redirect:/board/post.do";
        }
    }
   
    @RequestMapping(value="/policeWrite.do", method=RequestMethod.GET)
	public String policeWrite(Model model, String author, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<BpoliceVO> data = repository.countBpolice(pageable, searchType, keyword, author);
		model.addAttribute("policeWrite", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		model.addAttribute("author",author);
		return "manager";
	}
    
    @RequestMapping(value="/myPoliceWrite.do", method=RequestMethod.GET)
	public String myPoliceWrite(Model model, String author, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<BpoliceVO> data = repository.myPoliceWrite(pageable, searchType, keyword, author);
		model.addAttribute("myPoliceWrite", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		model.addAttribute("author",author);
		return "mypage";
	}
}
