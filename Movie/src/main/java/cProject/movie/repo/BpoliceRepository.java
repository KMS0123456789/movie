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

import cProject.movie.vo.BoardVO;
import cProject.movie.vo.BpoliceVO;

@Repository
public class BpoliceRepository {

    @Autowired
    private SqlSessionTemplate template;
    private final String NAME_SPACE = "BpoliceMapper";

    public void bPolice(BpoliceVO vo) {
        template.insert(NAME_SPACE + ".insertbPolice", vo);
    }
    
    public Page<BpoliceVO> countBpolice(Pageable pageable, String searchType, String keyword, String author) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		int total = bpoliceCount(searchType, keyword, author);
		List<BpoliceVO> boards = template.selectList(NAME_SPACE + ".selectPolice", map);
		return new PageImpl<BpoliceVO>(boards, pageable, total);
	}
    
    public int bpoliceCount(String searchType, String keyword, String author) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		return template.selectOne(NAME_SPACE + ".bpoliceCount", map);
	}
	public int policeWriteOff(BpoliceVO vo) {
		return template.update(NAME_SPACE + ".policeWriteOff", vo);
	}
}
