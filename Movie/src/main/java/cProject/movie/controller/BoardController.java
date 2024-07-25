package cProject.movie.controller;

import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cProject.movie.vo.FileVO;
import cProject.movie.vo.LikeVO;
import cProject.movie.vo.StarVO;
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import cProject.movie.repo.BoardRepository;
import cProject.movie.repo.FileRepository;
import cProject.movie.repo.StarRepository;
import cProject.movie.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardRepository repository;
	@Autowired
	ServletContext servletContext;
	@Autowired
	FileRepository fileRepository;
	@Autowired
    private StarRepository starRepository;
	
	@RequestMapping(value="/board.do", method=RequestMethod.GET)
	public String board(BoardVO vo, Model model) {
		List<BoardVO> list = (List<BoardVO>) repository.board(vo);
		model.addAttribute("list", list);
		return "home";
	}
	@RequestMapping(value="/freelist.do", method=RequestMethod.GET)
	public String freelist(Model model, BoardVO vo, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 10);
		int categoryNo = 0;
		Page<BoardVO> data = repository.freelist(pageable, searchType, keyword, categoryNo);
		model.addAttribute("fPage", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		
		session.getAttribute("user");
		session.removeAttribute("s");
		
		return "freelist";
	}
	@RequestMapping(value="/reviewlist.do", method=RequestMethod.GET)
	public String reviewlist(Model model, BoardVO vo, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 10);
		int categoryNo = 1;
		Page<BoardVO> data = repository.reviewlist(pageable, searchType, keyword, categoryNo);
		model.addAttribute("rPage", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		
		session.getAttribute("user");
		session.removeAttribute("s");
		
		return "reviewlist";
	}
	@RequestMapping(value="/minfolist.do", method=RequestMethod.GET)
	public String minfolist(Model model, BoardVO vo, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 10);
		int categoryNo = 2;
		Page<BoardVO> data = repository.minfolist(pageable, searchType, keyword, categoryNo);
		model.addAttribute("mPage", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		
		session.getAttribute("user");
		session.removeAttribute("s");
		
		return "minfolist";
	}
	@RequestMapping(value="/goodslist.do", method=RequestMethod.GET)
	public String goodslist(Model model, BoardVO vo, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword,
			HttpSession session) {
		Pageable pageable = PageRequest.of(page-1, 10);
		int categoryNo = 3;
		Page<BoardVO> data = repository.goodslist(pageable, searchType, keyword, categoryNo);
		model.addAttribute("gPage", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		
		session.getAttribute("user");
		session.removeAttribute("s");
		
		return "goodslist";
	}
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write() {
		return "write";
	}
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String writeOK(BoardVO boardVO, 
	        @RequestParam("file") MultipartFile[] files, 
	        @RequestParam(name="star", required=false, defaultValue="0") int star) {

	    int result = repository.insertOne(boardVO);
	    
	    if(result > 0) {
	        String uploadDir = servletContext.getRealPath("/uploads/");
	        File dir = new File(uploadDir);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
	        
	        List<FileVO> fileList = new ArrayList<>();
	        for(MultipartFile file : files) {
	            if(!file.isEmpty()) {
	                String originFileName = file.getOriginalFilename();
	                String uniqueFileName = UUID.randomUUID().toString() + "_" + originFileName;
	                String filePath = "/uploads/" + uniqueFileName;
	                
	                try {
	                    file.transferTo(new File(uploadDir + uniqueFileName));
	                    FileVO fileVO = new FileVO();
	                    fileVO.setBno(boardVO.getBno());
	                    fileVO.setFileName(originFileName);
	                    fileVO.setFilePath(filePath);
	                    fileVO.setFileSize(String.valueOf(file.getSize()));
	                    fileList.add(fileVO);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                    // 파일 업로드 실패 시 처리 (예: 에러 메시지 설정)
	                }
	            }
	        }
	        
	        if(!fileList.isEmpty()) {
	            fileRepository.insert(fileList);
	        }
	        
	        if (star > 0) {
	            StarVO starVO = new StarVO();
	            starVO.setAuthor(boardVO.getAuthor());
	            starVO.setBno(boardVO.getBno());
	            starVO.setStar(star);
	            starRepository.insertStar(starVO);
	        }
	        
	        return "redirect:/board/post.do?bno=" + boardVO.getBno();
	    } else {
	        return "redirect:/board/board.do";
	    }
	}
	@RequestMapping(value="/post.do",method =RequestMethod.GET)
	public String view(@RequestParam(name="bno" , defaultValue="0") int bno,
					   @RequestParam(name="id", defaultValue="null") String id,
					   Model model, HttpSession session){
		
		BoardVO vo =repository.selectOne(bno, id);
			
		session.getAttribute("user");
		
		String show = (String)session.getAttribute("s");
		if( show == null) {
			int res = repository.update_readhit(bno);
			session.setAttribute("s", "check");
		}
		
		model.addAttribute("vo", vo);
		
		return "post"; 
	}
	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public String modify(@RequestParam(name="bno", required=false, defaultValue="0") int bno, Model model) {
		BoardVO vo = repository.modify(bno);
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
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	@RequestMapping(value="/myWrite.do", method=RequestMethod.GET)
	public String myWrite(Model model, String author, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<BoardVO> data = repository.myWrite(pageable, searchType, keyword, author);
		model.addAttribute("myWrite", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		model.addAttribute("author",author);
		return "mypage";
	}
	@RequestMapping(value="/myWriteOff.do", method=RequestMethod.POST)
	public String myWriteOff(BoardVO vo) {
		int result = repository.off(vo);
		if(result > 0) {
			return "redirect:/board/myWrite.do";
		}else {
			return "redirect:/board/mypage.do";
		}
		
	}
	public String getFileExtension(String fileName) {
		int index = fileName.lastIndexOf(".");
		if(index == -1) {
			return "";
		}
		return fileName.substring(index+1);
	}
	@RequestMapping(value="/manager.do", method=RequestMethod.GET)
	public String manager() {
		return "manager";
	}
	@RequestMapping(value="/offWrite.do", method=RequestMethod.GET)
	public String offWrite(Model model, String author, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<BoardVO> data = repository.offWrite(pageable, searchType, keyword);
		model.addAttribute("offWrite", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		return "manager";
	}
	@RequestMapping(value="/writeOn.do", method=RequestMethod.POST)
	public String writeOn(BoardVO vo) {
		int result = repository.writeOn(vo);
		if(result > 0) {
			return "redirect:/board/manager.do";
		}else {
			return "redirect:/board/manager.do";
		}
		
	}
	@RequestMapping(value="/myLike.do", method=RequestMethod.GET)
	public String myLike(Model model, String likeUser, 
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="searchType", required=false) String searchType,
			@RequestParam(name="keyword", required=false) String keyword
			) {
		Pageable pageable = PageRequest.of(page-1, 10);
		Page<BoardVO> data = repository.myLike(pageable, searchType, keyword, likeUser);
		model.addAttribute("myLike", data.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", data.getTotalPages());
		model.addAttribute("pageSize", 10);
		model.addAttribute("likeUser",likeUser);
		return "mypage";
	}
	
	@RequestMapping(value="/policeWriteOff.do", method=RequestMethod.POST)
	public String managerWriteOff(BoardVO vo) {
		int result = repository.policeWriteOff(vo);
		
		if(result > 0) {
			return "redirect:/bpolice/policeWrite.do";
		}else {
			return "redirect:/board/manager.do";
		}
		
	}
}
