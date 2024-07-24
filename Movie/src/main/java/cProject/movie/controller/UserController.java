package cProject.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cProject.movie.repo.UserRepository;
import cProject.movie.vo.BoardVO;
import cProject.movie.vo.CpoliceVO;
import cProject.movie.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserRepository repository;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginOK(@ModelAttribute UserVO vo, HttpSession session, HttpServletRequest request) {
		UserVO user = repository.login(vo);
		session.setAttribute("user", user);
		if (request.getHeader("Referer") != null) {
		    return "redirect:" + request.getHeader("Referer");
		}else {
			return "redirect:/board/board.do";
		}
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinOk(UserVO vo, @RequestParam("email") String email, RedirectAttributes redirectAttributes) {
	    vo.setEmail(email);
	    int result = repository.join(vo);
	    if(result > 0) {
	        redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다.");
	        return "redirect:/board/board.do";
	    } else {
	        redirectAttributes.addFlashAttribute("error", "회원가입에 실패했습니다. 다시 시도해주세요.");
	        return "redirect:/user/join.do";
	    }
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public Map<String, String> idCheck(@RequestParam("id") String id) {
		
		int count = repository.idCheck(id);
		
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) {
			map.put("result", "failed");
		}else {
			map.put("result", "success");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/nickCheck.do", method=RequestMethod.POST)
	public Map<String, String> nickCheck(@RequestParam("nick") String nick) {
		
		int count = repository.nickCheck(nick);
		
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) {
			map.put("result", "failed");
		}else {
			map.put("result", "success");
		}		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/emailCheck.do", method=RequestMethod.POST)
	public Map<String, String> emailCheck(@RequestParam("email") String email) {
		
		int count = repository.emailCheck(email);
		
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) {
			map.put("result", "failed");
		}else {
			map.put("result", "success");
		}		
		return map;
	}
	
	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "findid";
	}
	
	@RequestMapping(value="/findId.do", method =RequestMethod.POST)
	public String findIdOk(@RequestParam(name="email") String email, Model model){
		
		UserVO vo =repository.findId(email);
		model.addAttribute("vo", vo);
		
		return "findidresult"; 
	}
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/board.do";
	}
	
	@RequestMapping(value="/findPw.do", method=RequestMethod.GET)
	public String findPw() {
		return "findpw";
	}
	
	@RequestMapping(value="/findPw.do", method=RequestMethod.POST)
    public String findPwOk(@RequestParam(name="id") String id, 
                         @RequestParam(name="email") String email, 
                         Model model) {
		
		UserVO vo = repository.findPw(id, email);
		model.addAttribute("vo", vo);
		return "changepw";
    }
	@RequestMapping(value="/changePw.do", method=RequestMethod.GET)
	public String changePw() {
		return "changepw";
	}
	
	@RequestMapping(value="/changePw.do", method=RequestMethod.POST)
    @ResponseBody
    public String changePwOk(UserVO vo) {
        try {
            repository.changePw(vo);
            return "success";
        } catch (Exception e) {
            return "failure";
        }
    }
	
	@RequestMapping(value="/myChangePw.do", method=RequestMethod.GET)
    public String myChangePw() {
        return "mychangepw";
    }

	@RequestMapping(value="/myChangePw.do", method=RequestMethod.POST)
    public String myChangePwOk(UserVO vo) {
        repository.myChangePw(vo);
        return "redirect:/board/board.do";
    }
	
	@RequestMapping(value="/userchange.do", method=RequestMethod.GET)
	public String userchange() {
		return "userchange";
	}
	@RequestMapping(value="/changenick.do", method=RequestMethod.POST)
    public String changenick(UserVO vo) {
        repository.changenick(vo);
        return "redirect:/user/userchange.do";
	}
	@RequestMapping(value="/changeemail.do", method=RequestMethod.POST)
    public String changeemail(UserVO vo) {
        repository.changeemail(vo);
        return "redirect:/user/userchange.do";
	}
	@RequestMapping(value="/policeUser.do", method=RequestMethod.GET)
	public String policeUser(Model model, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<UserVO> data = repository.countUpolice(pageable, searchType, keyword);
		model.addAttribute("policeUser", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		return "manager";
	}
	@RequestMapping(value="/offUser.do", method=RequestMethod.GET)
	public String offUser(Model model,
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<UserVO> data = repository.offUser(pageable, searchType, keyword);
		model.addAttribute("offUser", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		return "manager";
	}
	@RequestMapping(value="/policeUserTotal.do", method =RequestMethod.POST)
	public String policeUserTotal(UserVO vo, Model model){
		
		List<UserVO> policeUserTotal = (List<UserVO>)repository.policeUserTotal(vo);
		
		model.addAttribute("policeUserTotal", policeUserTotal);
		
		return "manager"; 
	}
}
