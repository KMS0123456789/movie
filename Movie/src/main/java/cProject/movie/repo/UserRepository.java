package cProject.movie.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import cProject.movie.vo.BoardVO;
import cProject.movie.vo.CpoliceVO;
import cProject.movie.vo.UserVO;

@Repository
public class UserRepository {
	@Autowired
	SqlSessionTemplate template;
	private final String NAME_SPACE = "UserMapper";
	
	public UserVO login(UserVO vo) {
		return template.selectOne(NAME_SPACE + ".login", vo);
	}
	
	public int join(UserVO vo) {
		return template.insert(NAME_SPACE +".join", vo);
	}
	
	public int idCheck(String id) {
		return template.selectOne(NAME_SPACE +".idCheck", id);
	}
	
	public int nickCheck(String nick) {
		return template.selectOne(NAME_SPACE +".nickCheck", nick);
	}
	
	public int emailCheck(String email) {
		return template.selectOne(NAME_SPACE +".emailCheck", email);
	}
	
	public UserVO findId(String email) {
        return template.selectOne(NAME_SPACE + ".findId", email);
	}
	
	public UserVO findPw(String id, String email) {
        UserVO userVO = new UserVO();
        userVO.setId(id);
        userVO.setEmail(email);
        return template.selectOne(NAME_SPACE + ".findPw", userVO);
    }

    public int changePw(UserVO vo) {
    	return template.update(NAME_SPACE + ".changePw", vo);        
    }
    
    public int myChangePw(UserVO vo) {
        return template.update(NAME_SPACE + ".myChangePw", vo);
    }
    
    public int changenick(UserVO vo) {
    	return template.update(NAME_SPACE + ".changenick", vo);  
    }
    public int changeemail(UserVO vo) {
    	return template.update(NAME_SPACE + ".changeemail", vo);  
    }
    public Page<UserVO> countUpolice(Pageable pageable, String searchType, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = upoliceCount(searchType, keyword);
		List<UserVO> users = template.selectList(NAME_SPACE + ".selectPolice", map);
		return new PageImpl<UserVO>(users, pageable, total);
	}
    
    public int upoliceCount(String searchType, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".upoliceCount", map);
	}
    public Page<UserVO> offUser(Pageable pageable, String searchType, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = offUserCount(searchType, keyword);
		List<UserVO> users = template.selectList(NAME_SPACE + ".offUser", map);
		return new PageImpl<UserVO>(users, pageable, total);
	}
	public int offUserCount(String searchType, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".offUserCount", map);
	}
	public List<UserVO> policeUserTotal(UserVO vo) {
		return	template.selectList(NAME_SPACE + ".policeUserTotal" , vo);
	}
	public int userOff(UserVO vo) {
		return template.update(NAME_SPACE + ".userOff", vo);
	}
	public int userOn(UserVO vo) {
		return template.update(NAME_SPACE + ".userOn", vo);
	}
}
