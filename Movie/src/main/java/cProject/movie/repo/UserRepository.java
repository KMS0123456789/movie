package cProject.movie.repo;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
    
    public int changenick(UserVO vo) {
    	return template.update(NAME_SPACE + ".changenick", vo);  
    }
    public int changeemail(UserVO vo) {
    	return template.update(NAME_SPACE + ".changeemail", vo);  
    }


}
