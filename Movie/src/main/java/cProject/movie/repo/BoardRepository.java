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
import cProject.movie.vo.LikeVO;
import cProject.movie.vo.StarVO;

@Repository
public class BoardRepository {
	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "BoardMapper";
	
	public List<BoardVO> board(BoardVO vo) {
		return template.selectList(NAME_SPACE + ".board", vo);
	}
	
	public Page<BoardVO> freelist(Pageable pageable, String searchType, String keyword, int categoryNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, categoryNo);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".freelist", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public Page<BoardVO> reviewlist(Pageable pageable, String searchType, String keyword, int categoryNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, categoryNo);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".reviewlist", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public Page<BoardVO> minfolist(Pageable pageable, String searchType, String keyword, int categoryNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, categoryNo);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".minfolist", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public Page<BoardVO> goodslist(Pageable pageable, String searchType, String keyword, int categoryNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int total = count(searchType, keyword, categoryNo);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".goodslist", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public int count(String searchType, String keyword, int categoryNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("categoryNo", categoryNo);
		return template.selectOne(NAME_SPACE + ".count", map);
	}
	public int insertOne(BoardVO vo) {
		return template.insert(NAME_SPACE + ".insert", vo);
	}
	public BoardVO selectOne(int bno) {
		return	template.selectOne(NAME_SPACE + ".findById" , bno);
	}
	
	public int insertStar(BoardVO boardVO, StarVO starVO) {
        int result = template.insert(NAME_SPACE + ".insertOne", boardVO);
        if (result > 0 && starVO != null && starVO.getStar() > 0) {
            starVO.setBno(boardVO.getBno());
            template.insert("StarMapper.insertStar", starVO);
        }
        return result;
    }
	
	public int update(BoardVO vo) {
		return template.update(NAME_SPACE + ".update", vo);
	}
	public int off(BoardVO vo) {
		return template.update(NAME_SPACE + ".off", vo);
	}
	public Page<BoardVO> myWrite(Pageable pageable, String searchType, String keyword, String author) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		int total = myWriteCount(searchType, keyword, author);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".myWrite", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public int myWriteCount(String searchType, String keyword, String author) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		return template.selectOne(NAME_SPACE + ".myWriteCount", map);
	}
	public int myWriteOff(BoardVO vo) {
		return template.update(NAME_SPACE + ".myWriteOff", vo);
	}
	public int update_readhit(int bno) {
		int res = template.update(NAME_SPACE + ".update_readhit" , bno);
		return res;
	}
	public Page<BoardVO> offWrite(Pageable pageable, String searchType, String keyword, String author) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		int total = offWriteCount(searchType, keyword, author);
		List<BoardVO> boards = template.selectList(NAME_SPACE + ".offWrite", map);
		return new PageImpl<BoardVO>(boards, pageable, total);
	}
	public int offWriteCount(String searchType, String keyword, String author) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("author", author);
		return template.selectOne(NAME_SPACE + ".offWriteCount", map);
	}
	public int writeOn(BoardVO vo) {
		return template.update(NAME_SPACE + ".writeOn", vo);
	}
	public Page<BoardVO> myLike(Pageable pageable, String searchType, String keyword, String likeUser) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", pageable.getOffset());
		map.put("limit", pageable.getPageSize());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("likeUser", likeUser);
		int total = myLikeCount(searchType, keyword, likeUser);
		List<BoardVO> likes = template.selectList(NAME_SPACE + ".myLike", map);
		return new PageImpl<BoardVO>(likes, pageable, total);
	}
	public int myLikeCount(String searchType, String keyword, String likeUser) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("likeUser", likeUser);
		return template.selectOne(NAME_SPACE + ".myLikeCount", map);
	}
	
	public int policeWriteOff(BoardVO vo) {
		return template.update(NAME_SPACE + ".policeWriteOff", vo);
	}
}
