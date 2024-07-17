package cProject.movie.repo;

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
}
