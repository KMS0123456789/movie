package cProject.movie.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cProject.movie.repo.BpoliceRepository;
import cProject.movie.vo.BpoliceVO;

@Controller
@RequestMapping("/bpolice")
public class BpoliceController {

    @Autowired
    private BpoliceRepository repository;

    @PostMapping("/police.do")
    public String bPolice(BpoliceVO police, HttpServletRequest request, Model model,
                          @RequestParam(name="id") String id,
                          @RequestParam(name="bno") int bno,
                          @RequestParam(name="policeReason") String policeReason) {

        model.addAttribute("id", id);
        model.addAttribute("bno", bno);
        model.addAttribute("policeReason", policeReason);
        
        repository.bPolice(police);

        if (request.getHeader("Referer") != null) {
            return "redirect:" + request.getHeader("Referer");
        } else {
            return "redirect:/board/post.do";
        }
    }
}
