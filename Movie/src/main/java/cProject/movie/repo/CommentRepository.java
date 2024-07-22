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
import cProject.movie.vo.CommentVO;


@Repository
public class CommentRepository {
	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "CommentMapper";
	
	public int insertOne(CommentVO vo, int bno, String author, String cbody) {
		return template.insert(NAME_SPACE + ".insert", vo);
	}
	public int modifyOne(CommentVO vo, int bno, String author, String cbody) {
		return template.update(NAME_SPACE + ".update", vo);
	}
	
	public int offOne(CommentVO vo, int bno, String author, String cbody, int cno) {
		return template.update(NAME_SPACE + ".off", vo);
	}
	public Page<CommentVO> myComment(Pageable pageable, String searchType, String keyword, String author) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		int total = myWriteCount(searchType, keyword, author);
		List<CommentVO> comments = template.selectList(NAME_SPACE + ".myComment", map);
		return new PageImpl<CommentVO>(comments, pageable, total);
	}
	public int myWriteCount(String searchType, String keyword, String author) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		return template.selectOne(NAME_SPACE + ".myCommentCount", map);
	}
	public int myCommentOff(CommentVO vo) {
		return template.update(NAME_SPACE + ".myCommentOff", vo);
	}
}
