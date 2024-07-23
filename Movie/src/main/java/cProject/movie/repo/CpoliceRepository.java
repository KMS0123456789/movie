package cProject.movie.repo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import cProject.movie.vo.BpoliceVO;
import cProject.movie.vo.CpoliceVO;



@Repository
public class CpoliceRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "CpoliceMapper";
	
	public void cPolice(CpoliceVO vo) {
		template.insert(NAME_SPACE + ".insertcPolice", vo);
	}
	public Page<CpoliceVO> myPoliceComment(Pageable pageable, String searchType, String keyword, String author) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		int total = myPoliceCommentCount(searchType, keyword, author);
		List<CpoliceVO> comments = template.selectList(NAME_SPACE + ".myPoliceComment", map);
		return new PageImpl<CpoliceVO>(comments, pageable, total);
	}
	public int myPoliceCommentCount(String searchType, String keyword, String author) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		return template.selectOne(NAME_SPACE + ".myPoliceCommentCount", map);
	}
	public Page<CpoliceVO> countCpolice(Pageable pageable, String searchType, String keyword, String author) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		int total = cpoliceCount(searchType, keyword, author);
		List<CpoliceVO> boards = template.selectList(NAME_SPACE + ".selectPolice", map);
		return new PageImpl<CpoliceVO>(boards, pageable, total);
	}
    
    public int cpoliceCount(String searchType, String keyword, String author) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		return template.selectOne(NAME_SPACE + ".cpoliceCount", map);
	}
}
