package cProject.movie.controller;

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
import cProject.movie.repo.CpoliceRepository;
import cProject.movie.vo.BpoliceVO;
import cProject.movie.vo.CpoliceVO;

@Controller
@RequestMapping("/cpolice")
public class CpoliceController {

    @Autowired
    private CpoliceRepository repository;

    @PostMapping("/police.do")
    public String cPolice(CpoliceVO police, HttpServletRequest request, Model model,
                          @RequestParam(name="id") String id,
                          @RequestParam(name="cno") int cno,
                          @RequestParam(name="policeReason") String policeReason) {

        model.addAttribute("id", id);
        model.addAttribute("cno", cno);
        model.addAttribute("policeReason", policeReason);
        
        repository.cPolice(police);

        if (request.getHeader("Referer") != null) {
            return "redirect:" + request.getHeader("Referer");
        } else {
            return "redirect:/board/post.do";
        }
    }
    @RequestMapping(value="/myPoliceComment.do", method=RequestMethod.GET)
	public String myPoliceComment(Model model, String author, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<CpoliceVO> data = repository.myPoliceComment(pageable, searchType, keyword, author);
		model.addAttribute("myPoliceComment", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		model.addAttribute("author",author);
		return "mypage";
	}
 
}
