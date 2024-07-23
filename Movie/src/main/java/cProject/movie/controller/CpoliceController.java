package cProject.movie.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cProject.movie.repo.CpoliceRepository;
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
}
