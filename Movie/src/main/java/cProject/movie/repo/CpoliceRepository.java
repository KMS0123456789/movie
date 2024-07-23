package cProject.movie.repo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import cProject.movie.vo.CpoliceVO;



@Repository
public class CpoliceRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	private final String NAME_SPACE = "CpoliceMapper";
	
	public void cPolice(CpoliceVO vo) {
		template.insert(NAME_SPACE + ".insertcPolice", vo);
	}
	
}
