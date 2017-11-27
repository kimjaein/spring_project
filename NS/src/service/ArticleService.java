package service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.ArticleDao;
import vo.ArticleVO;

@Component
public class ArticleService {
	
	@Autowired
	private ArticleDao dao;
	public void setDao(ArticleDao dao) {
		this.dao = dao;
	}
	public int ArticleInsert(ArticleVO vo) {
		return dao.ArticleInsert(vo);
	}
	public int ArticlePhotoInsert(int articleNum,String FileURL) {
		System.out.println("서비스왔다2.");
		return dao.ArticlePhotoInsert(articleNum, FileURL);
	}
}
