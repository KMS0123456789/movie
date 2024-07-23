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

import com.google.protobuf.Service;

import cProject.movie.vo.LikeVO;

@Repository
public class LikeRepository {
	
	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "LikeMapper";
	
	public int likeUp(LikeVO vo) {
		return template.insert(NAME_SPACE+ ".likeUp", vo);
	}
	public int likeOff(LikeVO vo) {
		return template.delete(NAME_SPACE+ ".likeOff", vo);
	}
}
