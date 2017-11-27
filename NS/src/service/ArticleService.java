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
		if(dao.ArticleInsert(vo)>0) {
			return vo.getArticle_num();
		}else {
			return -1;
		}
	}

	public int ArticlePhotoInsert(int articleNum, String FileURL) {
		System.out.println("���񽺿Դ�2.");
		return dao.ArticlePhotoInsert(articleNum, FileURL);
	}
}
