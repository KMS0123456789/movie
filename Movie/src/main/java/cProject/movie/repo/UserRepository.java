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
}
