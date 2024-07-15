package cProject.movie.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cProject.movie.vo.BoardVO;

@Repository
public class BoardRepository {
	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "BoardMapper";
	
	public List<BoardVO> freelist() {
		return template.selectList(NAME_SPACE + ".freelist");
	}
	public List<BoardVO> reviewlist() {
		return template.selectList(NAME_SPACE + ".reviewlist");
	}
	public List<BoardVO> minfolist() {
		return template.selectList(NAME_SPACE + ".minfolist");
	}
	public List<BoardVO> goodslist() {
		return template.selectList(NAME_SPACE + ".goodslist");
	}
	public int insertOne(BoardVO vo) {
		return template.insert(NAME_SPACE + ".insert", vo);
	}
}
