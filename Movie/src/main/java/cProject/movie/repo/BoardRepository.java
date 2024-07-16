package cProject.movie.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import cProject.movie.vo.BoardVO;

@Repository
public class BoardRepository {
	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "BoardMapper";
	
	public Page<BoardVO> freelist(Pageable pageable, String searchType, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".freelist", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public Page<BoardVO> reviewlist(Pageable pageable, String searchType, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".reviewlist", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public Page<BoardVO> minfolist(Pageable pageable, String searchType, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".minfolist", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public Page<BoardVO> goodslist(Pageable pageable, String searchType, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".goodslist", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public int count(String searchType, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return template.selectOne(NAME_SPACE + ".count", map);
	}
	public int insertOne(BoardVO vo) {
		return template.insert(NAME_SPACE + ".insert", vo);
	}
}
