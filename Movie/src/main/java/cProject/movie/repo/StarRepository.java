package cProject.movie.repo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.protobuf.Service;
import cProject.movie.vo.StarVO;

@Repository
public class StarRepository {

	@Autowired
	SqlSessionTemplate template;

    private static final String NAME_SPACE = "StarMapper";

    public int insertStar(StarVO starVO) {
        return template.insert(NAME_SPACE + ".insertStar", starVO);
    }

}
