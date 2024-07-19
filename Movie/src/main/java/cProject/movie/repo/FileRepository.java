package cProject.movie.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cProject.movie.vo.FileVO;


@Repository
public class FileRepository {
	@Autowired
	SqlSessionTemplate template;
	
	public int insert(List<FileVO> vo) {
		return template.insert("FileMapper.insert", vo);
	}
	
}
