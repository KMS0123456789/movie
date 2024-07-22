package cProject.movie.repo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import cProject.movie.vo.BpoliceVO;

@Repository
public class BpoliceRepository {

    @Autowired
    private SqlSessionTemplate template;
    private final String NAME_SPACE = "BpoliceMapper";

    public void bPolice(BpoliceVO vo) {
        template.insert(NAME_SPACE + ".insertbPolice", vo);
    }
}
