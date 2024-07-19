package cProject.movie.repo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
